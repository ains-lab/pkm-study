---
title: Zotero MCP
created: 2026-07-16
updated: 2026-07-22
type: entity
tags:
  - tool
  - open-source
  - zotero
  - mcp
  - research
sources:
  - raw/notebooklm/zotero-mcp-github.md
  - raw/notebooklm/llm-wiki-zotero-notebooklm-youtube.md
  - raw/web/zotero-mcp-server-installation.md
  - raw/web/codex-mcp-configuration.md
confidence: medium
---

# Zotero MCP

Zotero MCP는 AI 에이전트가 로컬 [[zotero]] 라이브러리의 메타데이터, PDF 본문, 주석과 컬렉션에 접근하도록 연결하는 오픈소스 통합 계층이다. Zotero 확장으로 동작하는 구현과 독립 MCP 서버로 동작하는 구현이 있으며, Codex 설치 절차는 Python 패키지 `zotero-mcp-server`를 사용하는 `54yyyu/zotero-mcp` 구현을 기준으로 한다. ^[raw/notebooklm/zotero-mcp-github.md] ^[raw/web/zotero-mcp-server-installation.md]

## 구현 구분

- `cookjohn/zotero-mcp`: Zotero 애플리케이션에 설치하는 플러그인 구현
- `54yyyu/zotero-mcp`: `zotero-mcp-server` 패키지와 `zotero-mcp` 실행 파일을 제공하는 독립 MCP 서버 구현

두 구현은 이름이 비슷하지만 설치 경로가 다르다. 아래 절차는 Codex가 STDIO로 로컬 프로세스를 시작하는 두 번째 구현에만 적용된다.

## 제공 기능

- 제목·저자·연도·태그·본문을 조합한 문헌 검색
- PDF 본문, 초록, 노트, 웹 스냅샷 추출
- 하이라이트와 주석 검색
- 컬렉션 탐색과 의미 검색
- 선택적으로 노트·태그·메타데이터 쓰기

## Codex 환경에 설치

### 1. 사전 조건

- Python 3.10 이상과 `uv`
- Zotero 7 이상
- 로컬 API가 활성화된 실행 중인 Zotero Desktop
- MCP를 지원하는 Codex CLI, 앱 또는 IDE 확장

Zotero 9에서는 **Settings → Advanced → Allow other applications on this computer to communicate with Zotero**를 활성화한다. 로컬 API는 빠른 읽기에 적합하며, 로컬 API만 구성한 상태에서는 라이브러리 쓰기를 사용할 수 없다. ^[raw/web/zotero-mcp-server-installation.md]

### 2. 서버 설치

기본 검색·메타데이터·주석·쓰기 도구만 필요하면 기본 패키지를 설치한다.

```bash
uv tool install zotero-mcp-server
```

의미 검색까지 필요하면 처음부터 `semantic` extra를 선택한다. PDF·Scite 기능까지 모두 필요할 때만 더 무거운 `all` extra를 사용한다.

```bash
uv tool install "zotero-mcp-server[semantic]"
# 또는
uv tool install "zotero-mcp-server[all]"
```

설치 위치는 `command -v zotero-mcp` 또는 `zotero-mcp setup-info`로 확인한다. GUI로 실행되는 Codex는 셸의 `PATH`를 그대로 상속하지 않을 수 있으므로 MCP 등록에는 절대 경로를 쓰는 편이 안전하다. ^[raw/web/zotero-mcp-server-installation.md]

### 3. Codex에 로컬 읽기 모드 등록

Codex는 로컬 MCP 서버를 STDIO 프로세스로 실행할 수 있다. 다음 명령은 설치된 실행 파일의 절대 경로를 구해 전역 Codex MCP 설정에 `zotero` 서버를 추가한다. ^[raw/web/codex-mcp-configuration.md]

```bash
ZOTERO_MCP_BIN="$(command -v zotero-mcp)"
codex mcp add zotero \
  --env ZOTERO_LOCAL=true \
  -- "$ZOTERO_MCP_BIN" serve
```

같은 설정을 `~/.codex/config.toml`에 직접 기록하려면 다음 형태를 사용한다. 신뢰된 저장소에서만 프로젝트별 `.codex/config.toml`을 사용할 수 있으며, Codex CLI·앱·IDE 확장은 같은 호스트의 설정을 공유한다. ^[raw/web/codex-mcp-configuration.md]

```toml
[mcp_servers.zotero]
command = "/absolute/path/to/zotero-mcp"
args = ["serve"]
enabled = true
startup_timeout_sec = 20
tool_timeout_sec = 120
default_tools_approval_mode = "writes"

[mcp_servers.zotero.env]
ZOTERO_LOCAL = "true"
```

`default_tools_approval_mode = "writes"`는 읽기 도구는 자동 실행하고, 읽기 전용으로 표시되지 않은 도구는 승인 대상으로 분리한다.

### 4. 등록과 연결 검증

설정 후 Codex를 재시작하고 다음 순서로 확인한다.

```bash
zotero-mcp version
codex mcp get zotero --json
codex mcp list
```

`codex mcp get zotero --json` 결과에서 `enabled: true`, `type: stdio`, `args: ["serve"]`, `ZOTERO_LOCAL: true`를 확인한다. TUI 또는 앱에서는 `/mcp`로 활성 서버와 도구를 확인한 다음, 라이브러리 목록이나 최근 항목처럼 부작용 없는 읽기 요청을 한 번 실행해 실제 연결을 검증한다. 설정 파일에 서버가 보여도 Zotero Desktop이 꺼져 있거나 로컬 API가 비활성화되어 있으면 도구 호출은 실패할 수 있다. ^[raw/web/codex-mcp-configuration.md] ^[raw/web/zotero-mcp-server-installation.md]

### 5. 쓰기와 시맨틱 검색은 선택적으로 활성화

추가·수정 같은 쓰기 작업은 Zotero Web API 자격증명이 필요하다. API 키를 저장소의 설정 파일에 직접 넣지 말고 Codex를 실행하는 환경에서 전달한 뒤, MCP 설정에는 전달할 변수 이름만 둔다.

기존 `[mcp_servers.zotero]` 표에 다음 줄을 추가한다.

```toml
env_vars = ["ZOTERO_API_KEY", "ZOTERO_LIBRARY_ID", "ZOTERO_LIBRARY_TYPE"]
```

`ZOTERO_LOCAL=true`와 Web API 자격증명을 함께 사용하면 로컬 읽기와 원격 쓰기를 결합한 하이브리드 모드가 된다. 그룹 라이브러리는 `ZOTERO_LIBRARY_TYPE=group`을 사용한다. ^[raw/web/zotero-mcp-server-installation.md] ^[raw/web/codex-mcp-configuration.md]

의미 검색 extra를 설치했다면 별도의 색인을 구성하고 갱신한다.

```bash
zotero-mcp setup --semantic-config-only
zotero-mcp update-db
zotero-mcp db-status
```

새 항목을 추가한 뒤 의미 검색에서 찾으려면 색인을 다시 갱신해야 한다. 임베딩 모델을 바꾸거나 색인이 손상된 경우에만 `zotero-mcp update-db --force-rebuild`를 사용한다.

## 위키 인입에서의 의미

[[llm-wiki]]로 논문을 인입할 때 첨부 PDF만 가져오면 서지정보와 부모 항목의 관계가 끊길 수 있다. Zotero MCP는 먼저 부모 레코드의 메타데이터를 확인하고 그다음 본문을 가져오는 통로로 사용해야 한다.

[[ai-knowledge-workflow]]에서는 Zotero MCP가 원본 도서관과 에이전트 사이의 경계 인터페이스이며, 심층 질의와 산출물 생성은 [[notebooklm-py]]가 보완한다.
