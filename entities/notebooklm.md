---
title: NotebookLM
created: 2026-07-16
updated: 2026-07-16
type: entity
tags: [tool, notebooklm, research, llm]
sources:
  - "raw/youtube/📺 LLM Wiki를 업그레이드하는 외부 지식 시스템! 연구자를 위한 최강의 조합 Zotero × Notebook × Obsidian x Claude Code.md"
  - "raw/notebooklm/notebooklm-py-github.md"
  - "raw/notebooklm/llm-wiki-zotero-notebooklm-youtube.md"
confidence: medium
---

# NotebookLM

NotebookLM은 선택한 소스 묶음을 기반으로 질의응답, 요약, 인사이트 추출과 파생 산출물 생성을 수행하는 도구다. 영구 지식베이스 전체보다 특정 연구 묶음과 집중적으로 대화하는 작업 공간에 가깝다.

## LLM Wiki와의 관계

- [[zotero]]에서 관리하는 원본 중 필요한 묶음을 가져온다.
- 제한된 소스 범위에서 질문하고 요약을 만든다.
- 가치 있는 결과를 [[obsidian]] 또는 [[llm-wiki]]에 다시 편입한다.
- 위키 전체의 지속적 구조화와 달리 일시적 탐색·합성에 집중한다.

## 주의점

NotebookLM에서 나온 결과도 자동으로 확정 지식이 되지는 않는다. 출처 범위, 생성 시점, 해석을 함께 보존해야 하며, 장기 보관할 결과는 [[ai-knowledge-workflow]]의 검토 단계를 거쳐야 한다.

## 자동화

[[notebooklm-py]]를 사용하면 소스 추가, 전체본문 추출, 질의, 보고서와 학습 산출물 생성을 에이전트 작업에 포함할 수 있다. 다만 비공식 API의 변동 가능성이 있으므로 원본과 최종 지식은 로컬에도 보존한다.

질의응답에서 재사용 가능한 내용만 선별해 장기 지식으로 편입하는 기준과 절차는 [[notebooklm-query-compounding]]에 정리한다.

## 관련 문서

- [[knowledge-tool-roles]]
- [[agentic-workspace]]
- [[research-feedback-loop]]
