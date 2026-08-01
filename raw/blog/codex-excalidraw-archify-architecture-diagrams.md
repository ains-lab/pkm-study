---
title: "Codex에서 Excalidraw와 Archify로 아키텍처 다이어그램 만들기"
source_type: authored
ingested: 2026-07-21
tested_with: "Codex CLI 0.144.6, Node.js v24.13.1, mcp-excalidraw-server v1.1.0, Archify v2.11.0, macOS launchd"
sha256: 90f660d2a7f89099e07000a3b526007b7424ccefc77daea6e084bf328d622a09
---

# Codex에서 Excalidraw와 Archify로 아키텍처 다이어그램 만들기

코드 에이전트에게 “이 저장소의 아키텍처를 그려줘”라고 요청하면 결과물의 목적부터 갈린다. 회의 중에 구조를 빠르게 고치고 싶을 때는 편집 가능한 캔버스가 필요하고, README나 기술 문서에 넣을 때는 테마와 내보내기 기능이 포함된 정돈된 산출물이 필요하다.

이 글은 Codex 환경에서 다음 두 Agent Skill을 설치하고 사용하는 방법을 설명한다.

- **Excalidraw Skill + MCP**: 라이브 캔버스에서 요소를 만들고, 화면을 캡처하며, `.excalidraw` 파일로 반복 편집한다.
- **Archify Skill**: 타입이 있는 JSON IR을 검증하고, 다크·라이트 테마와 이미지 내보내기를 포함한 단일 HTML 다이어그램을 만든다.

두 도구는 같은 문제를 서로 다른 방식으로 푼다. Excalidraw는 탐색과 편집에 강하고, Archify는 검증된 배포용 산출물에 강하다.

> [!note] 검증 환경
> 이 글의 절차는 macOS, Node.js v24.13.1, Codex CLI 0.144.6, `mcp-excalidraw-server@1.1.0`, Archify v2.11.0에서 검증했다. 두 프로젝트 모두 Node.js 18 이상을 요구한다.

## 1. 먼저 선택 기준부터 정리하기

| 기준 | Excalidraw | Archify |
|---|---|---|
| 주된 결과물 | 라이브 캔버스, `.excalidraw`, PNG, SVG | 자체 포함 HTML, PNG, JPEG, WebP, SVG |
| 작업 방식 | MCP·CLI로 요소를 직접 생성하고 반복 수정 | Agent가 JSON IR을 만들고 렌더러가 검증·출력 |
| 강점 | 자유로운 배치, 손 편집, 실시간 확인 | 일관된 디자인, 테마 전환, 구조·레이아웃 검증 |
| 서버 | 로컬 캔버스 서버 사용 | 불필요 |
| 브라우저 | 스크린샷·Mermaid·이미지 출력에 필요 | 완성된 HTML 확인·내보내기에 필요 |
| 적합한 상황 | 설계 탐색, 워크숍, 수동 보정 | README, 기술 블로그, 설계 문서, 리뷰 산출물 |

실무에서는 “편집 가능한 원본”이 중요하면 Excalidraw를, “일관된 최종 문서”가 중요하면 Archify를 먼저 선택하면 된다.

## 2. 공통 전제 조건

먼저 기본 도구를 확인한다.

```bash
node --version
npm --version
codex --version
```

Node.js는 18 이상이어야 한다. 이 글에서는 재현성을 위해 패키지와 릴리스 버전을 고정한다. 최신 버전을 바로 사용하고 싶다면 명령의 `@1.1.0`과 `--ref v2.11.0`을 제거할 수 있지만, 팀 단위 환경에서는 검증된 버전을 고정하는 편이 안전하다.

## 3. Excalidraw Skill과 MCP 설치

Excalidraw 통합은 세 층으로 나뉜다.

```text
Codex Agent Skill
      │ 작업 절차와 품질 기준
      ▼
MCP 또는 CLI
      │ 요소 생성·조회·수정·내보내기
      ▼
로컬 Canvas Server :3000
      │ WebSocket 동기화
      ▼
브라우저의 Excalidraw 캔버스
```

### 3.1 Codex 전역 Skill 설치

패키지에 포함된 Skill을 Codex 전역 디렉터리에 설치한다.

```bash
npx -y mcp-excalidraw-server@1.1.0 install-skill --target codex
test -f "$HOME/.codex/skills/excalidraw-skill/SKILL.md"
```

설치 후 새 Codex 작업을 열거나 앱을 재시작한다. 이미 열린 작업은 시작 시점의 Skill 목록을 유지할 수 있다.

### 3.2 Codex MCP 등록

CLI만으로도 모든 기능을 사용할 수 있지만, Codex가 MCP 도구를 직접 호출하게 하려면 전역 MCP 서버를 등록한다.

```bash
codex mcp add excalidraw -- \
  npx -y mcp-excalidraw-server@1.1.0
```

등록 상태를 확인한다.

```bash
codex mcp get excalidraw
```

정상이라면 다음 핵심 값이 보인다.

```text
enabled: true
transport: stdio
command: npx
args: -y mcp-excalidraw-server@1.1.0
```

같은 이름이 이미 등록되어 있다면 먼저 현재 설정을 확인한다. 의도적으로 교체할 때만 삭제 후 다시 추가한다.

```bash
codex mcp remove excalidraw
```

### 3.3 Canvas Server 기동과 헬스체크

캔버스에 접근하는 CLI나 MCP 명령은 서버가 없을 때 자동으로 시작한다. 명시적으로 시작하려면 다음을 실행한다.

```bash
npx -y mcp-excalidraw-server@1.1.0 start
open http://127.0.0.1:3000
```

상태와 HTTP 헬스체크를 확인한다.

```bash
npx -y mcp-excalidraw-server@1.1.0 status
curl --fail http://127.0.0.1:3000/health
```

브라우저 탭은 단순한 미리보기가 아니다. PNG·SVG 스크린샷, Mermaid 변환, viewport 제어는 프런트엔드 렌더링을 사용하므로 `http://127.0.0.1:3000` 탭을 열어둬야 한다.

### 3.4 macOS 로그인 시 자동 시작하기

`~/.zshrc`는 macOS 부팅 시점이 아니라 대화형 터미널을 열 때마다 실행된다. 로그인 후 터미널 없이 한 번 시작하려면 사용자 LaunchAgent가 적합하다.

다음 예시는 NVM 기본 Node 버전을 불러온 뒤 Excalidraw 서버를 시작한다.

```bash
AUTOSTART_LABEL="com.local.mcp-excalidraw-server"
AUTOSTART_PLIST="$HOME/Library/LaunchAgents/$AUTOSTART_LABEL.plist"

mkdir -p "$HOME/Library/LaunchAgents" "$HOME/Library/Logs"

cat > "$AUTOSTART_PLIST" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>$AUTOSTART_LABEL</string>

    <key>ProgramArguments</key>
    <array>
        <string>/bin/zsh</string>
        <string>-c</string>
        <string>source "\$NVM_DIR/nvm.sh" &amp;&amp; nvm use default --silent &amp;&amp; exec npx -y mcp-excalidraw-server@1.1.0 start</string>
    </array>

    <key>EnvironmentVariables</key>
    <dict>
        <key>HOME</key>
        <string>$HOME</string>
        <key>NVM_DIR</key>
        <string>$HOME/.nvm</string>
        <key>PATH</key>
        <string>/usr/bin:/bin:/usr/sbin:/sbin</string>
    </dict>

    <key>WorkingDirectory</key>
    <string>$HOME</string>
    <key>RunAtLoad</key>
    <true/>
    <key>ProcessType</key>
    <string>Background</string>

    <key>StandardOutPath</key>
    <string>$HOME/Library/Logs/mcp-excalidraw-server.log</string>
    <key>StandardErrorPath</key>
    <string>$HOME/Library/Logs/mcp-excalidraw-server.error.log</string>
</dict>
</plist>
EOF
```

plist를 검사하고 현재 로그인 세션에 등록한다.

```bash
plutil -lint "$AUTOSTART_PLIST"
launchctl bootout "gui/$(id -u)" "$AUTOSTART_PLIST" 2>/dev/null || true
launchctl bootstrap "gui/$(id -u)" "$AUTOSTART_PLIST"
launchctl enable "gui/$(id -u)/$AUTOSTART_LABEL"
```

`start` 명령은 실제 Canvas Server를 detached 프로세스로 만든 뒤 종료한다. 따라서 잠시 후 `launchctl print`에서 starter job이 `not running`, `last exit code = 0`으로 보여도 정상이다. 실제 상태는 `status`나 `/health`로 판단한다.

```bash
launchctl print "gui/$(id -u)/$AUTOSTART_LABEL"
npx -y mcp-excalidraw-server@1.1.0 status
```

이 LaunchAgent는 **부팅 후 사용자 로그인 시** 실행된다. 로그인 전부터 실행해야 하는 시스템 LaunchDaemon은 관리자 권한과 별도 보안 설계가 필요하므로 이 용도에는 권장하지 않는다.

## 4. Excalidraw 사용법

### 4.1 Codex 프롬프트로 시작하기

가장 간단한 사용법은 Skill을 명시하고 결과 파일과 검증 조건을 함께 요청하는 것이다.

```text
$excalidraw-skill 이 저장소의 런타임 아키텍처를 분석해 다이어그램으로 그려줘.
핵심 컴포넌트는 12개 이하로 제한하고, 주요 요청 경로와 신뢰 경계를 표시해줘.
스크린샷으로 겹침과 잘린 텍스트를 검증한 뒤 docs/architecture.excalidraw로 내보내줘.
```

기존 Mermaid를 편집 가능한 Excalidraw로 옮길 수도 있다.

```text
$excalidraw-skill 아래 Mermaid 흐름을 Excalidraw 캔버스로 변환하고,
레이블 겹침과 화살표 교차를 수정한 뒤 PNG와 .excalidraw 파일로 저장해줘.
```

MCP가 활성화된 작업에서는 Codex가 `read_diagram_guide`, `batch_create_elements`, `describe_scene`, `get_canvas_screenshot`, `export_scene` 같은 도구를 직접 사용한다. MCP가 보이지 않는 환경에서는 Skill이 동일 기능의 CLI를 사용한다.

### 4.2 CLI로 작은 다이어그램 만들기

CLI는 JSON 배열을 입력받는다. 도형에 `text`를 넣으면 레이블이 되고, 화살표의 `startElementId`와 `endElementId`는 도형 ID에 바인딩된다.

```bash
echo '[
  {
    "id": "web",
    "type": "rectangle",
    "x": 100,
    "y": 120,
    "width": 180,
    "height": 70,
    "text": "Web App",
    "fillStyle": "solid",
    "backgroundColor": "#a5d8ff"
  },
  {
    "id": "api",
    "type": "rectangle",
    "x": 400,
    "y": 120,
    "width": 180,
    "height": 70,
    "text": "API Server",
    "fillStyle": "solid",
    "backgroundColor": "#b2f2bb"
  },
  {
    "id": "db",
    "type": "rectangle",
    "x": 700,
    "y": 120,
    "width": 180,
    "height": 70,
    "text": "PostgreSQL",
    "fillStyle": "solid",
    "backgroundColor": "#99e9f2"
  },
  {
    "type": "arrow",
    "x": 0,
    "y": 0,
    "startElementId": "web",
    "endElementId": "api",
    "text": "HTTPS"
  },
  {
    "type": "arrow",
    "x": 0,
    "y": 0,
    "startElementId": "api",
    "endElementId": "db",
    "text": "SQL"
  }
]' | npx -y mcp-excalidraw-server@1.1.0 add
```

결과를 구조와 화면 두 관점에서 확인한다.

```bash
npx -y mcp-excalidraw-server@1.1.0 describe
npx -y mcp-excalidraw-server@1.1.0 screenshot \
  --out docs/architecture.png
```

편집 가능한 원본을 저장한다.

```bash
npx -y mcp-excalidraw-server@1.1.0 export \
  --out docs/architecture.excalidraw
```

Obsidian Excalidraw 플러그인 형식으로 저장하려면 출력 파일의 확장자를 `.excalidraw.md`로 지정할 수 있다.

```bash
npx -y mcp-excalidraw-server@1.1.0 export \
  --out diagrams/architecture.excalidraw.md
```

### 4.3 반복 수정 루프

Excalidraw의 핵심은 한 번에 완벽하게 그리는 것이 아니라 다음 루프를 반복하는 데 있다.

```text
요소 일괄 생성
  → describe로 ID·좌표·연결 확인
  → screenshot으로 실제 렌더링 확인
  → update/apply로 위치·크기·색상 수정
  → 다시 screenshot
  → export
```

특히 다음 항목을 확인한다.

1. 레이블이 도형 안에서 잘리지 않는가?
2. 도형 사이에 최소 40px 정도의 간격이 있는가?
3. 화살표가 관련 없는 도형을 가로지르지 않는가?
4. 긴 영역 박스의 레이블이 내부 요소와 겹치지 않는가?
5. 글꼴 크기가 본문 16px, 제목 20px 이상인가?

위험한 수정 전에는 snapshot을 저장할 수 있다.

```bash
npx -y mcp-excalidraw-server@1.1.0 snapshot save before-refactor
npx -y mcp-excalidraw-server@1.1.0 snapshot restore before-refactor
```

서버 재시작 전에는 `.excalidraw` 파일로 내보내는 편이 안전하다. Canvas Server의 현재 요소는 메모리에 있기 때문에 프로세스가 종료되면 사라질 수 있다.

## 5. Archify Skill 설치

Archify는 MCP 서버가 아니라 Agent Skill과 로컬 렌더러 묶음이다. 공식 설치 명령은 다음과 같다.

```bash
npx skills add tt-a1i/archify -g
```

이 방식은 지원되는 에이전트의 전역 Skill 위치를 자동으로 선택한다. Codex의 `~/.codex/skills`에 릴리스를 고정해 설치하려면 Codex 내장 Skill Installer를 사용할 수 있다.

```bash
CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"

python3 \
  "$CODEX_HOME/skills/.system/skill-installer/scripts/install-skill-from-github.py" \
  --repo tt-a1i/archify \
  --path archify \
  --ref v2.11.0
```

두 설치 방식 중 하나만 선택한다. 이후 예시는 Codex 전역 디렉터리를 기준으로 한다.

```bash
ARCHIFY_DIR="${CODEX_HOME:-$HOME/.codex}/skills/archify"
test -f "$ARCHIFY_DIR/SKILL.md"
node "$ARCHIFY_DIR/bin/archify.mjs" doctor
```

`doctor`가 Node.js, 템플릿, 독립 실행형 스키마 검증기, 다섯 렌더러를 모두 `[ok]`로 표시하면 준비가 끝난다. 설치 후에는 새 Codex 작업을 열거나 앱을 재시작한다.

## 6. Archify 사용법

### 6.1 Codex 프롬프트로 HTML 산출물 만들기

Archify는 “무엇을 보여줄지”를 명확히 제한할수록 결과가 좋아진다.

```text
$archify 이 저장소의 고수준 런타임 아키텍처를 분석해줘.
핵심 컴포넌트는 8~12개로 제한하고, 주 요청 경로와 외부 시스템,
신뢰 경계를 보여줘. 세부 구현은 화살표 대신 summary card에 넣어줘.
JSON IR을 함께 보존하고, validate와 check를 통과한 단일 HTML로 출력해줘.
```

다이어그램 유형을 명시하면 해석이 더 안정적이다.

| 유형 | 적합한 질문 |
|---|---|
| `architecture` | 서비스, 저장소, 외부 시스템, 보안 경계가 어떻게 연결되는가? |
| `workflow` | CI/CD, 승인, 장애 대응 같은 절차가 어떤 순서로 진행되는가? |
| `sequence` | 요청이 시간 순서대로 어떤 시스템을 호출하고 반환되는가? |
| `dataflow` | 데이터가 어디서 생성되고 변환·저장·소비되는가? |
| `lifecycle` | 객체나 작업이 어떤 상태와 종료 조건을 거치는가? |

예를 들어 캐시 미스 흐름은 `architecture`보다 `sequence`가 적합하다.

```text
$archify Web App → API → Redis → PostgreSQL → API → Web App 흐름을
sequence 다이어그램으로 만들어줘. Redis hit는 기본 경로,
PostgreSQL 조회는 cache-miss 보조 경로로 표현해줘.
```

### 6.2 JSON IR에서 HTML 렌더링하기

Archify의 중간 산출물은 타입이 있는 JSON이다. 다음은 최소한의 아키텍처 예제다.

```json
{
  "schema_version": 1,
  "diagram_type": "architecture",
  "meta": {
    "title": "Sample Web App",
    "subtitle": "Primary request path",
    "output": "sample-web-app.html"
  },
  "components": [
    {
      "id": "users",
      "type": "external",
      "label": "Users",
      "sublabel": "Browser",
      "pos": [40, 180]
    },
    {
      "id": "web",
      "type": "frontend",
      "label": "Web App",
      "sublabel": "Next.js",
      "pos": [250, 180]
    },
    {
      "id": "api",
      "type": "backend",
      "label": "API",
      "sublabel": "FastAPI :8000",
      "pos": [460, 180]
    },
    {
      "id": "db",
      "type": "database",
      "label": "PostgreSQL",
      "sublabel": ":5432",
      "pos": [680, 180]
    }
  ],
  "boundaries": [
    {
      "kind": "region",
      "label": "Application Network",
      "wraps": ["web", "api", "db"]
    }
  ],
  "connections": [
    {
      "from": "users",
      "to": "web",
      "label": "HTTPS",
      "variant": "emphasis"
    },
    {
      "from": "web",
      "to": "api"
    },
    {
      "from": "api",
      "to": "db",
      "label": "SQL"
    }
  ],
  "cards": []
}
```

파일을 `docs/architecture/sample.architecture.json`에 저장했다고 가정하면 다음 순서로 처리한다.

```bash
ARCHIFY_DIR="${CODEX_HOME:-$HOME/.codex}/skills/archify"
INPUT="docs/architecture/sample.architecture.json"
OUTPUT="docs/architecture/sample-web-app.html"

node "$ARCHIFY_DIR/bin/archify.mjs" \
  validate architecture "$INPUT" --json

node "$ARCHIFY_DIR/bin/archify.mjs" \
  render architecture "$INPUT" "$OUTPUT"

node "$ARCHIFY_DIR/bin/archify.mjs" \
  check "$OUTPUT"

open "$OUTPUT"
```

생성된 HTML은 CSS, SVG, 테마 전환, 내보내기 스크립트를 한 파일에 포함한다. 우측 상단 메뉴나 단축키를 사용할 수 있다.

- `T`: 다크·라이트 테마 전환
- `E`: Export 메뉴 열기
- Export: PNG 복사, PNG·JPEG·WebP·SVG 다운로드

SVG 출력에는 다크·라이트 변수와 `prefers-color-scheme` 처리가 들어가므로 README나 블로그에 벡터 이미지로 넣기 좋다.

### 6.3 Archify 품질 루프

Archify에서는 완성 HTML을 직접 고치기보다 JSON IR을 수정한다.

```text
요구사항 정리
  → 유형 선택
  → JSON IR 작성
  → validate
  → render
  → check
  → 브라우저 확인
  → JSON IR 수정 후 재렌더링
```

검증 실패 메시지는 `/components/3`, `/connections/1`처럼 JSON 경로와 수정 힌트를 제공한다. 다음 문제를 렌더링 전에 잡을 수 있다.

- 컴포넌트·레이블 겹침
- 존재하지 않는 연결 대상
- 화면 밖으로 벗어난 요소와 경계
- 너무 짧거나 관련 없는 노드를 통과하는 연결선
- 잘못된 SVG 좌표와 비정상적인 HTML 산출물

## 7. 두 도구를 함께 사용하는 방법

두 결과물을 억지로 같은 파일 형식으로 변환할 필요는 없다. 동일한 “architecture brief”를 공유하고 목적별 산출물을 만든다.

### 설계 탐색 중심

```text
Codex 저장소 분석
  → Excalidraw에서 컴포넌트와 경로 초안
  → 브라우저에서 수동 이동·메모 추가
  → screenshot 검토
  → .excalidraw 원본 커밋
```

### 문서 배포 중심

```text
Codex 저장소 분석
  → Archify 유형과 주 경로 결정
  → JSON IR 작성·검증
  → self-contained HTML 생성
  → SVG/PNG 내보내기
  → README·블로그·설계 문서에 삽입
```

### 두 산출물이 모두 필요한 경우

1. Excalidraw로 설계 회의용 초안을 만든다.
2. 확정된 컴포넌트, 주 경로, 신뢰 경계를 짧은 텍스트 명세로 정리한다.
3. 같은 명세를 Archify에 입력해 배포용 HTML과 SVG를 만든다.
4. 저장소에는 `.excalidraw`, Archify JSON IR, HTML 또는 SVG를 함께 보존한다.

이렇게 하면 자유로운 편집 원본과 재현 가능한 최종 산출물을 모두 유지할 수 있다.

## 8. 문제 해결

### Excalidraw MCP가 Codex에서 보이지 않는다

```bash
codex mcp get excalidraw
```

MCP와 Skill 설치 후 새 Codex 작업을 연다. 이미 열린 작업은 설치 전 도구 목록을 유지할 수 있다.

### 스크린샷이나 Mermaid 변환이 실패한다

CLI 종료 코드 4는 브라우저 탭이 필요하다는 뜻이다.

```bash
open http://127.0.0.1:3000
npx -y mcp-excalidraw-server@1.1.0 status
```

`browserClients` 또는 `websocketClients`가 1 이상인지 확인한 뒤 다시 실행한다.

### 3000번 포트가 충돌한다

```bash
lsof -nP -iTCP:3000 -sTCP:LISTEN
```

Excalidraw 서버가 아닌 프로세스라면 먼저 해당 서비스의 용도를 확인한다. 다른 포트를 사용할 때는 MCP, CLI, 브라우저가 같은 URL을 보도록 `EXPRESS_SERVER_URL`을 일관되게 설정해야 한다.

### Archify가 실행되지 않는다

```bash
node --version
node "$ARCHIFY_DIR/bin/archify.mjs" doctor
```

Node.js 18 이상인지, Skill 디렉터리에 `SKILL.md`, `bin/archify.mjs`, `schemas/`, `renderers/`가 모두 있는지 확인한다. JSON 오류는 렌더러 코드를 수정하지 말고 `validate`가 가리키는 입력 경로를 고친다.

## 9. 보안과 운영 주의사항

- Excalidraw Canvas Server의 기본 바인딩은 `127.0.0.1`이다. API에 자체 인증이 없으므로 `HOST=0.0.0.0`으로 외부에 노출하지 않는다.
- `npx`로 실행하는 패키지는 팀에서 검증한 버전으로 고정한다.
- 캔버스를 종료하기 전에 `.excalidraw` 파일을 내보낸다.
- `clear --yes`, 대량 `delete`, `import --replace` 전에는 export나 snapshot을 만든다.
- Archify에서는 생성된 HTML보다 JSON IR을 변경 이력의 기준으로 삼는다.
- HTML과 SVG를 외부에 공개하기 전에 내부 호스트명, 계정명, 네트워크 대역, 보안 경계 레이블을 검토한다.

## 10. 업데이트와 제거

### Excalidraw 업데이트

검증 후 버전 번호를 함께 올린다.

```bash
npx -y mcp-excalidraw-server@NEW_VERSION \
  install-skill --target codex

codex mcp remove excalidraw
codex mcp add excalidraw -- \
  npx -y mcp-excalidraw-server@NEW_VERSION
```

### Excalidraw 자동 시작 제거

```bash
AUTOSTART_LABEL="com.local.mcp-excalidraw-server"
AUTOSTART_PLIST="$HOME/Library/LaunchAgents/$AUTOSTART_LABEL.plist"

launchctl bootout "gui/$(id -u)" "$AUTOSTART_PLIST"
rm "$AUTOSTART_PLIST"
npx -y mcp-excalidraw-server@1.1.0 stop
```

### Archify 업데이트

공식 skills CLI를 사용했다면 다음처럼 갱신한다.

```bash
npx skills add tt-a1i/archify -g
```

릴리스를 고정한 Codex Skill Installer 방식이라면 새 태그로 다시 설치한다. 기존 디렉터리가 있을 때 설치 도구가 교체를 거부한다면 현재 Skill을 별도 백업한 뒤 의도적으로 업그레이드한다.

## 마무리

아키텍처 다이어그램의 품질은 도구보다 목적을 얼마나 분명히 했는지에 크게 좌우된다. Excalidraw에는 “편집 가능한 캔버스와 시각 검증”을, Archify에는 “한 개의 명확한 이야기와 검증 가능한 최종 산출물”을 요구해야 한다.

추천 기준은 간단하다.

- 설계가 아직 변하고 있다면 **Excalidraw**
- 문서에 배포할 결과가 필요하다면 **Archify**
- 둘 다 필요하다면 동일한 architecture brief에서 편집 원본과 배포 산출물을 각각 만든다.

## 참고 자료

- [yctimlin/mcp_excalidraw](https://github.com/yctimlin/mcp_excalidraw)
- [tt-a1i/archify](https://github.com/tt-a1i/archify)
