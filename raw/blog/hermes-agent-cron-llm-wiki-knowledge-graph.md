---
title: "Hermes Agent Cron으로 LLM Wiki와 지식그래프 파이프라인 자동화하기"
source_type: authored
ingested: 2026-07-20
tested_with: "Hermes Agent v0.18.2 (2026.7.7.2), macOS launchd"
sha256: 77e6000e549e64a8e9ab26dcd1f0a5984ca43394caeb2b108181849565a44cd2
---

# Hermes Agent Cron으로 LLM Wiki와 지식그래프 파이프라인 자동화하기

LLM 에이전트로 지식베이스를 운영하다 보면 자동화의 목표가 단순한 “매일 프롬프트 실행”이 아니라는 사실을 금방 알게 된다. 원본이 추가되었을 때만 에이전트를 깨우고, 커스텀 위키 스킬로 Markdown 문서를 정리한 뒤, 지식그래프 분석 배치가 모두 끝난 경우에만 최종 그래프를 저장해야 한다. 변경이 없는 날에는 모델 토큰을 한 개도 쓰지 않는 편이 바람직하다.

이 글은 다음 파이프라인을 Hermes Agent cron으로 운영하는 방법을 설명한다.

```text
inbox/ 또는 Wiki 변경
        │
        ▼
pre-run 변경 감지 게이트
        │ wakeAgent=true
        ▼
llm-wiki-ains
원본 보존 → 문서 생성·갱신 → lint
        │
        ▼
understand-knowledge
결정적 파싱 → LLM 분석 배치 → merge → 검증
        │
        ▼
.ua/knowledge-graph.json
        │
        ▼
Hermes gateway가 다음 예약 실행을 관리
```

대상 독자는 Hermes의 기본 설치와 LLM 인증을 이미 끝냈고, 장기 운영·비용·보안·실패 복구까지 고려하는 사용자다. 모든 경로와 Job ID는 공개 가능한 예시로 추상화했다.

> 검증 환경: Hermes Agent v0.18.2, macOS arm64, launchd, Python 3.11 이상, `uv`, `jq`. Hermes 버전에 따라 CLI 옵션이 달라질 수 있으므로 실제 배포 전 `hermes cron create --help`를 확인한다.

## 1. 해결하려는 운영 문제

단순하게 다음과 같은 cron을 만들 수도 있다.

```text
매일 03:00 → “위키를 읽고 지식그래프를 다시 만들어라”
```

하지만 실제 운영에서는 네 가지 문제가 생긴다.

1. **무변경 비용**: 아무 파일도 달라지지 않았는데 매일 전체 스킬과 위키를 모델 컨텍스트에 올린다.
2. **커스텀 스킬 발견**: 사용자가 만든 스킬이 Hermes built-in 스킬과 이름이 겹치거나 Hermes의 신뢰 경계 밖에 있다.
3. **비동기 조기 종료**: 지식그래프 분석 subagent가 백그라운드에서 실행되는 동안 부모 에이전트가 먼저 성공 응답을 내보낼 수 있다.
4. **표면적인 성공 상태**: cron의 `last_status: ok`는 에이전트 턴이 정상 종료되었다는 뜻이지, 반드시 새 그래프가 저장되었다는 뜻은 아니다.

따라서 이 파이프라인은 다음 불변조건을 가져야 한다.

- 새 입력이나 위키 변경이 없으면 LLM을 호출하지 않는다.
- `raw/` 원본은 수정하지 않는다.
- 외부 스킬은 명시적으로 신뢰한 디렉터리에서만 읽는다.
- 예상한 분석 배치가 모두 존재하기 전에는 merge와 성공 보고를 하지 않는다.
- 최종 그래프의 모든 edge는 존재하는 node를 가리킨다.
- 저장된 graph/meta의 수정 시각이 이번 실행 시작 이후여야 한다.

## 2. 최종 디렉터리 구조

예시 위키 프로젝트는 다음 구조를 사용한다.

```text
/absolute/path/to/pkm-study/
├── SCHEMA.md
├── index.md
├── log.md
├── inbox/
│   └── processed/
├── raw/
├── entities/
├── concepts/
├── comparisons/
├── queries/
└── .ua/
    ├── knowledge-graph.json
    └── meta.json
```

Hermes 쪽 파일은 프로젝트 밖에 둔다.

```text
~/.hermes/
├── config.yaml
├── scripts/
│   └── pkm_wiki_gate.py
├── skills/
│   ├── custom/
│   │   └── llm-wiki-ains -> /real/path/to/llm-wiki
│   └── understand-anything -> /real/path/to/understand-anything/skills
└── cron/
    ├── jobs.json
    └── output/
```

`inbox/`는 아직 처리하지 않은 입력, `raw/`는 보존된 원본, `entities/`·`concepts/` 등은 에이전트가 컴파일한 canonical 위키, `.ua/`는 그래프 산출물이다. 계층을 섞지 않는 것이 자동화 안정성의 출발점이다.

## 3. 전제 조건과 공개용 변수

먼저 설치 상태를 확인한다.

```bash
hermes --version
python3 --version
uv --version
jq --version
```

이 글의 명령을 실행할 셸에서 다음 값을 자신의 환경에 맞게 바꾼다.

```bash
HERMES_DIR="$HOME/.hermes"
PROJECT_ROOT="/absolute/path/to/pkm-study"
LLM_WIKI_SKILL_DIR="/absolute/path/to/llm-wiki"
UA_SKILLS_DIR="/absolute/path/to/understand-anything-plugin/skills"
```

모든 경로는 가능하면 심볼릭 링크가 아닌 실제 경로로 해석해 확인한다.

```bash
cd "$PROJECT_ROOT" && pwd -P
cd "$LLM_WIKI_SKILL_DIR" && pwd -P
cd "$UA_SKILLS_DIR" && pwd -P
```

공개 문서, cron prompt, 스크립트에 API 토큰을 넣지 않는다. 모델 인증은 Hermes의 `.env` 또는 지원되는 secret provider에서 관리한다.

## 4. 사용자 커스텀 스킬을 Hermes에 등록하기

### 4.1 별칭을 디렉터리 이름으로 만든다

원본 스킬의 frontmatter 이름이 `llm-wiki`여도 Hermes cron에서는 경로가 명확한 별칭 `custom/llm-wiki-ains`로 호출할 수 있다.

```bash
mkdir -p "$HERMES_DIR/skills/custom"

test ! -e "$HERMES_DIR/skills/custom/llm-wiki-ains"
ln -s "$LLM_WIKI_SKILL_DIR" \
  "$HERMES_DIR/skills/custom/llm-wiki-ains"
```

Understand Anything 플러그인의 여러 스킬을 한 번에 노출하려면 그 상위 skills 디렉터리를 연결한다.

```bash
test ! -e "$HERMES_DIR/skills/understand-anything"
ln -s "$UA_SKILLS_DIR" \
  "$HERMES_DIR/skills/understand-anything"
```

`ln -sfn`처럼 기존 대상을 조용히 덮어쓰는 명령은 피한다. 이미 같은 이름이 있으면 먼저 `readlink`로 대상을 확인하고 의도적인 교체인지 판단한다.

```bash
readlink "$HERMES_DIR/skills/custom/llm-wiki-ains"
readlink "$HERMES_DIR/skills/understand-anything"
```

### 4.2 외부 스킬 디렉터리를 명시적으로 신뢰한다

심볼릭 링크 로드는 성공하더라도 링크 대상이 `~/.hermes/skills/` 밖에 있으면 Hermes가 보안 경고를 기록할 수 있다. `~/.hermes/config.yaml`의 `skills.external_dirs`에 최소한의 읽기 경로만 추가한다.

```yaml
skills:
  disabled: []
  external_dirs:
    - /absolute/path/to/agents/skills
    - /absolute/path/to/llm-wiki-real-parent
    - /absolute/path/to/understand-anything-plugin/skills
```

여기서 중요한 점은 **심볼릭 링크가 최종적으로 해석되는 실제 경로**도 신뢰 경계 안에 있어야 한다는 것이다. 예를 들어 `/path/to/agents/skills/llm-wiki`가 다시 다른 Git 저장소를 가리킨다면 그 실제 상위 디렉터리도 추가한다.

목록 값을 `hermes config set`으로 전달하면 일부 버전에서 YAML 배열이 아니라 문자열로 저장될 수 있다. 설정 후 반드시 파일을 열어 실제 YAML 자료형을 확인한다.

```bash
hermes config check
hermes gateway restart
```

스킬 발견 여부를 확인한다.

```bash
hermes skills list | rg 'llm-wiki|understand-knowledge'
```

운영 원칙상 `external_dirs`는 홈 디렉터리 전체처럼 넓게 잡지 않는다. 커스텀 스킬 저장소와 플러그인 skills 디렉터리만 허용한다.

## 5. 변경 감지 pre-run 게이트 구현

Hermes의 agent-mode cron에 `--script`를 붙이면 스크립트 stdout이 agent prompt에 주입된다. stdout 마지막 비어 있지 않은 줄이 다음 JSON이면 Hermes는 agent 실행 자체를 생략한다.

```json
{"wakeAgent": false}
```

반대로 `wakeAgent: true`이면 전체 JSON이 에이전트 컨텍스트로 전달된다. 이를 이용해 변경 감지와 비용 제어를 LLM 바깥에서 결정한다.

### 5.1 게이트의 판정 순서

1. `inbox/processed/` 밖에 파일이 있으면 `source_inbox`
2. 그래프가 없으면 `graph_missing`
3. 위키 또는 raw 파일이 그래프보다 새로우면 `wiki_changed`
4. 그 외에는 `up_to_date`

`inbox/`는 파일 수정 시각과 관계없이 우선한다. 오래된 파일을 나중에 inbox로 복사한 경우에도 처리해야 하기 때문이다. 반면 `log.md`는 감시 목록에서 제외한다. cron 자체가 log를 추가한 뒤 다시 자신을 깨우는 피드백 루프를 피하기 위해서다.

### 5.2 범용 게이트 스크립트

다음 파일을 `~/.hermes/scripts/pkm_wiki_gate.py`에 저장한다. `DEFAULT_WIKI_ROOT`를 실제 절대 경로로 바꾼다.

```python
#!/usr/bin/env python3
from __future__ import annotations

import json
import os
from pathlib import Path
from typing import Final, TypedDict


DEFAULT_WIKI_ROOT: Final = Path("/absolute/path/to/pkm-study")
REFERENCE_PATH: Final = Path(".ua/knowledge-graph.json")
INBOX_PATH: Final = Path("inbox")
WATCHED_PATHS: Final = (
    Path("SCHEMA.md"),
    Path("index.md"),
    Path("entities"),
    Path("concepts"),
    Path("comparisons"),
    Path("queries"),
    Path("raw"),
)


class GatePayload(TypedDict):
    wakeAgent: bool
    reason: str
    changedPaths: list[str]


def detect_changes(wiki_root: Path) -> GatePayload:
    inbox = wiki_root / INBOX_PATH
    inbox_files = sorted(
        candidate
        for candidate in inbox.rglob("*")
        if candidate.is_file()
        and "processed" not in candidate.relative_to(inbox).parts
    )
    if inbox_files:
        return {
            "wakeAgent": True,
            "reason": "source_inbox",
            "changedPaths": [
                candidate.relative_to(wiki_root).as_posix()
                for candidate in inbox_files
            ],
        }

    reference = wiki_root / REFERENCE_PATH
    if not reference.is_file():
        return {
            "wakeAgent": True,
            "reason": "graph_missing",
            "changedPaths": [REFERENCE_PATH.as_posix()],
        }

    reference_mtime = reference.stat().st_mtime_ns
    files = tuple(
        candidate
        for relative_path in WATCHED_PATHS
        for candidate in (
            tuple((wiki_root / relative_path).rglob("*"))
            if (wiki_root / relative_path).is_dir()
            else (wiki_root / relative_path,)
        )
        if candidate.is_file()
    )
    changed_paths = sorted(
        candidate.relative_to(wiki_root).as_posix()
        for candidate in files
        if candidate.stat().st_mtime_ns > reference_mtime
    )
    if changed_paths:
        return {
            "wakeAgent": True,
            "reason": "wiki_changed",
            "changedPaths": changed_paths,
        }

    return {
        "wakeAgent": False,
        "reason": "up_to_date",
        "changedPaths": [],
    }


def main() -> None:
    configured_root = os.environ.get("PKM_WIKI_ROOT")
    wiki_root = (
        Path(configured_root).expanduser().resolve()
        if configured_root
        else DEFAULT_WIKI_ROOT
    )
    print(
        json.dumps(
            detect_changes(wiki_root),
            ensure_ascii=False,
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
```

Hermes v0.18.2에서 pre-run 스크립트는 cron의 `--workdir`이 아니라 `~/.hermes/scripts/`를 cwd로 실행한다. 따라서 `Path.cwd()`를 wiki root로 간주하면 안 된다. 위 예시처럼 절대 기본 경로를 넣거나 gateway 프로세스에 `PKM_WIKI_ROOT`를 명시한다. `--workdir`은 이후 에이전트의 파일·터미널 도구 작업 디렉터리를 결정한다.

게이트를 단독 실행해 JSON 한 줄만 출력되는지 확인한다.

```bash
python3 "$HERMES_DIR/scripts/pkm_wiki_gate.py"
```

### 5.3 최소 회귀 테스트

운영 전 다음 세 경계를 자동화 테스트로 잠근다.

```python
from __future__ import annotations

import json
import os
from pathlib import Path
import subprocess
import sys


GATE = Path("/absolute/path/to/.hermes/scripts/pkm_wiki_gate.py")


def run_gate(root: Path) -> dict[str, object]:
    environment = os.environ.copy()
    environment["PKM_WIKI_ROOT"] = str(root)
    result = subprocess.run(
        [sys.executable, str(GATE)],
        check=True,
        capture_output=True,
        env=environment,
        text=True,
    )
    return json.loads(result.stdout)


def create_graph(root: Path, mtime_ns: int) -> Path:
    graph = root / ".ua" / "knowledge-graph.json"
    graph.parent.mkdir()
    graph.write_text("{}", encoding="utf-8")
    os.utime(graph, ns=(mtime_ns, mtime_ns))
    return graph


def test_current_graph_skips_agent(tmp_path: Path) -> None:
    create_graph(tmp_path, 2_000_000_000)
    index = tmp_path / "index.md"
    index.write_text("# Wiki Index\n", encoding="utf-8")
    os.utime(index, ns=(1_000_000_000, 1_000_000_000))

    assert run_gate(tmp_path) == {
        "changedPaths": [],
        "reason": "up_to_date",
        "wakeAgent": False,
    }


def test_newer_wiki_file_wakes_agent(tmp_path: Path) -> None:
    create_graph(tmp_path, 1_000_000_000)
    concept = tmp_path / "concepts" / "updated.md"
    concept.parent.mkdir()
    concept.write_text("# Updated\n", encoding="utf-8")
    os.utime(concept, ns=(2_000_000_000, 2_000_000_000))

    assert run_gate(tmp_path)["reason"] == "wiki_changed"


def test_inbox_wakes_even_when_source_is_older(tmp_path: Path) -> None:
    create_graph(tmp_path, 2_000_000_000)
    source = tmp_path / "inbox" / "new-source.md"
    source.parent.mkdir()
    source.write_text("# New source\n", encoding="utf-8")
    os.utime(source, ns=(1_000_000_000, 1_000_000_000))

    assert run_gate(tmp_path) == {
        "changedPaths": ["inbox/new-source.md"],
        "reason": "source_inbox",
        "wakeAgent": True,
    }
```

```bash
uvx pytest -q test_pkm_wiki_gate.py
uvx ruff check pkm_wiki_gate.py test_pkm_wiki_gate.py
uvx basedpyright --level error \
  pkm_wiki_gate.py test_pkm_wiki_gate.py
```

mtime 게이트는 빠르고 이해하기 쉽지만 파일 내용 해시만큼 강하지 않다. 네트워크 파일시스템, 과거 시각으로 복원한 백업, 외부 도구의 시각 보존 복사까지 엄격히 감지해야 한다면 manifest 기반 SHA-256 게이트로 확장한다.

## 6. Cron prompt를 운영 계약으로 작성하기

스킬만 연결하고 “위키를 갱신하라”고 짧게 지시하면 에이전트가 실행마다 변경을 다시 탐색하거나, 비동기 작업을 기다리지 않거나, cron에서 승인이 불가능한 명령을 호출할 수 있다. Prompt에는 데이터 흐름과 성공 조건을 명시한다.

다음 내용을 `CRON_PROMPT`로 사용한다. 경로는 공개용 예시다.

```text
pre-run Script Output의 wakeAgent, reason, changedPaths를 신뢰하고 변경 여부를 다시 계산하지 않는다.

reason이 source_inbox이면 changedPaths의 입력만 커스텀 llm-wiki 규칙으로 ingest한다. raw 사본과 위키 반영이 모두 성공한 입력만 inbox/processed/ 아래로 이동한다.

reason이 wiki_changed 또는 graph_missing이면 새 ingest 없이 기존 위키를 orient하고 lint한 다음 지식그래프를 생성한다. 항상 SCHEMA.md, index.md, log.md의 최근 30개 항목을 먼저 읽는다.

cron 보안상 execute_code와 python -c를 호출하지 않는다. 기존 페이지 10개 이상을 수정해야 하면 수정하지 말고 승인 필요 범위를 보고한다. raw 원본은 수정하지 않는다.

understand-knowledge로 .ua/knowledge-graph.json과 .ua/meta.json을 갱신한다. Phase 3에서는 /absolute/path/to/understand-anything-plugin/agents/article-analyzer.md 지침을 읽고 예상 배치 수를 기록한 뒤 최대 3개 배치의 delegate_task를 한 번에 호출한다.

delegate_task는 백그라운드이므로 호출 직후 완료로 간주하거나 최종 응답하지 않는다. 분석 결과 메시지가 다시 들어오고 예상한 모든 .ua/intermediate/analysis-batch-N.json이 존재할 때까지 부모 턴을 유지한다. 기다릴 때는 안전한 terminal 명령 sleep 15를 사용하고 파일 수를 다시 확인한다.

모든 배치가 없으면 merge, save, 성공 보고를 금지한다. 모든 배치가 확인된 뒤에만 merge, dangling-edge 검증, graph/meta 저장, intermediate 정리를 수행한다.

저장 후 knowledge-graph.json과 meta.json의 mtime이 이번 실행 시작 이후인지 확인한다. cron 환경에서는 dashboard를 열지 않는다. 마지막에 변경 파일, lint 결과, 그래프 노드·엣지 통계를 간단히 보고한다.
```

이 prompt에서 특히 중요한 부분은 다음과 같다.

- **게이트 결과를 다시 판단하지 않는다**: 결정적 검사는 Python, 의미 작업은 LLM이 담당한다.
- **입력 단위를 제한한다**: `source_inbox`에서는 `changedPaths`만 처리한다.
- **성공 조건을 산출물로 정의한다**: 모델의 말이 아니라 batch 파일, graph/meta, dangling edge로 판정한다.
- **무인 실행의 권한 경계를 고정한다**: 승인이 필요한 명령을 시도하지 않는다.

## 7. Hermes cron 생성

### 7.1 시간대 설정

```bash
hermes config set timezone Asia/Seoul
```

`0 3 * * *`는 설정된 시간대 기준으로 매일 03:00이다. 서버의 시스템 시간대와 Hermes 시간대가 다를 수 있으므로 `hermes cron list`의 `Next run`을 반드시 확인한다.

### 7.2 작업 생성

긴 prompt는 셸 quoting 실수를 줄이기 위해 먼저 변수에 넣거나 별도 안전한 텍스트 파일에서 읽는다. 아래에서는 이미 `CRON_PROMPT` 변수에 위 내용을 넣었다고 가정한다.

```bash
hermes cron create "0 3 * * *" "$CRON_PROMPT" \
  --name pkm-study \
  --deliver local \
  --skill custom/llm-wiki-ains \
  --skill understand-knowledge \
  --script pkm_wiki_gate.py \
  --workdir "$PROJECT_ROOT"
```

각 옵션의 역할은 다음과 같다.

| 옵션 | 역할 |
|---|---|
| `--name pkm-study` | 운영자가 알아보기 쉬운 작업명 |
| `--deliver local` | 결과를 로컬 cron output에 보존 |
| 첫 번째 `--skill` | 커스텀 위키 ingest·lint 워크플로우 |
| 두 번째 `--skill` | 위키용 지식그래프 생성 워크플로우 |
| `--script` | agent 실행 전에 변경 여부를 판정 |
| `--workdir` | agent 파일·터미널 도구의 프로젝트 루트 |

여기서는 `--no-agent`를 사용하면 안 된다. `--no-agent`는 스크립트 stdout 자체가 작업 결과일 때 쓰는 모드다. 이 파이프라인에서 스크립트는 게이트이고, 변경이 있을 때는 두 스킬을 사용하는 LLM agent가 필요하다.

생성 결과에서 12자리 Job ID를 기록한다.

```bash
hermes cron list
JOB_ID="012345abcdef"
```

설정이 잘못되었다면 전체를 삭제하고 다시 만들 필요 없이 수정할 수 있다.

```bash
hermes cron edit "$JOB_ID" --name pkm-study
hermes cron edit "$JOB_ID" --schedule "0 3 * * *"
hermes cron edit "$JOB_ID" --prompt "$CRON_PROMPT"
```

스킬 목록 전체를 교체할 때는 `--skill`을 반복한다.

```bash
hermes cron edit "$JOB_ID" \
  --skill custom/llm-wiki-ains \
  --skill understand-knowledge
```

## 8. Gateway를 launchd 서비스로 배포하기

cron job을 저장하는 것과 예약 시각에 실행할 scheduler를 계속 띄우는 것은 별개다. macOS에서는 Hermes gateway를 launchd 서비스로 설치한다.

```bash
hermes gateway install --start-now --start-on-login
hermes gateway status --deep
hermes cron status
```

정상 상태에서는 다음 조건을 확인한다.

- launchd service definition이 현재 Hermes 설치와 일치한다.
- gateway PID가 존재한다.
- ticker heartbeat가 갱신된다.
- active job 수와 next run이 표시된다.

설정 파일이나 외부 스킬 경로를 바꾼 뒤에는 gateway를 재시작한다.

```bash
hermes gateway restart
hermes gateway status
```

`restart` 중 “drain timeout” 경고가 보여도 새 PID, running 상태, heartbeat가 모두 정상이라면 강제 launchd 재시작이 완료된 것이다. 최종 상태를 기준으로 판단한다.

## 9. 변경이 있는 실행을 수동 QA하기

예약 시각까지 기다리지 말고 실제 사용 표면에서 한 번 강제 실행한다.

### 9.1 게이트가 변경을 감지하는지 확인

테스트용 입력을 `inbox/`에 넣거나 canonical wiki 파일을 의도적으로 갱신한 상태에서 실행한다.

```bash
python3 "$HERMES_DIR/scripts/pkm_wiki_gate.py"
```

예상 출력:

```json
{
  "changedPaths": ["inbox/new-source.md"],
  "reason": "source_inbox",
  "wakeAgent": true
}
```

### 9.2 Job을 다음 tick에 예약하고 즉시 실행

`cron run`은 Job을 다음 scheduler tick에서 실행되도록 표시한다. 즉시 검증하려면 `tick`까지 호출한다.

```bash
hermes cron run "$JOB_ID"
hermes cron tick
```

긴 분석에서는 명령이 수 분 동안 실행될 수 있다. 별도의 두 번째 실행을 중복 시작하지 말고 agent log와 output을 관찰한다.

```bash
hermes cron list
hermes logs
```

결과 문서는 보통 다음 경로에 저장된다.

```text
~/.hermes/cron/output/<JOB_ID>/YYYY-MM-DD_HH-MM-SS.md
```

`last_status: ok`만 보지 말고 결과 문서가 “배치 미완료” 같은 의미상 실패를 보고하지 않는지 확인한다.

### 9.3 Graph와 meta를 구조적으로 검증

```bash
GRAPH="$PROJECT_ROOT/.ua/knowledge-graph.json"
META="$PROJECT_ROOT/.ua/meta.json"

jq -e '
  .kind == "knowledge"
  and (.nodes | type == "array" and length > 0)
  and (.edges | type == "array")
  and (.layers | type == "array")
  and (.tour | type == "array")
' "$GRAPH" >/dev/null

jq '{
  kind,
  nodes: (.nodes | length),
  edges: (.edges | length),
  layers: (.layers | length),
  tour: (.tour | length)
}' "$GRAPH"

jq . "$META"
```

`.tour`는 배열이므로 `.tour.steps`처럼 객체로 가정하면 안 된다.

dangling edge가 없는지 검사한다.

```bash
jq -e '
  [.nodes[].id] as $ids
  | [
      .edges[]
      | .source as $source
      | .target as $target
      | select(
          ($ids | index($source) | not)
          or ($ids | index($target) | not)
        )
    ]
  | length == 0
' "$GRAPH" >/dev/null
```

마지막으로 graph와 meta의 수정 시각이 이번 수동 실행보다 새로운지 확인한다. 파일이 존재한다는 사실만으로는 이전 실행의 낡은 결과인지 구분할 수 없다.

## 10. 무변경 실행이 LLM을 깨우지 않는지 검증

성공한 그래프가 모든 감시 파일보다 최신이면 게이트는 다음을 반환해야 한다.

```bash
python3 "$HERMES_DIR/scripts/pkm_wiki_gate.py"
```

```json
{
  "changedPaths": [],
  "reason": "up_to_date",
  "wakeAgent": false
}
```

이 상태에서 다시 강제 실행한다.

```bash
hermes cron run "$JOB_ID"
hermes cron tick
```

정상이라면 수 초 이내 종료되고 최신 cron output에 다음 문구가 남는다.

```text
Script gate returned `wakeAgent=false` — agent skipped.
```

agent log에도 다음 형태의 기록이 있어야 한다.

```text
wakeAgent=false, skipping agent run
```

이 경로에서는 skills가 prompt에 로드되지 않고 모델 API 호출도 일어나지 않는다. 이것이 매일 실행되는 자동화의 비용을 실질적으로 줄이는 핵심이다.

## 11. 비동기 분석 배치의 조기 종료 방지

Understand Anything의 LLM 분석 단계가 `delegate_task`를 사용하면 각 subagent는 백그라운드에서 실행되고 호출 자체는 즉시 반환될 수 있다. 부모 에이전트가 할 일을 모두 끝냈다고 판단하면 배치 파일이 생성되기 전에 최종 응답을 내보낼 수 있다.

실제로 주의할 상태는 다음과 같다.

```text
Cron status: ok
Response: “분석 배치가 아직 완료되지 않았습니다.”
Graph mtime: 이전 실행 시각
```

이를 막으려면 prompt에 예상 배치 수와 파일 기반 barrier를 넣는다.

```text
expected_batches = 3

delegate_task(batch 1, batch 2, batch 3)
        │
        ├── analysis-batch-1.json
        ├── analysis-batch-2.json
        └── analysis-batch-3.json
                    │
                    ▼
       세 파일이 모두 있을 때만 merge
```

Hermes의 delegation 지침은 일반적으로 polling을 권하지 않지만, cron처럼 부모 세션이 끝나면 백그라운드 결과를 잃을 수 있는 작업에서는 부모 턴을 유지해야 한다. 이 사례에서는 안전한 `sleep 15`와 결과 파일 수 확인을 제한적으로 반복한다. 중요한 것은 기다린 시간 자체가 아니라 **모든 예상 산출물이 존재한다는 barrier**다.

운영 prompt에는 다음 금지 조건을 명시한다.

- 배치가 하나라도 없으면 merge하지 않는다.
- 기존 graph를 그대로 두고 성공이라고 보고하지 않는다.
- batch 파일 생성이 끝나기 전에 intermediate를 정리하지 않는다.
- 최종 graph 저장 후 node 필드와 dangling edge를 검증한다.

## 12. 보안과 권한 경계

### 12.1 Cron은 대화형 승인을 받을 수 없다

무인 cron에서 위험 명령이 감지되면 Hermes는 승인을 요청할 사용자가 없으므로 실행을 차단한다. 다음 동작을 agent prompt에서 금지한다.

- `execute_code`
- `python -c`처럼 임의 코드를 인라인 실행하는 명령
- `rm -rf`와 재귀 삭제
- foreground 셸 명령의 `&` 백그라운딩
- 광범위한 파일 이동·대량 수정

필요한 결정적 처리는 미리 검토한 `~/.hermes/scripts/` 파일에 두고, agent는 제한된 파일·검색·터미널 도구만 사용하게 한다.

### 12.2 Raw 원본은 불변이다

`raw/` 파일은 읽기만 한다. 수정이 필요하면 canonical 위키 페이지에 정정 내용을 기록한다. inbox 입력은 raw 보존과 위키 반영이 모두 성공한 경우에만 `inbox/processed/`로 이동한다.

### 12.3 외부 스킬은 최소 경로만 신뢰한다

`skills.external_dirs`는 실행 가능한 지침을 agent prompt에 넣을 수 있는 신뢰 경계다. 저장소 전체나 홈 디렉터리 전체를 추가하지 않는다. 스킬 원본의 SHA-256을 배포 시 기록하고 변경 감사를 수행할 수 있다.

```bash
shasum -a 256 "$LLM_WIKI_SKILL_DIR/SKILL.md"
```

### 12.4 Prompt에 secret을 넣지 않는다

cron output과 agent log는 운영 진단을 위해 보존된다. 토큰, 쿠키, 개인 chat ID, 내부 URL을 prompt나 stdout에 넣지 않는다. Hermes의 출력 redaction은 추가 방어선이지 secret 관리 수단을 대체하지 않는다.

## 13. 장애 진단

| 증상 | 가능 원인 | 확인 및 조치 |
|---|---|---|
| 예약 시각에 실행되지 않음 | gateway 미실행 | `hermes gateway status`, `hermes cron status` 확인 |
| `Skill not found` | 별칭 또는 플러그인 링크 오류 | `readlink`, `hermes skills list` 확인 |
| 외부 스킬 보안 경고 | 실제 링크 대상이 `external_dirs` 밖 | `pwd -P`로 실제 경로를 구해 최소 상위 경로 추가 |
| `Script not found` | gate가 `~/.hermes/scripts/` 밖에 있음 | 스크립트를 허용 디렉터리로 이동하고 `--script`에는 파일명 사용 |
| 항상 `wakeAgent=true` | graph보다 새로운 파일이 계속 생김 | `changedPaths`와 파일 mtime 확인, 생성 프로세스 조사 |
| `ok`인데 graph가 갱신되지 않음 | 비동기 batch 조기 종료 | cron output 본문, batch 파일 수, graph mtime 확인 |
| parser traceback | 위키 frontmatter 자료형 불일치 | parser를 수동 실행해 정확한 파일과 필드를 확인한 뒤 schema 정규화 |
| 위험 명령 차단 | cron에서 승인 불가능한 명령 사용 | prompt와 스크립트를 결정적·비파괴 명령으로 재설계 |
| graph 검증 실패 | 필수 node 필드 누락 또는 dangling edge | 새 graph를 배포하지 말고 intermediate와 merge report 보존 |

로그 확인:

```bash
hermes logs
hermes logs errors
```

Job 결과 확인:

```bash
ls -1t "$HERMES_DIR/cron/output/$JOB_ID" | head
```

새 raw 파일이 graph 저장 직후 생성되면 첫 실행이 성공했더라도 gate가 다시 `wiki_changed`를 반환한다. 이는 오류가 아니라 실행 중 새로운 입력이 도착했다는 뜻이다. 다음 tick에서 다시 처리하거나 운영자가 한 번 더 수동 실행한다.

## 14. 일시 중지, 재개, 수정, 삭제

문제가 있을 때는 삭제보다 pause를 우선한다. Job ID와 설정을 보존한 채 scheduler 실행만 막을 수 있다.

```bash
hermes cron pause "$JOB_ID"
hermes cron list
```

수정 후 재개한다.

```bash
hermes cron edit "$JOB_ID" --prompt "$CRON_PROMPT"
hermes cron resume "$JOB_ID"
```

완전히 제거해야 할 때만 삭제한다.

```bash
hermes cron remove "$JOB_ID"
```

삭제 전에 `~/.hermes/cron/jobs.json`, 해당 Job의 output, gate 스크립트, 실제 prompt를 백업한다. Job 삭제는 위키나 graph를 자동으로 삭제하지 않지만, 같은 ID로 축적된 운영 이력을 다시 연결하기 어려울 수 있다.

gateway 자체를 중단하는 것은 모든 예약 작업에 영향을 준다. 특정 작업 문제라면 gateway를 멈추지 말고 해당 Job만 pause한다.

## 15. 운영 체크리스트

### 배포 전

- [ ] 위키 root가 절대 경로이며 존재한다.
- [ ] `SCHEMA.md`, `index.md`, `log.md`를 읽을 수 있다.
- [ ] 커스텀 스킬 별칭이 올바른 실제 경로를 가리킨다.
- [ ] `skills.external_dirs`가 최소 신뢰 경계로 설정되어 있다.
- [ ] gate 스크립트가 `~/.hermes/scripts/` 아래에 있다.
- [ ] gate 단위 테스트와 정적 검사가 통과한다.
- [ ] cron prompt에 성공 조건과 금지 동작이 명시되어 있다.
- [ ] 시간대와 다음 실행 시각을 확인했다.

### 변경 실행 QA

- [ ] gate가 `source_inbox`, `wiki_changed`, `graph_missing` 중 의도한 reason을 반환한다.
- [ ] 예상 분석 batch가 모두 완료된다.
- [ ] graph/meta mtime이 이번 실행 이후다.
- [ ] node와 edge가 배열이며 node 수가 0보다 크다.
- [ ] dangling edge가 0이다.
- [ ] cron output 본문에 의미상 실패가 없다.

### 무변경 실행 QA

- [ ] gate가 `up_to_date`, `wakeAgent=false`를 반환한다.
- [ ] 강제 cron 실행이 수 초 안에 끝난다.
- [ ] output에 `agent skipped`가 기록된다.
- [ ] 모델 API 호출이 발생하지 않는다.

### 상시 운영

- [ ] gateway heartbeat와 next run을 주기적으로 확인한다.
- [ ] 스킬 원본 변경을 SHA-256으로 감사한다.
- [ ] cron output과 errors log의 보존 정책을 정한다.
- [ ] raw 불변성과 inbox/processed 규칙을 지킨다.
- [ ] 위키 규모 증가에 따라 batch 수와 실행 시간을 재평가한다.

## 16. 전체 명령 요약

```bash
# 1) 시간대
hermes config set timezone Asia/Seoul

# 2) 스킬 별칭과 신뢰 경로 설정 후
hermes config check
hermes gateway restart

# 3) 게이트 검증
python3 "$HOME/.hermes/scripts/pkm_wiki_gate.py"

# 4) Job 생성
hermes cron create "0 3 * * *" "$CRON_PROMPT" \
  --name pkm-study \
  --deliver local \
  --skill custom/llm-wiki-ains \
  --skill understand-knowledge \
  --script pkm_wiki_gate.py \
  --workdir "$PROJECT_ROOT"

# 5) Gateway
hermes gateway install --start-now --start-on-login
hermes gateway status --deep
hermes cron status

# 6) 수동 변경 실행
hermes cron run "$JOB_ID"
hermes cron tick

# 7) 무변경 실행
python3 "$HOME/.hermes/scripts/pkm_wiki_gate.py"
hermes cron run "$JOB_ID"
hermes cron tick

# 8) 운영
hermes cron list
hermes cron pause "$JOB_ID"
hermes cron resume "$JOB_ID"
```

## 결론

안정적인 LLM cron 자동화는 “정해진 시각에 프롬프트를 던지는 기능”이 아니다. 결정적 변경 감지, 명시적인 스킬 신뢰 경계, 비동기 결과 barrier, 산출물 기반 검증, 무변경 0-token 경로를 하나의 운영 계약으로 묶는 일이다.

이 구조에서 Python 게이트는 **에이전트를 깨울지** 결정하고, `llm-wiki-ains`는 **원본을 어떤 지식으로 컴파일할지** 결정하며, `understand-knowledge`는 **그 지식을 어떤 관계 그래프로 표현할지** 결정한다. 책임을 분리하면 각 부분을 독립적으로 테스트하고, 실패 시 마지막으로 검증된 graph를 유지하며, 위키가 커져도 운영 비용을 통제할 수 있다.
