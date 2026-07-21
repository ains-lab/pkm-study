---
title: NotebookLM 질의 지식 증분 워크플로우
created: 2026-07-16
updated: 2026-07-16
type: query
tags: [notebooklm, knowledge-base, workflow, provenance, automation]
sources:
  - "raw/notebooklm/notebooklm-py-github.md"
  - "raw/notebooklm/llm-wiki-skill-github.md"
confidence: medium
contested: false
---

# NotebookLM 질의 지식 증분 워크플로우

## 질의

NotebookLM 질의응답에서 원본 대화 전문을 별도로 저장하지 않으면서, 재사용 가능한 지식만 `queries/`에 편입해 개인 지식베이스를 증분시키려면 어떻게 운영해야 하는가?

## 핵심 결론

NotebookLM 답변은 일시적인 합성 결과이고 `queries/` 문서는 검토를 통과한 장기 지식이다. 두 계층을 구분하되 원본 Q&A 파일은 만들지 않는다. 답변의 가치와 근거를 평가한 뒤 하나의 canonical query 문서만 생성하거나 갱신하고, 실제 근거 source와 NotebookLM 대화 식별자를 기록한다.

```text
NotebookLM 질의
  → JSON 답변과 source ID 확보
  → 저장 가치 판정
  → 기존 위키 문서 검색
  → 근거·사실 교차검증
  → queries/ canonical 문서 생성 또는 갱신
  → index·log·역링크 갱신
  → lint
```

## 저장 대상 판정

다음과 같이 다시 도출하기 어렵고 반복 활용할 수 있는 결과만 저장한다.

- 여러 source를 결합한 비교와 종합
- 반복 가능한 연구·개발 워크플로우
- 장기적으로 적용할 의사결정 기준
- 연구 가설, 지식 공백과 검증 계획
- 기존 위키 문서 여러 개를 새롭게 연결하는 분석
- 오류와 제약까지 검토된 심층 설명

단순 명령어, 상태 조회, 이미 기존 페이지에 있는 설명, 후속 질문을 유도하는 대화 문구와 근거가 불명확한 답변은 저장하지 않는다. 답변 길이가 아니라 가치·검증 가능성·재사용성이 기준이다.

## 질의와 인용 확보

새 질문은 전체 notebook UUID와 `--json`을 사용한다.

```bash
notebooklm ask \
  --notebook <notebook-id> \
  --json \
  "질문"
```

JSON에서 다음 값을 확보한다.

- `answer`
- `conversation_id`
- `turn_number`
- `references[].source_id`
- `references[].citation_number`
- `references[].cited_text`

`--save-as-note`와 `history --save`는 NotebookLM 내부 노트를 만드는 기능이므로 로컬 [[llm-wiki]] 편입 용도로 사용하지 않는다.

## 출처 매핑

각 `references[].source_id`는 로컬 `raw/**/*.md`의 다음 frontmatter와 연결한다.

```yaml
notebooklm_source_id: "<source-id>"
```

UUID가 일치하는 파일만 query의 `sources:`에 기록한다. citation 번호나 제목이 비슷하다는 이유만으로 출처 경로를 추정하지 않는다.

| 상태 | 의미 |
|---|---|
| `complete` | 인용된 source ID가 모두 로컬 원본에 매핑됨 |
| `partial` | 일부 source만 로컬 원본에 매핑됨 |
| `unavailable` | 과거 history처럼 원래 reference 정보가 없음 |

`notebooklm history --json --show-all`은 질문과 답변은 제공하지만 원래 `references[]`를 포함하지 않는다. 과거 답변을 다시 질의해 검증할 수는 있으나, 이는 기존 인용의 복구가 아니라 새로운 검증 turn으로 기록한다.

## Canonical query 작성

새 문서를 만들기 전에 `queries/`, `comparisons/`, `concepts/`, `entities/`를 검색한다.

- 같은 장기 질문을 다루는 query가 있으면 새 페이지 대신 기존 페이지를 갱신한다.
- 후속 turn은 `updated` 날짜와 검증 기록을 추가한다.
- 정의나 도구 설명은 기존 concept·entity 문서에 두고 query에서는 링크만 사용한다.
- 원본 답변, 요약본, 최종본을 각각 별도 문서로 만들지 않는다.
- `raw/notebooklm-queries/` 또는 Q&A 전문 파일을 생성하지 않는다.

권장 frontmatter는 다음과 같다.

```yaml
---
title: Query Title
created: YYYY-MM-DD
updated: YYYY-MM-DD
type: query
tags: [notebooklm, knowledge-base, workflow]
sources:
  - "raw/notebooklm/local-source.md"
confidence: medium
notebooklm_notebook_id: "<full UUID>"
notebooklm_notebook_title: "<title>"
notebooklm_conversation_id: "<conversation UUID>"
notebooklm_turn: 1
notebooklm_reference_status: complete
---
```

본문은 원래 질문, 핵심 결론, 검증된 근거, 적용 절차, 검증 및 제한으로 구성한다. NotebookLM 답변을 그대로 복사하지 않고 위키의 기존 지식 및 실제 원본과 대조해 재작성한다.

## 검증과 증분 갱신

query 편입 전후에 다음을 확인한다.

1. 모든 `sources:` 경로가 실제로 존재하는가?
2. 답변의 중요한 주장이 source 본문이나 설치된 도구 정의와 일치하는가?
3. 불확실하거나 버전 의존적인 내용이 명시되어 있는가?
4. 동일 질문의 query가 중복 생성되지 않았는가?
5. 최소 두 개의 유효한 위키링크가 있는가?
6. 관련 문서에서 query로 돌아오는 역링크가 있는가?
7. `index.md`의 Queries 구역과 전체 페이지 수가 갱신됐는가?
8. `log.md`에 notebook·conversation·turn과 변경 파일이 기록됐는가?
9. frontmatter, 태그, 깨진 링크와 200줄 기준이 lint를 통과하는가?

이 과정은 [[research-feedback-loop]]의 NotebookLM 합성 결과를 [[llm-wiki]]의 검증된 장기 지식으로 승격시키는 관문이다. [[notebooklm]]은 답변을 생성하지만, 무엇을 보존하고 기존 지식과 어떻게 합칠지는 위키의 책임이다.

## 검증 및 제한

- NotebookLM 답변 전문을 저장하지 않으므로 서버 대화가 삭제되면 원문을 복원할 수 없다.
- 대신 질문, 검증된 최종 지식, 실제 source 경로와 conversation·turn 식별자를 보존한다.
- source ID가 로컬 원본에 매핑되지 않으면 `confidence`를 낮추거나 편입을 보류한다.
- 빠르게 변하는 도구 기능은 저장 시점의 설치된 스킬·CLI 도움말과 다시 대조한다.

## 관련 문서

- [[notebooklm]]
- [[notebooklm-py]]
- [[llm-wiki]]
- [[research-feedback-loop]]
- [[ai-knowledge-workflow]]
