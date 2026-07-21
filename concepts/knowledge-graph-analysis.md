---
title: 지식 그래프 분석
created: 2026-07-16
updated: 2026-07-16
type: concept
tags: [knowledge-graph, knowledge-base, research, provenance]
sources:
  - "raw/notebooklm/understand-anything-github.md"
  - "raw/notebooklm/graphify-github.md"
  - "raw/notebooklm/codegraph-github.md"
  - "raw/notebooklm/2026-07-16-all-notes.md"
confidence: medium
---

# 지식 그래프 분석

지식 그래프 분석은 문서·코드·개념을 노드와 관계로 표현해 텍스트 목록만으로는 보기 어려운 구조적 패턴을 찾는 방법이다.

## 발견할 수 있는 구조

- 여러 군집을 잇는 브리지 노드
- 연결이 부족한 고립 노드와 지식 공백 후보
- 반복해서 중심에 등장하는 핵심 개념
- 상충하는 주장이나 중복된 엔티티
- 코드 변경이 전파되는 의존 경로

[[understand-anything]]은 대화형 시각화와 위키 분석에, [[graphify]]는 다양한 자료의 경로 질의와 내보내기에, [[codegraph]]는 로컬 코드의 정밀한 구조 색인에 초점을 둔다. ^[raw/notebooklm/2026-07-16-all-notes.md]

## 해석 원칙

그래프의 빈 공간이 곧 학술적 연구 공백은 아니다. 자료 수집 누락, 엔티티 중복, 추출 실패로도 동일한 모양이 생긴다. 따라서 후보를 발견한 뒤 원문과 기존 문헌을 다시 검색하고, [[notebooklm]]에서 관련 소스만 묶어 비판적 질문을 수행해야 한다.

## 위키 품질 피드백

그래프에서 발견한 고립 문서는 위키링크를 보강하고, 모순 후보는 `contested` 상태로 검토한다. 이 과정은 [[research-feedback-loop]]를 통해 다시 위키의 구조와 출처 품질을 개선한다.

UA에서 이 분석을 생성·시각화·질의·환류하는 실행 순서는 [[ua-knowledge-graph-workflow]]를 따른다.
