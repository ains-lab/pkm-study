# 데이터 분석과 클라우드 플랫폼 15주 수업계획서

## 교과목 개요

이 교과목은 호서대학교 컴퓨터공학과 4학년을 대상으로 한다. 학생은 공개 CTI 응답에서 시작해 원본 보존, 정규화, 안전한 Hermes Agent 자동화, LLM Wiki 승격, Understand Anything(UA) 지식그래프 생성·검증, 재현 가능한 그래프 분석과 원문 대조 결론까지 하나의 데이터 계보를 완성한다.

수업은 기능 나열이 아니라 `CTI response → raw hash → normalized CVE/source ID → canonical source link → UA node/edge ID → metric result → checked conclusion`의 전 구간을 개인 실행 증거로 설명하는 데 초점을 둔다. 2~3인 통합 프로젝트는 동료 검토를 위한 형성 활동이며 **프로젝트 별도 점수 없음**이다. 성적은 출석 20%, 중간고사 40%, 기말고사 40%만으로 산정하고 두 시험 모두 개인 실행 증거를 요구한다.

문서의 진술 유형은 다음처럼 구분한다.

- **문서화된 사실:** 기준일에 확인한 공식 문서·API 또는 고정 commit이 뒷받침하는 내용이다.
- **과목 기본값:** 안전하고 재현 가능한 운영을 위해 담당자가 정한 수업 규칙이며 제품의 영구 속성으로 주장하지 않는다.
- **학기 fixture:** owner·schema·hash·기준일·기대 결과를 고정한 교육 자료다. live 수행과 동일하다고 주장하지 않는다.
- **가설:** 그래프·LLM이 제안했지만 원문 대조가 끝나지 않은 관계다. 평가에서는 사실과 분리한다.

## 운영 전제 및 선수지식

학교가 제공한 NCP sub-account를 우선 사용하되, 권한·비용·서비스 장애가 있으면 승인된 Linux VM, WSL2-with-systemd 또는 교수자 fixture로 전환한다. NCP/실습실 Linux VM/WSL2-with-systemd는 Hermes의 live systemd 경로가 될 수 있다. Docker는 collector·Wiki·UA 작업의 제한적 보조 환경일 뿐, systemd가 없는 Docker에서 Hermes gateway persistence는 `fixture-only`다.

Hermes의 과목 기본값은 학생별 **non-root** 계정과 학생 workspace 한 경로에 한정된 `read`·`list`·`search` 및 교수자 검토 wrapper tool allowlist다. 하나의 gateway scheduler와 local-only delivery만 사용하고, `approvals.mode: smart`를 기본으로 하되 위험·범위확장 동작은 manual approval 또는 재설계를 요구하며 `cron_mode: deny`를 유지한다. messaging/browser는 각각 별도의 명시적 승인이 있기 전까지 사용하지 않는다. gate가 제공한 `wakeAgent`, `reason`, `changedPaths`를 신뢰하고 agent가 변경 여부를 재계산하지 않는다. API key·token·cookie·내부 URL은 config·prompt·stdout·log·history에 넣지 않는다. 근거: [Hermes cron](https://github.com/NousResearch/hermes-agent/blob/0f64557c06f3e878fd9ec5170b9bca7f20e2778e/website/docs/user-guide/features/cron.md), [Hermes security](https://github.com/NousResearch/hermes-agent/blob/0f64557c06f3e878fd9ec5170b9bca7f20e2778e/website/docs/user-guide/security.md#L30-L58).

1주차 개시 진단은 `opening-diagnostic.md`, `diagnostic-terminal.txt`, `diagnostic-git.txt`, `diagnostic-api.json`, `diagnostic-graph.txt`를 제출한다. 계정·비밀정보·실제 공인 IP는 요구하지 않는다.

| 선수지식 | 진단 관찰값 | fixture 기반 보충 경로 |
|---|---|---|
| Linux shell | 경로·권한·로그 읽기 명령과 오류를 terminal 전사에 기록 | Linux VM/WSL2 shell fixture에서 같은 형식으로 재수행 |
| Git | status, diff, staged/untracked를 구분 | 오프라인 history fixture로 판별 근거 제출 |
| Python | JSON 필수 키 검사와 예외를 stderr로 분리 | 고정 입력으로 타입·예외·UTF-8 처리 재수행 |
| HTTP/API | URL·상태·헤더·본문을 구분하고 429를 실패로 기록 | 저장된 CISA/NVD/EPSS 응답으로 bounded retry 판단 |
| JSON/YAML | JSON 배열과 leading YAML frontmatter를 독립 파싱 | malformed fixture의 오류 위치·schema·격리 결정 기록 |
| networking/IAM | private/public, 최소권한, 제한된 TCP 22 규칙 판별 | NCP 설정 fixture에서 ACG·비용·정리 표 완성 |
| graph basics | 방향 그래프와 단순 무방향 projection 및 degree/component/isolate 구분 | self-loop 제거·parallel edge 병합 fixture 재계산 |

진단 미달은 해당 보충 산출물이 기계 판독 가능한 결과와 함께 통과할 때까지 보완한다. 접근성 조정과 공결·결석 처리는 `학칙/담당자 정책 적용`으로 결정하며 임의 감점식을 만들지 않는다.

## 학습성과 및 평가 정렬

- **LO1:** live NCP에서는 VPC/subnet·ACG·제한 SSH·public IP·비용경보·완전 정리를 **구성하고 검증하여 설명한다**. 승인 fallback에서는 Linux 서비스 작업과 교수자 NCP fixture의 동일 설계·teardown 증거를 **검증하여 설명하되 실제 provisioning을 주장하지 않는다**.
- **LO2:** Hermes를 non-root·최소도구·로컬 전달 경계에서 **점검하고**, changed/no-change/semantic-failure를 **구분해 last-good 보존과 안전한 복구를 설명한다**.
- **LO3:** 공개 CTI의 raw provenance를 **기록·정규화하고**, uppercase CVE join·dedupe·상태 구분·rate-limit 실패를 **재현 검증한다**.
- **LO4:** raw를 보존한 canonical Wiki를 **lint하고**, UA graph/meta를 live로 생성하거나 pinned fixture로 **구조 검증하며 두 경로의 주장 한계를 구분한다**.
- **LO5:** 원시 방향 그래프와 단순 무방향 projection을 **재현 계산하고**, 지표 기반 후보를 원문과 대조해 **검증된 통찰 또는 반려 가설로 판정한다**.

최소 숙련은 각 시험 안에서 해당 LO의 모든 필수 실습 증거 가족을 개인적으로 완성하는 것이다. 출석이나 팀 결과는 누락된 기술 성과를 대체하지 않는다.

| LO | 필수 기술과 주차 | 평가 증거 |
|---|---|---|
| LO1 | NCP/Linux, VPC/subnet, ACG, SSH, 비용·teardown; 2·3·8주 | 중간: 환경 및 네트워크 증거 10점 |
| LO2 | Hermes pinned 설치, doctor, 최소 allowlist, scheduler fixture; 4·7·8주 | 중간: 안전 설치·health 10점, troubleshooting·안전 8점 |
| LO3 | CISA KEV, NVD 2.0, FIRST EPSS, ATT&CK v19.1, normalize/dedupe; 1·5·6·7·8·9·14주 | 중간: CTI 수집·품질 12점 |
| LO4 | raw manifest, canonical lint, `understand-knowledge`, UA 구조; 1·9·10·11·14·15주 | 기말: Wiki 10점, UA 10점 |
| LO5 | directed/raw, simple undirected projection, 세 지표군, 원문 대조; 12·13·14·15주 | 기말: 지표 10점, 해석·복구 10점 |

## 평가 방법

| 평가 범주 | 비중 | 학습성과 및 증거 |
|---|---:|---|
| 출석 | 20% | LO1–LO5의 준비 과정: LMS 동영상 완료 기록과 대면 실습 참여·산출물을 함께 확인한다. 공결·결석은 학칙/담당자 정책 적용이다. |
| 중간고사 | 40% | 8주 3시간 개인 실기, LO1·LO2·LO3의 명령 전사·manifest/hash·redacted 설정·실패 판정 |
| 기말고사 | 40% | 15주 3시간 개인 실기, LO4·LO5 및 전 구간 lineage의 개인 생성·검증·해석·복구 증거 |

2~3인 형성 통합 활동은 별도 가중치가 없고 팀 화면·공유 파일이 개인 수행을 대신하지 않는다.

### 중간고사 개인 실기 rubric

| 채점 항목 | 관련 LO | 점수 |
|---|---|---:|
| NCP/fallback 환경 및 네트워크 증거 | LO1 | 10 |
| Hermes 안전 설치·health | LO2 | 10 |
| CTI 수집 및 데이터 품질 증거 | LO3 | 12 |
| 개인 troubleshooting·안전 설명 | LO1·LO2·LO3 | 8 |
| **합계** |  | **40** |

### 기말고사 개인 실기 rubric

| 채점 항목 | 관련 LO | 점수 |
|---|---|---:|
| LLM Wiki schema·provenance·lint | LO4 | 10 |
| UA graph 생성·검증 | LO4 | 10 |
| 그래프 지표 재현성 | LO5 | 10 |
| 원문 대조 해석 및 복구 | LO4·LO5 | 10 |
| **합계** |  | **40** |

## 15주 수업 일정

모든 비동기 동영상에는 자막·대본·접근 가능한 대체 자료가 함께 제공된다.

| 주차 | 형식·주제 | 실습·시험 | 선행 | LO | 산출물 | Happy | Fail | 대체 | 안전·비용 | 평가 |
|---:|---|---|---|---|---|---|---|---|---|---|
| 1 | `topic_id: W01-orientation-diagnostic-provenance` — 60분 비동기 동영상 + 120분 대면 실습: 오리엔테이션·진단·provenance | 공개 fixture의 지시/데이터 경계와 manifest/hash 판독 | 없음 | LO3·LO4: 증거 계보를 식별 | 진단 5종과 provenance 표 | fixture ID/hash 및 parser PASS | malformed·주입성 문구를 실행하지 않고 격리 | 오프라인 golden fixture | credential·PII 미사용 | 출석, LO3·LO4 진단 |
| 2 | `topic_id: W02-cloud-ncp-networking` — 60분 비동기 동영상 + 120분 대면 실습: cloud·NCP networking | VPC/public subnet·ACG·public IP·budget 설계 검토 | networking/IAM 진단 | LO1: 최소권한 네트워크를 설계·검증 | redacted 설정 export 또는 `ncp-lab-fixture.json` 결과와 ACG 표 | TCP 22가 현재 IP/campus CIDR로 제한되고 budget 증거 PASS | `0.0.0.0/0` SSH는 `FAIL_UNRESTRICTED_SSH` | Linux VM/WSL2와 NCP fixture | 실제 IP·키 redaction, 생성 전 비용경보 | 출석, 중간 LO1 10점 준비 |
| 3 | `topic_id: W03-ncp-vm-approved-fallback` — 60분 비동기 동영상 + 120분 대면 실습: NCP VM 또는 승인 fallback | SSH/terminal·임시 service curl·완전 teardown | 2주 승인 설계 | LO1: live 구성 또는 fixture 설계 검증을 정직하게 설명 | terminal/curl, owner label, rule·budget, teardown 묶음 | live는 접속·서비스·terminate·public-IP release·잔여 확인 PASS | stop-only·남은 IP·미제한 rule은 실패 | 개인/실습 Linux VM 또는 WSL2와 fixture; provisioning 주장 금지 | 임시 포트 제거, 잔존 비용 후속 확인 | 출석, 중간 LO1 10점 준비 |
| 4 | `topic_id: W04-hermes-safe-install-operation` — 60분 비동기 동영상 + 120분 대면 실습: Hermes 설치·안전 운영 | non-root headless 설치 또는 health fixture 판독 | Linux 보충 완료 | LO2: 안전 경계와 health를 점검 | commit/version/hash, `hermes doctor`, redacted config | non-root·학생 workspace allowlist·local-only·Asia/Seoul 확인 | doctor 오류는 성공으로 바꾸지 않고 원인·fallback 기록 | systemd Linux live 또는 install-health fixture | approvals·`cron_mode: deny`; messaging/browser는 별도 승인 | 출석, 중간 LO2 10점 준비 |
| 5 | `topic_id: W05-cti-source-manual-provenance` — 60분 비동기 동영상 + 120분 대면 실습: CTI source·수동 provenance | CISA/NVD/EPSS/ATT&CK 원본 manifest와 표본 정규화 | HTTP·JSON 진단 | LO3: raw 사실 단위를 기록·구분 | 8필드 manifest, 3종 normalized 표본 | source/version/hash와 uppercase CVE join PASS | absent/null/unknown 혼동·잘못된 CVE는 격리 | instructor-owned response fixture | 공개 데이터만, API key·원문 명령 실행 금지 | 출석, 중간 LO3 12점 준비 |
| 6 | `topic_id: W06-cti-normalize-idempotent-collector` — 60분 비동기 동영상 + 120분 대면 실습: normalized/idempotent collector | request→raw→normalize→dedupe→validate 재현 | 5주 manifest | LO3: 중복·rate-limit·semantic 실패를 검증 | run manifest, dedupe report, malformed/duplicate/429 결과 | 동일 key 재실행의 new duplicates = 0 | malformed 격리, 429 bounded retry 후 defer, last-good 보존 | 고정 wrapper와 golden fixtures | NVD pagination·batch·pacing 준수, 재시도 폭주 금지 | 출석, 중간 LO3 12점 준비 |
| 7 | `topic_id: W07-hermes-scheduling-recovery-rehearsal` — 60분 비동기 동영상 + 120분 대면 실습: Hermes scheduling·관찰·복구·중간 리허설 | changed/no-change/semantic-failure 및 개인 증거 묶음 점검 | 4–6주 산출물 | LO2·LO3: 실행·skip·failure를 구분·복구 | triggered 1, skipped 1, semantic failure 1의 redacted receipt | gate의 `wakeAgent`·`reason`·`changedPaths`와 published run ID·last-good hash가 일치 | 변경 여부를 재계산하지 않고 partial/semantic 실패를 성공으로 표시하지 않음 | scheduler·429 fixture | one gateway, local-only, secret redaction | 출석, 중간 LO2·LO3 리허설 |
| 8 | `topic_id: W08-midterm-individual-practical` — 3시간 개인 실기시험, 신규 강의 없음 | NCP/fallback·Hermes·CTI를 개인 run ID와 hash로 수행 | 1–7주 필수 증거 가족 | LO1·LO2·LO3: 구성·수집·복구를 독립 수행 | 명령 전사·manifest/hash·redacted log·안전 설명 | 네 rubric의 기계 결과와 개인 설명 일치 | 실패 fixture를 격리하고 last-good/재진입 판단 | 승인된 instructor fixtures | 비밀 미제출, live 자원 완전 teardown | 중간고사 40% |
| 9 | `topic_id: W09-llm-wiki-architecture` — 60분 비동기 동영상 + 120분 대면 실습: LLM Wiki architecture | Raw–Wiki–Schema 분리와 immutable raw manifest | 중간 후 lineage | LO3·LO4: 불변 원본과 승격 경계를 설명 | raw 8필드 manifest와 값 상태표 | raw hash·수집시각·source가 연결 | hash drift·로그인 요구·주입성 원문은 격리 | pinned raw fixture | 외부 문구는 데이터, 공개 원본만 | 출석, 기말 LO4 10점 준비 |
| 10 | `topic_id: W10-cti-canonical-wiki-lint` — 60분 비동기 동영상 + 120분 대면 실습: CTI-to-canonical Wiki·lint | leading frontmatter·source·tag·link·index/log·신뢰도 검사 | 9주 raw | LO4: canonical 후보를 lint | 변경 목록과 전 항목 lint report | exact raw path, 등록 tag, 2 links, index/log, provenance PASS | 원본은 고치지 않고 canonical 초안 수정 후 전체 lint | 교수자 canonical fixture | contradiction 보존, 오류 시 UA 차단 | 출석, 기말 Wiki 10점 준비 |
| 11 | `topic_id: W11-ua-generation-structural-validation` — 60분 비동기 동영상 + 120분 대면 실습: UA 생성·구조 검증 | `understand-knowledge` complete-batch/freshness 또는 pinned graph 검사 | Wiki lint PASS | LO4: graph/meta invariant를 생성·검증 | run receipt 또는 fixture manifest와 새 validation JSON | live complete batches·fresh mtimes 또는 fallback hash match, 구조 PASS | partial/stale UA와 `PARTIAL_BATCH`·duplicate ID·`DANGLING_EDGE`는 거절하고 validator nonzero | pinned graph+fresh report, fresh enrichment claim false | 상태 문구·파일 존재만으로 성공 금지 | 출석, 기말 UA 10점 준비 |
| 12 | `topic_id: W12-graph-data-model-metrics` — 60분 비동기 동영상 + 120분 대면 실습: graph data model·metrics | directed provenance와 simple undirected projection 생성 | 검증된 graph | LO5: 투영 정책을 재현 | raw count 표와 projection metadata JSON | input hash, 제거/병합/무시 수, tie rule PASS | 방향·loop·parallel·weight 혼합은 재현 실패 | pinned graph와 golden projection | node/edge 수를 영구 임계값으로 사용 금지 | 출석, 기말 지표 10점 준비 |
| 13 | `topic_id: W13-reproducible-analysis-source-verification` — 60분 비동기 동영상 + 120분 대면 실습: 재현 분석·source verification | components/isolate, degree top-five, bridge/articulation 또는 betweenness와 원문 대조 | 12주 projection | LO5: 지표를 재현하고 결론을 판정 | 분석 보고서, verified insight 1, rejected inference 1 | fixture 기대치·tolerance와 source identifiers 일치 | 근거 없는 공유 허브/중심성 관계를 rejected inference로 기록 | golden metrics와 source-check sheet | CVSS/EPSS/KEV 무설명 합성 금지 | 출석, 기말 LO5 20점 준비 |
| 14 | `topic_id: W14-end-to-end-recovery-final-rehearsal-teardown` — 60분 비동기 동영상 + 120분 대면 실습: end-to-end 복구·기말 리허설·teardown | 전 lineage 재실행, 한 장애 복구, 환경·증거 정리 | 9–13주 산출물 | LO3·LO4·LO5: 계보를 복구·검증 | 개인 receipt, command manifest, 보존/삭제·teardown 목록 | 모든 handoff ID와 결과가 연속 | dangling/partial/stale/hash mismatch에서 publish·merge 차단 | last-good 및 승인 golden fixture | public IP·임시 로그·fixture 사본 정리 | 출석, 기말 전 항목 리허설 |
| 15 | `topic_id: W15-final-individual-practical` — 3시간 개인 실기시험, 신규 강의 없음 | Wiki→UA→projection→metric→checked conclusion 독립 실행 | 9–14주 필수 증거 가족 | LO4·LO5: 생성·검증·분석·복구를 독립 수행 | lineage receipt, lint·validation JSON, metric report, 원문 대조 | 네 10점 rubric과 source evidence 일치 | stale/partial/unsourced relation을 거절하고 재진입 설명 | 승인된 Wiki·UA·analysis fixtures | 비밀 미제출, 학기 보존·삭제 정책 준수 | 기말고사 40% |

## 실습 마일스톤 및 제출 증거

각 마일스톤은 happy path, failure path, 학생 artifact, 기계 판독 증거, fallback, 안전·비용 메모, 평가 연결을 모두 가져야 한다.

| 마일스톤 | Happy | Fail | Artifact | Machine | Fallback | Safety | Assess |
|---|---|---|---|---|---|---|---|
| M1 진단·provenance | `M1-HAPPY` fixture ID/hash와 다섯 진단 PASS | `M1-FAIL` malformed·권한 오류 격리 후 보충 재수행 | `M1-ARTIFACT` 진단 5종·provenance 표 | `M1-MACHINE` parser exit·SHA-256 report | `M1-FALLBACK` offline fixture는 판독 보존, live 접근 미증명 | `M1-SAFETY` secret·PII 없음 | `M1-ASSESS` LO3·LO4, 출석 |
| M2 NCP/Linux | `M2-HAPPY` 제한 SSH·service·budget·완전 teardown PASS | `M2-FAIL` unrestricted SSH·stop-only·남은 IP/비용 거절 | `M2-ARTIFACT` redacted export·ACG·terminal/curl·teardown receipt | `M2-MACHINE` ACG validator와 resource/비용 상태 report | `M2-FALLBACK` 설계 판독만 보존, provisioning·실비용 상실 | `M2-SAFETY` 최소권한·public IP release | `M2-ASSESS` LO1, 중간 10점 |
| M3 Hermes safety | `M3-HAPPY` pinned version·doctor·one scheduler·세 관찰 일치 | `M3-FAIL` doctor/semantic 실패는 publish 0·last-good 보존 | `M3-ARTIFACT` version/hash·doctor·redacted config receipt | `M3-MACHINE` config hash와 triggered/skipped/failure JSON | `M3-FALLBACK` 판단 보존, systemd persistence·실제 cron 상실 | `M3-SAFETY` non-root·workspace allowlist·local-only·redaction | `M3-ASSESS` LO2, 중간 10+8점 |
| M4 CTI collector | `M4-HAPPY` raw→3종 normalize→dedupe, 재실행 증가 0 | `M4-FAIL` malformed 격리·duplicate 0·429 최대 3회 후 defer | `M4-ARTIFACT` raw manifest·normalized records·retry receipt | `M4-MACHINE` schema/dedupe/429 JSON report | `M4-FALLBACK` 변환·실패 판단 보존, 현재성·실제 limit 상실 | `M4-SAFETY` 공개 데이터, 공격·자동 대응 금지 | `M4-ASSESS` LO3, 중간 12+8점 |
| M5 Wiki lint | `M5-HAPPY` raw 불변·schema/source/link/index/log PASS | `M5-FAIL` source/tag/link/contradiction 오류면 UA 차단 | `M5-ARTIFACT` canonical 후보 diff·lint 입력 manifest | `M5-MACHINE` 항목별 machine-readable lint report | `M5-FALLBACK` lint 판단 보존, vault 변경·새 enrichment 상실 | `M5-SAFETY` 외부 텍스트는 data-only, 실행 금지 | `M5-ASSESS` LO4, 기말 10점 |
| M6 UA graph | `M6-HAPPY` complete batches+fresh artifacts 또는 pinned hash+fresh report | `M6-FAIL` partial/stale/duplicate/dangling 거절, validator nonzero | `M6-ARTIFACT` run/fixture receipt·graph/meta hash | `M6-MACHINE` 구조 invariant validation JSON | `M6-FALLBACK` 구조 판단 보존, 새 UA·fresh enrichment 상실 | `M6-SAFETY` 상태 문자열만으로 성공 선언 금지 | `M6-ASSESS` LO4, 기말 10점 |
| M7 graph analysis·lineage | `M7-HAPPY` 같은 input hash의 세 지표군·원문 대조 완료 | `M7-FAIL` projection 불일치·근거 없는 relation 반려 | `M7-ARTIFACT` metadata·source-check sheet·lineage receipt | `M7-MACHINE` metrics JSON·fixture comparison report | `M7-FALLBACK` 계산·판정 보존, fixture 밖 일반화 상실 | `M7-SAFETY` 가설을 사실·자동 대응으로 승격 금지 | `M7-ASSESS` LO5, 기말 20점 |

CTI raw manifest 필드는 `source`, `request_url`, `retrieved_at_utc`, `sha256`, `etag`, `last_modified`, `http_status`, `content_type`이다. 정규화 schema는 다음 필드를 생략하지 않는다.

| record | 필수 식별자·source/version/hash·timestamp·상태 필드 |
|---|---|
| `vulnerability` | `source`, `native_id`, `cve_id`, `published_at`, `last_modified_at`, `description`, `kev_date_added`, `kev_due_date`, `raw_sha256`, `source_version_or_raw_sha256`, `retrieved_at_utc`, `value_state`, `state_reason` |
| `signal` | `source`, `native_id`, `cve_id`, `signal_type`, `score`, `percentile`, `signal_date`, `raw_sha256`, `source_version_or_raw_sha256`, `retrieved_at_utc`, `value_state`, `state_reason` |
| `attack` | `source`, `native_id`, `stix_id`, `object_type`, `name`, `stix_version`, `modified`, `revoked`, `deprecated`, `fixture_release`, `fixture_sha256`, `as_of`, `value_state`, `state_reason` |

CVE join은 trim 후 uppercase와 `CVE-연도-번호` 형식 검사를 거치며 dedupe key는 `(source,native_id,source_version_or_raw_sha256)`다. `absent`(공급자 미제공), `null`(명시적 JSON null), `unknown`(값 미확정)은 서로 대체하지 않고 각 필드의 `value_state`와 `state_reason`에 이유를 남기며 빈 문자열이나 추정값으로 메우지 않는다.

NVD 수집은 `resultsPerPage`와 `startIndex`를 run manifest에 기록하고 작은 페이지/날짜 batch로 수행한다. 각 페이지/날짜 batch 사이에는 **최소 6초**를 두며 timeout·network error·HTTP 429에는 `Retry-After`를 우선하고 없으면 증가 backoff로 최대 3회만 재시도한다. 상한을 넘으면 `deferred_rate_limited`로 격리하고 publish하지 않으며 `last_good_run_id`와 `last_good_sha256`을 보존한다. 근거: [NVD API](https://nvd.nist.gov/developers/vulnerabilities), [NVD limits](https://nvd.nist.gov/developers/start-here).

UA live 검사는 `kind == "knowledge"`, nonempty `nodes`, unique node IDs, array `edges`·`layers`·`tour`, 모든 edge endpoint 존재, valid meta JSON, expected/completed batch 집합 일치, graph/meta mtime이 run 시작보다 최신임을 요구한다. partial 또는 stale UA는 명시적으로 거절하고 validator가 nonzero를 반환해야 한다. fallback도 같은 구조 불변식을 새로 검사하되 pinned graph hash와 fresh validation report를 요구하고 `fresh_enrichment_claim: false`로 기록한다.

그래프 계보 수는 원시 directed graph에서 방향·type·multiplicity를 보존한다. 구조 지표는 같은 input hash의 모든 node를 포함한 unweighted simple undirected projection에서만 계산하며 self-loop를 제거하고 parallel/mutual edge를 한 unordered pair로 병합하며 weight와 edge type을 무시한다. 동점은 node ID 오름차순이다. 필수 지표군은 (1) connected components와 isolates, (2) degree top-five, (3) bridges·articulation exact-set/order zero tolerance 또는 fixture가 지정한 normalized betweenness top-five와 허용오차 `1e-9`다.

## 운영 환경 및 대체 실습 매트릭스

### 플랫폼 역량

| 플랫폼 | live로 주장 가능한 범위 | 제한 |
|---|---|---|
| 학교 NCP sub-account+Linux VM | NCP provisioning, 제한 ACG/SSH, public IP, 비용경보, terminate/release; Hermes systemd 관찰 | 학교 승인·비용·권한 범위 안에서만 수행 |
| 실습실/개인 Linux VM | Linux/service와, systemd 제공 시 Hermes gateway 지속성 | NCP control-plane·실제 public 비용 증명 불가 |
| WSL2-with-systemd | Linux/service와 Hermes live systemd 경로 | NCP provisioning·public IP·실제 Cost Explorer 증명 불가 |
| Docker | collector·Wiki·UA의 제한적 컨테이너 실습 | Hermes gateway persistence는 `fixture-only`; NCP provisioning 불가 |

### 정확히 여섯 트랙의 live/fallback 계약

| 트랙 | live evidence | instructor fixture | manifest/hash | preserved competency | lost competency | allowed claim |
|---|---|---|---|---|---|---|
| NCP | `F-NCP-LIVE` VPC/subnet·ACG·제한 SSH·budget·terminate/public-IP release의 redacted 증거 | `F-NCP-FIXTURE` `ncp-lab-fixture.json`과 Linux VM/WSL2 보조 | `F-NCP-MANIFEST` fixture_id, owner, schema_version, created_at, refreshed_at, source_urls, sha256, expected_results | `F-NCP-PRESERVED` 네트워크·ACG·비용·teardown 판단 | `F-NCP-LOST` 실제 provisioning·public 연결·alert·release | `F-NCP-CLAIM` fixture 기반 NCP 설계·검증만 주장 |
| Hermes | `F-HERMES-LIVE` systemd Linux의 non-root install, doctor, gateway·관찰 receipt | `F-HERMES-FIXTURE` changed/no-change/semantic-failure와 health fixture; Docker persistence fixture-only | `F-HERMES-MANIFEST` owner, schema_version, refreshed_at, source commit, config/fixture SHA-256, expected result | `F-HERMES-PRESERVED` 안전 설정·상태·last-good 판단 | `F-HERMES-LOST` 실제 systemd persistence·scheduler/cron·복구 | `F-HERMES-CLAIM` fixture/Docker에서 운영 증거를 해석했다고만 주장 |
| CTI API | `F-CTI_API-LIVE` 공개 API의 bounded response·manifest·normalize·dedupe | `F-CTI_API-FIXTURE` CISA/NVD/EPSS/ATT&CK 및 malformed/duplicate/429 fixture | `F-CTI_API-MANIFEST` source URL, as_of, owner, schema_version, raw/fixture SHA-256 | `F-CTI_API-PRESERVED` provenance·join·상태·idempotency·실패 처리 | `F-CTI_API-LOST` 현재 API 가용성·최신성·실제 limit 상호작용 | `F-CTI_API-CLAIM` 고정 fixture에서 재현했다고만 주장 |
| LLM enrichment | `F-LLM_ENRICHMENT-LIVE` input hash·redacted prompt·모델/시각·사람의 원문 대조 | `F-LLM_ENRICHMENT-FIXTURE` redacted prompt/response와 approved/rejected sheet | `F-LLM_ENRICHMENT-MANIFEST` owner, schema_version, refreshed_at, source URLs, input/output SHA-256 | `F-LLM_ENRICHMENT-PRESERVED` 근거 분리·원문 검증·가설 거절 | `F-LLM_ENRICHMENT-LOST` 현재 응답·모델 가용성·새 enrichment | `F-LLM_ENRICHMENT-CLAIM` fixture 후보를 검증했다고만 주장 |
| UA generation | `F-UA_GENERATION-LIVE` `understand-knowledge`, complete batches, fresh graph/meta와 invariant report | `F-UA_GENERATION-FIXTURE` instructor-owned pinned graph와 이번 실행의 새 validation report | `F-UA_GENERATION-MANIFEST` graph/report SHA-256, owner, schema_version, refreshed_at, expected invariants | `F-UA_GENERATION-PRESERVED` 구조·batch·freshness 판독과 dangling 거절 | `F-UA_GENERATION-LOST` 학생 환경의 새 UA·현재 LLM enrichment | `F-UA_GENERATION-CLAIM` pinned graph를 새 보고서로 검증했다고만 주장 |
| graph analysis | `F-GRAPH_ANALYSIS-LIVE` raw directed counts와 명시 projection·metrics·source check | `F-GRAPH_ANALYSIS-FIXTURE` pinned graph, projection metadata, expected metrics와 source-check sheet | `F-GRAPH_ANALYSIS-MANIFEST` graph/script SHA-256, owner, schema_version, refreshed_at, tolerance | `F-GRAPH_ANALYSIS-PRESERVED` 재현 projection·세 지표군·verified/rejected 판정 | `F-GRAPH_ANALYSIS-LOST` 새 live graph 분석·fixture 밖 일반화 | `F-GRAPH_ANALYSIS-CLAIM` fixture 지표와 대조 결론을 재현했다고만 주장 |

모든 fixture manifest는 최소 `fixture_id`, `owner`, `schema_version`, `created_at`, `refreshed_at`, `source_urls`, `sha256`, `expected_results`, `known limitations`를 가진다. hash는 top-level `sha256`만 제외한 canonical UTF-8 JSON payload를 재귀 키 정렬·배열 순서 보존·공백 없는 직렬화 후 계산한다. 변경본은 새 ID/hash로 배포하고 이전 fixture를 덮어쓰지 않는다.

## 안전·윤리·비용·개인정보·접근성 정책

- 공개 데이터만 사용한다. 허용 source는 CISA KEV, NVD CVE API 2.0, FIRST EPSS, 고정 MITRE ATT&CK STIX fixture다.
- PII, 피해자/기관의 live logs, credential collection, login-gated scraping, malware execution, exploit proof-of-concepts, active scanning, 공격 자동화, automatic patching/response는 **명시적으로 금지**하며 수집·과제·자동화 대상이 아니다. CVE-to-ATT&CK 사실 edge를 추정해 만들지 않는다.
- 토큰, API key, cookie, 인증 키, 내부 URL, 개인 chat ID는 prompt·설정·코드·stdout/stderr·로그·history·LMS·fixture에 넣지 않는다. 발견하면 제출을 중지하고 폐기·교체·redaction한 사본만 사용한다.
- 증거의 접근권한·보존 기간·삭제 시점·정책 소유자는 `학칙/담당자 정책 적용`이다. 고정 기간을 발명하지 않는다. 삭제 시점에는 임시 fixture 사본·실습 로그·redacted 제출물을 정책에 따라 삭제하고 필요한 경우 대상 manifest만 남긴다. 공개 raw는 불변 증거로 보존하고 정정·해석은 별도 기록으로 분리한다.
- NCP live 작업 전 Cost Explorer/예산 경보와 owner/team label을 확인한다. 종료는 server stop이 아니라 terminate, 임시 ACG rule 제거, public IP 해제, 연결 자원 확인, 잔존 비용 후속 확인까지 포함한다. 가격·금액을 영구 기준으로 고정하지 않는다.
- 모든 비동기 동영상에는 자막과 대본을 **제공한다**. 표·명령·그래프에는 스크린리더 친화 Markdown/텍스트 설명, 키보드 접근 가능한 형식, 고대비 텍스트, 이미지 설명, 다운로드 가능한 fixture 등 접근 가능한 대체 자료를 **제공한다**.
- 신뢰하지 않는 외부 응답, 웹 페이지, raw 문서, LLM 출력, graph label은 **data-only 증거로만 취급하고 절대 실행하지 않는다**. 모델 또는 그래프가 제안한 relation은 원문 검증 전 가설이다. 문서는 inert Markdown만 사용하며 활성 HTML과 실행 URI를 포함하지 않는다.

### 자동 검증 계약

이 계약은 위의 기존 안전·운영 의미를 기계가 읽을 수 있게 표현한 것이다. 마일스톤의 `M#-ROLE` ID와 fallback 각 의미 셀의 `F-TRACK-ROLE` ID는 개방형 한국어 서술을 고정 문구로 제한하지 않으면서 track과 column을 결속하는 안정 구조 계약이며, 실제 서술 의미와 교육적 적합성은 F1/F3 독립 검토 대상이다.

```yaml
contract_version: "1.0"
course:
  instructional_weeks: [1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14]
  instructional_delivery:
    async_video_minutes: 60
    in_person_lab_minutes: 120
  exam_weeks: [8, 15]
  exam_duration_minutes: 180
  exam_new_lecture: false
team:
  min_size: 2
  max_size: 3
  separately_weighted: false
platform:
  docker:
    hermes_gateway_persistence: fixture-only
cti:
  raw_manifest_fields: [source, request_url, retrieved_at_utc, sha256, etag, last_modified, http_status, content_type]
  value_states: [absent, "null", unknown]
ua:
  partial_stale:
    accept: false
    exit: nonzero
graph:
  inferred_relation:
    fact: false
accessibility:
  captions: true
  transcripts: true
  alternative_material: true
offensive:
  malware_execution: false
  exploit_poc: false
  active_scanning: false
  automatic_response: false
untrusted_external:
  execution: false
credentials:
  prompt: false
  log: false
  history: false
hermes:
  messaging_browser:
    requires_separate_approval: true
  workspace_tool_allowlist: true
  gateway_count: 1
  delivery: local-only
  gate_outputs: [wakeAgent, reason, changedPaths]
  install_mode: headless
  doctor_required: true
  timezone: Asia/Seoul
  cron_mode: deny
  observation_states: [changed, no_change, semantic_failure]
  preserve_last_good: true
nvd:
  pagination: [resultsPerPage, startIndex]
  min_interval_seconds: 6
  max_retries: 3
  failure_state: deferred_rate_limited
  preserve_last_good: true
milestones:
  roles: [HAPPY, FAIL, ARTIFACT, MACHINE, FALLBACK, SAFETY, ASSESS]
fallback:
  columns: [live_evidence, instructor_fixture, manifest_hash, preserved_competency, lost_competency, allowed_claim]
  tracks: [NCP, Hermes, CTI_API, LLM_enrichment, UA_generation, graph_analysis]
```

## 교수자 사전 준비 및 장애 복구

### 매 실습·시험 전 preflight

1. live 권한, 학교 sub-account 범위, systemd 제공 여부, 공개 source allowlist, Hermes 고정 commit과 설치 artifact hash를 확인한다.
2. NCP budget/alert, owner/team label, 제한 ACG, teardown checklist와 public-IP release 확인 절차를 점검한다. 비용 정보·권한이 없으면 provisioning 전에 fixture로 전환한다.
3. golden fixture마다 owner·ID·schema·created/refreshed time·source URLs·SHA-256·expected results·known limitations를 독립 검증한다.
4. happy, malformed, duplicate, 429, changed, no-change, semantic-failure, partial-batch, stale, dangling-edge fixture와 last-good 결과를 준비한다.
5. 비동기 동영상의 자막·대본·접근 가능한 대체 자료, 키보드/스크린리더 경로, 시험의 개인 fixture 사본을 확인한다.
6. 제출 템플릿의 secret/PII redaction, 증거 보존·삭제 정책, 장애 연락·전환 기준을 학생에게 공지한다.

### 장애·중단 복구

- API/LLM outage에는 재시도 폭주나 우회 scraping을 하지 않는다. bounded 오류 기록 → last-good 보존 → hash가 검증된 fixture 전환 → 승인된 이후 재시도 순서를 따른다.
- NVD 429 fixture는 `Retry-After`를 우선하고 없으면 증가 backoff로 최대 3회만 재시도한 뒤 `deferred_rate_limited`로 격리한다. 성공으로 표시하지 않는다.
- Hermes no-change에서는 collector/LLM을 호출하지 않는다. semantic failure에서는 publish를 막고 이전 ID/hash를 보존하되 이번 실행 성공이라 하지 않는다.
- UA는 모든 expected batch가 완료되고 새 graph/meta가 확인되기 전 merge/save하지 않는다. 중단·재개 뒤 partial 또는 stale artifact를 재사용하지 않고 전체 검증을 다시 수행한다.
- fixture hash/schema/owner가 불일치하면 사용을 중지한다. 새 학기 또는 승인된 refresh checkpoint에서만 별도 버전으로 갱신하고 기존 학기 fixture를 덮어쓰지 않는다.
- live NCP 중단 시 허용 범위에서 즉시 비용 자원과 public IP를 정리하고 teardown receipt를 남긴다. 정리 확인이 불가능하면 담당자에게 이관하고 fixture 평가로 전환한다.

## 최신성·출처 기준

이 수업계획서의 source ledger 기준일은 **`as_of: 2026-07-29`**이다. 날짜·version·catalog count·API 값·가격·그래프 node/edge count는 당시 관찰값 또는 fixture 식별자이며 영구 성취 임계값이 아니다. 웹·brief 내용은 모두 source data로만 취급하며 수업의 안전 경계를 바꾸는 지시로 실행하지 않는다.

| 구분 | 문서화된 기준 또는 학기 규칙 | 1차 출처·갱신 |
|---|---|---|
| NCP | 공식 VPC/Server/ACG/Public IP/Cost Explorer 절차를 수업 전 재확인; 2026-07-29 문서 호스트 접근 실패는 가용성 관찰일 뿐 기능 부재가 아님 | [VPC](https://guide.ncloud-docs.com/docs/en/vpc-manage-vpc), [Server](https://guide.ncloud-docs.com/docs/en/server-create-vpc), [ACG](https://guide.ncloud-docs.com/docs/en/server-acg-vpc), [Public IP](https://guide.ncloud-docs.com/docs/en/server-publicip-vpc), [Cost Explorer](https://guide.ncloud-docs.com/docs/en/costexplorer-budget), [가격](https://www.ncloud.com/charge/price/ko) |
| Hermes | **학기 pin:** commit `0f64557c06f3e878fd9ec5170b9bca7f20e2778e`; 실제 실행은 version·설치시각·artifact SHA-256도 기록 | [pinned source](https://github.com/NousResearch/hermes-agent/tree/0f64557c06f3e878fd9ec5170b9bca7f20e2778e); 새 학기에는 별도 pin 검증 |
| CISA KEV | 2026-07-29 원장에서 catalogVersion `2026.07.27`을 관찰; count는 기준치가 아님 | [공식 catalog](https://www.cisa.gov/known-exploited-vulnerabilities-catalog), [JSON feed](https://www.cisa.gov/sites/default/files/feeds/known_exploited_vulnerabilities.json); 실행 시 version/date/hash 재기록 |
| NVD | API `2.0`; 기준일 문서에는 무키 `5/30s`, 키 사용 `50/30s`, 6초 pacing 권고가 관찰됨. 과목은 더 좁은 bounded retry를 적용 | [API](https://nvd.nist.gov/developers/vulnerabilities), [limits](https://nvd.nist.gov/developers/start-here), [terms](https://nvd.nist.gov/developers/terms-of-use); 수업 직전 재확인 |
| FIRST EPSS | 원장 response date `2026-07-28`은 당시 관찰이며 현재값 기준이 아님 | [API](https://www.first.org/epss/api), [FAQ](https://www.first.org/epss/faq); 응답 date/hash를 run마다 기록 |
| MITRE ATT&CK | **semester fixture:** `v19.1`, `fixture_as_of: 2026-07-29`; 당시 `official_latest: v19.1` | [v19.1 release](https://github.com/mitre-attack/attack-stix-data/releases/tag/v19.1), [release index](https://github.com/mitre-attack/attack-stix-data/releases); 실행 시 공식 latest를 확인하되 활성 학기 fixture는 조용히 교체하지 않음 |

ATT&CK refresh 절차는 (1) 공식 release API의 요청시각·tag·published date·URL·response hash 기록, (2) `v19.1` teaching fixture와 비교, (3) 활성 학기에는 기존 hash/schema 유지, (4) 이후 학기에 채택할 때 새 owner·fixture ID·source URL·retrieval time·schema·SHA-256·expected results·차이·승인 기록을 가진 별도 fixture 생성 순서다. 최신 release가 달라도 이전 fixture를 덮어쓰거나 현재 수행처럼 소급 표기하지 않는다.

그래프 node/edge 수, 중심성, path, cluster 및 LLM 관계는 검토 후보이지 사실이 아니다. 원문과 권위 source로 확인된 식별자 계보만 `checked conclusion`으로 인정하며 근거가 없으면 `rejected inference`로 보존한다.
