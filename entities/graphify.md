---
title: Graphify
created: 2026-07-16
updated: 2026-07-16
type: entity
tags: [tool, open-source, knowledge-graph, code-analysis]
sources:
  - "raw/notebooklm/graphify-github.md"
  - "raw/notebooklm/2026-07-16-all-notes.md"
confidence: medium
---

# Graphify

Graphify는 코드, 데이터베이스 스키마, 문서, 논문, 이미지와 영상에서 엔티티와 관계를 추출해 질의 가능한 지식 그래프를 만드는 오픈소스 도구다.

## 특징

- 코드는 AST 기반으로 구조를 추출하고 문서는 LLM 기반 의미 추출을 사용한다.
- 그래프 경로, 설명, 질의, 커뮤니티 클러스터링을 제공한다.
- JSON·HTML·SVG·GraphML·Obsidian 등 여러 형식으로 결과를 내보낸다.
- 변경 감지와 증분 갱신, 작업 결과에 대한 학습 메모를 지원한다.

## LLM Wiki와의 관계

[[llm-wiki]]가 사람이 읽고 수정하는 개별 Markdown 페이지를 지속적으로 컴파일한다면 Graphify는 전체 자료의 관계망과 경로 탐색을 우선한다. 따라서 위키 페이지 생성의 대체재보다 [[knowledge-graph-analysis]]를 위한 보완 계층으로 보는 편이 정확하다.

## 주의점

문서와 PDF의 의미 추출에는 모델 호출이 필요하며, 추론 관계는 원본에서 직접 추출된 관계와 구분해 검토해야 한다. [[understand-anything]] 및 [[codegraph]]와의 선택 기준은 [[knowledge-graph-tools]]에 정리한다.
