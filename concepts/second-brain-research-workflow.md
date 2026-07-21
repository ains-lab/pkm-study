---
title: 세컨드 브레인 연구 워크플로
created: 2026-07-16
updated: 2026-07-20
type: concept
tags: [pkm, workflow, research, knowledge-base]
sources:
  - "raw/notebooklm/2026-07-16-all-notes.md"
  - "raw/notebooklm/llm-wiki-zotero-notebooklm-youtube.md"
confidence: medium
---

# 세컨드 브레인 연구 워크플로

세컨드 브레인 연구 워크플로는 원본 보존, AI 합성, 개인 해석을 분리하면서 하나의 반복 가능한 연구 환경으로 연결하는 방식이다.

이 워크플로는 [[ai-personal-knowledge-management]]의 계층 원칙을 연구 자료 수집과 검증에 적용한 구현이다.

## 역할 분담

- [[zotero]]: 논문과 웹 자료의 원본·서지정보 관리
- [[llm-wiki]]: 재사용 가능한 지식 카드와 비교 문서
- [[notebooklm]]: 특정 소스 묶음의 심층 질의와 학습 산출물
- [[understand-anything]]·[[graphify]]: 전체 지식의 관계와 공백 탐색
- [[obsidian]]: Markdown 지식과 개인 메모의 장기 편집 환경
- [[codegraph]]: 연구 코드의 구조 및 구현 근거 분석

## 개인 지식과 외부 지식

외부 원본의 요약과 사용자의 경험·판단을 같은 층에서 섞으면 출처와 의견의 경계가 흐려진다. 원본과 컴파일된 지식은 출처를 유지하고, 개인 메모는 별도 섹션이나 문서로 기록하는 것이 좋다.

## 성공 조건

- 원문으로 돌아갈 수 있다.
- AI가 만든 주장과 개인 판단을 구분할 수 있다.
- 도구가 바뀌어도 Markdown과 메타데이터가 남는다.
- 새 자료가 기존 지식과 연결되거나 모순으로 표시된다.

이 구조의 운영 절차는 [[ai-knowledge-workflow]], 반복적 개선은 [[research-feedback-loop]]에 정리한다.
