---
title: slides-grab
created: 2026-07-16
updated: 2026-07-16
type: entity
tags: [tool, open-source, presentation, agent]
sources:
  - "raw/web/NomaDamasslides-grab Best harness + editor + linter for generating slides in Claude Code  Codex - Claude Design Open Source Alternative.md"
confidence: medium
---

# slides-grab

slides-grab은 에이전트가 HTML·CSS로 프레젠테이션을 만들고, 브라우저 편집기에서 영역을 지정해 수정하며, PDF·PNG 등으로 내보내도록 구성된 오픈소스 도구다.

## 작업 흐름

1. 발표 구조를 계획한다.
2. 슬라이드를 개별 HTML 파일로 생성한다.
3. 시각 편집기에서 텍스트나 영역을 선택해 에이전트에 수정 요청한다.
4. 검증과 디자인 게이트를 통과한 뒤 PDF 또는 이미지로 내보낸다.

## 지식 시스템에서의 위치

slides-grab은 [[llm-wiki]]에 축적된 지식을 발표 자료로 변환하는 산출 계층이다. [[orca]] 같은 실행 환경에서 에이전트 작업을 관리할 수 있지만, 슬라이드의 논리와 근거는 [[ai-knowledge-workflow]]의 출처 검토를 유지해야 한다.

## 주의점

원본 README는 PPTX와 Figma 내보내기를 실험적 기능으로 명시한다. 안정적인 전달 형식은 PDF와 슬라이드별 PNG를 우선하는 편이 안전하다.

## 관련 문서

- [[agentic-workspace]]
- [[knowledge-tool-roles]]
