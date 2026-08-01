# F1 v4 — 계획 준수 및 평가 정렬 최종 감사

```yaml
recommendation: REJECT
review_mode: read-only
review_commit_sha: 8857bdd924bc0e155b7dd64a8a471692b7b7ab85
target: output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
target_sha256: 75df0f2733c5bf898b78ee531cbc13700aafcc359b4f7ea15d3a0c296d2c1e51
checker: .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb
checker_sha256: efab908d52db0049be5d7f1afaf7d78f814bbd9dc9360fe802c1577cfe2041cd
regression_sha256: c5faba61f79a29a0b11a43e6bb953409a3b25263af88d0567c641707baef9bc8
only_persistent_write: .omo/evidence/hoseo-data-analysis-cloud-platform-course/F1-plan-compliance-v4.md
```

## blockers

1. **현재 checker에는 의미 보존 한국어 수정 네 종류를 거절하는 natural-language token overfit이 남아 있다.** 독립 임시 복사본에서 실제 의미, YAML typed contract, 안정 ID, 수치와 안전 극성을 유지한 채 (a) 4주의 `headless`를 `GUI 없는`으로, (b) 7주의 `changed/no-change/semantic-failure`를 `변경·무변경·의미 검증 실패`로, (c) UA의 `partial/stale`를 `부분 실행/오래된`으로, (d) graph `relation`을 `관계`로 바꾸었더니 모두 예상 exit 0 대신 exit 1이었다. 실패 위치는 checker 163, 165, 167–168, 171–172행이다. 이 네 검사는 typed YAML 및 안정 구조 계약과 별개인 개방형 산문을 구현 상수로 고정하며, `remove-ai-slops`와 `programming`의 prose-pin/implementation-mirroring/거짓 확신 금지 기준을 위반한다.
2. **현재 target/checker 쌍에 결합된 code-quality review가 없다.** 현재 checker SHA를 기록하는 파일은 F2/F3, Task 8 및 global runtime/QA receipts뿐이다. `.omo/evidence/hoseo-data-analysis-cloud-platform-course-code-review.md`는 checker `4eb64f0e...`에 대한 `FAIL`, `final-gate/code-quality-review.md`는 checker `b5923d58...`에 대한 `FAIL`이다. `F2-source-fidelity-v3.md`는 현재 SHA와 두 skill을 언급하지만 명시적으로 문서 출처 lane만 검토하며 checker/test 유지보수성 검토를 수행하지 않는다. 따라서 필수 code-review report의 동일 skill 관점과 overfit/slop coverage가 현재 빌드에 대해 absent/unsupported다.

## originalIntent

호서대학교 컴퓨터공학과 4학년이 공개 CTI 원본에서 NCP/Linux, 안전한 Hermes 자동화, 재현 가능한 CTI 정규화, LLM Wiki, UA 지식그래프, 출처 대조 그래프 분석까지 하나의 증거 계보로 학습하는 한국어 15주 수업계획서 한 건을 제공하는 것이 원래 의도다. live 환경이 막혀도 보존 역량과 상실 역량을 정직하게 구분한 fixture 평가가 가능해야 하며, 출석 20%·중간 40%·기말 40%와 두 개인 실기시험이 LO1–LO5에 정렬되어야 한다.

## desiredOutcome

사용자가 바로 검토하고 강의 준비에 사용할 수 있는 단일 GFM 수업계획서와, 의미를 훼손한 변경은 거부하면서도 안전하고 의미가 같은 한국어 수정은 허용하는 유지보수 가능한 local/read-only 검증 체계가 함께 있어야 한다. 기존 raw/canonical/wiki/UA/output와 NCP/Hermes/cron 외부 상태는 바뀌지 않아야 한다.

## userOutcomeReview

수업계획서 본문 자체는 사용자 가시 결과를 충족한다. 독립 파서는 정확한 H2 10개, 15주, 13개 `60분 비동기 동영상 + 120분 대면 실습` 주차, 8·15주 개인 실기시험, W01–W15 순서, LO1–LO5, 20/40/40, 중간 10+10+12+8, 기말 10+10+10+10, M1–M7/49개 역할 ID, 여섯 fallback을 확인했다. 수동 검토에서도 live/fixture 주장 한계, individual evidence, 공개 데이터, offensive activity 금지, credential/PII 경계, 접근성, 비용·teardown, dated source/ATT&CK refresh, UA freshness, graph source-check가 서로 정렬된다.

그러나 전달물에는 plan이 요구한 checker와 회귀 증거도 포함된다. 현재 checker는 정확한 현재 문서를 통과시키고 harmful controls도 잘 거절하지만, 의미가 같은 정상 한국어 수정을 네 종류나 잘못 거절한다. 최신 code-quality report도 없다. 따라서 학생·교수자용 본문은 준비됐지만 전체 완료 증거는 승인할 수 없다.

## Build identity and exact executions

| Check | Exact invocation / observable | Exit | Result |
|---|---|---:|---|
| Vault | `pwd -P` | 0 | `/Users/sysmoon/.codex/projects/pkm-study` |
| HEAD | `git rev-parse HEAD` | 0 | exact `8857bdd924bc0e155b7dd64a8a471692b7b7ab85` |
| Hashes | `shasum -a 256 <target> <checker> <regression>` | 0 | exact pinned target/checker; regression `c5faba61...9bc8` |
| Required checker | `ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` | 0 | `PASS headings=10 weeks=15 topic_ids=15 milestones=7 evidence_ids=49 fallbacks=6 weights=20/40/40 rubrics=40/40 contract=PASS` |
| Required regression | `ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb` | 0 | 78/78 expected exits matched: valid + 7 positives accepted, 70 harmful mutations rejected |
| Required Pandoc | `pandoc -f gfm -t html5 output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md -o /tmp/hoseo-f1.html` | 0 | 53,501 bytes; 10 H2 and 11 tables |
| Required Glow | `NO_COLOR=1 glow -w 160 -s dark output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md >/tmp/hoseo-f1.txt` | 0 | 105,263 bytes/551 lines; no ellipsis; assessment, both rubrics and typed contract found on rendered surface |
| Independent parser | Ruby 2.6-compatible H2/table/set/YAML parser over the target | 0 | `INDEPENDENT_CONTRACT_PASS ... headings=10 weeks=15 instructional=13 exams=8,15 topics=15 los=5 weights=20/40/40 ... evidence_ids=49 fallbacks=6 typed_contract=PASS` |
| Protected state | Ruby `Digest::SHA256` recomputation of `task-1-protected-sha256.txt` plus fresh scope set | 0 | baseline 142/current 143; 0 missing, 0 mismatch; sole addition is target |
| Corrupt fixture | `ruby <checker> .omo/evidence/.../corrupt-syllabus.md` | 1 | reports missing week 8 and grading mismatch, plus dependent failures |
| Whitespace | `git diff --no-index --check /dev/null <target>` | 1 | normal new-file difference exit; diagnostic bytes 0 |
| Independent safe/harmful probes | Ruby `Dir.mktmpdir` + `Open3.capture2e('ruby', checker, copy)` | mixed | harmful YAML/weight/script 4/4 rejected; safe paraphrases 4/5 wrongly rejected |

The first independent parser attempt used Ruby's unavailable `filter_map` and failed with `NoMethodError`; the complete parser was rewritten with Ruby 2.6-compatible `map(...).compact` and rerun from the beginning. The failed harness attempt is not counted as product evidence.

## Must-have checklist

| ID | Requirement | Result | Direct evidence |
|---|---|---|---|
| MH-01 | Exactly one Korean external deliverable at the required path | PASS | target is UTF-8/LF/final-newline Markdown; protected scope has exactly this one new output |
| MH-02 | Ten unique required top-level sections | PASS | exact ordered H2 set, count 10 |
| MH-03 | Five observable LO1–LO5 used in outcomes, schedule and assessment | PASS | five observable definitions plus schedule/assessment occurrence and mapping rows |
| MH-04 | 15 weeks; 13×60+120; weeks 8/15 three-hour individual exam-only | PASS | independent row parser: `15/13/[8,15]` |
| MH-05 | Fixed weekly topic sequence | PASS | exact ordered W01–W15 topic IDs and manual topic review |
| MH-06 | 20/40/40; formative 2–3-person work unweighted; individual exam evidence | PASS | exactly three weighted identities; no project percentage; individual evidence explicit |
| MH-07 | Midterm 10+10+12+8=40 | PASS | named rows and arithmetic independently parsed |
| MH-08 | Final 10+10+10+10=40 | PASS | named rows and arithmetic independently parsed |
| MH-09 | Six honest live/fallback paths; Docker Hermes persistence fixture-only | PASS | exact six complete rows plus platform table and lost/allowed claims |
| MH-10 | ATT&CK v19.1 dated fixture, current check and non-silent refresh | PASS | `as_of: 2026-07-29`, `official_latest: v19.1`, four-step refresh procedure |
| MH-11 | Captions/transcripts/accessibility, public CTI, secrets, retention/deletion, NCP cost/teardown, fixture metadata | PASS | schedule preface, safety policy, fallback/fixture contract and preflight |
| MH-12 | Tests-after local/read-only verification only | PASS | Ruby/Pandoc/Glow/hash reads only; no cloud/agent/cron/live API/wiki/UA mutation |

## Must-NOT checklist

| ID | Guardrail | Result | Direct evidence |
|---|---|---|---|
| MN-01 | No real NCP/Hermes/cron/UA operation | PASS | inspected receipts and process/state boundary; all fresh checks local |
| MN-02 | No protected raw/canonical/schema/index/log/UA/existing-output mutation | PASS | 142/142 hashes match; exact path set has only the syllabus addition |
| MN-03 | No malware/PoC/scanning/victim logs/PII/credential scraping/automatic response assignment | PASS | explicit prohibition, typed false values and actual syllabus review |
| MN-04 | No graph inference as fact, unexplained composite risk, invented CVE→ATT&CK edge | PASS | verified/rejected boundary and explicit prohibition |
| MN-05 | No volatile price/catalog/API/release/graph count as permanent threshold | PASS | dated observations, refresh guidance and non-threshold graph language |
| MN-06 | No HA/multi-AZ/VPN/SOC/offensive/fine-tuning/separate graded-project scope expansion | PASS | full target review; none present |
| MN-07 | No stage/commit/revert/normalization of unrelated dirty state | PASS | staged diff empty; unrelated dirty paths preserved; protected hashes exact |

## Todo acceptance checklist

| Todo | Result | Independent evidence |
|---|---|---|
| 1 — baseline/source ledger | PASS | four nonempty artifacts; dated official-source fields; 142 sorted protected records; malformed URL nonzero and first-party fallback; fresh recomputation 0 mismatch |
| 2 — course contract | PASS | five LO headings/maps, seven diagnosis/remediation rows, exact instructional/exam schemas, 20/40/40, formative team and accessibility terms; missing-LO fixture rejected |
| 3 — NCP module | PASS | exactly weeks 2/3; eight fixture fields; restricted TCP 22; `0.0.0.0/0` failure; complete teardown/public-IP/residual-cost; Docker fixture-only |
| 4 — Hermes/CTI/midterm | PASS | weeks 4–8; 10/10/12/8; raw/normalized/dedupe/status contracts; 5/30s, 50/30s, six-second bounded retry; trigger/skip/semantic failure and last-good |
| 5 — Wiki/UA/graph/final | PASS | weeks 9–15; four tens; live/fallback invariants; complete-batch/freshness; projection and metric policies; lineage, verified insight and rejected inference |
| 6 — governance/fallback | PASS | exactly three weighted rows totaling 100; six complete fallback rows; individual evidence, policy-owned retention/deletion, safety and accessibility; blank lost-competency fixture rejected |
| 7 — single-writer assembly | PASS | preflight six briefs, exact current target hash and independently validated current content. T7 v3's checker reference is stale (`de2cd...`) but its target hash is current; current validation is supplied by T8 v5 and this audit |
| 8 — validation and render | **FAIL** | mechanical criteria all pass, but validation quality fails the mandatory direct slop/overfit gate: four safe paraphrases are false negatives and no current-SHA code-quality approval exists |

## Success criteria checklist

| ID | Success criterion | Result | Evidence |
|---|---|---|---|
| SC-01 | Single GFM deliverable readable in terminal | PASS | target, Pandoc and Glow surfaces |
| SC-02 | 15 unique weeks, 13 instructional, exams 8/15, fixed topics | PASS | independent table/topic parser |
| SC-03 | Observable/assessed LO1–LO5 and consistent grading/rubrics | PASS | outcomes/schedule/assessment alignment below |
| SC-04 | Five technologies with artifacts, happy/failure evidence and safety | PASS | schedule and M1–M7 manual semantic review |
| SC-05 | Six honest fallbacks; Docker does not overclaim Hermes persistence | PASS | exact matrix and platform rows |
| SC-06 | CTI provenance/normalization/idempotency/API/ATT&CK currency without offense/unstable claims | PASS | manifest/schema/NVD/source/policy sections |
| SC-07 | Complete UA structural/freshness contract | PASS | live/fallback prose plus typed `accept:false`, `exit:nonzero` |
| SC-08 | Graph projection policies, three metric families, verified/rejected conclusions | PASS | weeks 12–14, M7 and graph-analysis fallback |
| SC-09 | Protected manifests match; no forbidden mutation | PASS | 142 baseline paths, 0 missing/mismatch; staging empty |
| SC-10 | Todo 8 and final verification complete before user acceptance | **FAIL** | this F1 rejects the current validation artifacts. This result does not depend on an absent future global-review stamp or unrelated notepad |

## LO and assessment alignment

| LO | Observable outcome and course evidence | Assessment route | Result |
|---|---|---|---|
| LO1 | Live NCP provision/ACG/SSH/cost/teardown or honest fixture design validation without provisioning claim; weeks 2,3,8 | midterm environment/network 10; troubleshooting/safety also exercises LO1 | PASS |
| LO2 | Non-root Hermes health, minimal allowlist, changed/no-change/semantic failure and last-good recovery; weeks 4,7,8 | midterm Hermes 10 plus troubleshooting/safety 8 | PASS |
| LO3 | Public CTI manifest, normalization, uppercase CVE join, dedupe/status/rate failure; weeks 1,5–9,14 | midterm CTI quality 12 plus troubleshooting/safety 8 | PASS |
| LO4 | Immutable raw, canonical lint, live/fallback UA structural/freshness validation; weeks 1,9–11,14,15 | final Wiki 10 and UA 10; recovery shared with final interpretation | PASS |
| LO5 | Directed/raw provenance and simple undirected projection, three metric families, source-checked conclusion; weeks 12–15 | final metric reproducibility 10 and interpretation/recovery 10 | PASS |

Attendance evidence supports preparation but the syllabus explicitly prevents attendance or team output from substituting for missing technical evidence. No LO is assessed only through attendance.

## YAML contract and prose consistency

The current artifact's typed values and actual prose agree:

- UA partial/stale artifacts: `accept: false`, nonzero rejection, complete-batch/freshness prose.
- Graph inference: `fact: false`; source proof before checked conclusion and rejected inference otherwise.
- Accessibility: captions, transcripts and alternative material are all true and affirmatively provided.
- Offensive controls: malware, exploit PoC, active scanning and automatic response are false/prohibited.
- Untrusted external content: execution false; external/raw/LLM/graph text is data-only.
- Credentials: prompt/log/history false; redaction and stop/replace behavior explicit.
- Hermes: separate messaging/browser approval, workspace allowlist, one local-only gateway, trusted gate outputs.
- NVD: pagination fields, six-second minimum, three retries, deferred state and last-good preservation.
- Milestone roles and fallback columns/tracks match the visible tables exactly.

No harmful prose/YAML polarity contradiction exists in the current syllabus. The rejection concerns checker maintainability and evidence quality, not a current syllabus safety defect.

## Direct `remove-ai-slops` and `programming` pass

Both skill files were read completely before review. Scope was the target, production checker, regression harness, Task 7 v3, Task 8 v5, F1 v2, current F2/F3 v3 and available code-quality reports.

- `syllabus_check.rb` is 188 pure LOC and `task-8-regression.rb` is 120 pure LOC; neither crosses the 250-LOC defect ceiling. They are deterministic and single-purpose. The checker has no network, shell, eval, broad exception swallowing, dead helper or speculative abstraction. The harness uses `Open3` only to exercise the actual CLI in isolated temp copies.
- The current repair removed whole-cell/full-line Korean snapshots and the obsolete 49/36 prose mutation loops. Typed YAML parsing, exact sets, arithmetic, schema IDs, active-content guards and malformed input checks are justified machine or boundary contracts.
- No deletion-only test, tautological expected value derived from the checker output, implementation duplicate of a real algorithm, unnecessary production extraction/normalization, sleep, network dependency or flaky timing was found.
- **Unresolved slop remains at checker lines 163–172.** These checks require incidental English/natural-language tokens even when the typed values and educational meaning are preserved. The current harness's week-4 positive merely reorders the same English tokens and does not test Korean replacement; it has no equivalent positive for the week-7 state phrase, UA phrase or graph `relation` label. Fresh probes produced four false negatives. These implementation-mirroring prose pins create maintenance burden and a misleading all-green 78-control result.
- The required code-review report coverage does not exist for the current hash. F2 v3's skill paragraph explicitly treats the checker as outside its source-fidelity lane, so it cannot substitute for code review.

## Manual QA and UltraQA

| Class | Fresh observation | Result |
|---|---|---|
| Required four commands | checker/regression/Pandoc/Glow exits `0/0/0/0` | PASS |
| Rendered contract/rubrics | stripped Glow surface found 평가 방법 line 68, midterm rubric 78, final rubric 88, contract 437, typed keys 442–480 | PASS |
| Malformed input | missing path/invalid UTF-8 controls in regression; corrupt copy exit 1 with missing exam and grading errors | PASS |
| Harmful mutation | YAML UA accept, graph fact, extra weighted row and active script all exit 1 | PASS |
| Safe paraphrase | five independent meaning-preserving cases; data-only rewrite passes, four other valid rewrites exit 1 | **FAIL** |
| Stale hashes | HEAD/target/checker match pins; 142 protected hashes match. T7 v3 checker hash is historical and not treated as current validation | PASS with documented stale receipt |
| Dirty worktree | extensive baseline dirt remains untouched; protected set exact; staged diff empty | PASS |
| Misleading PASS | exact current document and 78 harness cases are green, but the four missing positive classes prove false-negative overfit | **FAIL** |
| Interrupted prior receipts | Task 1 interruption/hook history and older checker receipts were read as history, not trusted as current proof; fresh checks reran from pinned files | PASS |
| Prompt injection | N/A as an execution surface; external text is treated as inert data and active HTML/URI mutants are rejected | N/A / bounded control PASS |
| Long/hung/flaky | local deterministic checks only; no sleep, server, polling or remote job | N/A |

## Checked artifact paths

- `.omo/plans/hoseo-data-analysis-cloud-platform-course.md` — full Scope, Verification strategy, Todos, Final wave and Success criteria.
- `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` — full target.
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb`.
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb` and `task-8-regression.log`.
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-baseline-status.txt`, `task-1-protected-sha256.txt`, `task-1-source-ledger.md`, `task-1-failure.txt`.
- Task 2 course contract, positive receipt and missing-LO negative fixture.
- Task 3 NCP module and check receipt.
- Task 4 Hermes/CTI module and check receipt.
- Task 5 Wiki/UA/graph module and check receipt.
- Task 6 governance/assessment brief and check receipt.
- `task-7-assembly-check.txt` and `task-7-adversarial-verify-v3.md`.
- `task-8-validation.log`, `task-8-adversarial-matrix.md`, `task-8-yaml-contract-repair.md`, `task-8-protected-sha256.txt`, `task-8-adversarial-verify-v5.md`, `task-8-syllabus.html`, `task-8-render.txt`, and `corrupt-syllabus.md`.
- `F1-plan-compliance-v2.md`, `F2-source-fidelity-v3.md`, and `F3-scenario-audit-v3.md`.
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course-code-review.md` and `final-gate/code-quality-review.md`.
- `SCHEMA.md`, `index.md`, and the latest 20–30 `log.md` entries for repository boundaries.

## Exact evidence gaps

1. A current independent code-quality report bound to target SHA `75df0f27...1e51` and checker SHA `efab908d...1cd`, explicitly applying both required skill perspectives and overfit/slop criteria, is missing.
2. The persistent regression suite lacks safe positive controls for the four false-negative classes demonstrated here: translated/rephrased week-4 `headless`, week-7 state labels, UA partial/stale terminology and graph relation terminology.
3. Checker lines 163–172 still need to stop treating incidental natural-language/English spellings as acceptance contracts. Stable typed values/IDs should carry automation; open Korean meaning should be reviewed semantically or represented by additional bounded machine fields.

## Cleanup and scope receipt

All independent mutation copies used `Dir.mktmpdir('hoseo-f1-overfit-')` and were removed automatically. The required `/tmp/hoseo-f1.html`, `/tmp/hoseo-f1.txt`, corrupt output and whitespace output were removed with exact `/bin/unlink` targets. A final `/private/tmp` scan found zero `hoseo-f1*` paths. The final hygiene check found zero staged changes and zero running Ruby/Pandoc/Glow processes. Target and checker hashes remained exact after cleanup.

Two earlier cleanup shell attempts were invalid and are not counted as evidence: the first used zsh's reserved `path` variable and lost command lookup; the second referenced nonexistent `/usr/bin/unlink`. The corrected `/bin/unlink` run and subsequent independent absence/process/staging checks are the cleanup evidence.

No syllabus, checker, regression, plan, ledger, Boulder state, canonical/raw/generated path or external operational state was modified by this audit. This report is the only persistent write.
