---
title: Enterprise Ontology
created: 2026-07-25
updated: 2026-07-25
type: concept
tags: [knowledge-graph, agent, workflow, provenance]
sources:
  - "raw/web/palantir-ontology-system.md"
  - "raw/web/palantir-architecture-center-overview.md"
  - "raw/web/palantir-aip-architecture-overview.md"
  - "raw/web/ax-labs-enterprise-ontology-shared-vocabulary.md"
confidence: medium
contested: false
---

# Enterprise Ontology

## 정의

엔터프라이즈 온톨로지는 조직의 핵심 명사, 관계, 행동 규칙을 기계가 읽고 실행할 수 있는 공통 언어로 표현한 것이다. 단순 용어사전이나 읽기 전용 의미 계층에 머물지 않고, 운영 의사결정에 필요한 데이터·로직·행동·보안을 함께 연결할 때 인간과 AI 에이전트가 공유하는 실행 문맥이 된다. ^[raw/web/palantir-ontology-system.md]

## 작동 구조

1. **언어 합의**: 고객, 주문, 설비 같은 객체와 관계·카디널리티를 정의한다.
2. **데이터 결합**: 여러 시스템의 레코드를 객체·속성·링크에 대응시킨다.
3. **로직 연결**: 규칙, 모델, 최적화, LLM 함수를 객체와 행동에 연결한다.
4. **행동과 쓰기**: 조회를 넘어 거래, 알림, 다단계 갱신을 운영 시스템에 반영한다.
5. **보안과 감사**: 사람과 에이전트의 읽기·실행 권한, 목적 제한, 이력을 같은 경계 안에서 집행한다.

Palantir의 설명은 이 구조를 Language, Engine, Toolchain으로 나눈다. AX LABS의 실무적 설명은 도입 전 단계에서 먼저 조직 용어의 불일치와 분류 규칙을 합의하는 것이 핵심이라고 강조한다. ^[raw/web/ax-labs-enterprise-ontology-shared-vocabulary.md]

## 현재의 활용 방식

- 여러 에이전트가 같은 엔티티와 행동 의미를 공유하게 한다.
- 분류 목록이나 RDF 같은 정의 파일을 코드 생성과 검증의 원본으로 사용한다.
- 운영 애플리케이션, 자동화, 분석이 같은 객체·권한 모델을 재사용하게 한다.
- [[enterprise-ai-operating-system]]에서 데이터 계층과 에이전트 실행 계층 사이의 계약 역할을 한다.

## LLM Wiki와의 관계

[[ontology-and-llm-wiki]]에서 정리하듯 온톨로지는 정합성을 위한 사전이고, [[llm-wiki]]는 비정형 근거를 축적하고 이해하기 위한 노트 체계다. 위키가 탐색을 통해 개념 후보와 근거를 축적하면, 반복적으로 안정된 핵심 개념을 온톨로지 계약으로 승격할 수 있다.

## 열린 질문

- 합의된 정의와 현실의 운영 변화 사이의 버전 관리를 누가 책임지는가?
- 개방형 표준 지원이 특정 플랫폼의 실행 엔진에 대한 종속성을 실제로 얼마나 줄이는가?
- 에이전트가 제안한 스키마 변경을 어떤 인간 검토와 회귀 검증으로 승인할 것인가?
