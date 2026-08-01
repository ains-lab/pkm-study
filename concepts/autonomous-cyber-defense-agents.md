---
title: 자율 사이버 방어 에이전트
created: 2026-07-22
updated: 2026-07-22
type: concept
tags: [agent, automation, llm, workflow, research]
sources:
  - raw/papers/2024-12-design-and-evaluation-of-an-autonomous-cyber-defence-agent-using-drl-and-an-augmented-llm.md
  - raw/papers/2025-09-a-review-of-agentic-ai-in-cybersecurity-cognitive-autonomy-ethical-governance-and-quantum-resilient-defense-version-1-peer-review-2-approved.md
  - raw/papers/2025-augmenting-threat-intelligence-a-framework-for-integrating-llms-ai-agents-and-rag-in-cybersecurity-analysis.md
  - raw/papers/2026-01-cti-thinker-an-llm-driven-system-for-cti-knowledge-graph-construction-and-attack-reasoning.md
  - raw/papers/2026-06-agentic-ai-and-llm-driven-framework-for-contextual-anomaly-detection.md
confidence: medium
---

# 자율 사이버 방어 에이전트

자율 사이버 방어 에이전트는 보안 상태를 관측하고 목표에 따라 대응 계획을 선택하며, 제한된 행동 공간에서 방어 조치를 실행하고 결과를 다시 학습·검토하는 시스템이다. 경보를 생성하는 분석 모델과 달리 행동 결과에 대한 책임까지 포함하므로 지식 근거, 권한 경계와 사후 검증이 함께 설계되어야 한다.

## 운영 루프

관측 → 위협 문맥화 → 계획 → 제한된 행동 → 결과 검증 → 사람에게 인계 또는 학습

- **관측:** 네트워크·호스트 이벤트와 자산 상태를 수집한다.
- **문맥화:** [[cyber-threat-intelligence-knowledge-graphs]]와 RAG가 취약점, 공격 기법과 과거 보고서를 연결한다.
- **계획:** 강화학습, LLM 계획과 규칙 기반 정책을 조합해 행동 후보를 선택한다.
- **행동:** 감시 강화, decoy 배치, 악성 프로세스 제거, 서비스 격리와 복구처럼 사전에 허용된 조치를 수행한다.
- **검증:** [[agentic-ai-contextual-anomaly-detection]]이 목표·순서·문맥 이탈을 찾고, 고위험 결과는 사람에게 넘긴다.

이 루프는 통제된 cyber range에서 DRL 방어 에이전트와 CTI 기반 챗봇을 함께 평가한 연구, CTI 수명주기 전반에 LLM·에이전트·RAG를 배치하는 프레임워크, CTI-Thinker의 공격 추론 구조를 종합한 것이다. ^[raw/papers/2024-12-design-and-evaluation-of-an-autonomous-cyber-defence-agent-using-drl-and-an-augmented-llm.md] ^[raw/papers/2025-augmenting-threat-intelligence-a-framework-for-integrating-llms-ai-agents-and-rag-in-cybersecurity-analysis.md] ^[raw/papers/2026-01-cti-thinker-an-llm-driven-system-for-cti-knowledge-graph-construction-and-attack-reasoning.md]

## 현재 활용과 경계

반복적이고 시간 민감한 수집·분류·상관 분석은 자동화 가치가 높지만, 공격적 대응이나 서비스 중단처럼 되돌리기 어려운 행동은 자동화 수준을 낮춰야 한다. [[agentic-workspace]]의 실행 격리·소유권·검토 관문을 보안 운영에 적용하면 에이전트의 속도와 분석가의 책임을 분리할 수 있다.

자율성은 곧 신뢰성이 아니다. 한 연구의 DRL 결과는 제한된 공격 전략과 시뮬레이션 환경에서 얻어졌고, 서술형 프레임워크와 리뷰 논문은 실제 배포 성능을 입증하지 않는다. 실제 적용에서는 새로운 공격 분포, 오염된 CTI, prompt injection, 잘못된 복구 행동과 다중 에이전트 충돌을 별도로 시험해야 한다. ^[raw/papers/2024-12-design-and-evaluation-of-an-autonomous-cyber-defence-agent-using-drl-and-an-augmented-llm.md] ^[raw/papers/2025-09-a-review-of-agentic-ai-in-cybersecurity-cognitive-autonomy-ethical-governance-and-quantum-resilient-defense-version-1-peer-review-2-approved.md] ^[raw/papers/2026-06-agentic-ai-and-llm-driven-framework-for-contextual-anomaly-detection.md]

운영 권한과 책임을 포함한 통제 구조는 [[agentic-ai-safety-governance]]에 정리한다.

## 열린 질문

- 어떤 방어 행동까지 사람이 사전 승인하지 않아도 되는가?
- 공격자가 CTI·로그·RAG 문맥을 오염시킬 때 계획을 어떻게 중단할 것인가?
- 시뮬레이션의 red team이 실제 공격 다양성을 충분히 대표하는지 어떻게 측정할 것인가?
- 여러 방어 에이전트가 같은 자산에 상충하는 조치를 내릴 때 누가 중재할 것인가?
