---
title: Ontology and LLM Wiki
created: 2026-07-25
updated: 2026-07-25
type: comparison
tags: [comparison, knowledge-base, knowledge-graph, workflow]
sources:
  - "raw/web/ax-labs-enterprise-ontology-shared-vocabulary.md"
  - "raw/web/palantir-ontology-system.md"
confidence: medium
contested: false
---

# Ontology and LLM Wiki

## 비교 목적

[[enterprise-ontology]]와 [[llm-wiki]]는 모두 지식을 구조화하지만 해결하는 문제가 다르다. 이 비교는 에이전트가 공유할 안정된 계약과, 계속 들어오는 비정형 근거를 축적하는 체계를 구분하기 위한 것이다.

## 비교

| 기준 | 엔터프라이즈 온톨로지 | LLM Wiki |
|---|---|---|
| 주된 목적 | 용어·관계·행동의 정합성 | 근거의 축적·종합·이해 |
| 주요 입력 | 구조화된 데이터와 조직 합의 | 문서, 논문, 회의록 등 비정형 원본 |
| 결과물 | 기계가 읽는 스키마·관계·행동 계약 | 사람이 읽는 상호 연결 canonical 문서 |
| 주 작성자 | 도메인 담당자와 개발자 | 에이전트가 작성하고 사람이 검토 |
| 변경 시점 | 안정된 개념을 명시적으로 버전 변경 | 새 근거가 들어올 때 증분 갱신 |
| 실패 양상 | 정의가 현실과 달라 시스템이 우회됨 | 낡은 주장·중복·모순이 누적됨 |
| 검증 | 스키마·데이터·코드 적합성 검사 | 출처·링크·메타데이터·모순 lint |

## 결론: 대체가 아니라 승격 파이프라인

두 체계는 대체 관계가 아니다. [[ai-knowledge-workflow]]에서 위키는 원본을 읽고 개념 후보와 충돌을 축적하는 탐색 계층으로, 온톨로지는 반복적으로 검증되어 여러 시스템과 에이전트가 공유해야 하는 개념을 계약으로 고정하는 실행 계층으로 배치할 수 있다.

실무 순서는 다음과 같다.

1. 위키에 근거와 맥락을 축적한다.
2. 반복되는 용어와 관계, 충돌을 찾아 인간이 합의한다.
3. 안정된 부분만 온톨로지로 승격한다.
4. 데이터·코드·에이전트가 계약을 지키는지 자동 검증한다.
5. 운영 중 발견한 예외와 변경 근거를 다시 위키에 환류한다.

이 순환은 [[research-feedback-loop]]을 구조화된 운영 정의까지 확장한다.
