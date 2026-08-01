# F1 v2 — 계획 준수 및 평가 정렬 독립 감사

```yaml
recommendation: REJECT
review_mode: read-only
review_commit_sha: 8857bdd924bc0e155b7dd64a8a471692b7b7ab85
target: output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
target_sha256: d062c7427f7b8a715f357f7d6f7e307f677fcd3b455c9b709c899ef192d52bee
checker: .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb
checker_sha256: de2cd490ff6f38289e25162ba68be640646682c80676c57854f6c5623e8f8241
only_persistent_write: .omo/evidence/hoseo-data-analysis-cloud-platform-course/F1-plan-compliance-v2.md
```

## blockers

1. **현재 checker는 의미 계약이 아니라 한국어 완성 문구를 중복 저장한 snapshot validator다.** `canonical_milestones` 49개 셀, `canonical_fallbacks` 36개 셀, 7개 정책 문장, 4·7주 전체 행을 대상 문서와 byte-for-byte 비교한다. 독립 positive control 네 건에서 뜻과 ID·기술 계약을 유지한 한국어 재표현이 모두 잘못 거부됐다. 이는 `remove-ai-slops`의 구현 미러링/중복과 `programming`의 prose snapshot·거짓 확신 금지 관점에서 unresolved overfit이다.
2. **현재 checker 해시에 결합된 code-quality review가 없다.** 검색 결과 `de2cd490...`를 기록한 `*code*review*.md`/`*quality*review*.md`는 0개다. 기존 `final-gate/code-quality-review.md`는 checker `b5923d...`에 결합된 `FAIL/REQUEST_CHANGES` 보고서이고, “brittle full-sentence pins를 추가하지 말라”는 미해결 요구를 남긴다. 더 오래된 외부 code review는 checker `4eb64f...`/target `b87d72...`에 결합돼 있다. 따라서 현재 수정이 동일 skill 관점과 overfit 기준을 통과했다는 독립 보고 증거가 없다.
3. **현재 회귀 harness에는 의미 보존 positive control이 없다.** `task-8-regression.rb`는 실제 target 한 건만 expected exit 0으로 실행하고, `mutants` 전체를 expected exit 1로 실행한다. `task-8-validation.log`가 이전 단계에서 언급한 “five Korean semantic paraphrases”는 현재 153-control harness에 존재하지 않는다. 현재 증거는 harmful mutation 거부를 보여주지만, 올바른 재표현을 허용하는지 판별하지 못하며 실제로 위 네 positive control을 거부한다.

## originalIntent

호서대학교 컴퓨터공학과 4학년이 공개 CTI 원본에서 NCP/Linux, 안전한 Hermes 자동화, 정규화, LLM Wiki, UA 지식그래프, 재현 그래프 분석까지 한 계보로 학습할 수 있는 한국어 15주 수업계획서 한 건을 제공하는 것이다. live 환경 장애에도 정직한 fixture 평가 경로가 있어야 하며, 20/40/40 평가와 두 실기시험은 개인 실행 증거 및 LO1–LO5에 정렬되어야 한다.

## desiredOutcome

사용자가 바로 검토·운영 준비에 쓸 수 있는 단일 Markdown 수업계획서와, 문서의 의미를 훼손한 경우는 거부하되 의미가 같은 안전한 한국어 수정은 허용하는 유지보수 가능한 read-only 검증 증거가 함께 있어야 한다. 보호된 위키·raw·UA·기존 output·Hermes/NCP 외부 상태는 바뀌지 않아야 한다.

## userOutcomeReview

수업계획서 본문은 사용자 관점의 교육 결과를 충족한다. 독립 파서는 정확한 H2 10개, 15주, 13개 60+120 수업 행, 8·15주 시험, W01–W15 고정 순서, LO1–LO5, 20/40/40, 두 40점 rubric, M1–M7/49개 증거 ID, 여섯 fallback을 모두 재확인했다. NCP/Hermes/CTI/Wiki/UA/graph의 live·fixture 한계, 안전·접근성·비용·출처 최신성도 직접 읽어 확인했다.

그러나 “완료” 결과에는 검증 체계도 포함된다. 현재 checker는 올바른 문서의 의미 보존 편집을 실패로 처리하고, 그 checker에 대한 최신 code-quality 승인이 없다. 따라서 본문은 준비됐지만 전체 전달물은 아직 최종 승인 가능한 상태가 아니다.

## Build identity and exact executions

| Check | Exact invocation / observable | Exit | Result |
|---|---|---:|---|
| HEAD | `git rev-parse HEAD` | 0 | `8857bdd924bc0e155b7dd64a8a471692b7b7ab85` |
| Target hash | `shasum -a 256 output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` | 0 | `d062c742...d52bee` exact |
| Checker hash | `shasum -a 256 .../syllabus_check.rb` | 0 | `de2cd490...f8241` exact |
| Ruby syntax | `ruby -c .../syllabus_check.rb` | 0 | `Syntax OK` |
| Valid target | `ruby .../syllabus_check.rb output/...md` | 0 | `PASS headings=10 weeks=15 topic_ids=15 milestones=7 evidence_ids=49 fallbacks=6 weights=20/40/40 rubrics=40/40 carry=PASS` |
| Persisted harness | `ruby .../task-8-regression.rb` | 0 | current 153-control negative harness green |
| Required corrupt copy | `ruby .../syllabus_check.rb .../corrupt-syllabus.md` | 1 | includes both `missing week 8 or week 15 exam` and grading mismatch |
| GFM surface | `pandoc --standalone --from gfm --to html5 ... -o /dev/null` | 0 | parse success |
| Terminal surface | `NO_COLOR=1 COLUMNS=420 glow -w 400 -s dark ... >/dev/null` | 0 | render success |
| Whitespace | `git diff --no-index --check /dev/null <target>` | 1 | normal added-file status; stdout/stderr diagnostics both 0 bytes |
| Protected manifest | independent Ruby SHA-256 recomputation | 0 | 142 paths, 0 missing/mismatch |
| Independent course parser | inline Ruby H2/table/set parser | 0 | `INDEPENDENT_CONTRACT_PASS ... weeks=1..15 instructional=13 ... weights=20%/40%/40% ... evidence_ids=49 fallbacks=6` |

## Must-have checklist

| ID | Requirement | Result | Direct evidence |
|---|---|---|---|
| MH-01 | Exactly one Korean external deliverable at the required path | PASS | target exists, valid UTF-8/LF/final newline; protected output baseline plus exactly this new output |
| MH-02 | Ten unique required top-level sections | PASS | exact ordered H2 set count 10 |
| MH-03 | Five observable LO1–LO5 used across outcomes, schedule, assessment | PASS | five definitions; every ID occurs in schedule and assessment |
| MH-04 | Exactly 15 weeks; 13×60+120; weeks 8/15 three-hour individual exam-only | PASS | independent week-row parser: 15/13/[8,15] |
| MH-05 | Fixed week 1–15 topic sequence | PASS | exact ordered `topic_id` W01–W15 plus human topic review |
| MH-06 | Attendance/midterm/final 20/40/40; formative 2–3-person work unweighted; individual exam evidence | PASS | exactly three weighted rows; no extra category |
| MH-07 | Midterm 10+10+12+8=40 | PASS | named rubric rows and total parsed independently |
| MH-08 | Final 10+10+10+10=40 | PASS | named rubric rows and total parsed independently |
| MH-09 | Honest live/fallback paths for six required tracks; Docker Hermes persistence fixture-only | PASS | exact six rows, complete cells, explicit preserved/lost/allowed claims |
| MH-10 | ATT&CK v19.1 dated fixture/current check/no silent semester replacement | PASS | `as_of: 2026-07-29`, `official_latest: v19.1`, refresh procedure |
| MH-11 | Captions/transcripts, accessibility, public CTI, credentials, retention/deletion, NCP cost/teardown, fixture metadata | PASS | direct policy/preflight/matrix inspection |
| MH-12 | Tests-after, local/read-only verification only | PASS | Ruby/Pandoc/Glow/local hashes; no NCP/Hermes/cron/live CTI/UA execution |

## Must-not-have checklist

| ID | Guardrail | Result | Direct evidence |
|---|---|---|---|
| MN-01 | No real NCP/Hermes/cron/UA operation | PASS | receipts and artifacts show bounded local reads/parses/renders only |
| MN-02 | No protected raw/canonical/schema/index/log/UA/existing-output mutation | PASS | 142 protected paths, 0 hash mismatches |
| MN-03 | No malware/PoC/scanning/victim logs/PII/credential scraping/automatic response assignment | PASS | explicit prohibition and data-only policy |
| MN-04 | No graph inference as fact, unexplained composite risk, or invented CVE→ATT&CK edge | PASS | verified/rejected distinction and explicit prohibition |
| MN-05 | No volatile values/counts as permanent thresholds | PASS | dated observations and refresh guidance; graph counts not grading criteria |
| MN-06 | No HA/multi-AZ/VPN/SOC/offensive/fine-tuning/separately graded expansion | PASS | direct full-document inspection found none |
| MN-07 | No stage/commit/revert/normalization of unrelated dirty state | PASS | staged path list empty; baseline status retained; one hook-state path is concurrent `.omo` runtime state |

## Todo acceptance checklist

| Todo | Result | Independent evidence |
|---|---|---|
| 1 — baseline/source ledger | PASS | four artifacts nonempty; required first-party keys/URLs; baseline precedes implementation; 142 protected hashes match |
| 2 — course contract | PASS | five LO headings, seven prerequisite diagnosis/remediation rows, exact instructional/exam schema, assessment/accessibility terms |
| 3 — NCP module | PASS | exactly weeks 2/3, eight fixture fields, restricted SSH, stop-only rejection, release/residual-cost, Docker fixture-only |
| 4 — Hermes/CTI/midterm | PASS | weeks 4–8, 10/10/12/8, raw/normalized/dedupe state, NVD limits, trigger/skip/failure and last-good |
| 5 — Wiki/UA/graph/final | PASS | weeks 9–15, four tens, live/fallback invariants, projection policy, metrics, lineage and rejected inference |
| 6 — governance/fallback | PASS | exactly three weights totaling 100; exactly six complete fallback tracks; policy ownership and prohibited activities |
| 7 — assembly | PASS | target exact hash; all six briefs present before assembly; independent current content parser and current Todo-7 v2 review |
| 8 — mechanical validation | PASS | current checker valid=0, corrupt=1, regression=0, Pandoc=0, Glow=0, protected mismatch=0 |
| 8 — validation quality / anti-overfit | **FAIL** | four meaning-preserving positive controls incorrectly exit 1; no current checker-bound code-quality approval |

## Success criteria checklist

| ID | Success criterion | Result | Evidence |
|---|---|---|---|
| SC-01 | Single GFM deliverable readable in terminal | PASS | target, Pandoc, Glow |
| SC-02 | 15 unique weeks, 13 instructional, exams 8/15, fixed topics | PASS | independent row/ID parser |
| SC-03 | Observable/assessed LO1–LO5 and consistent grading/rubrics | PASS | outcomes/schedule/assessment parser |
| SC-04 | Five technologies with artifacts, happy/failure evidence, safety | PASS | weekly schedule and M1–M7 human review |
| SC-05 | Six honest fallback rows; Docker does not overclaim systemd persistence | PASS | exact fallback matrix |
| SC-06 | CTI provenance/normalization/idempotency/API/ATT&CK currency without offense/unstable claims | PASS | schema/NVD/source/policy sections |
| SC-07 | Complete UA structural/freshness contract | PASS | UA policy and week 11/M6/fallback row |
| SC-08 | Graph projection policies, three metric families, verified/rejected conclusions | PASS | graph contract and weeks 12–14/M7 |
| SC-09 | Baseline/final protected paths match; no forbidden mutation | PASS | 142/0 recomputation; staging empty |
| SC-10 | Todo 8 plus all final verifiers approve with evidence | **FAIL** | current checker quality blocker; this F1 cannot approve; current checker-bound quality review absent |

## Direct anti-overfit/slop pass

The explicit scope was the syllabus, checker, regression harness, current Task 8 receipts, and available code-quality reports. The checker is compact (`168` pure LOC), deterministic, single-purpose, and has no network, subprocess, eval, dead helper, broad rescue, or oversized-module defect. The unresolved defect is test shape and duplication:

| Positive control (meaning and stable contract retained) | Expected | Actual | Diagnostic |
|---|---:|---:|---|
| M1 happy cell: five diagnostics + fixture ID/hash all pass, rephrased | 0 | 1 | `M1 ... HAPPY canonical cell mismatch` |
| M2 fallback: design-reading preserved; provisioning/real-cost evidence lost, reordered | 0 | 1 | `M2 ... FALLBACK canonical cell mismatch` |
| Accessibility: captions/transcripts still affirmatively delivered, rephrased | 0 | 1 | `accessibility policy canonical line mismatch` |
| Week 4 LO2: same health/safety-boundary check with phrase order changed | 0 | 1 | `week 4 canonical operation contract mismatch` |

All controls ran on `Dir.mktmpdir` copies and were automatically removed. The real target hash did not change.

## Checked artifact paths

- `.omo/plans/hoseo-data-analysis-cloud-platform-course.md` (full Scope, Verification, Todos, Final wave, Success)
- `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` (full target)
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.log`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/corrupt-syllabus.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-validation.log`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-adversarial-matrix.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-adversarial-verify-v4.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-protected-sha256.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-*`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-2-course-contract.md` and its check/adversarial receipt
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-3-ncp-module.md` and its check/adversarial receipt
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-4-hermes-cti-module.md` and its check/adversarial receipt
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-5-wiki-ua-graph-module.md` and its check/adversarial receipt
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-6-governance-assessment.md` and its check/adversarial receipt
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-7-assembly-check.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-7-adversarial-verify-v2.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/final-gate/code-quality-review.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course-code-review.md`

## Exact evidence gaps

- A fresh, independent code-quality report bound to checker SHA `de2cd490ff6f38289e25162ba68be640646682c80676c57854f6c5623e8f8241` and target SHA `d062c7427f7b8a715f357f7d6f7e307f677fcd3b455c9b709c899ef192d52bee` is missing.
- The current regression harness needs positive controls for meaning-preserving edits of milestone, fallback, policy, and operational-week content; harmful negative controls alone cannot detect snapshot overfit.
- The checker must stop duplicating unrestricted Korean prose as the acceptance mechanism. Stable structural IDs/sets/arithmetic/schema tokens should remain automated; open-ended Korean meaning should be independently reviewed or encoded through a bounded machine-readable contract.

No syllabus, checker, plan, ledger, Boulder state, protected path, or external operational state was modified by this audit.
