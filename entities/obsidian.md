---
title: Obsidian
created: 2026-07-16
updated: 2026-07-25
type: entity
tags: [tool, obsidian, pkm, knowledge-base]
sources:
  - "raw/youtube/📺 How To Build LLM Wiki In Obsidian 🧠 A Memory Layer For Any Agentic AI.md"
  - "raw/youtube/📺 LLM Wiki를 업그레이드하는 외부 지식 시스템! 연구자를 위한 최강의 조합 Zotero × Notebook × Obsidian x Claude Code.md"
  - "raw/web/logseq-github-overview.md"
confidence: high
---

# Obsidian

Obsidian은 로컬 Markdown 파일, YAML 속성, 위키링크를 바탕으로 개인 지식베이스를 운영하는 도구다. 이 위키에서는 원본 저장소 자체라기보다 사람이 읽고 연결하며 에이전트도 접근할 수 있는 지식 인터페이스 역할을 맡는다.

## LLM Wiki에서의 역할

- `raw/` 원본과 컴파일된 개념·엔티티 문서를 같은 파일 시스템에서 탐색한다.
- 그래프 보기와 역링크로 [[llm-wiki]]의 연결 구조를 사람이 검토한다.
- 에이전트가 생성한 Markdown 결과를 별도 변환 없이 사용한다.
- 첨부 파일과 대형 원본의 장기 보존은 [[zotero]] 같은 전문 저장소와 분담할 수 있다.

## 설계상 의미

Obsidian은 지식의 “표시 계층”과 “수동 편집 계층”에 가깝다. 원본 수집, 출처 메타데이터, 소스 묶음 기반 질의응답까지 모두 한 도구에 맡기기보다 [[ai-knowledge-workflow]]처럼 역할을 나누는 편이 추적성과 유지보수에 유리하다.

[[logseq]]도 로컬 중심의 지식 편집·탐색 인터페이스라는 유사한 위치를 차지한다. Obsidian과 Logseq 가운데 무엇을 선택하든 원본 불변성, canonical 편입 기준, 출처와 검증 규칙은 편집기 밖에서 별도로 유지해야 한다.

## 관련 문서

- [[notebooklm]]
- [[agentic-workspace]]
- [[knowledge-tool-roles]]
