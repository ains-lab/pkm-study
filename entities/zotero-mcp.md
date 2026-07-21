---
title: Zotero MCP
created: 2026-07-16
updated: 2026-07-16
type: entity
tags: [tool, open-source, zotero, mcp, research]
sources:
  - "raw/notebooklm/zotero-mcp-github.md"
  - "raw/notebooklm/llm-wiki-zotero-notebooklm-youtube.md"
confidence: medium
---

# Zotero MCP

Zotero MCP는 AI 에이전트가 로컬 [[zotero]] 라이브러리의 메타데이터, PDF 본문, 주석과 컬렉션에 접근하도록 연결하는 오픈소스 플러그인이다.

## 제공 기능

- 제목·저자·연도·태그·본문을 조합한 문헌 검색
- PDF 본문, 초록, 노트, 웹 스냅샷 추출
- 하이라이트와 주석 검색
- 컬렉션 탐색과 의미 검색
- 선택적으로 노트·태그·메타데이터 쓰기

## 위키 인입에서의 의미

[[llm-wiki]]로 논문을 인입할 때 첨부 PDF만 가져오면 서지정보와 부모 항목의 관계가 끊길 수 있다. Zotero MCP는 먼저 부모 레코드의 메타데이터를 확인하고 그다음 본문을 가져오는 통로로 사용해야 한다.

[[ai-knowledge-workflow]]에서는 Zotero MCP가 원본 도서관과 에이전트 사이의 경계 인터페이스이며, 심층 질의와 산출물 생성은 [[notebooklm-py]]가 보완한다.
