---
title: AI 지식관리 도구 역할 비교
created: 2026-07-16
updated: 2026-07-16
type: comparison
tags: [comparison, tool, workflow, pkm]
sources:
  - "raw/youtube/📺 How To Build LLM Wiki In Obsidian 🧠 A Memory Layer For Any Agentic AI.md"
  - "raw/youtube/📺 LLM Wiki를 업그레이드하는 외부 지식 시스템! 연구자를 위한 최강의 조합 Zotero × Notebook × Obsidian x Claude Code.md"
  - "raw/web/stablyaiorca Orca is the ADE for working with a fleet of parallel agents. Run any coding agent with your own subscription. Available on desktop and mobile..md"
  - "raw/web/NomaDamasslides-grab Best harness + editor + linter for generating slides in Claude Code  Codex - Claude Design Open Source Alternative.md"
  - "raw/notebooklm/2026-07-16-all-notes.md"
confidence: medium
---

# AI 지식관리 도구 역할 비교

이 비교는 어느 도구가 “최고”인지보다 [[ai-knowledge-workflow]]에서 각 도구가 맡는 책임과 교체 가능한 경계를 보여준다.

| 도구 | 주된 역할 | 지속성 | 강점 | 주의점 |
|---|---|---:|---|---|
| [[zotero]] | 원본·서지정보 관리 | 높음 | 출처와 첨부 파일 보존 | 개념 합성은 별도 계층 필요 |
| [[notebooklm]] | 선택한 소스 묶음 탐색 | 중간 | 범위가 정해진 질의·요약 | 결과를 장기 지식으로 다시 편입해야 함 |
| [[llm-wiki]] | 검토된 지식 컴파일 | 높음 | 연결·모순·출처를 누적 | 지속적인 유지보수와 린트 필요 |
| [[obsidian]] | 사람이 읽고 편집하는 인터페이스 | 높음 | 로컬 Markdown과 링크 탐색 | 대형 원본·서지 관리는 전문 도구가 유리 |
| [[orca]] | 에이전트 실행·병렬 조정 | 작업 단위 | 격리된 worktree와 결과 비교 | 지식 저장소 자체는 아님 |
| [[slides-grab]] | 발표 산출물 제작 | 산출물 단위 | HTML 기반 시각 편집과 내보내기 | 일부 내보내기 형식은 실험적 |
| [[understand-anything]]·[[graphify]] | 지식 관계 분석 | 재생성 가능 | 군집·경로·공백 후보 탐색 | 그래프 해석을 원문으로 검증해야 함 |

## 결론

이 도구들은 대부분 대체재가 아니라 계층별 보완재다. 가장 이식성이 높은 중심 자산은 공개 형식의 원본, Markdown 문서, 출처 메타데이터다. 특정 제품의 자동화가 바뀌어도 이 세 가지를 보존하면 [[agentic-workspace]]를 다른 도구로 재구성할 수 있다. ^[raw/youtube/📺 How To Build LLM Wiki In Obsidian 🧠 A Memory Layer For Any Agentic AI.md]

제품 기능은 빠르게 변하므로 [[orca]]와 [[slides-grab]]의 상세 기능은 도입 시점에 최신 공식 문서를 다시 확인해야 한다.
