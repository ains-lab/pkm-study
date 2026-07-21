---
title: 연구 피드백 루프
created: 2026-07-16
updated: 2026-07-16
type: concept
tags: [workflow, research, knowledge-graph, provenance]
sources:
  - "raw/notebooklm/2026-07-16-all-notes.md"
  - "raw/notebooklm/llm-wiki-zotero-notebooklm-youtube.md"
  - "raw/notebooklm/notebooklm-py-github.md"
confidence: medium
---

# 연구 피드백 루프

연구 피드백 루프는 원본 수집, 위키 컴파일, 그래프 분석, 집중 합성의 결과가 다시 지식베이스로 돌아오는 반복 구조다.

## 순환 구조

1. [[zotero]]와 [[zotero-mcp]]로 원본과 서지정보를 확보한다.
2. [[llm-wiki]]에서 개념·엔티티·비교 문서로 컴파일한다.
3. [[knowledge-graph-analysis]]으로 브리지·고립·모순 후보를 찾는다.
4. [[notebooklm-py]]로 관련 Markdown과 원본을 NotebookLM에 묶는다.
5. 비판적 질문과 보고서로 가설을 검토한다.
6. 검증된 결과만 출처와 함께 위키에 다시 편입한다.

이 루프의 목표는 산출물 수를 늘리는 것이 아니라 “왜 이 관계가 중요한가”를 반복 검증하는 것이다. NotebookLM의 답변이나 그래프의 연결은 중간 가설이며, 원본을 확인한 뒤에만 장기 지식으로 승격한다. ^[raw/notebooklm/2026-07-16-all-notes.md]

## 환류 가능한 형식

- Markdown 보고서와 질의 결과
- JSON 마인드맵과 지식 그래프
- CSV 비교표
- PDF·PPTX·이미지 산출물

장기 보관할 핵심 내용은 공개 형식의 Markdown과 출처 경로로 환원해 [[obsidian]]에서 탐색 가능하게 유지한다.

UA 지식그래프를 이 순환에 연결하는 구체적인 스킬 순서는 [[ua-knowledge-graph-workflow]]에 정리되어 있다.

NotebookLM 질의 결과를 원본 대화 파일 없이 canonical query로 증분 편입하는 절차는 [[notebooklm-query-compounding]]을 따른다.
