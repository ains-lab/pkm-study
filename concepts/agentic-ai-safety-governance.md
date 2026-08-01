---
title: 에이전틱 AI 안전 거버넌스
created: 2026-07-22
updated: 2026-07-22
type: concept
tags: [agent, llm, workflow, research, provenance]
sources:
  - raw/papers/2024-12-design-and-evaluation-of-an-autonomous-cyber-defence-agent-using-drl-and-an-augmented-llm.md
  - raw/papers/2025-09-a-review-of-agentic-ai-in-cybersecurity-cognitive-autonomy-ethical-governance-and-quantum-resilient-defense-version-1-peer-review-2-approved.md
  - raw/papers/2026-04-integrating-anomaly-detection-into-agentic-ai-for-proactive-risk-management-in-human-activity.md
  - raw/papers/2026-06-agentic-ai-and-llm-driven-framework-for-contextual-anomaly-detection.md
  - raw/papers/2026-06-detection-and-mitigation-of-mythos-class-frontier-model-capabilities-a-layered-reference-architecture.md
confidence: medium
---

# 에이전틱 AI 안전 거버넌스

에이전틱 AI 안전 거버넌스는 모델 출력의 유해성만 검사하는 것이 아니라, 에이전트가 어떤 목표·데이터·도구·권한으로 얼마나 오래 행동할 수 있는지와 그 결과에 누가 책임지는지를 통제하는 운영 체계다. 자율성이 커질수록 접근 승인, 실행 격리, runtime 탐지와 감사 증거를 여러 층으로 분리해야 한다.

## 다층 통제 구조

| 통제 층 | 핵심 질문 | 대표 수단 |
|---|---|---|
| 위험 분류 | 이 작업과 배포면의 잠재 피해는 무엇인가? | 사전 평가, 위협 모델, 허용 행동 등급 |
| 접근·도구 경계 | 어떤 데이터와 도구에 접근할 수 있는가? | 최소 권한, vetted access, 자격증명 분리 |
| 권한 있는 결과 방출 | 실행 가능한 결과를 누가 승인하는가? | 정책 검사, 사람 승인, 서명·attestation |
| runtime 감시 | 정상 계획에서 벗어나는가? | [[agentic-ai-contextual-anomaly-detection]], drift 감시, kill switch |
| 실행면 격리 | 실패가 어디까지 전파되는가? | sandbox, 네트워크·compute 격리, 복구 지점 |
| 책임과 학습 | 결정 근거와 사고 대응을 재현할 수 있는가? | 감사 로그, provenance, 사후 검토, 정책 갱신 |

이 구조는 에이전틱 사이버 방어 리뷰의 자율성·윤리·회복탄력성 관점, frontier AI를 위한 방어 심층화 reference design, 에이전트 궤적 탐지 연구를 운영 통제 층으로 재배열한 것이다. ^[raw/papers/2025-09-a-review-of-agentic-ai-in-cybersecurity-cognitive-autonomy-ethical-governance-and-quantum-resilient-defense-version-1-peer-review-2-approved.md] ^[raw/papers/2026-06-detection-and-mitigation-of-mythos-class-frontier-model-capabilities-a-layered-reference-architecture.md] ^[raw/papers/2026-06-agentic-ai-and-llm-driven-framework-for-contextual-anomaly-detection.md]

## 적용 원칙

- [[autonomous-cyber-defense-agents]]처럼 실제 환경을 변경하는 시스템은 분석 전용 에이전트보다 좁은 행동 공간과 강한 승인 경계를 가져야 한다.
- 정적 규칙은 명확한 금지 행동에, 문맥 기반 탐지는 장기 궤적과 미지의 이탈에 사용하고 어느 하나를 단독 관문으로 두지 않는다.
- 안전 지표는 모델 성능뿐 아니라 오탐·미탐 비용, 인간의 개입 가능성, 복구 시간과 증거 보존을 함께 포함해야 한다.
- [[ai-knowledge-workflow]]처럼 원본·해석·결정 기록을 분리해야 사고 후 어떤 근거가 행동을 만들었는지 재현할 수 있다.

## 증거 수준과 주의점

현재 근거는 통제된 실험, 서술형 리뷰, 개념 프레임워크와 reference design이 혼재한다. 특히 “Mythos-class”와 그 위협 범주는 해당 논문이 제안한 명명과 전제이며, 제시된 구조도 배포된 시스템이 아니라 검증을 기다리는 설계다. 인간 활동 위험 관리 연구 역시 fall mitigation을 anomaly detection과 agent orchestration으로 재구성한 개념 제안이다. 따라서 특정 용어와 통제 묶음을 확정 표준으로 취급하지 말고, 독립적 위협 모델과 운영 시험으로 채택 여부를 결정해야 한다. ^[raw/papers/2026-06-detection-and-mitigation-of-mythos-class-frontier-model-capabilities-a-layered-reference-architecture.md] ^[raw/papers/2026-04-integrating-anomaly-detection-into-agentic-ai-for-proactive-risk-management-in-human-activity.md]

## 열린 질문

- 에이전트의 권한과 자율성 깊이를 조직 간에 비교 가능한 방식으로 어떻게 측정할 것인가?
- 암호학적 승인과 실제 인간 책임 사이의 공백을 어떻게 막을 것인가?
- runtime 감시 모델 자체가 공격받거나 drift할 때 어떤 독립 관문이 필요한가?
- 안전을 위한 로그가 개인정보·기밀정보를 과도하게 축적하지 않도록 어떻게 제한할 것인가?
