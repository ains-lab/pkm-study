---
title: 지식 그래프 도구 비교
created: 2026-07-16
updated: 2026-07-16
type: comparison
tags: [comparison, knowledge-graph, tool, code-analysis]
sources:
  - "raw/notebooklm/understand-anything-github.md"
  - "raw/notebooklm/graphify-github.md"
  - "raw/notebooklm/codegraph-github.md"
  - "raw/notebooklm/2026-07-16-all-notes.md"
confidence: medium
---

# 지식 그래프 도구 비교

| 도구 | 중심 대상 | 대표 결과 | 강점 | 적합한 질문 |
|---|---|---|---|---|
| [[understand-anything]] | 코드·위키·문서 | 대화형 대시보드와 JSON 그래프 | 시각적 탐색, 가이드 투어, 위키 분석 | 전체 구조와 군집은 어떻게 생겼는가? |
| [[graphify]] | 코드·문서·논문·미디어 | 그래프, 리포트, 다양한 내보내기 | 관계 경로 질의, 폭넓은 자료 형식 | A와 B 사이의 연결 경로는 무엇인가? |
| [[codegraph]] | 로컬 코드베이스 | 로컬 색인과 MCP 문맥 | 심볼·호출·영향 범위, 자동 동기화 | 이 변경이 어떤 코드에 영향을 주는가? |

## 선택 기준

[[llm-wiki]] 전체를 사람이 탐색하고 연구 공백 후보를 찾으려면 Understand Anything이 자연스럽다. 이질적인 문서와 코드에서 경로 중심 그래프를 만들려면 Graphify가 적합하다. 구현 코드의 정밀한 문맥과 변경 영향이 목적이면 CodeGraph가 더 직접적이다.

세 도구의 기능 주장은 각 프로젝트 문서에 기반하므로 실제 도입 전 최신 버전과 데이터 처리 방식을 다시 확인해야 한다. 그래프 결과의 연구적 해석 원칙은 [[knowledge-graph-analysis]]을 따른다.
