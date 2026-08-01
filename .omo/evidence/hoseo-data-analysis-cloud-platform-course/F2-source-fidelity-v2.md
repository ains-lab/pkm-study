# F2 v2 — 문서·1차 출처·충실도 감사

## 빌드 식별

- 감사 시각: `2026-07-29T09:55:50Z`
- HEAD: `8857bdd924bc0e155b7dd64a8a471692b7b7ab85`
- 대상: `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`
- 대상 SHA-256: `d062c7427f7b8a715f357f7d6f7e307f677fcd3b455c9b709c899ef192d52bee`
- 검사기: `.omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb`
- 검사기 SHA-256: `de2cd490ff6f38289e25162ba68be640646682c80676c57854f6c5623e8f8241`
- 기준 원장: `task-1-source-ledger.md`, `as_of: 2026-07-29`

## 판정

**APPROVE**

지원되지 않거나 실질적으로 오래된 물질적 주장은 0건이다. 문서는 제품 사실, 과목 기본값, 학기 fixture, 가설을 구분하고, 변동 가능한 값에는 기준일·실행 시 재확인·고정 fixture 갱신 절차를 둔다. 그래프 또는 LLM이 추론한 관계를 사실로 승격한 곳도 없다.

## 감사 범위와 방법

전체 계획의 F2 계약, Todo 1 원장, Todo 2–6 브리프, 현재 대상 전체, `SCHEMA.md`, `concepts/llm-wiki.md`, `queries/ua-knowledge-graph-workflow.md`, `concepts/knowledge-graph-analysis.md`, `concepts/cyber-threat-intelligence-knowledge-graphs.md`, `concepts/agentic-ai-safety-governance.md`, `concepts/agentic-workspace.md`, 승인된 draft, 그리고 Hermes raw 근거의 지정 범위를 직접 읽었다. 이전 F2 결과는 현재 빌드의 승인 근거로 재사용하지 않았다.

이 v2 lane은 부모가 지정한 로컬 source ledger를 계획 권위로 삼았으므로 외부 최신값을 다시 조회하지 않았다. 대신 최종 문서의 URL을 계획·원장·브리프의 URL 집합과 정확 문자열로 대조하고, 기준일에 고정된 의미 필드를 수동으로 역추적했다. 결과는 최종 URL 18개, 로컬 권위 입력 URL 41개, 입력에 없는 최종 URL 0개였다. 최종 URL의 도메인은 `github.com`, `guide.ncloud-docs.com`, `nvd.nist.gov`, `www.cisa.gov`, `www.first.org`, `www.ncloud.com`뿐이며 모두 해당 제공자·프로젝트의 1차 출처다.

## 물질적 주장별 근거 대조

| 영역 | 대상 위치 | 권위 근거 | 판정 |
|---|---|---|---|
| 평가·시수 | 7, 44, 54–86, 97, 104행 | 승인 draft의 고정 결정; Todo 2·6의 20/40/40, 13개 60+120 수업 주차, 8·15주 개인 실기, 2~3인 무가중 형성 활동 | PASS |
| NCP | 18, 38, 91–92, 113, 142–151, 166, 174–175, 188, 196행 | Todo 1의 NCP 원장; Todo 3의 VPC/subnet/Server/access/ACG/Public IP/Cost Explorer/terminate 1차 URL과 live/fallback 한계 | PASS |
| Hermes | 18–20, 39, 49, 93, 96, 114, 142–152, 174, 185, 197행 | Todo 1의 고정 commit; Todo 4; `raw/blog/...` 413–503, 530–724, 781–816의 gate 신뢰, local delivery, complete-batch, secret·권한 경계 | PASS |
| CTI | 40, 50, 94–95, 115, 120–130, 153, 162–164, 177, 183–184, 198–201행 | Todo 1의 CISA/NVD/EPSS/ATT&CK 관찰; Todo 4의 raw/normalized/dedupe/429 계약; Todo 6의 공개 데이터·금지 활동 경계 | PASS |
| LLM Wiki | 41, 51, 98–100, 116, 132, 155, 158, 165, 168행 | `SCHEMA.md` 전부; `concepts/llm-wiki.md`; Todo 5의 raw 불변, leading frontmatter, source/tag/link/index/log, confidence/contradiction, lint-before-UA 계약 | PASS |
| UA·그래프 | 42, 52, 100–104, 117–118, 132–134, 155–156, 186, 205행 | `queries/ua-knowledge-graph-workflow.md`; Todo 5의 complete-batch/freshness/invariant와 projection 계약; 두 그래프 concept의 원문 재검증 원칙 | PASS |
| 안전·접근성·수명주기 | 22, 34, 86, 160–168, 172–188행 | Todo 6; agentic safety/workspace의 최소권한·승인·격리·provenance 원칙; 고정 기간을 발명하지 않는 학칙 위임 | PASS |

## 인용과 출처 충실도

- Hermes 인용은 정확한 40자 commit의 `tree` 또는 `blob` 경로다. 20행의 `wakeAgent`, `reason`, `changedPaths`는 Hermes 자체의 영구 제품 속성으로 표현되지 않고 과목 gate 출력으로 표현되며, 로컬 raw 운영 근거가 이를 직접 뒷받침한다.
- NCP 최종 참고표는 VPC, Server, ACG, Public IP, Cost Explorer, 가격의 공식 URL을 제공한다. subnet/access/terminate 세부 URL은 Todo 3에 남아 있고, 최종 문서의 관련 실습 주장은 그 브리프를 압축한 것이다. 다른 제공자 링크로 치환되거나 기능 부재로 오인된 인용은 없다.
- CISA는 공식 catalog와 JSON feed, NVD는 API·limits·terms, FIRST는 API·FAQ, ATT&CK은 공식 저장소 release index와 v19.1 tag를 가리킨다. 인용 목적과 URL 경로가 일치한다.
- 활성 HTML, `javascript:`/`data:`/`file:` URI, 홍보성 출처, 로그인 우회·비공식 미러는 없다.
- 상세 주차 표의 운영 계약은 마지막 `최신성·출처 기준` 표로 역추적되며, Hermes와 NVD의 가장 변동성 높은 운영 주장은 각각 20행과 130행에서 근접 인용된다.

## 변동성·fixture·가설 감사

| 항목 | 현재 문서의 보호 장치 | 판정 |
|---|---|---|
| NCP | 2026-07-29 문서 접근 실패를 가용성 관찰로만 한정하고 수업 전 공식 URL 재확인을 요구한다. 가격·금액은 고정하지 않는다. | PASS |
| Hermes | semver/latest를 영구 사실로 쓰지 않고 commit `0f64557...`을 학기 pin으로 삼으며 실제 실행의 version/time/hash를 별도 기록한다. | PASS |
| CISA KEV | `catalogVersion 2026.07.27`은 원장 기준일의 관찰이고 실행 시 version/date/hash를 다시 기록한다. count를 임계값으로 쓰지 않는다. | PASS |
| NVD | API 2.0, 5/30s, 50/30s, 6초는 기준일 관찰로 표시하고 수업 직전 재확인한다. 최대 3회 retry는 제품 사실이 아니라 더 좁은 과목 운영 경계다. | PASS |
| FIRST EPSS | `2026-07-28`을 response date 관찰로만 두고 run마다 date/hash를 기록한다. score cutoff를 만들지 않는다. | PASS |
| ATT&CK | `v19.1`을 `semester fixture`, `fixture_as_of`, 당시 `official_latest`로 구분하고, 활성 학기 무음 교체를 금지하는 4단계 refresh를 둔다. | PASS |
| UA·그래프 | node/edge 수를 영구 성취 임계값으로 쓰지 않고, 중심성·path·cluster·LLM relation을 검토 후보로만 취급한다. | PASS |

최종 문서에는 vault snapshot 수치 `229`, `321`이나 원장의 KEV 표본 count `1655`가 없다. `1e-9`는 변동 관찰값이 아니라 고정 fixture 알고리즘 결과의 재현 허용오차이고, `3회`는 수업의 bounded-retry 안전 기본값이다.

## 사실·기본값·fixture·가설 표본

- 문서화된 사실: 192–201행의 `as_of`, 고정 Hermes commit, 날짜 있는 CISA/EPSS 관찰, NVD API/limits, ATT&CK release 상태. 각 항목에 1차 URL과 재확인 문구가 있다.
- 과목 기본값: 20행의 one scheduler/local-only/manual approval/`cron_mode: deny`, 130·184행의 최대 3회 retry. 제품 보편 속성이나 영구 임계값으로 표현되지 않는다.
- 학기 fixture: 13, 151–158, 176–177, 187, 201–203행. owner/schema/hash/expected result/known limitation과 live claim 상실을 명시한다.
- 가설: 14, 42, 102, 118, 163, 168, 205행. source proof 없는 CVE-to-ATT&CK, 중심성, path, cluster, LLM 관계는 `rejected inference`로 남는다.

## 한국어·용어 일관성

차단할 수준의 모호성이나 용어 충돌은 없다. `live`, `fallback`, `fixture`, `raw`, `canonical`, `provenance`, `teardown` 같은 한영 혼합 용어는 4학년 컴퓨터공학 수업의 산출물·허용 주장과 함께 정의되거나 표에서 반복적으로 같은 의미로 사용된다. `정규화`/`normalized`, `hash`/SHA-256, `partial`/`stale`, `fresh`의 판정 극성이 표마다 바뀌지 않는다. NCP 대체 경로는 보존 역량과 상실 역량을 분리하므로 실제 provisioning 과장으로 읽히지 않는다.

## remove-ai-slops·programming 관점

두 스킬을 모두 직접 읽고 검토 관점을 적용했다. 이 F2 lane은 Markdown 출처 감사이며 제품 코드나 테스트를 변경하지 않는다. `remove-ai-slops`가 금지하는 자연어 문구 고정 테스트를 승인 근거로 사용하지 않았고, 의미 주장과 권위 source의 대응을 직접 검토했다. `programming`의 prompt/prose 테스트 금지, 구현 상수 미러링 금지, 불필요한 파싱 금지 관점에서 이 문서 자체에 적용 가능한 위반은 없다. 검사기 코드의 유지보수성·회귀 위험은 이 F2의 소유 범위 밖이며 본 판정은 검사기 자기보고에 의존하지 않는다.

## Findings by severity

- CRITICAL: 없음.
- HIGH: 없음.
- MEDIUM: 없음.
- LOW: 없음.

외부 endpoint의 현재 HTTP 상태를 이 lane에서 재관찰하지 않은 것은 계획된 범위 선택이며 잔여 결함이 아니다. 문서는 자체적으로 실행 시 재확인을 요구하고, 이 감사는 exact build의 로컬 dated ledger에 대한 충실도를 판정한다.

## 최종 결과

- `verdict`: `APPROVE`
- `codeQualityStatus`: `CLEAR` — F2에 적용 가능한 문서 품질 관점에서 차단 사항 없음
- `recommendation`: `APPROVE`
- `reportPath`: `.omo/evidence/hoseo-data-analysis-cloud-platform-course/F2-source-fidelity-v2.md`
- `blockers`: `[]`
