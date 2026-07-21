---
title: notebooklm-py
created: 2026-07-16
updated: 2026-07-16
type: entity
tags: [tool, open-source, notebooklm, automation, agent]
sources:
  - "raw/notebooklm/notebooklm-py-github.md"
  - "raw/notebooklm/2026-07-16-all-notes.md"
  - "raw/notebooklm/llm-wiki-zotero-notebooklm-youtube.md"
confidence: medium
---

# notebooklm-py

notebooklm-py는 Google [[notebooklm]]을 Python API, CLI, MCP와 에이전트 스킬로 자동화하는 비공식 오픈소스 라이브러리다.

## 기능 범위

- 노트북 생성과 URL·YouTube·PDF·Markdown 소스 추가
- 소스 전체본문과 가이드 추출
- 출처가 표시된 질의응답과 대화 기록
- 오디오, 영상, 보고서, 슬라이드, 퀴즈, 마인드맵 등 생성
- 결과물을 Markdown, JSON, CSV, PDF, PPTX 등으로 내보내기

## 위키 통합

이 위키에서는 `2nd-brain` 노트북의 전체 소스 목록과 본문을 읽어 `raw/notebooklm/`에 보존하는 데 사용했다. 장기적으로는 [[research-feedback-loop]]에서 위키 문서와 원본을 NotebookLM에 넣고, 검토할 가치가 있는 결과만 다시 [[llm-wiki]]로 환류시키는 자동화 계층을 맡는다.

## 위험

Google의 문서화되지 않은 내부 API를 사용하는 비공식 프로젝트이므로 API 변경, 인증 만료, 속도 제한에 영향을 받을 수 있다. 따라서 [[agentic-workspace]]의 핵심 지식은 NotebookLM에만 두지 말고 로컬 원본과 Markdown으로 함께 보존해야 한다.
