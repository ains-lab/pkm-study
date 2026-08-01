# F1 v5 — plan compliance and assessment-alignment audit

```yaml
recommendation: APPROVE
verdict: PASS
confidence: high
review_mode: read-only
reviewed_head: 8857bdd924bc0e155b7dd64a8a471692b7b7ab85
target: output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
target_sha256: 65ed06d96716202509679a3a3ef57c4a0d446c2bb77998a454ed2885d2123d66
checker: .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb
checker_sha256: 487470cea93eeb62ca199216f4db0385a3816a40428d725f5a9f419a9520f5ba
harness: .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb
harness_sha256: ba031c00f4382d0e78408a0e1a9e17c410b561fae18e9b6afcbebabde5258dab
owned_persistent_writes:
  - .omo/evidence/hoseo-data-analysis-cloud-platform-course/F1-plan-compliance-v5.md
  - .omo/evidence/hoseo-data-analysis-cloud-platform-course/global-final-v4/goal-constraint-review.md
```

## Findings first

**APPROVE / PASS.** No blocker remains in the current exact-hash F1 scope. The syllabus satisfies every assigned Must-have, Must-NOT, Todo acceptance, learning-outcome, assessment, fallback, semantic, and user-visible success requirement. The current checker intentionally limits its success claim to machine-consumed structure and prints `prose_semantics=REVIEWED_EXTERNALLY`; this audit independently read the complete Korean document and found the prose consistent with its typed YAML contract and the plan.

The global-final-v3 blockers are resolved in the current artifacts:

- The brittle Korean polarity oracle is gone. Eight retained, non-no-op Korean paraphrases pass, including the four classes that F1 v4 rejected.
- The harness has 38 distinct documents, enforced by duplicate-name, no-op, and duplicate-body guards; no duplicate test pair remains.
- Result channels are strict: accepts require one complete PASS line and empty stderr; rejects require nonzero, empty stdout, `FAIL:`-only stderr, and no traceback.
- Fixed-point HTML-entity decoding rejects active content at shallow and deep encodings, with explicit 64-round and 1,000,000-byte fail-closed bounds.
- Contract cardinality, table-header order, typed Hermes fields, 49 milestone-role placements, and all 36 fallback-role placements are bound structurally.

No current sibling stamp or notepad was required by this assigned lane. Aggregate orchestration can consume this report after its own independent lanes finish; their future presence is not a condition of this F1 verdict.

## originalIntent

Provide exactly one Korean GFM syllabus for HoSeo University fourth-year computer-science students. The course must teach one cumulative evidence lineage from NCP/Linux and safe Hermes automation through public CTI provenance and normalization, LLM Wiki, UA knowledge-graph validation, reproducible graph analysis, and source-checked conclusions. Live outages must have honest, capability-bounded fallback assessment routes. Evaluation must use attendance 20%, a 40-point individual midterm, and a 40-point individual final without a separately weighted team project.

## desiredOutcome

The user receives a readable, immediately reviewable 15-week teaching plan with ten required sections; five observable and assessed outcomes; 13 instructional 60+120 weeks; individual exams in weeks 8 and 15; safe operational rules; concrete artifacts and failure evidence; exactly six live/fallback tracks; dated fixture/source policy; and a local read-only validator that proves stable machine contracts without freezing open Korean prose.

## userOutcomeReview

The shipped document achieves that outcome. The visible sequence is coherent for a fourth-year audience: orientation and provenance (week 1), NCP/Linux (2–3), Hermes and CTI (4–7), individual midterm (8), LLM Wiki and UA (9–11), graph modeling and source-checked analysis (12–13), end-to-end recovery/teardown (14), and individual final (15). Each week exposes prerequisites, LO, artifact, happy/failure path, fallback, safety/cost boundary, and assessment route. The document never treats a fallback as evidence of a capability it cannot demonstrate.

## Build identity and fresh execution evidence

| Check | Exact invocation | Exit | Observable |
| --- | --- | ---: | --- |
| Vault and HEAD | `pwd -P`; `git rev-parse HEAD` | 0 / 0 | Correct vault; exact assigned HEAD |
| Artifact identity | `shasum -a 256 <target> <checker> <harness>` | 0 | All three exact assigned SHA-256 values |
| Ruby syntax | `ruby -c <checker>`; `ruby -c <harness>` | 0 / 0 | `Syntax OK` twice |
| Production checker | `ruby <checker> <target>` | 0 | `PASS ... machine_contract=PASS prose_semantics=REVIEWED_EXTERNALLY` (169-byte stdout, empty stderr) |
| Regression harness | `ruby <harness>` | 0 | 38/38 verdicts pass; `total=38 expected_accept=10 expected_reject=28 distinct=38` |
| Independent structure parser | Ruby 2.6-compatible H2/table/set/YAML parser over target | 0 | `h2=10 weeks=15 instructional=13 exams=8,15 topics=15 los=5 weights=20/40/40 mid=10+10+12+8 final=10+10+10+10 milestones=7 milestone_ids=49 fallbacks=6 fallback_ids=36 yaml_contract=Hash` |
| Failure control | `ruby <checker> corrupt-syllabus.md` | 1 | Reports exact-week, missing week 8, topic, exam-format, and grading failures |
| Pandoc | `pandoc -f gfm -t html <target>` captured in memory | 0 | 56,193 bytes, 10 H2, 11 tables, zero rendered active-content match |
| Glow 160 | `NO_COLOR=1 COLUMNS=180 glow -s dark -w 160 <target>` | 0 | 107,965 bytes, 565 lines, required visible anchors, zero ellipsis |
| Glow 400 | `NO_COLOR=1 COLUMNS=420 glow -s dark -w 400 <target>` | 0 | 150,759 bytes, 331 lines, required visible anchors, zero ellipsis |
| Whitespace | `git diff --no-index --check /dev/null <target>` | 1 expected | 0 diagnostic bytes; exit 1 is the normal no-index added-file status |
| Protected state | Ruby `Find` + `Digest::SHA256.file` against Todo 1 manifest | 0 | expected 142, current 143, missing/removed/mismatch 0; sole addition is target |
| Staging | `git diff --cached --name-only` | 0 | 0 paths |
| Sensitive data | Bounded seven-class scan over target/checker/harness | 0 | 0 matches; all 20 Markdown destinations use HTTPS |

The first independent parser attempt used Ruby's unavailable `filter_map` and exited 1 before evaluating the document. The full parser was rewritten for Ruby 2.6 and rerun from the beginning; only the successful complete run above is evidence. Two early Glow-inspection helpers also made incorrect assumptions about non-TTY capture and wrapped W08/W15 IDs; the final real redirected 160/400 runs inspected visible wrapped anchors and cleaned their exact temporary directory. Those were reviewer-harness corrections, not product failures.

## Must-have checklist

| ID | Requirement | Verdict | Exact evidence |
| --- | --- | --- | --- |
| MH-01 | Exactly one Korean external deliverable at the required path | PASS | UTF-8/LF/final newline; protected scope has only this output addition |
| MH-02 | Ten exact, unique, ordered H2 sections | PASS | Independent parser: 10 and exact order |
| MH-03 | Observable LO1–LO5 in outcomes, schedule, and assessment | PASS | Five definitions at target lines 38–42; independent coverage and mapping check |
| MH-04 | Fifteen weeks; 13 instructional 60+120 rows; exam-only 8/15 | PASS | Independent week parser: 15 / 13 / `[8,15]` |
| MH-05 | Fixed week-1-through-week-15 topic sequence | PASS | Exact ordered W01–W15 slugs, one each |
| MH-06 | 20/40/40; unweighted 2–3-person formative work; individual exam evidence | PASS | Exactly three weighted rows; no project percentage; individual evidence explicit |
| MH-07 | Midterm rubric 10+10+12+8=40 | PASS | Independently parsed named rows and sum |
| MH-08 | Final rubric 10+10+10+10=40 | PASS | Independently parsed named rows and sum |
| MH-09 | Six honest live/fallback paths; Docker Hermes persistence fixture-only | PASS | Six complete rows, 36 correctly placed IDs, explicit lost/allowed claims |
| MH-10 | ATT&CK v19.1 dated fixture and non-silent refresh | PASS | `as_of: 2026-07-29`, `official_latest: v19.1`, four-step refresh process |
| MH-11 | Accessibility, public CTI, credential, retention/deletion, NCP cost/teardown, fixture metadata | PASS | Schedule preface; target safety, fallback, preflight, and source sections |
| MH-12 | Tests-after, local/read-only verification only | PASS | Checker/harness/Pandoc/Glow/hashes only; no external operational mutation |

## Must-NOT checklist

| ID | Guardrail | Verdict | Evidence |
| --- | --- | --- | --- |
| MN-01 | No real NCP/Hermes/cron/UA operation | PASS | No such command or process in current review; task evidence is design/read-only |
| MN-02 | No protected raw/canonical/schema/index/log/UA/existing-output mutation | PASS | 142 expected hashes; zero missing, removed, or mismatched paths |
| MN-03 | No malware, exploit PoC, active scanning, victim logs, PII, credentials, scraping, or automatic response assignment | PASS | Explicit Korean prohibition and typed `false` values; direct semantic review |
| MN-04 | No inferred relation as fact, composite unexplained risk score, or invented CVE→ATT&CK fact edge | PASS | Source-check/rejected-inference contract and explicit prohibition |
| MN-05 | No volatile price/catalog/API/release/graph count as permanent threshold | PASS | Dated observations and refresh rules; graph counts are non-threshold context |
| MN-06 | No HA, multi-AZ, VPN/bastion, production SOC, offense, tuning, or separately graded project | PASS | Complete target read; none introduced |
| MN-07 | No stage/commit/revert/normalization of unrelated dirty state | PASS | Staging 0; protected hashes exact; baseline dirty state retained |

## Todo acceptance checklist

| Todo | Verdict | Inspected evidence and result |
| --- | --- | --- |
| 1 — baseline/source ledger | PASS | Four nonempty artifacts; dated first-party ledger; invalid URL nonzero; 142-row manifest recomputes exactly |
| 2 — course contract/outcomes/prerequisites | PASS | Five LO briefs; seven diagnosis/remediation rows; exact schedule/exam schemas; missing-LO negative receipt |
| 3 — NCP module | PASS | Weeks 2–3; restricted TCP 22; `0.0.0.0/0` rejection; teardown/public-IP/cost; Docker limits |
| 4 — Hermes/CTI/midterm | PASS | Weeks 4–8; non-root/headless/doctor/one gateway; raw/normalized/dedupe; 5/30s, 50/30s, six-second pacing, three retries; 40-point rubric |
| 5 — Wiki/UA/graph/final | PASS | Weeks 9–15; lint-before-UA; live/fallback invariants; projection and three metric families; 40-point rubric and lineage |
| 6 — governance/fallback | PASS | Exactly three weighted categories totaling 100 and six complete fallback rows; blank Hermes lost-competency negative rejected |
| 7 — assembly | PASS | Current target is the single writer's complete document; T7 v4 independently binds the same target hash and passes parser/Pandoc/Glow/protected checks |
| 8 — validation | PASS | Current exact checker/harness hashes; 38 distinct controls; malformed/entity/contract/table/ID/schema negatives and eight safe Korean paraphrases; T8 v9 independently confirms |

## Success criteria checklist

| ID | Criterion | Verdict | Evidence |
| --- | --- | --- | --- |
| SC-01 | Single GFM deliverable readable in terminal | PASS | Exact target, Pandoc, Glow 160/400 |
| SC-02 | Fifteen unique weeks, 13 instructional rows, exams 8/15, fixed topics | PASS | Independent parser |
| SC-03 | Observable/assessed LO1–LO5 and exact grading/rubrics | PASS | Outcome/assessment table and arithmetic |
| SC-04 | Requested technology progression with concrete artifacts, happy/failure evidence, safety | PASS | Schedule plus M1–M7 direct semantic review |
| SC-05 | Honest six-row fallback matrix and Docker boundary | PASS | Six rows and 36 role IDs in correct semantic columns |
| SC-06 | CTI provenance, normalization, idempotency, API hygiene, fixture currency | PASS | Raw/schema/state/NVD/source sections |
| SC-07 | Complete UA structural/freshness contract | PASS | Live/fallback prose plus typed `accept: false`, `exit: nonzero` |
| SC-08 | Declared graph projection and three metric families plus verified/rejected conclusions | PASS | Target lines 132–134 and weeks 12–14/M7 |
| SC-09 | Protected manifests match and no forbidden mutation | PASS | `142/143`, sole target addition, staging 0 |
| SC-10 | Assigned final verification lane supplies an evidence-backed decision before user acceptance | PASS | This current F1 report approves; future sibling stamps were expressly excluded from this lane's prerequisites |

## LO and assessment alignment

| LO | Observable competency | Individual assessment route | Verdict |
| --- | --- | --- | --- |
| LO1 | Configure/validate NCP/Linux evidence or honestly validate the NCP fixture without a provisioning claim | Midterm NCP/fallback environment and network 10; troubleshooting/safety also exercises LO1 | PASS |
| LO2 | Inspect safe Hermes boundaries and distinguish changed/no-change/semantic failure with last-good recovery | Midterm Hermes 10 plus troubleshooting/safety 8 | PASS |
| LO3 | Record and normalize public CTI; reproduce join/dedupe/state/rate-limit handling | Midterm CTI quality 12 plus troubleshooting/safety 8 | PASS |
| LO4 | Lint evidence-preserving Wiki content and generate/validate live or pinned-fallback UA with honest limits | Final Wiki 10 and UA 10; recovery also exercises LO4 | PASS |
| LO5 | Reproduce directed/projection metrics and classify source-verified insight versus rejected inference | Final metric 10 and interpretation/recovery 10 | PASS |

Attendance supports preparation but cannot substitute for missing technical evidence. Team work cannot replace an individual's exam artifacts. No LO is assessed only through attendance.

## Machine-contract and Korean-prose consistency

| Contract domain | Typed value | Independent visible-prose finding | Verdict |
| --- | --- | --- | --- |
| UA partial/stale | accept `false`, exit `nonzero` | Partial/stale/batch/dangling failures block merge and require nonzero validation | PASS |
| Graph inference | fact `false` | Relations remain hypotheses until source proof; unsupported claims become rejected inference | PASS |
| Accessibility | captions/transcripts/alternative `true` | All asynchronous videos supply captions, transcripts, and accessible alternatives | PASS |
| Offensive actions | four values `false` | Malware, PoC, scanning, and automatic response are not assignments or automation targets | PASS |
| Untrusted external | execution `false` | Raw/web/LLM/graph text is data-only and never executed | PASS |
| Credentials | prompt/log/history `false` | Secrets are excluded and redacted; discovery stops submission and triggers replacement | PASS |
| Hermes | separate approval, allowlist, one local-only gateway, exact gate outputs, headless/doctor/KST/deny cron/three states/last-good | Lines 20, 93, 96, 152 and recovery prose agree without overclaiming fixture/Docker | PASS |
| NVD | pagination, 6 seconds, 3 retries, deferred state, last-good | Line 130 and recovery line 238 agree | PASS |
| Milestones/fallback | exact role/track arrays | Seven meaningful milestone rows and six honest fallback rows match role columns | PASS |

## Direct `remove-ai-slops` and `programming` pass

- Checker: 209 total / 192 pure lines. Harness: 102 total / 90 pure lines. Both are below the warning and defect thresholds.
- Each file has one bounded responsibility. The checker has no shell, network, eval, broad exception catch, external write, speculative abstraction, or prose semantic classifier. The fixed-point decode guard is a justified hostile-input boundary, not redundant defense.
- Exact headings, table identities/order, typed YAML, stable IDs, arithmetic, schemas, and source-ledger keys are machine-consumed contracts. They do not snapshot the entire file or claim to understand Korean meaning.
- The harness invokes the real CLI through `Open3.capture3`, asserts channel shape, rejects no-op and duplicate cases, and automatically removes `Dir.mktmpdir` fixtures. All 38 documents are distinct.
- No deletion-only test, test that merely verifies a requested removal, tautological self-comparison, implementation-derived expected value, snapshot, useless padding case, duplicate case, sleep, network dependency, or unnecessary production extraction/normalization remains.
- The ten accepted cases are useful anti-overfit controls: one valid target, eight meaning-preserving Korean rewrites, and one benign entity case. They test that unrelated prose changes do not alter machine-contract acceptance; they do not assert a natural-language sentence as the product contract.
- The 28 rejects cover distinct behavior classes: active-content decoding, contract cardinality/location/types, exact header/order and role placement, schedule/grading identities, and schema carry-through. This is bounded regression evidence rather than inflated removal-only coverage.

## ULTRAQA

| Class | Result | Fresh evidence |
| --- | --- | --- |
| Malformed input | PASS | Missing path, invalid UTF-8, 2,000-byte truncation, and corrupt syllabus exit 1 with bounded `FAIL:` diagnostics |
| Prompt injection | PASS within actual boundary | Passive HTML comment remains inert and accepted; checker has no execution/network route and explicitly defers prose semantics to this exact-hash review |
| Active content | PASS | Five-layer entity-encoded JavaScript exits 1; retained harness also covers raw/entity/data/srcdoc and deep-bound cases |
| Stale hashes | PASS | All three assigned hashes recomputed before and after QA |
| Dirty worktree | PASS with attribution | 53 status lines are visible; 142 protected paths match; sole protected-scope addition is target; staging 0 |
| Misleading success | PASS | Extra weighted row exits 1 with empty stdout; exact current PASS line is bounded to machine contract and states external prose review |
| Safe paraphrase tolerance | PASS | Independent translated week-7 state mutation exits 0; eight retained Korean paraphrases all exit 0 |
| Repeated interruption | PASS | Immediate SIGTERM yields signal 15; a clean rerun exits 0 with 39 lines and exact 38-control count |
| Long/hung | N/A | No required bounded local command hung |
| Flaky | N/A | No nondeterminism observed; immutable-input checks and full reruns were stable |

## Checked artifact paths

- `AGENTS.md`, `SCHEMA.md`, `index.md`, and the latest 20–30 `log.md` entries.
- `.omo/plans/hoseo-data-analysis-cloud-platform-course.md` in full.
- `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` in full.
- `syllabus_check.rb` and `task-8-regression.rb` in full.
- Todo 1 baseline/status/hash/ledger/failure artifacts.
- Todo 2–6 briefs and their positive/negative verification receipts.
- `task-7-assembly-check.txt` and `task-7-adversarial-verify-v4.md`.
- `task-8-validation.log`, `task-8-protected-sha256.txt`, `task-8-regression.log`, `task-8-adversarial-matrix.md`, `corrupt-syllabus.md`, and `task-8-adversarial-verify-v9.md`.
- F1/F4 historical reports and every `global-final-v3` report, treated as stale-hash failure history rather than current success evidence.
- `omo:review-work`, `omo:remove-ai-slops`, and `omo:programming` skill contracts.

## Exact evidence gaps

None within the assigned F1 scope. External live NCP/Hermes/API/UA execution is intentionally out of scope and is not needed to validate this static course-design deliverable. Future sibling gate stamps and a notepad path were explicitly excluded from this lane's prerequisites.

## Cleanup receipt

All fresh malformed, active, prompt, structural, safe-paraphrase, render, and interruption fixtures were created under exact `Dir.mktmpdir` or `mktemp -d /tmp/hoseo-f1v5-*` roots and removed. Final `/tmp` inspection found no matching reviewer path. Process inspection found no Ruby, Pandoc, or Glow process. Staging contains zero paths. Target/checker/harness hashes remained exact. No product, checker, harness, plan, ledger, Boulder state, protected path, external system, or unrelated dirty-worktree file was edited by this lane.

APPROVE
