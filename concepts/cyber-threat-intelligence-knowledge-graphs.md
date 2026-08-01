---
title: 사이버 위협 인텔리전스 지식 그래프
created: 2026-07-22
updated: 2026-07-25
type: concept
tags: [knowledge-graph, llm, research, workflow]
sources:
  - raw/papers/2024-12-design-and-evaluation-of-an-autonomous-cyber-defence-agent-using-drl-and-an-augmented-llm.md
  - raw/papers/2025-augmenting-threat-intelligence-a-framework-for-integrating-llms-ai-agents-and-rag-in-cybersecurity-analysis.md
  - raw/papers/2026-01-cti-thinker-an-llm-driven-system-for-cti-knowledge-graph-construction-and-attack-reasoning.md
  - raw/papers/2026-01-graph-based-anomaly-apt-attack-detection-via-threat-intelligence.md
  - raw/papers/2026-05-structure-enhanced-pre-trained-language-model-for-requirement-cyber-threat-intelligence-knowledge-graph-completion.md
confidence: medium
---

# 사이버 위협 인텔리전스 지식 그래프

사이버 위협 인텔리전스(CTI) 지식 그래프는 보고서, 이벤트 로그, 취약점, 공격 기법과 방어 요구사항을 엔티티와 관계로 정규화해 검색·추론·대응에 재사용하는 구조다. 단순 문서 검색과 달리 CVE, CAPEC, CWE, MITRE ATT&CK 같은 기준 체계와 관측 사건 사이의 경로를 보존하므로, 공격 의도 추론과 방어 조치 선택의 근거를 추적할 수 있다.

## 반복되는 처리 흐름

1. **수집과 정규화:** 비정형 CTI 보고서, 네트워크·호스트 로그, 취약점 데이터와 관리 요구사항을 공통 스키마로 모은다.
2. **엔티티·관계 추출:** 언어 모델이나 보안 특화 인코더가 위협 행위자, 기술, 자산, 취약점과 조치 후보를 추출하고 ATT&CK 같은 외부 체계에 정렬한다.
3. **구조·의미 결합:** 그래프 신경망의 위상 정보와 언어 모델의 텍스트 표현을 함께 사용해 누락 관계를 보완한다.
4. **근거 기반 추론:** GraphRAG나 경로 탐색으로 관련 서브그래프를 회수하고, 분석가 질의·공격 의도 추론·방어 에이전트의 판단 문맥으로 제공한다.

이 흐름은 CTI-Thinker의 추출·정규화·GraphRAG, RCTI+의 구조·텍스트 결합, 자율 방어 에이전트의 네트워크·CTI·취약점 그래프를 하나의 운영 파이프라인으로 해석한 것이다. ^[raw/papers/2026-01-cti-thinker-an-llm-driven-system-for-cti-knowledge-graph-construction-and-attack-reasoning.md] ^[raw/papers/2026-05-structure-enhanced-pre-trained-language-model-for-requirement-cyber-threat-intelligence-knowledge-graph-completion.md] ^[raw/papers/2024-12-design-and-evaluation-of-an-autonomous-cyber-defence-agent-using-drl-and-an-augmented-llm.md]

## 활용 패턴

- **공격 추론:** CTI-Thinker는 문서에서 추출한 지식과 ATT&CK 자원을 결합해 전술·기법과 공격 의도를 질의한다.
- **논문 검증:** CTI-Thinker의 구성, 정량 결과와 CAG 적용 경계는 [[cti-thinker-paper-summary]]에 별도로 정리한다.
- **관리 요구사항 연결:** RCTI+와 SeBert는 위협 관계뿐 아니라 보안 관리 요구사항을 그래프에 포함하고 구조·텍스트 표현을 함께 학습한다.
- **이상 탐지:** 위협 인텔리전스로 보강한 정상 provenance graph를 학습하면 이벤트 단위 오탐을 줄이면서 구조적 이탈을 찾는 기반이 된다.
- **에이전트 문맥:** [[autonomous-cyber-defense-agents]]는 이 그래프를 관측 해석, 행동 계획과 분석가 설명을 잇는 공유 지식으로 사용할 수 있다.

그래프가 제안한 관계는 곧 사실이 아니다. [[knowledge-graph-analysis]]의 해석 원칙처럼 자동 추출·링크 예측 결과는 원문과 외부 기준 체계로 재검증해야 하며, [[agentic-ai-contextual-anomaly-detection]]과 결합할 때도 탐지 점수에서 실제 대응으로 넘어가는 승인 경계를 분리해야 한다.

## 증거 수준과 제약

각 연구는 엔티티 추출, 지식 그래프 완성, 통제된 cyber range, 호스트 이벤트 탐지처럼 서로 다른 데이터셋과 평가 단위를 사용한다. 따라서 개별 논문이 보고한 우수한 성능이나 오탐 감소를 동일한 운영 효과로 직접 비교할 수 없으며, 새 조직의 로그·공격 분포·스키마에서 재검증해야 한다. ^[raw/papers/2026-01-cti-thinker-an-llm-driven-system-for-cti-knowledge-graph-construction-and-attack-reasoning.md] ^[raw/papers/2026-01-graph-based-anomaly-apt-attack-detection-via-threat-intelligence.md] ^[raw/papers/2026-05-structure-enhanced-pre-trained-language-model-for-requirement-cyber-threat-intelligence-knowledge-graph-completion.md]

## 열린 질문

- 시간에 따라 바뀌는 공격 기법과 오래된 관계를 어떻게 버전 관리할 것인가?
- 자동 추출 오류가 GraphRAG 답변과 에이전트 행동으로 증폭되는 것을 어떻게 차단할 것인가?
- 조직별 민감 로그를 노출하지 않으면서 공통 CTI 그래프와 결합할 수 있는가?
- 추론 경로를 분석가가 검토 가능한 증거 묶음으로 어떻게 제시할 것인가?
