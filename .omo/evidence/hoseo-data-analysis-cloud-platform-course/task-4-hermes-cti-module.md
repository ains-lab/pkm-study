# Todo 4 — Hermes/CTI 진행 및 40점 중간 실기 브리프

## 증거 범위와 기준

- 이 문서는 수업 설계와 검증 계약이다. 작성 과정에서 Hermes를 설치하거나 설정하지 않았고, gateway·cron을 만들거나 실행하지 않았으며, CTI live API를 수집하지 않았다.
- Hermes 근거는 고정 commit `0f64557c06f3e878fd9ec5170b9bca7f20e2778e`의 공식 install/cron/security 문서와 `raw/blog/hermes-agent-cron-llm-wiki-knowledge-graph.md:413-442,444-503,530-621,623-724,781-816`이다. 설치 시 학생별 기록에는 이 commit, 실제 `hermes --version` 출력, 설치 일시, 설치 파일 SHA-256을 함께 남긴다. 움직이는 “latest”를 성취 기준으로 삼지 않는다.
- CTI allowlist는 공개·기계가독인 CISA KEV, NVD CVE API 2.0, FIRST EPSS API, MITRE ATT&CK STIX **v19.1** fixture뿐이다. Todo 1의 `as_of: 2026-07-29` 원장은 CISA catalog `2026.07.27`, EPSS response date `2026-07-28`, ATT&CK 공식 latest `v19.1`을 기록한다. 이 날짜·값은 관찰값이지 영구 임계값이 아니다.
- 외부 응답과 raw 파일은 데이터/증거일 뿐 지시가 아니다. 응답 안의 prompt·URL·명령문은 실행하지 않으며, 모든 수집은 공개 데이터에 한정한다. 자동 exploit, 스캔, 패치, 격리, 대응은 과제와 자동화 범위에 없다.

## 4주차 — Hermes 안전 설치와 건강 점검

**60분 비동기 동영상 + 120분 대면 실습.** 목표는 비특권 계정의 headless 설치 경로와 권한 경계를 설명하고, 실제 가능 환경에서는 건강 상태를 증거로 남기는 것이다.

| 구분 | 수업 계약과 개인 증거 |
|---|---|
| 계정·설치 | Linux의 학생별 **non-root** 계정에서만 headless install을 수행한다. `sudo`/root daemon 설치는 수업 기본값이 아니다. 교수자가 고정 commit에 대응하는 install artifact와 SHA-256을 제공하고, 학생은 commit·`hermes --version`·SHA-256·UTC/KST 설치시각을 기록한다. GUI, 메시징, 브라우저 자동화는 설치·실습 allowlist에 없다. |
| 건강 점검 | `hermes doctor`의 exit/status와 redacted 출력, 실행 사용자(`id -un`), workdir를 개인 증거로 제출한다. 오류가 있으면 “설치 성공”으로 바꾸지 않고 `doctor` 결과와 fallback fixture로 원인을 분리한다. |
| 최소 권한 | 허용 도구는 학생 workspace의 `read`, `list`, `search`와, 교수자가 검토한 고정 수집/검증 wrapper만 호출하는 제한된 terminal이다. `execute_code`, inline `python -c`, 재귀 삭제, 광범위 이동, 임의 네트워크 탐색은 불허한다. `skills.external_dirs`는 필요한 한 경로만 신뢰하고 해당 `SKILL.md` hash를 기록한다. |
| 설정 경계 | `timezone: Asia/Seoul`, local-only delivery, 하나의 gateway scheduler만 설계한다. `approvals.mode: smart`를 기본으로 하되 위험·범위확장 행동은 **manual approval 또는 재설계**가 필요하다. `cron_mode: deny`로 scheduler가 승인을 우회하지 못하게 한다. messaging/browser는 별도 승인 전까지 disallowed다. |
| 비밀정보 | API key·토큰·cookie·채팅 ID·내부 URL은 config, prompt, stdout, log, cron output, history에 넣지 않는다. 키가 필요한 선택 경로는 교수자 비밀관리 절차에서 주입하고, 학생 증거에는 `<REDACTED>`만 남긴다. |

**대체 경로:** systemd가 가능한 NCP/실습실 Linux VM/WSL2-with-systemd에서만 live gateway 지속성을 관찰한다. Docker는 collector·fixture 검증에는 쓸 수 있지만 Hermes gateway persistence를 증명하지 못하므로 `fixture-only`로 평가한다. 시스템 제공이 불가하면 instructor-owned `hermes-install-health-fixture.json`의 `fixture_id`, `owner`, `schema_version`, `created_at`, `source_commit`, `sha256`, `doctor_result`, `expected_results`를 읽고 동일한 권한·health 판단을 설명한다.

## 5주차 — 공개 CTI 원본과 수동 provenance

**60분 비동기 동영상 + 120분 대면 실습.** CTI를 위험 점수로 합산하지 않고, 원본 응답·버전·시각을 보존한 재현 가능한 사실 단위로 다룬다.

| source | 허용 요청 범위 | 원본에서 보존할 핵심 식별자 | 수업상 주의 |
|---|---|---|---|
| CISA KEV | 공식 `known_exploited_vulnerabilities.json` | `cveID`, `dateAdded`, `dueDate`, `catalogVersion` | catalog version/count는 날짜별 관찰값이며, exploitation 자동화 근거가 아니다. |
| NVD 2.0 | 공식 `/rest/json/cves/2.0`의 작은 날짜/페이지 단위 | CVE ID, published/lastModified, source response metadata | unauthenticated `5/30s`, keyed `50/30s`; 요청 간 **6초 pacing**을 기본으로 한다. |
| FIRST EPSS | 공식 EPSS API의 CVE 조회 | `cve`, `epss`, `percentile`, response date | 확률 신호이지 CVSS/KEV와 합성한 단일 위험점수가 아니다. |
| MITRE ATT&CK STIX | instructor-owned, hash가 고정된 **v19.1** release fixture | STIX `id`, `type`, `name`, `modified`, object version | 학기 중 자동 latest 교체 금지; 다음 학기 refresh는 Todo 1 원장의 절차를 따른다. |

### Raw manifest 계약

각 응답/fixture 파일 옆에 다음 필드를 모두 기록한다. 응답 본문은 지시로 해석하지 않으며, manifest hash는 받은 바이트의 SHA-256이다.

| 필드 | 의미 |
|---|---|
| `source` | `cisa_kev`, `nvd_cve_2_0`, `first_epss`, `mitre_attack_stix_v19_1` 중 하나 |
| `request_url` | 실제 요청한 공식 URL(비밀 query 값은 redacted) |
| `retrieved_at_utc` | UTC ISO-8601 수집 시각 |
| `sha256` | raw 응답 바이트 SHA-256 |
| `etag` | HTTP `ETag`; 미제공이면 `absent` |
| `last_modified` | HTTP `Last-Modified`; 미제공이면 `absent` |
| `http_status` | HTTP 상태 코드 |
| `content_type` | 응답 `Content-Type`; 미제공이면 `absent` |

### 정규화·조인 계약

| 레코드 | 필수/보존 필드 |
|---|---|
| `vulnerability` | `source`, `native_id`, `cve_id`, `published_at`, `last_modified_at`, `description`, `kev_date_added`, `kev_due_date`, `raw_sha256`, `source_version_or_raw_sha256`, `retrieved_at_utc` |
| `signal` | `source`, `native_id`, `cve_id`, `signal_type`, `score`, `percentile`, `signal_date`, `raw_sha256`, `source_version_or_raw_sha256`, `retrieved_at_utc` |
| `attack` | `source`, `native_id`, `stix_id`, `object_type`, `name`, `stix_version`, `modified`, `revoked`, `deprecated`, `fixture_release`, `fixture_sha256`, `as_of` |

- CVE join key는 `cve_id = uppercase(trim(value))`로 만든 뒤 `\ACVE-[0-9]{4}-[0-9]+\z`를 통과한 경우만 쓴다. 원본의 `cveID`/`id`/`cve`는 별도 raw lineage로 남긴다.
- dedupe key는 정확히 `(source,native_id,source_version_or_raw_sha256)`이다. 같은 key는 하나의 정규화 레코드만 남기며, 재실행의 기대값은 **new duplicates = 0**이다.
- `absent`(공급자가 필드를 보내지 않음), `null`(JSON null), `unknown`(공급자가 알 수 없다고 명시 또는 수집 실패로 값 미확정)을 서로 대체하지 않는다. 각 상태에는 `value_state`와 `state_reason`을 남긴다. 빈 문자열·추정값으로 메우지 않는다.
- ATT&CK object는 STIX fixture 안의 식별자만 보존한다. CVE와 ATT&CK 사이에 자동 사실 edge를 만들지 않으며, 향후 분석에서 제안된 연결은 원문/공식 기준으로 재검증할 가설이다.

**개인 산출물:** 허용된 한 개의 공개 response/fixture에 대한 raw manifest, 정상화 표본, `CVE-YYYY-NNNN` 대소문자 정규화 전·후 비교, 그리고 source/fixture/version/hash를 포함한 provenance 표. live API가 막히면 instructor-owned golden response와 manifest/hash로 같은 검증을 수행하되 live 수집 성공이라고 주장하지 않는다.

## 6주차 — idempotent CTI collector와 데이터 품질

**60분 비동기 동영상 + 120분 대면 실습.** 고정 wrapper 또는 교수자 fixture를 사용해 request→raw manifest→normalize→dedupe→validate 순서를 재현한다. raw는 덮어쓰지 않고 run ID별로 보존하며, publish는 validation 뒤에만 한다.

### 요청·재시도·마지막 정상 결과

1. NVD non-keyed 요청은 rolling window `5/30s`, keyed 요청은 `50/30s` 이하로 제한한다. API key가 있어도 key 값은 config/log/history에 기록하지 않는다.
2. 페이지/날짜 batch 사이에는 최소 6초를 둔다. timeout·network 오류와 HTTP `429`에는 `Retry-After`가 있으면 이를 우선하고, 없으면 증가 backoff로 **최대 3회**만 재시도한다. retry 횟수·상태만 redacted log에 남긴다.
3. 429가 재시도 상한을 넘으면 `deferred_rate_limited`로 quarantine하고 publish/성공 판정을 하지 않는다. 다음 승인된 실행에서 재개하며 기존 결과는 보존한다.
4. schema/semantic validation은 parse 성공만으로 통과시키지 않는다. 필수 `source`, `native_id`, `source_version_or_raw_sha256` 또는 유효 uppercase CVE join이 없으면 새 publish를 막고 `last_good_run_id`와 `last_good_sha256`을 그대로 보존한다.
5. 동일 raw/정규화 입력을 다시 실행할 때 manifest/hash와 dedupe key 검증 후 duplicate growth가 0인지 확인한다. mismatch는 새 원본으로 숨기지 말고 quarantine과 원인 기록으로 끝낸다.

### 부정 fixture와 기대 관찰

| fixture | 자극 | 기대 상태 | publish/증가 | redacted 관찰 |
|---|---|---|---|---|
| `changed-input` | allowlist source의 새 raw fixture, `wakeAgent=true` | **triggered run**; manifest→normalize→dedupe→semantic validation 모두 통과 | 새로 유효한 key만 증가 | `run=triggered`, source, hash prefix, no secret |
| `no-change` | 모든 watch input이 last-good보다 오래됨, `wakeAgent=false` | **skipped run**; agent/collector 미호출 | 0 | `agent skipped`, `wakeAgent=false` |
| `semantic-failure` | JSON은 parse되나 필수 source/version 또는 CVE 형식이 위반됨 | quarantine, semantic failure; last-good 보존 | 0; `last_good_run_id`/`last_good_sha256` 불변 | `semantic_validation_failed`, `<REDACTED>` |
| `malformed-input` | 손상 JSON 또는 잘린 STIX bundle | quarantine, parse failure (성공 아님) | 0 | fixture ID, parser class, hash prefix만 기록 |
| `duplicate-input` | 같은 `(source,native_id,source_version_or_raw_sha256)`가 반복됨 | dedupe 완료 (성공 레코드 재발행 아님) | **duplicate growth 0** | duplicate key hash prefix, count |
| `nvd-429` | HTTP 429와 선택적 `Retry-After` fixture | bounded retry 후 deferred/quarantine; 성공 아님 | 0 | `429`, retry `1..3`, `deferred_rate_limited` |

`changed-input`, `no-change`, `semantic-failure`는 Hermes 관찰 시나리오이며 실제 수업에서는 **한 gateway scheduler만** 사용한다. triggered run 1회, skipped run 1회, last-good을 보존하는 semantic failure 1회를 각각 확인한다. `last_status: ok`나 파일 존재만으로 성공을 선언하지 않고, manifest·validation·published run ID와 redacted log를 함께 본다.

## 7주차 — Hermes scheduling 관찰·실패 복구와 중간 리허설

**60분 비동기 동영상 + 120분 대면 실습.** 이 주차는 cron을 무제한 자동화하는 법이 아니라, gate 결과를 신뢰하고 실패를 성공처럼 보이지 않게 하는 관찰 연습이다.

| 관찰 단계 | 통과 증거 | 실패 시 복구 경계 |
|---|---|---|
| 단일 scheduler | `Asia/Seoul`, 하나의 gateway scheduler, local-only delivery, pinned Hermes/version 기록 | 두 번째 scheduler를 만들지 않는다. 환경이 불가하면 scheduler fixture로 전환한다. |
| changed fixture | `wakeAgent=true`, changed path, triggered run 1회, raw manifest·normalized validation·redacted output | 실패하면 새 publish를 금지하고 quarantine 원인을 기록한다. |
| no-change fixture | `wakeAgent=false`, `agent skipped`, collector/LLM 호출 0 | 변경 여부를 agent가 재계산하지 않는다. gate 출력과 watch state를 재검토한다. |
| semantic failure | parse와 별개인 semantic error, last-good ID/hash 보존, 새 결과 0 | 이전 last-good을 재사용해 “이번 실행 성공”으로 표시하지 않는다. failure status와 재개 조건을 남긴다. |
| approval boundary | `approvals.mode: smart`와 manual approval 필요 조건, `cron_mode: deny` 확인 | 승인 필요 작업은 scheduler로 실행하지 않고 교수자 승인 또는 안전한 fixture로 재설계한다. |

**중간 리허설의 개인 증거 묶음:** non-root/headless/version/`hermes doctor` 증거, allowlist 및 secret-redaction 점검표, 세 Hermes fixture 결과, raw manifest 1개, normalized records 3종 표본, uppercase CVE join·dedupe rerun report, malformed/duplicate/429 결과, 그리고 안전 설명 녹화 또는 구두 설명 기록. 2~3인 팀은 fixture 해석과 통합 점검을 함께 할 수 있으나, 개인 파일·명령 출력·설명은 공유 대체가 불가하다.

## 8주차 — 중간고사: 개인 3시간 실기만 운영

신규 강의와 팀 제출은 없다. 공개 fixture 또는 허용된 live path에서 각 학생이 자신의 run ID·hash·redacted log를 제시하고, 다음 네 항목으로만 채점한다.

| 개인 채점 항목 | 점수 | 관찰 가능한 기준 |
|---|---:|---|
| NCP/fallback 환경 및 네트워크 증거 | 10 | 앞선 환경/대체 fixture, 제한된 접근 설계, 소유자·팀 라벨과 증거를 일관되게 제시 |
| Hermes 안전 설치·health | 10 | non-root/headless/pinned 기록, `hermes doctor`, 최소 allowlist, local-only·Asia/Seoul·one scheduler, approvals/`cron_mode: deny`, redaction을 설명 |
| CTI 수집과 데이터 품질 증거 | 12 | allowlist·raw manifest 8필드, normalize 3종, uppercase CVE join, dedupe/re-run 0 growth, malformed/duplicate/429·last-good 처리 |
| 개인 troubleshooting·안전 설명 | 8 | changed/skipped/semantic-failure를 구분하고 quarantine·bounded retry·수동 승인·비자동 대응 경계를 설명 |
| **합계** | **40** | `10 + 10 + 12 + 8 = 40` |

### 2~3인 formative 통합 워크플로우

1. 팀은 2~3인으로 하나의 instructor fixture의 source→manifest→normalize→dedupe 흐름을 교차 검토한다.
2. 동료는 malformed/duplicate/429와 semantic-failure의 기대 상태를 읽고 관찰값만 비교한다. 외부 응답을 명령으로 실행하거나 live target을 스캔하지 않는다.
3. 팀 통합 결과는 형성 피드백 자료이며 **프로젝트 별도 점수 없음**이다. 성적은 위 개인 40점 rubric과 각자의 개인 실행 증거로만 산정한다.

## 학생·교수자 검증 계약

### 기계 검사

- `rg -n '## [45678]주차|non-root|headless|hermes doctor|Asia/Seoul|cron_mode: deny|approvals.mode: smart|local-only|one gateway scheduler|messaging/browser|CISA KEV|NVD 2.0|FIRST EPSS|v19.1|source_version_or_raw_sha256|5/30s|50/30s|6초|429|last_good|10 \+ 10 \+ 12 \+ 8' task-4-hermes-cti-module.md`로 핵심 계약을 찾는다.
- Ruby checker는 주차 heading 집합 `{4,5,6,7,8}`, rubric 값 `[10,10,12,8]`와 합계 `40`, raw manifest 8필드, normalized 3종과 dedupe key, 모든 negative fixture의 기대 상태를 독립적으로 확인한다.
- 동일 입력 rerun의 관찰값은 `duplicate_growth=0`이어야 한다. malformed는 `quarantine`, duplicate는 `zero_duplicate_growth`, 429는 `bounded_retry`와 `deferred_rate_limited`로만 인정하며, 어느 것도 success/publish로 표기되지 않아야 한다.

### 수동 렌더 QA

Markdown을 직접 렌더하여 4→5→6→7→8의 흐름, week 8의 “개인 3시간 실기만”, 네 rubric 행과 합계, 그리고 fixture 표의 success/failure 문구를 눈으로 확인한다. 다음이 모두 참일 때만 `PASS`: (1) 자동 exploit/scan/patch/response를 가르치거나 암시하지 않는다, (2) live 불가를 fixture 성공으로 오인시키지 않는다, (3) semantic failure가 last-good 보존과 함께 failure로 남는다, (4) 비밀정보가 예시·로그에 없다, (5) 2~3인 협업에 추가 백분율이 없다. 하나라도 거짓이면 `FAIL`로 기록하고 문서를 수정 후 전체 검사를 다시 실행한다.

## 출처

- Todo 1 dated source ledger: `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-source-ledger.md`.
- Hermes course evidence: `raw/blog/hermes-agent-cron-llm-wiki-knowledge-graph.md:413-442,444-503,530-621,623-724,781-816`.
- CTI knowledge/provenance boundary: `concepts/cyber-threat-intelligence-knowledge-graphs.md:18-41`.
- Official pinned sources: [Hermes install](https://github.com/NousResearch/hermes-agent/blob/0f64557c06f3e878fd9ec5170b9bca7f20e2778e/website/docs/getting-started/installation.md#L113-L144), [Hermes cron](https://github.com/NousResearch/hermes-agent/blob/0f64557c06f3e878fd9ec5170b9bca7f20e2778e/website/docs/user-guide/features/cron.md), [Hermes security](https://github.com/NousResearch/hermes-agent/blob/0f64557c06f3e878fd9ec5170b9bca7f20e2778e/website/docs/user-guide/security.md#L30-L58), [CISA KEV JSON](https://www.cisa.gov/sites/default/files/feeds/known_exploited_vulnerabilities.json), [NVD API](https://nvd.nist.gov/developers/vulnerabilities), [NVD limits](https://nvd.nist.gov/developers/start-here), [FIRST EPSS](https://www.first.org/epss/api), [ATT&CK v19.1](https://github.com/mitre-attack/attack-stix-data/releases/tag/v19.1).
