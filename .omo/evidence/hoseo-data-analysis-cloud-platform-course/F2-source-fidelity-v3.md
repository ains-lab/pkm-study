# F2 v3 — 문서·1차 출처 충실도 감사

## 빌드 식별

- 감사 시각: `2026-07-29T10:17:11Z`
- HEAD: `8857bdd924bc0e155b7dd64a8a471692b7b7ab85`
- 대상: `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`
- 대상 SHA-256: `75df0f2733c5bf898b78ee531cbc13700aafcc359b4f7ea15d3a0c296d2c1e51`
- 검사기: `.omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb`
- 검사기 SHA-256: `efab908d52db0049be5d7f1afaf7d78f814bbd9dc9360fe802c1577cfe2041cd`
- 기준 원장: `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-source-ledger.md`, `as_of: 2026-07-29`

해시는 감사 시작 시 `git rev-parse HEAD`와 `shasum -a 256`으로 직접 재계산했으며 요청에 주어진 세 값과 정확히 일치했다.

## 판정

**APPROVE**

현재 빌드에는 지원되지 않거나 실질적으로 오래된 물질적 주장, 타입이 본문 의미를 뒤집는 YAML 값, 그래프 가설의 사실 승격, 비공식·오귀속 출처가 없다. 변동 가능한 외부 값은 기준일 관찰, 학기 fixture 또는 과목 운영 기본값으로 한정되고 실행 전 재확인·별도 버전 갱신 절차가 있다.

## 독립 감사 범위

다음을 직접 열어 전체 또는 계획이 지정한 권위 범위를 대조했다. 이전 F2 승인과 checker의 PASS 문구는 현재 판정 근거로 재사용하지 않았다.

- `.omo/plans/hoseo-data-analysis-cloud-platform-course.md`의 F2 및 Must-have/Must-not-have 계약
- `task-1-source-ledger.md`, `task-2-course-contract.md`, `task-3-ncp-module.md`, `task-4-hermes-cti-module.md`, `task-5-wiki-ua-graph-module.md`, `task-6-governance-assessment.md`
- 현재 대상 253행 전체와 174–216행의 YAML 계약
- `SCHEMA.md`, `AGENTS.md`, `concepts/llm-wiki.md`, `queries/ua-knowledge-graph-workflow.md`, `concepts/knowledge-graph-analysis.md`, `concepts/cyber-threat-intelligence-knowledge-graphs.md`, `concepts/agentic-ai-safety-governance.md`, `concepts/agentic-workspace.md`
- `raw/blog/hermes-agent-cron-llm-wiki-knowledge-graph.md`의 gate·cron·complete-batch·보안 경계 구간
- Todo 1/3/4/6이 지정한 공식 HTTP 출처 23개

## 물질적 주장·계약의 근거 대조

| 영역 | 현재 대상 | 권위 근거 | 판정 |
|---|---|---|---|
| 교과목·평가 | 5–7, 36–82, 84–104행 | Todo 2·6의 승인된 15주·LO1–LO5·20/40/40·개인 실기·무가중 형성 활동 계약 | PASS |
| NCP | 18, 38, 91–92, 113, 140–151, 166, 222–224, 244행 | Todo 1 원장 및 Todo 3의 NCP VPC/subnet/Server/access/ACG/Public IP/Cost Explorer/terminate 공식 URL과 live/fallback 한계 | PASS |
| Hermes | 18–20, 39, 49, 93, 96, 114, 142–152, 198–204, 222, 245행 | 고정 commit, Todo 4, 로컬 raw 운영 근거의 gate 출력 신뢰·local delivery·batch barrier·비밀/권한 경계 | PASS |
| CTI | 40, 50, 94–95, 115, 120–130, 153, 162–164, 205–210, 231–233, 246–249행 | Todo 1의 CISA/NVD/EPSS/ATT&CK 관찰과 Todo 4의 raw/normalized/dedupe/rate-limit 계약 | PASS |
| LLM Wiki | 41, 51, 98–100, 116, 132, 155, 158, 165, 168행 | `SCHEMA.md`, `AGENTS.md`, Todo 5, `concepts/llm-wiki.md`의 raw 불변·frontmatter·source/tag/link/index/log·lint-before-UA 계약 | PASS |
| UA·그래프 | 42, 52, 100–104, 117–118, 132–134, 155–156, 176–182, 225, 234, 253행 | `AGENTS.md:84-98`, Todo 5, UA workflow 및 그래프 concept의 complete-batch/freshness/invariant와 원문 재검증 원칙 | PASS |
| 안전·접근성·수명주기 | 20, 22, 34, 86, 160–168, 183–197, 220–236행 | Todo 6와 agentic safety/workspace의 최소권한·승인·격리·provenance 경계 | PASS |

문서는 제품 기능 목록을 과장하지 않고 대부분을 과목 수행 계약으로 제시한다. NCP 세부 동작은 live 성공으로 선결하지 않으며, Hermes의 one-gateway/local-only/max-three-retry 등은 제품의 영구 기본값이 아니라 더 좁은 과목 기본값이다.

## YAML 타입과 본문 의미 대조

174–216행만 분리해 Ruby `YAML.safe_load`로 파싱했다. 모든 값은 기대한 scalar/sequence 타입이었고 본문의 허용·금지 극성과 일치했다.

| YAML 계약 | 실제 타입·값 | 대응 본문 | 판정 |
|---|---|---|---|
| `contract_version` | String `"1.0"` | 170–172행의 자동 검증 계약 | PASS |
| `ua.partial_stale` | Boolean `accept: false`, String `exit: nonzero` | 100, 117, 132, 234행의 partial/stale 거절·nonzero | PASS |
| `graph.inferred_relation.fact` | Boolean `false` | 14, 42, 102, 118, 163, 168, 253행의 가설/반려 규칙 | PASS |
| `accessibility.*` | 세 Boolean 모두 `true` | 86, 167, 226행의 자막·대본·대체 자료 제공 | PASS |
| `offensive.*` | 네 Boolean 모두 `false` | 163행의 malware/PoC/scanning/자동 대응 금지 | PASS |
| `untrusted_external.execution` | Boolean `false` | 168행의 data-only·절대 실행 금지 | PASS |
| `credentials.*` | 세 Boolean 모두 `false` | 20, 164, 227행의 prompt/log/history 비밀정보 금지 | PASS |
| `hermes.*` | approval/allowlist Boolean, `gateway_count: 1` Integer, `delivery: local-only` String, gate-output sequence | 20, 93, 96, 114행 | PASS |
| `nvd.*` | pagination sequence, `6`·`3` Integer, failure String, last-good Boolean | 95, 115, 130, 232행 | PASS |
| `milestones.roles` | 7개 String sequence | 110–118행의 열과 49개 안정 ID | PASS |
| `fallback.columns/tracks` | 6개씩의 String sequence | 147–156행의 여섯 트랙·여섯 계약 열 | PASS |

YAML은 본문보다 좁은 기계 판독 표면이며, 생략된 안전 세부사항을 허용으로 반전하지 않는다. `false`가 금지/비수용을, `true`가 제공/필요 조건을 일관되게 뜻한다.

## 변동성·fixture·기준일 감사

| 항목 | 2026-07-29 재관찰 | 현재 문서의 표현 | 판정 |
|---|---|---|---|
| Hermes | GitHub commit API SHA가 `0f64557c06f3e878fd9ec5170b9bca7f20e2778e`와 일치 | 움직이는 latest가 아니라 학기 pin이며 실제 version/time/hash를 별도 기록 | PASS |
| CISA KEV | `catalogVersion 2026.07.27`, `dateReleased 2026-07-27T19:00:15.8632Z`, 1,655건 | version은 기준일 관찰, count는 문서 임계값에 사용하지 않음 | PASS |
| NVD | API `/rest/json/cves/2.0`, `resultsPerPage`, `startIndex`, 무키 5/30초·키 50/30초, 요청 간 6초 권고 확인 | 기준일 관찰과 수업 직전 재확인을 명시; 최대 3회는 더 좁은 과목 안전 규칙 | PASS |
| FIRST EPSS | 최신 표본 response date `2026-07-28` | 당시 관찰일로만 기록하고 run마다 date/hash 재기록 | PASS |
| ATT&CK | latest API가 `v19.1`, published `2026-05-12T17:40:07Z` | `semester fixture`, `fixture_as_of`, 당시 `official_latest`를 분리하고 무음 교체 금지 | PASS |
| NCP | 8개 docs HEAD가 HTTP 403; 가격 원 URL GET은 HTTP 200 | 403을 2026-07-29 가용성 관찰로만 한정하고 기능 부재로 해석하지 않으며 수업 전 재확인 | PASS |
| 그래프 | 현재 vault 수치 `229/321`을 대상에서 사용하지 않음 | node/edge/중심성/path/cluster는 영구 threshold가 아니며 검토 후보 | PASS |

`1e-9`는 변동 외부값이 아니라 고정 fixture 알고리즘 비교 허용오차다. `max_retries: 3`도 NVD의 영구 제품 설정으로 귀속되지 않고 과목의 bounded-retry 정책으로 제시된다.

## 공식 URL 집합과 인용 드리프트

- Todo 1/3/4/6의 공식 URL 23개를 `curl -I -L --max-time 20`으로 재검사했다.
- 결과: Hermes 4×200, MITRE 3×200, CISA 2×200, FIRST 2×200, NCP docs 8×403, NVD 3×403, NCP 가격 HEAD는 redirect 뒤 timeout이었다. NVD는 명시적 audit User-Agent GET으로 세 페이지 모두 읽었고, NCP 가격 원 URL GET은 HTTP 200이었다.
- 대상이 직접 노출하는 고유 URL은 18개이며 모두 23개 공식 집합의 부분집합이다. 비공식 도메인, 404, provider 오귀속은 0개다.
- 최종 문서에서 압축 생략된 세부 URL은 NCP subnet/access/return, Hermes install, ATT&CK pinned LICENSE의 5개다. 앞의 네 항목은 정확한 세부 URL이 Todo 3/4 브리프에 유지되고 최종 문서가 같은 공식 provider/repository의 상위 또는 관련 1차 링크를 제공한다. 대상은 ATT&CK 라이선스 내용이나 재배포 권리를 주장하지 않으므로 LICENSE 링크 생략은 발명된 법적 주장이나 citation drift를 만들지 않는다.
- 변동성이 높은 Hermes 운영 경계와 NVD pacing/pagination은 각각 20행과 130행에 근접한 고정 commit/공식 문서 링크가 있다. 나머지 날짜·version 관찰은 238–251행의 같은 표 행에 1차 출처와 갱신 절차가 있다.

외부 문서 본문은 모두 증거 데이터로만 읽었고 명령으로 실행하지 않았다. 요청에 credential, cookie, token 또는 PII를 사용·보존하지 않았다.

## 사실·기본값·fixture·가설 표본

- **문서화된 사실:** 240–249행의 `as_of`, Hermes commit, CISA version, NVD API/rate, EPSS response date, ATT&CK latest. 각 항목은 날짜와 1차 URL을 가진다.
- **과목 기본값:** 20행의 workspace allowlist, one scheduler, local-only, approval/deny 경계와 130행의 최대 3회 retry. 제품의 보편 속성으로 쓰지 않는다.
- **학기 fixture:** 13, 147–158, 224–225, 235, 249–251행. owner/schema/hash/기준일/기대 결과와 live에서 잃는 역량을 분명히 한다.
- **가설:** 14, 42, 102, 118, 163, 168, 253행. source proof 없는 graph/LLM relation과 CVE-to-ATT&CK edge는 사실이 아니라 `rejected inference`다.

이는 `SCHEMA.md:70-75`, `AGENTS.md:59-66`, `concepts/knowledge-graph-analysis.md:29-35`, `concepts/cyber-threat-intelligence-knowledge-graphs.md:37-41`의 근거·충돌·가설 경계와 일치한다.

## 한국어·용어 일관성

차단할 모호성이나 용어 극성 충돌은 없다. `live`, `fallback`, `fixture`, `raw`, `canonical`, `provenance`, `teardown`, `partial/stale`, `fresh`는 같은 의미로 반복되고 보존/상실/허용 주장과 함께 정의된다. NCP fallback은 실제 provisioning을 했다고 읽히지 않으며 Docker는 Hermes systemd persistence를 `fixture-only`로만 둔다. 결석·접근 조정·보존/삭제 기간은 `학칙/담당자 정책 적용`에 위임하여 호서대학교 정책을 발명하지 않는다.

홍보성 최고/혁신/완벽 주장, 무료 tier·가격 혜택, 라이선스 명칭·권리, 고정 결석 감점식, 고정 보존 일수는 발견되지 않았다.

## `remove-ai-slops`·`programming` 관점

두 스킬을 직접 읽고 관점을 적용했다.

- 대상은 외부용 Markdown 수업계획서이며 이 lane은 제품 코드나 테스트를 변경하지 않는다. 자연어 문구 고정이나 checker 상수 미러링을 출처 충실도 증거로 삼지 않고, 실제 의미를 권위 원문·계약과 직접 대조했다.
- `syllabus_check.rb`의 현재 실행은 `contract=PASS`를 포함해 성공했지만 이는 빌드 식별과 구조 보조 증거일 뿐 F2 승인의 근거를 대신하지 않는다.
- Markdown prose에는 동작 seam이 없으므로 `remove-ai-slops`가 금지하는 문구 고정 회귀 테스트를 새로 만들지 않았다. 불필요한 production parser/normalizer, 삭제 전용·동어반복·구현 상수 미러링 테스트, untyped escape hatch 또는 needless abstraction은 이 F2 문서 diff에 없다.
- 따라서 두 skill 관점의 적용 가능한 위반은 없다.

## 독립 실행 증거

```text
git rev-parse HEAD
  -> 8857bdd924bc0e155b7dd64a8a471692b7b7ab85

shasum -a 256 <target> <checker>
  -> target 75df0f2733c5bf898b78ee531cbc13700aafcc359b4f7ea15d3a0c296d2c1e51
  -> checker efab908d52db0049be5d7f1afaf7d78f814bbd9dc9360fe802c1577cfe2041cd

ruby -ryaml ... < extracted-lines-175-215
  -> YAML_TYPED_VALUES_PASS

pandoc -f gfm -t html <target>
  -> exit 0

ruby <checker> <target>
  -> PASS headings=10 weeks=15 topic_ids=15 milestones=7 evidence_ids=49
     fallbacks=6 weights=20/40/40 rubrics=40/40 contract=PASS
```

## Findings by severity

- CRITICAL: 없음.
- HIGH: 없음.
- MEDIUM: 없음.
- LOW: 없음.

잔여 운영 제약은 NCP 문서 호스트가 현재 감사 환경에서 403을 반환한다는 점뿐이며, 대상은 이를 정확히 공개하고 수업 전 1차 URL 재확인을 요구한다. 이는 숨은 결함이나 승인 차단 사항이 아니다.

## 최종 결과

- `verdict`: `APPROVE`
- `codeQualityStatus`: `CLEAR`
- `recommendation`: `APPROVE`
- `reportPath`: `.omo/evidence/hoseo-data-analysis-cloud-platform-course/F2-source-fidelity-v3.md`
- `blockers`: `[]`
