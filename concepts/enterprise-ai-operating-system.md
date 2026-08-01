---
title: Enterprise AI Operating System
created: 2026-07-25
updated: 2026-07-25
type: concept
tags: [agent, orchestration, workflow, automation]
sources:
  - "raw/web/palantir-aip-foundry-apollo.md"
  - "raw/web/palantir-architecture-center-overview.md"
  - "raw/web/palantir-aip-architecture-overview.md"
  - "raw/web/palantir-interoperability.md"
  - "raw/web/palantir-multimodal-data-plane.md"
  - "raw/web/palantir-ontology-system.md"
  - "raw/web/palantir-rubix-substrate.md"
confidence: medium
contested: false
---

# Enterprise AI Operating System

## 정의

엔터프라이즈 AI 운영체제는 데이터, 의미 모델, 로직, AI 모델, 자동화, 애플리케이션, 배포와 보안을 하나의 운영 루프로 연결하는 아키텍처 패턴이다. 여기서 “운영체제”는 범용 컴퓨터 OS가 아니라 조직의 의사결정과 실행을 공통 기반에서 조정한다는 비유다. [[palantir]]는 AIP·Foundry·Apollo의 결합을 이 용어로 설명한다. ^[raw/web/palantir-aip-foundry-apollo.md]

## 계층과 흐름

| 계층 | 책임 |
|---|---|
| 데이터·컴퓨트 | 원본 형식, 스트리밍·배치·대화형 처리, 외부 런타임 연결 |
| [[enterprise-ontology]] | 객체·관계·로직·행동·권한을 운영 언어로 통합 |
| 에이전트·자동화 | 문맥을 사용해 분석하고 승인된 행동을 실행 |
| 애플리케이션 | 인간과 에이전트가 같은 운영 상태를 조회·갱신 |
| 배포 기판 | 여러 환경에 서비스와 정책을 지속 배포하고 롤백 |
| 거버넌스 | 계층 전체의 접근, 목적, 계보, 감사 이력을 집행 |

이 패턴의 핵심은 에이전트를 별도 챗봇으로 붙이는 것이 아니라 데이터 흐름, 권한, 행동 인터페이스, 평가와 배포 수명주기에 포함하는 것이다. ^[raw/web/palantir-aip-architecture-overview.md]

## 상호운용성과 종속성

개방형 데이터 형식, 표준 API, 여러 컴퓨트 엔진과 모델을 지원하면 기존 데이터 플랫폼과의 공존 가능성이 커진다. 그러나 인터페이스가 열려 있다는 사실만으로 의미 모델, 정책, 애플리케이션과 운영 절차의 이전 비용이 사라지지는 않는다. 따라서 [[ai-knowledge-workflow]]처럼 원본·canonical 지식·실행 시스템의 경계를 명시하고, 플랫폼 밖으로 내보낼 수 있는 데이터·정의·감사 기록을 별도로 검증해야 한다. ^[raw/web/palantir-interoperability.md]

## 운영 원칙

- 사람과 에이전트가 같은 권한·감사 체계를 사용한다.
- 모델 선택보다 문맥, 행동 경계, 평가와 복구 절차를 먼저 설계한다.
- 배치·스트리밍·외부 컴퓨트와 모델을 단일 제품에 복제하지 않고 연결할 수 있어야 한다.
- 지속 배포는 [[agentic-ai-safety-governance]]의 승인·중지·롤백 통제와 결합되어야 한다.

## 열린 질문

- 통합 플랫폼의 일관성과 모듈형 아키텍처의 교체 가능성 사이에서 어느 수준이 적절한가?
- 공급자 자체 문서의 보안·가용성·규모 주장을 어떤 독립 증거로 검증할 것인가?
- 조직 온톨로지와 실제 업무 절차가 어긋날 때 변경 책임과 승인 권한은 어디에 있는가?
