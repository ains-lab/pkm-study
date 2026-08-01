# F3 학생·교수자 시나리오 및 렌더링 감사 v3

- 검증 시각: 2026-07-29 (Asia/Seoul)
- Git HEAD: `8857bdd924bc0e155b7dd64a8a471692b7b7ab85`
- 대상: `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`
- 대상 SHA-256: `75df0f2733c5bf898b78ee531cbc13700aafcc359b4f7ea15d3a0c296d2c1e51`
- 검사기: `syllabus_check.rb`, SHA-256 `efab908d52db0049be5d7f1afaf7d78f814bbd9dc9360fe802c1577cfe2041cd`
- 범위: 읽기/렌더링/임시 변형 검증만 수행했다. NCP·Hermes·cron·UA·외부 API를 provisioning 또는 호출하지 않았다.

## manualQa

### surfaceEvidence

| ID | 기준 | 표면·정확한 호출 | 판정 | artifactRefs |
|---|---|---|---|---|
| S1 | 전체 계약·15주·평가·fallback·YAML | `ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` | PASS: headings=10, weeks=15, topic IDs=15, milestones=7/ID=49, fallbacks=6, 20/40/40, rubrics=40/40, typed YAML 계약이 모두 통과했다. | A1 |
| S2 | 학생/교수자 HTML 읽기 표면 | `pandoc -f gfm -t html5 --standalone output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` 후 `<h2>`/`<table>`/안전·fallback 키워드 검사 | PASS: 10개 H2와 11개 table이 HTML로 형성됐고, Docker `fixture-only`, `deferred_rate_limited`, non-root, 접근성·안전 텍스트가 표면에 존재한다. | A2 |
| S3 | 단말 가독성/CJK 폭 | `glow -w 160 …` 및 `glow -w 400 …`; `glow -w 160 … | node …/visual-qa.mjs tui-check /dev/stdin --cols 160` | PASS: 160열에서 541줄, 최대 폭 158/160, overflow 0, border misalignment false, wide CJK column이 검출됐다. 400열 321줄이며 두 폭에서 줄임표는 0개다. 11열 주차 표는 160열에서 여러 줄로 wrap되지만 열 경계/내용은 유지되며 400열에서 더 읽기 쉽다. | A3 |
| S4 | 평가·시험 정직성 | 일정 8/15주, 평가표, 두 rubric 및 각 fallback의 `lost competency`/`allowed claim`을 수동 추적 | PASS: 8·15주는 신규 강의 없는 개인 실기이고, 각각 40점 rubric이며 fallback은 보존 역량과 잃은 역량을 분리한다. 팀 활동은 별도 점수가 없고 개인 증거를 대체하지 않는다. | A4 |
| S5 | 기계 계약과 보이는 산문 일치 | YAML 계약 블록 및 안전 정책, 4·7·11주, CTI schema/NVD 산문을 함께 읽고 S1의 recursive typed-contract 검사를 실행 | PASS: `partial_stale.accept: false`/`exit: nonzero`, 공격 행위 false, 외부 입력 execution false, 접근성 true, Hermes 승인·allowlist·local-only, NVD pacing/retry가 해당 산문과 같은 방향이다. | A1, A4 |

### adversarialCases

| ID | 기준 | 적대 상황·기대 동작 | 판정 | artifactRefs |
|---|---|---|---|---|
| A-NCP | NCP unavailable | 권한·비용·장애로 NCP가 없으면 Linux VM/WSL2 또는 교수자 fixture로 전환하고, 설계·teardown 판단만 평가하며 실제 provisioning/public 연결/alert/release는 주장하지 않는다. | PASS: 운영 전제, 3·8주, NCP fallback 행이 전제·산출물·중간시험 route·lost competency를 모두 명시한다. | A4 |
| A-HERMES | systemd 없는 Docker | Docker에서 Hermes persistence를 live 성공으로 취급하지 않고 `fixture-only`로 한정한다. no-change는 collector/LLM을 호출하지 않고 semantic failure는 publish 0·last-good 보존이다. | PASS: 운영 전제, 플랫폼 표, Hermes fallback 행, 7주와 장애 복구가 모두 이를 명시한다. | A4 |
| A-CTI | CTI 429/network | 작은 page/date batch와 최소 6초 간격, `Retry-After` 우선, 최대 3회 retry 후 `deferred_rate_limited`, publish 금지·last-good 보존으로 전환한다. | PASS: 6주, CTI fallback, NVD 수집/복구 및 M4가 정확한 failure artifact와 정직한 제한을 제공한다. | A4 |
| A-LLM | LLM enrichment unavailable | bounded 오류 기록→last-good→hash 검증 fixture→승인 후 재시도이며 현재 모델 응답/새 enrichment를 주장하지 않는다. | PASS: LLM fallback 행은 preserved/lost competency와 allowed claim을 분리하고, 장애 복구는 우회 scraping·retry 폭주를 금지한다. | A4 |
| A-UA | partial/stale UA | 부분/오래된 graph를 거절하고 validator nonzero, complete batch+fresh artifact 또는 pinned graph+fresh validation report만 허용한다. | PASS: 11·14·15주, M6, UA 정책 및 fallback 행이 서로 일치한다. 임시 문구 변형은 검사기가 `FAIL: UA prose contradicts the partial/stale contract`로 거절했다. | A1, A4, A5 |
| A-GRAPH | graph ambiguity | inferred relation을 사실로 승격하지 않고, projection mismatch/근거 없는 relation은 rejected inference로 남기며 원문 대조를 요구한다. | PASS: 12–15주, M7, graph fallback, 안전 정책이 동일한 판정 경계를 제공한다. | A4 |
| A-SAFETY | 접근성·안전 | 자막·대본·대체 자료를 제공하고, malware/exploit/active scanning/automatic response와 외부 텍스트 실행을 금지한다. | PASS: 일정 상단과 안전 정책의 보이는 산문이 YAML boolean 계약과 일치한다. | A1, A2, A4 |
| A-CORRUPT | 입력 손상 | invalid UTF-8 입력은 안정적 nonzero 실패여야 한다. | PASS: `/tmp/hoseo-f3-invalid.*` 임시 파일에 `ff fe`를 넣어 검사했고 `FAIL: syllabus is not valid UTF-8`를 받았다. 임시 파일은 검증 후 제거했다. | A1, A5 |

### artifactRefs

| ID | kind | 설명 | path |
|---|---|---|---|
| A1 | executable-check | 최신 대상에 대한 Ruby typed-contract/구조 검사 결과 | `.omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb` |
| A2 | rendered-surface | Pandoc HTML 표면: 10 H2/11 table 및 정책 문구의 HTML 형성 확인. 임시 stdout 렌더링으로 생성하여 보존하지 않았다. | `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` |
| A3 | rendered-surface | Glow 160/400 열 terminal 표면과 `tui-check` 결과. 임시 stdout 렌더링으로 생성하여 보존하지 않았다. | `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` |
| A4 | manual-trace | 위 표의 고정 상황을 문서의 주차·fallback·복구·안전·평가 표까지 수동으로 추적한 기록 | `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` |
| A5 | adversarial-execution | invalid UTF-8와 partial/stale 의미 반전 임시 입력의 nonzero 거절; 파일은 `/tmp`에서 제거 완료 | `.omo/evidence/hoseo-data-analysis-cloud-platform-course/F3-scenario-audit-v3.md` |

## 결론

**APPROVE.** 세 가지 고정 운영 경로와 CTI/LLM/UA/그래프·안전의 실패 경로가 모두 정직한 평가 route로 연결되며, fallback에서 잃은 역량을 live 성취로 과장하지 않는다. 최신 SHA의 기계 계약, Pandoc HTML, Glow terminal 표면, UTF-8 및 partial/stale 변형 거절을 실제 실행으로 확인했다.
