---
title: UA 위키 지식그래프 전체 워크플로우
created: 2026-07-16
updated: 2026-07-16
type: query
tags: [knowledge-graph, knowledge-base, workflow, code-analysis]
sources:
  - "raw/notebooklm/understand-anything-github.md"
  - "raw/notebooklm/2026-07-16-all-notes.md"
confidence: medium
---

# UA 위키 지식그래프 전체 워크플로우

## 질의

위키 문서가 이미 생성되었다고 가정할 때 Understand Anything(UA)의 각 스킬은 어떤 역할을 하며, 지식그래프 생성부터 분석·활용·갱신까지 어떤 순서로 실행해야 하는가?

## 핵심 결론

Karpathy 패턴의 [[llm-wiki]]가 이미 존재한다면 시작점은 일반 코드 분석용 `understand`가 아니라 위키 전용 `understand-knowledge`다. 이 스킬로 `.ua/knowledge-graph.json`을 생성한 뒤 대시보드, 그래프 질의, 도메인 분석을 수행하고, 발견한 공백과 오류를 위키에 반영한 다음 그래프를 다시 생성한다.

```text
원본 자료
  → LLM Wiki 문서·index.md·wikilink
  → understand-knowledge
  → .ua/knowledge-graph.json
  → dashboard·chat·domain 분석
  → 위키 보강
  → understand-knowledge 재실행
```

## 스킬별 역할

| 스킬 | 중심 역할 | 위키 워크플로우에서의 위치 |
|---|---|---|
| `understand` | 코드·설정·문서·인프라의 구조와 의존성 분석 | 코드베이스를 별도로 분석할 때 사용 |
| `understand-knowledge` | LLM Wiki의 문서·주제·엔티티·주장·관계 추출 | 위키 지식그래프 생성의 핵심 |
| `understand-dashboard` | 그래프를 브라우저에서 시각화 | 생성 직후 구조 검토 |
| `understand-chat` | 관련 부분 그래프를 검색해 관계 질문에 답변 | 개념·문서 관계 질의 |
| `understand-domain` | 도메인, 흐름, 단계로 지식을 재구성 | 지식관리·연구 프로세스 분석 |
| `understand-explain` | 특정 파일·함수·모듈과 주변 관계를 심층 설명 | 주로 코드용이며 문서에 `filePath`가 있으면 제한적으로 활용 |
| `understand-diff` | Git 변경 파일과 1-hop 영향 범위 분석 | Git으로 관리되는 위키 변경 분석에 제한적으로 활용 |
| `understand-onboard` | 레이어와 투어 기반 온보딩 가이드 생성 | 지식 체계의 학습 경로 생성 |
| `understand-figma` | Figma 디자인을 별도 디자인 그래프로 변환 | 디자인 자료가 있을 때만 사용 |

## 코드 분석과 위키 분석의 구분

`understand`는 파일·함수·클래스·설정·서비스의 구조와 호출·의존 관계를 중심으로 코드 아키텍처를 만든다. 반면 `understand-knowledge`는 `index.md`, 문서 제목, frontmatter, 위키링크를 결정론적으로 추출하고 LLM 분석으로 암시적 관계, 엔티티와 핵심 주장을 보강한다.

두 경로 모두 `.ua/knowledge-graph.json`을 만들 수 있지만 질문의 초점이 다르다.

- 코드 그래프: 무엇이 무엇을 호출하고 의존하는가?
- 위키 그래프: 어떤 개념과 주장이 연결되고 어떤 주제 군집을 이루는가?

## 권장 실행 순서

### 1. 위키 입력 구조 점검

위키 루트에 `index.md`와 여러 Markdown 문서 및 위키링크가 있어야 한다. `raw/`는 원본 source 노드를 제공하고, `index.md`의 구역은 주제 레이어와 guided tour의 기반이 된다. 분석 산출물과 도구 설정은 `.ua/.understandignore`로 제외하되, `index.md`가 실제 전용 파서에서 정상 사용되는지는 생성 통계로 확인한다.

### 2. 위키 지식그래프 생성

```text
$understand-anything:understand-knowledge /위키/경로
```

이 단계는 article, entity, topic, claim, source 노드와 `related`, `categorized_under`, `cites` 등의 관계를 생성한다. 엔티티 이름을 정규화하고 카테고리 기반 레이어와 학습 투어를 구성한 뒤 결과를 다음 위치에 저장한다.

```text
.ua/knowledge-graph.json
.ua/meta.json
```

### 3. 구조 및 품질 검증

생성 후에는 다음 항목을 확인한다.

- article·entity·topic·claim·source 노드 수
- 명시적 wikilink와 암시적 관계 수
- 미해결 wikilink와 dangling edge
- 고립 문서와 과도한 허브
- 중복 엔티티와 출처 없는 claim
- 레이어와 tour 단계가 `index.md` 구조를 반영하는지

그래프에서 보이는 빈 공간은 곧바로 연구 공백을 뜻하지 않는다. 자료 누락, 링크 부족, 추출 실패 또는 엔티티 중복일 수 있으므로 [[knowledge-graph-analysis]]의 검증 원칙에 따라 원문과 대조한다.

### 4. 대시보드 탐색

```text
$understand-anything:understand-dashboard /위키/경로
```

대시보드에서는 주제 군집, 중심 개념, 브리지 노드, 고립 문서, 원본과 주장의 연결 및 권장 학습 순서를 살펴본다. 위키 그래프는 `kind: "knowledge"`를 사용하므로 코드 계층도보다 지식 연결 탐색에 적합한 배치가 적용된다.

### 5. 그래프 기반 질의

```text
$understand-anything:understand-chat "A와 B는 어떤 관계인가?"
```

이 스킬은 질문과 일치하는 노드, 연결 edge, 인접 노드와 레이어를 찾아 관련 부분 그래프만으로 답한다. 도구 역할 차이, 근거가 부족한 주장, 연결이 약한 주제, 여러 군집을 잇는 개념을 찾는 질문에 적합하다.

### 6. 도메인 흐름 추출

```text
$understand-anything:understand-domain
```

기존 그래프가 있으면 파일을 다시 스캔하지 않고 domain, flow, step을 파생해 `.ua/domain-graph.json`으로 저장한다. 개인 지식관리에서는 다음과 같은 흐름을 표현하는 데 유용하다.

```text
원본 수집
  → AI 합성
  → 위키 컴파일
  → 지식그래프 생성
  → 구조 탐색
  → 공백 검증
  → 위키 환류
```

### 7. 보조 분석

- 특정 코드 파일이나 모듈은 `understand-explain`으로 심층 설명한다.
- Git 변경 파일의 영향은 `understand-diff`로 확인하고 `.ua/diff-overlay.json`을 대시보드에서 본다.
- 레이어와 tour를 학습 문서로 바꾸려면 `understand-onboard`를 사용한다.
- Figma 자료는 `understand-figma`로 별도의 디자인 그래프를 만든다.

이 스킬들은 코드베이스 중심으로 정의된 부분이 있으므로 article 노드와 파일 경로를 제대로 인식하는지 확인한 뒤 위키에 적용한다.

### 8. 위키 환류와 재생성

고립 문서에는 적절한 링크를 추가하고, 중복 개념은 대표 문서로 통합하며, 미해결 링크와 근거 없는 주장을 수정한다. 큰 문서는 개별 개념으로 나누고 `index.md`의 카테고리를 보완한다. 이 결과는 [[research-feedback-loop]]를 따라 다시 장기 지식으로 편입한다.

현재 `understand-knowledge`에는 명시적인 `--auto-update` 또는 증분 분석 옵션이 없다. 따라서 위키가 바뀌면 `understand-knowledge`를 다시 실행하는 것이 안전하다. `--full`, `--review`, `--auto-update`, `--language` 옵션은 일반 코드 분석용 `understand` 경로의 기능이므로 위키 전용 옵션과 혼동하지 않는다.

## 운영 체크리스트

1. [[llm-wiki]] 생성과 링크 검증
2. `index.md` 및 `.ua/.understandignore` 확인
3. `understand-knowledge` 실행
4. 노드·관계·미해결 링크 통계 검증
5. `understand-dashboard`로 구조 탐색
6. `understand-chat`으로 관계 질의
7. `understand-domain`으로 전체 흐름 분석
8. 필요할 때 explain·diff·onboard 사용
9. 공백·중복·약한 연결을 위키에 반영
10. `understand-knowledge` 재실행

## 역할 분담

[[notebooklm]]은 선택한 원본을 읽고 집중적으로 종합한다. [[llm-wiki]]는 검증된 내용을 영속적인 상호 연결 문서로 컴파일한다. [[understand-anything]]의 `understand-knowledge`는 그 문서를 질의하고 시각화할 수 있는 지식그래프로 변환한다. dashboard, chat, domain 분석은 그래프에서 새로운 검토 후보를 찾고 이를 다시 위키로 환류시키는 탐색 계층이다.
