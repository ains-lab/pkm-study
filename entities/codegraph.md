---
title: CodeGraph
created: 2026-07-16
updated: 2026-07-16
type: entity
tags: [tool, open-source, knowledge-graph, code-analysis]
sources:
  - "raw/notebooklm/codegraph-github.md"
  - "raw/notebooklm/2026-07-16-all-notes.md"
confidence: medium
---

# CodeGraph

CodeGraph는 로컬 코드베이스를 사전 색인해 심볼, 호출, 참조와 변경 영향 범위를 에이전트에 제공하는 코드 지식 그래프 도구다.

## 주요 역할

- 여러 언어의 코드 구조와 파일 간 참조를 로컬에서 색인한다.
- 저장 시점의 변경을 동기화해 그래프를 최신 상태로 유지한다.
- MCP를 통해 검색, 호출자·피호출자, 영향 범위와 작업별 문맥을 제공한다.
- 에이전트가 전체 저장소를 반복 탐색하는 도구 호출과 문맥 사용을 줄이는 것을 목표로 한다.

## 적용 경계

CodeGraph의 중심 대상은 소프트웨어 소스 코드다. 논문·일반 문서까지 포괄하는 [[graphify]], 위키와 코드베이스의 대화형 시각화를 제공하는 [[understand-anything]]과 초점이 다르다.

연구 코드가 포함된 [[second-brain-research-workflow]]에서는 구현 구조와 실험 코드의 영향을 설명하는 보조 근거가 될 수 있지만, 논문 주장의 출처 관리 자체는 [[llm-wiki]]와 [[zotero]]가 담당해야 한다.
