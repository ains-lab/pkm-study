# Wiki Schema

## Domain

AI 기반 개인 지식관리(PKM), LLM Wiki, 연구 자료 관리, 에이전트 개발 환경과 지식 산출 도구의 연결 방식.

이 위키는 특정 제품의 기능 목록보다 “원본을 보존하고, 지식으로 컴파일하고, 에이전트가 재사용하는 흐름”을 중심으로 정리한다.

## Conventions

- 파일명은 소문자 영문과 하이픈을 사용한다.
- 모든 위키 페이지는 YAML frontmatter로 시작한다.
- 페이지마다 최소 2개의 `[[wikilink]]`를 둔다.
- 페이지를 갱신할 때 `updated` 날짜를 변경한다.
- 새 페이지는 `index.md`의 알맞은 구역에 추가한다.
- 모든 작업은 `log.md`에 추가한다.
- 3개 이상의 원본을 종합한 문단에는 가능한 경우 `^[raw/.../source.md]` 형식의 출처 표지를 붙인다.
- `raw/` 아래 원본은 수정하지 않는다.

## Frontmatter

```yaml
---
title: Page Title
created: YYYY-MM-DD
updated: YYYY-MM-DD
type: entity | concept | comparison | query | summary
tags: [taxonomy-tag]
sources: ["raw/path/source.md"]
confidence: high | medium | low
contested: false
---
```

필수 필드는 `title`, `created`, `updated`, `type`, `tags`, `sources`이다. 단일 출처이거나 빠르게 변하는 제품 정보는 `confidence: medium`을 기본값으로 삼는다.

## Tag Taxonomy

- 지식관리: `pkm`, `knowledge-base`, `knowledge-graph`, `research`, `provenance`, `citation`
- AI 시스템: `llm`, `agent`, `automation`, `orchestration`, `code-analysis`
- 도구: `tool`, `open-source`, `obsidian`, `zotero`, `notebooklm`, `mcp`
- 산출물: `workflow`, `presentation`, `comparison`

새 태그는 먼저 이 목록에 추가한 뒤 사용한다.

## Page Thresholds

- 한 원본의 중심 주제이거나 둘 이상의 원본에서 반복되는 개념은 페이지로 만든다.
- 스쳐 지나가는 언급은 별도 페이지로 만들지 않는다.
- 기존 주제는 새 페이지 대신 기존 페이지를 갱신한다.
- 200줄을 넘는 페이지는 하위 주제로 분리한다.
- 완전히 대체된 페이지는 `_archive/`로 옮긴다.

## Entity Pages

- 대상의 역할과 범위를 먼저 설명한다.
- 확인 가능한 핵심 기능과 제약을 구분한다.
- 관련 엔티티와 개념을 최소 2개 연결한다.

## Concept Pages

- 정의, 작동 구조, 현재의 활용 방식, 열린 질문을 포함한다.
- 도구 자체보다 도구 사이의 관계를 우선 설명한다.

## Comparison Pages

- 비교 목적과 기준을 명시한다.
- 표를 우선 사용하고, 도구가 서로 대체 관계인지 보완 관계인지 결론에서 밝힌다.

## Update Policy

1. 날짜가 있는 최신 원본을 우선하되 제품 홍보성 주장은 독립 검증 전까지 확정 사실로 굳히지 않는다.
2. 충돌하는 주장은 양쪽의 날짜와 출처를 함께 기록한다.
3. 해결되지 않은 충돌은 `contested: true`와 `contradictions:`로 표시한다.
4. 변경 사항은 `log.md`에 남긴다.
