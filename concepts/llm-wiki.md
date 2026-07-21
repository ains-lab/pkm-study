---
title: LLM Wiki
created: 2026-07-16
updated: 2026-07-16
type: concept
tags: [knowledge-base, pkm, llm, provenance]
sources:
  - "raw/youtube/📺 How To Build LLM Wiki In Obsidian 🧠 A Memory Layer For Any Agentic AI.md"
  - "raw/youtube/📺 LLM Wiki를 업그레이드하는 외부 지식 시스템! 연구자를 위한 최강의 조합 Zotero × Notebook × Obsidian x Claude Code.md"
  - "raw/notebooklm/llm-wiki-skill-github.md"
  - "raw/notebooklm/2026-07-16-all-notes.md"
confidence: high
---

# LLM Wiki

LLM Wiki는 원본 자료를 한 번 구조화해 사람과 여러 AI 에이전트가 반복해서 사용할 수 있게 만드는 지속형 Markdown 지식베이스다. 질문할 때마다 원본을 처음부터 검색하는 방식과 달리, 개념 페이지·엔티티·비교·출처 연결을 누적한다.

## 세 계층

1. **Raw:** 변경하지 않는 원본 자료와 출처 메타데이터.
2. **Wiki:** 원본을 요약·비교·연결한 개념 및 엔티티 문서.
3. **Schema:** 파일명, frontmatter, 태그, 링크, 갱신 규칙.

이 분리는 원본과 해석을 섞지 않으면서도 [[obsidian]]에서 하나의 탐색 가능한 공간처럼 사용할 수 있게 한다.

## RAG와의 차이

RAG는 질의 시점에 관련 조각을 검색해 답변 문맥을 구성한다. LLM Wiki는 자주 재사용할 지식을 미리 컴파일하고, 모순과 관계를 문서에 남긴다. 둘은 배타적이지 않다. RAG는 대규모 원본 검색에, 위키는 검토된 장기 지식과 연결 구조에 적합하다.

## 운영 원칙

- 원본은 [[zotero]] 같은 저장소 또는 `raw/`에 보존한다.
- 특정 소스 묶음의 탐색은 [[notebooklm]] 같은 도구로 보조한다.
- NotebookLM 질의 결과는 [[notebooklm-query-compounding]]의 가치 판정과 출처 검증을 거쳐 편입한다.
- 새 자료를 기존 페이지에 연결하고 중복 페이지를 피한다.
- 자동 생성 결과는 링크·태그·출처·모순 검사를 거친다.
- [[knowledge-graph-analysis]] 결과를 이용해 고립 문서와 약한 연결을 다시 점검한다.

## 열린 질문

- 위키가 커질 때 자동 생성과 사람의 검토 비율을 어떻게 조정할 것인가?
- 빠르게 변하는 제품 정보의 신선도를 어떤 주기로 확인할 것인가?
- 개인 메모와 외부 지식의 경계를 얼마나 엄격하게 유지할 것인가?

## 관련 문서

- [[ai-knowledge-workflow]]
- [[agentic-workspace]]
- [[knowledge-tool-roles]]
- [[research-feedback-loop]]
