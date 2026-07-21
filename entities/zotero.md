---
title: Zotero
created: 2026-07-16
updated: 2026-07-16
type: entity
tags: [tool, zotero, research, provenance]
sources:
  - "raw/youtube/📺 LLM Wiki를 업그레이드하는 외부 지식 시스템! 연구자를 위한 최강의 조합 Zotero × Notebook × Obsidian x Claude Code.md"
  - "raw/notebooklm/zotero-mcp-github.md"
  - "raw/notebooklm/llm-wiki-zotero-notebooklm-youtube.md"
confidence: medium
---

# Zotero

Zotero는 논문, 보고서, 웹페이지, 영상 등 연구 원본과 서지정보를 수집·관리하는 도구다. 현재 자료가 제안하는 구조에서는 [[llm-wiki]] 바깥의 원본 도서관으로 배치된다.

## 핵심 역할

- 원본 파일과 서지 메타데이터를 함께 보존한다.
- 브라우저 커넥터를 통해 자료 수집 진입점을 단순화한다.
- 에이전트 연동 시 원본과 메타데이터를 [[obsidian]] 기반 위키로 전달한다.
- 주장의 근거를 다시 확인할 수 있도록 출처 추적성을 유지한다.

## 경계

Zotero는 원본 관리에는 강하지만, 여러 원본을 개념 페이지로 지속적으로 합성하고 상호 연결하는 위키 계층을 대신하지 않는다. 따라서 [[notebooklm]] 및 [[ai-knowledge-workflow]]와 보완 관계로 보는 것이 적절하다.

AI 에이전트와 연결할 때는 [[zotero-mcp]]를 통해 부모 서지 레코드, 첨부 파일, 주석과 본문을 구분해 가져오는 것이 중요하다.

## 열린 질문

- 영상과 웹페이지를 장기적으로 어느 수준까지 서지 레코드로 정규화할 것인가?
- 첨부 파일, 부모 항목, 노트 중 무엇을 위키의 출처 단위로 삼을 것인가?
