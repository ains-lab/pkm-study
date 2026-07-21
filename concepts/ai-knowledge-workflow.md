---
title: AI 지식 워크플로
created: 2026-07-16
updated: 2026-07-20
type: concept
tags: [workflow, research, provenance, automation]
sources:
  - "raw/youtube/📺 How To Build LLM Wiki In Obsidian 🧠 A Memory Layer For Any Agentic AI.md"
  - "raw/youtube/📺 LLM Wiki를 업그레이드하는 외부 지식 시스템! 연구자를 위한 최강의 조합 Zotero × Notebook × Obsidian x Claude Code.md"
  - "raw/web/stablyaiorca Orca is the ADE for working with a fleet of parallel agents. Run any coding agent with your own subscription. Available on desktop and mobile..md"
  - "raw/notebooklm/2026-07-16-all-notes.md"
  - "raw/notebooklm/llm-wiki-zotero-notebooklm-youtube.md"
confidence: medium
---

# AI 지식 워크플로

AI 지식 워크플로는 원본 수집부터 검토된 지식과 산출물 생성까지를 역할별 계층으로 나누는 운영 방식이다.

이 흐름을 개인 지식관리 체계 전체의 관점에서 해석한 내용은 [[ai-personal-knowledge-management]]에 정리한다.

## 기본 흐름

`수집 → 원본 보존 → 탐색·질의 → 위키 컴파일 → 검증 → 산출`

- [[zotero]]: 원본과 서지정보를 수집·보존한다.
- [[notebooklm]]: 선택한 소스 묶음을 탐색하고 질문한다.
- [[llm-wiki]]와 [[obsidian]]: 장기 지식과 관계를 Markdown으로 유지한다.
- [[orca]]: 여러 에이전트의 실행과 비교를 조정한다.
- [[slides-grab]]: 검토된 지식을 발표 산출물로 변환한다.
- [[understand-anything]]·[[graphify]]: 지식 연결과 연구 공백 후보를 탐색한다.

이 구조의 핵심은 한 도구가 모든 책임을 갖지 않는다는 점이다. 원본 보존, 지식 합성, 실행 조정, 결과 표현을 분리하면 도구를 교체해도 축적된 Markdown과 출처 관계를 유지할 수 있다. ^[raw/youtube/📺 LLM Wiki를 업그레이드하는 외부 지식 시스템! 연구자를 위한 최강의 조합 Zotero × Notebook × Obsidian x Claude Code.md]

## 검증 관문

1. 원본과 요약이 분리되어 있는가?
2. 모든 핵심 주장에 추적 가능한 출처가 있는가?
3. 기존 문서와 중복되거나 충돌하지 않는가?
4. 내부 링크가 실제 문서를 가리키는가?
5. 산출물이 목적에 맞는 형식으로 직접 열리고 사용되는가?

## 위험

- 병렬 에이전트가 같은 문서를 서로 다르게 해석할 수 있다.
- 제품 README나 소개 영상의 홍보성 주장이 검증 없이 굳어질 수 있다.
- 자동화가 늘수록 잘못된 메타데이터가 빠르게 전파될 수 있다.

따라서 [[agentic-workspace]]의 속도 이점은 출처와 일관성 검사를 자동화할 때 비로소 장기 지식 품질로 이어진다.

반복 운영 모델은 [[research-feedback-loop]], 연구 중심 구성은 [[second-brain-research-workflow]]에 정리한다.
