---
slug: hoseo-data-analysis-cloud-platform-course
status: complete
intent: clear
review_required: false
pending-action: choose start-work or high-accuracy review for .omo/plans/hoseo-data-analysis-cloud-platform-course.md
approach: "13개 수업 주차를 단일 누적 프로젝트로 설계하고, 각 단계의 실패를 독립 fixture로 복구 가능하게 하며, 한국어 Markdown 수업계획서와 주차별 실습·평가·안전·검증 기준을 output/에 생성한다."
---

# Draft: hoseo-data-analysis-cloud-platform-course

## Components (topology ledger)
<!-- Lock the SHAPE before depth. One row per top-level component that can succeed or fail independently. -->
<!-- id | outcome (one line) | status: active|deferred | evidence path -->

| id | outcome | status | evidence path |
|---|---|---|---|
| C1 | 교과목 학습성과, 15주 구조, 평가와 개인 숙련 검증이 정렬된 수업계획서 | active | 사용자 요구; `raw/lectures/open-up/오픈소스 AI 운영 가이드_양식_풀스택과정.pptx.pdf`는 8주 참고자료일 뿐 동일 교과목 계획이 아님 |
| C2 | 최소권한·비용경보·정리 절차를 포함한 NCP Linux VM 실습 | active | NCP 공식 Server/VPC/ACG/Public IP/Cost Explorer 문서 |
| C3 | 비특권 계정과 제한된 도구권한으로 동작하는 Hermes Agent 및 gateway/cron 실습 | active | Hermes 공식 문서 commit `0f64557c06f3e878fd9ec5170b9bca7f20e2778e`; `raw/blog/hermes-agent-cron-llm-wiki-knowledge-graph.md:192-209,413-724` |
| C4 | 허가된 공개 CTI를 provenance와 중복제거를 보존하며 자동 수집·정규화 | active | CISA KEV, NVD CVE API 2.0, FIRST EPSS API, MITRE ATT&CK STIX 2.1 공식 자료 |
| C5 | raw→canonical LLM Wiki→UA knowledge graph 생성·검증 | active | `SCHEMA.md:5-18`; `concepts/llm-wiki.md:18-43`; `queries/ua-knowledge-graph-workflow.md:19-148` |
| C6 | 그래프 구조 지표와 원문 대조를 결합한 데이터 분석 및 통찰 검증 | active | `concepts/knowledge-graph-analysis.md:17-30`; `.ua/knowledge-graph.json`; `log.md:317-325` |

## Open assumptions (announced defaults)
<!-- Record any default you adopt instead of asking, so the user can veto it at the gate. -->
<!-- assumption | adopted default | rationale | reversible? -->

| assumption | adopted default | rationale | reversible? |
|---|---|---|---|
| 산출물 형식 | `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` 한국어 Markdown 1개 | 수업계획서는 canonical 지식이 아니라 외부 deliverable이며 `output/` 경계와 일치 | yes |
| 학기 구조 | 8주 중간고사, 15주 기말고사, 나머지 13주는 하나의 누적 실습 프로젝트 | 사용자 고정 조건; 선수관계와 연쇄 실패를 함께 관리 | no for exam weeks |
| 주차 순서 | 기초 진단→NCP→수동 CTI→Hermes 자동화→LLM Wiki→UA→그래프 분석·통합 | 자동화 이전에 네트워크/API/데이터 실패를 분리할 수 있어야 함 | yes |
| NCP 기준 환경 | 팀별 소형 Linux VM 1대, 전용 VPC/공개 subnet, IP 제한 SSH, custom ACG, 비용경보와 완전 종료 | 공식 NCP의 가장 짧은 유효 접근 경로이면서 비용·공격면을 제한 | yes |
| Hermes 안전선 | 비특권 사용자, headless 설치, systemd gateway, `cron_mode: deny`, 메시징·브라우저 비활성, 학생 workspace만 접근 | 공식 문서는 local backend가 격리되지 않음을 명시; 원격 실행 위험 축소 | yes |
| CTI source allowlist | CISA KEV + NVD CVE API 2.0 + FIRST EPSS + MITRE ATT&CK STIX 2.1; v19.1은 `as_of`가 있는 2026-2학기 재현용 fixture이며 실행 시 공식 최신 release를 별도 확인; 웹 스크래핑·악성코드 실행·피해자 로그 제외 | 무료·공식·기계가독·재현 가능하고 수집/정규화/조인을 모두 실습 가능 | yes |
| UA 성공 기준 | `kind==knowledge`, nonempty nodes, unique IDs, edge endpoint 누락 0, graph/meta fresh mtime; 의미 분석 실패 시 결정론적 fixture 사용 | 저장소 validation contract와 최근 성공 기록 일치 | yes |
| 그래프 분석 기준 | degree/connected components, bridge 또는 betweenness, isolates 중 최소 3종을 재현하고 통찰 1건·오탐 후보 1건을 원문으로 대조 | 단순 대시보드 관찰을 넘어 데이터분석 과목 성과를 증명 | yes |
| 검증 전략 | tests-after: 문서 생성 후 15개 주차, 고정 시험 주차, 5대 요구사항, 평가 합계, 보안·비용·QA rubric을 자동 점검; 각 실습은 happy/failure evidence 포함 | 코드를 먼저 잠글 경계가 아니라 교육 문서이며, 산출물 구조 검증이 적합 | yes |
| NCP 대체 환경 | 학교 NCP 계정을 우선 사용하고, 제공 불가 시 개인 PC 또는 실습실 PC의 Linux VM/WSL2-with-systemd로 Hermes gateway를 실습; Docker는 collector/wiki/UA에만 사용하고 Hermes service/cron은 교수자 fixture로 평가 | 실제 과금·계정 없이 핵심 역량을 평가하되 Docker의 systemd 비동등성을 숨기지 않음 | yes |

## Findings (cited - path:lines)

- 저장소에는 동일 교과목의 15주 수업계획서와 NCP 구축 자료가 없다. 재사용 가능한 중심 근거는 LLM Wiki, CTI, Hermes 자동화, UA, 그래프 분석 문서다 (`index.md:5-48`; `queries/ua-knowledge-graph-workflow.md:19-148`).
- 최신 vault 검증은 canonical 31페이지, 유효 링크 193개, 최신 UA graph 229 nodes/321 edges, dangling edge 0을 기록한다 (`log.md:310-325`).
- Hermes 공식 문서는 Linux 비특권 설치, systemd gateway, 60초 scheduler tick, fresh cron sessions, execution ledger, `cron_mode: deny`를 제공한다 (https://github.com/NousResearch/hermes-agent/tree/0f64557c06f3e878fd9ec5170b9bca7f20e2778e).
- NCP 공식 문서는 VPC/subnet 선행, image→settings→auth key→ACG 순의 server 생성, public IP 비용, custom ACG의 초기 무규칙 상태, 중지 후에도 잔존 비용 가능성을 확인한다 (https://guide.ncloud-docs.com/docs/en/server-create-vpc; https://guide.ncloud-docs.com/docs/en/server-acg-vpc; https://guide.ncloud-docs.com/docs/en/server-publicip-vpc; https://www.ncloud.com/charge/price/ko).
- NVD는 unauthenticated 5 requests/30 seconds, API key 사용 시 50/30 seconds이며 증분 수집에는 last-modified 범위와 6초 간격을 권장한다 (https://nvd.nist.gov/developers/start-here).
- 2026-07-29 직접 확인한 공개 데이터는 CISA KEV catalog version `2026.07.27`, NVD CVE API `2.0`, FIRST EPSS 최신 일자 `2026-07-28`, ATT&CK STIX release `v19.1`이다.

## Decisions (with rationale)

- 다섯 기술 요구를 독립 단원으로 병렬 배치하지 않고 CTI raw→Hermes automation→LLM Wiki→UA graph→analysis라는 데이터 계보로 연결한다.
- 각 upstream 실패가 학기 전체를 막지 않도록 instructor-owned golden fixture, 마지막 성공 산출물, 재진입 체크포인트를 모든 후속 모듈에 둔다.
- 실기 성과는 실행 로그·manifest·hash·설정 export·검증 명령 결과로 채점하고, `last_status: ok`, 단순 스크린샷, 파일 존재만으로 통과시키지 않는다.
- graph-inferred 관계와 CTI enrichment는 가설로 취급하고 원문/CVE/ATT&CK 근거를 역추적한 경우에만 분석 결론으로 인정한다.
- 수업은 주 3시간으로 고정한다. 이론 1시간은 동영상 강의로 대체하고, 대면 수업은 실습 2시간으로 운영한다.
- NCP 계정은 학교 제공을 기본으로 하되, 제공 불가 시 개인 PC 또는 실습실 PC 대체 경로를 사용한다. 대체 경로에서도 NCP 설계 이해를 증명하도록 교수자 제공 설정 fixture를 함께 사용한다.
- 성적은 출석 20%, 중간고사 40%, 기말고사 40%로 고정한다. 별도 프로젝트 점수 없이 중간·기말을 누적 실기평가로 설계한다.
- 팀 구성은 2~3인으로 고정한다. 팀별 통합 산출물은 형성평가 자료이며 별도 점수를 배정하지 않고, 중간·기말은 개인 실행 증거로 채점한다.
- 1시간 동영상 + 2시간 실습 형식은 1~7주와 9~14주의 13개 수업 주차에만 적용한다. 8주와 15주는 신규 강의 없이 3시간 개인 실기시험으로 운영한다.

## Scope IN

- 교과목 개요, 대상·선수지식, 학습성과, 15주 주차별 강의·실습·산출물·검증·과제
- 중간·기말고사의 개인별 역량 검증 설계
- NCP/Hermes/CTI/LLM Wiki/UA/그래프 분석의 안전·비용·윤리·장애복구 경계
- 누적 팀 프로젝트와 개인 기여 증거, 평가 rubric 및 성적 배분
- 외부 API/LLM/NCP 장애 시 동등한 fixture 기반 대체 실습

## Scope OUT (Must NOT have)

- 실제 NCP 계정·VM·gateway·cron의 생성 또는 외부 운영 상태 변경
- 실제 악성코드 실행, 공격 자동화, 무단 스캐닝, 피해자/기관 로그·PII 수집
- `raw/` 수정, canonical wiki 편집, `.ua/knowledge-graph.json` 수동 편집 또는 그래프 재생성
- HA, multi-AZ, load balancer, VPN/bastion, production SOC 배포, 모델 fine-tuning을 필수 성과로 확대
- 특정 실시간 가격·제품 버전을 영구 상수로 기재하거나 홍보성 주장을 사실로 고정

## Open questions

없음. 사용자 결정으로 수업 시수, NCP 환경, 평가 비중을 확정했다.

## Approval gate
status: approved
approach: 13개 수업 주차를 하나의 누적 실습으로 구성한다. 1시간 이론은 동영상으로 대체하고 2시간 대면 실습에서 NCP/대체 Linux 환경, Hermes, CTI 수집, LLM Wiki, UA, 그래프 분석을 순차 구축한다. 중간고사는 전반부 누적 실기, 기말고사는 후반부 통합 실기로 평가하며 출석 20%·중간 40%·기말 40%를 적용한다.
pending-action: choose `$omo:start-work` to execute the plan or request the optional high-accuracy dual review; plan approval never authorized syllabus implementation.
<!-- When exploration is exhausted and unknowns are answered, set status: awaiting-approval. -->
<!-- That durable record is the loop guard: on a later turn read it and resume at the gate instead of re-running exploration. -->

## Planning review ledger

- User approval: received.
- Mandatory Metis review: completed; gaps integrated for lifecycle state, ATT&CK semester-fixture currency, Docker/systemd limits, exam-week format, attendance evidence, team weighting, fixture contracts, learning outcomes, weekly schema, assessment alignment, CTI/NCP/Hermes/UA/graph contracts, accessibility, dirty-worktree protection, single-writer assembly, and document-specific final verification.
- Plan path: `.omo/plans/hoseo-data-analysis-cloud-platform-course.md`.
- Plan SHA-256: `4df30e872cfa248f4050a8a2e50047f307952255717c1adcff6eba92f2143c52`.
- Structural verification: `PLAN_STRUCTURE_OK tasks=8 finals=4 fields=complete`; Pandoc and Glow render checks passed; `git diff --check` passed.
- Review state: `review_required: false`; high-accuracy dual review remains optional until requested.
