---
title: Palantir
created: 2026-07-25
updated: 2026-07-25
type: entity
tags: [tool, agent, orchestration]
sources:
  - "raw/web/palantir-architecture-center-overview.md"
  - "raw/web/palantir-aip-foundry-apollo.md"
  - "raw/web/palantir-aip-architecture-overview.md"
  - "raw/web/palantir-interoperability.md"
  - "raw/web/palantir-multimodal-data-plane.md"
  - "raw/web/palantir-ontology-system.md"
  - "raw/web/palantir-rubix-substrate.md"
confidence: medium
contested: false
---

# Palantir

## 역할과 범위

Palantir는 AIP, Foundry, Apollo를 결합해 데이터 통합부터 AI 에이전트의 운영까지 연결하는 엔터프라이즈 플랫폼 아키텍처를 제시한다. Foundry는 데이터·로직·워크플로우 기반, AIP는 생성형 AI와 에이전트 개발·평가 계층, Apollo는 이 서비스들의 지속 배포를 담당한다. 세 플랫폼은 [[enterprise-ai-operating-system]]이라는 하나의 운영 모델로 설명된다. ^[raw/web/palantir-aip-foundry-apollo.md]

## 검증 가능한 구조

- **Ontology**: 데이터뿐 아니라 로직, 행동, 보안을 함께 모델링해 인간과 에이전트가 공유하는 운영 문맥을 구성한다.
- **Multimodal Data Plane**: Iceberg·Parquet 같은 개방형 형식, 여러 컴퓨트 런타임, 외부 모델과 자체 모델을 연결한다.
- **Rubix**: Kubernetes 기반의 격리·자동 확장·고가용성 실행 기판을 제공한다.
- **상호운용 계층**: REST, JDBC, S3 호환 인터페이스, SDK, 컨테이너, BI·분석 도구와의 연결을 표방한다.

이 구조에서 [[enterprise-ontology]]는 운영 언어와 의사결정 인터페이스이고, 데이터·컴퓨트·배포 계층은 그 언어를 실제 시스템과 연결하는 기반이다. ^[raw/web/palantir-ontology-system.md]

## AI 에이전트 운영

AIP는 모델 접근, 문맥 구성, 에이전트·자동화 개발, 관찰 가능성, 평가, 릴리스와 배포를 하나의 수명주기로 묶는다. 에이전트도 사람과 같은 Ontology 및 권한 체계를 사용하도록 설계되어 [[agentic-workspace]]와 [[agentic-ai-safety-governance]]에서 요구하는 공유 문맥·권한·감사 관문을 플랫폼 수준에서 구현하려 한다. ^[raw/web/palantir-aip-architecture-overview.md]

## 제약과 증거 경계

이 문서의 수치, 보안 수준, 고객 적용 사례와 성능 주장은 Palantir 자체 문서에서 나온 공급자 주장이다. 독립적인 성능·비용·운영 복잡성 검증이 없으므로 확정 사실이 아니라 아키텍처 의도와 제품 설명으로 취급한다. 특히 개방형 인터페이스 지원과 실제 교체 가능성은 구분해서 평가해야 한다.
