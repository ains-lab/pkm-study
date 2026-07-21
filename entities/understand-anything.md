---
title: Understand Anything
created: 2026-07-16
updated: 2026-07-16
type: entity
tags: [tool, open-source, knowledge-graph, code-analysis]
sources:
  - "raw/notebooklm/understand-anything-github.md"
  - "raw/notebooklm/2026-07-16-all-notes.md"
confidence: medium
---

# Understand Anything

Understand Anything(UA)은 코드베이스, 문서, Karpathy 패턴의 위키를 대화형 지식 그래프로 변환하는 오픈소스 분석 도구다. 구조 파싱과 LLM 기반 의미 분석을 결합해 파일·함수·엔티티·주장·관계를 탐색 가능한 그래프로 표현한다.

## 위키 분석 모드

`understand-knowledge`는 `index.md`와 위키링크를 결정론적으로 읽고, 문서 분석 에이전트가 암시적 관계와 핵심 주장을 보강한다. 결과는 커뮤니티 클러스터링이 적용된 그래프로 저장되며 [[llm-wiki]]의 구조적 결함을 찾는 데 활용할 수 있다.

## 활용 가치

- 고립된 문서와 약한 연결을 시각적으로 찾는다.
- 서로 다른 주제 군집을 잇는 브리지 노드를 식별한다.
- 문서 사이의 잠재적 모순과 연구 공백 후보를 발견한다.
- 코드베이스에서는 구조·도메인·변경 영향 분석을 지원한다.

발견된 관계는 자동으로 사실이 되는 것이 아니라 [[knowledge-graph-analysis]]를 거쳐 원문과 다시 대조해야 한다. 그래프에서 얻은 연구 아이디어는 [[notebooklm]]의 제한된 소스 묶음으로 비판적으로 검토할 수 있다.

위키 생성 이후 각 스킬을 어떤 순서로 적용하는지는 [[ua-knowledge-graph-workflow]]에 정리한다.

## 관련 문서

- [[graphify]]
- [[codegraph]]
- [[research-feedback-loop]]
