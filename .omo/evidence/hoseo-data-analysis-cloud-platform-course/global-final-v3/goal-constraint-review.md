# Goal & constraint review — global final v3

```yaml
recommendation: REJECT
verdict: FAIL
confidence: high
review_commit_sha: 8857bdd924bc0e155b7dd64a8a471692b7b7ab85
target_sha256: 75df0f2733c5bf898b78ee531cbc13700aafcc359b4f7ea15d3a0c296d2c1e51
checker_sha256: efab908d52db0049be5d7f1afaf7d78f814bbd9dc9360fe802c1577cfe2041cd
```

## Findings and blockers

### HIGH — the checker still emits misleading success for material policy contradictions

The exact checker passed its retained 78-run harness, but a fresh black-box pass against isolated regular-file copies found eight ordinary Korean rewrites that preserve the checker's expected tokens while reversing the required behavior. Every case exited `0` and printed the complete `PASS headings=10 ... contract=PASS` line:

| Fresh mutation | Violated contract |
| --- | --- |
| Keep `data-only` wording, then state that an external command is called | Untrusted external input must never execute |
| Call a graph relation a hypothesis, then adopt it without evidence | Graph inference must not become fact without source verification |
| State captions/transcripts are provided, then deny students access | Accessibility materials must actually be available |
| Retain the prohibited-activity list, then run malware in the lab | Malware/offensive activity is excluded |
| Retain the credential prohibition, then copy an API key into the prompt | Credentials must not enter prompts/logs/history |
| Retain NVD retry words, then call requests immediately without pacing | Six-second pacing and bounded retry are required |
| Retain M6 `partial/stale`, `nonzero`, and rejection words, then declare actual validator success `(0)` | Partial/stale UA must fail nonzero |
| Retain the UA rejection sentence, then state that the actual result is success `(0)` | Visible prose must agree with the typed UA contract |

Exact execution was an inline Ruby runner using `Dir.mktmpdir`, `File.write`, and `Open3.capture2e('ruby', checker, path)` for each copy. Aggregate observable: `SLOP_FALSE_SUCCESS count=8`; runner exit `1`; the temporary directory was absent after the block. This directly violates the plan's failure-detection and semantic-assertion requirements and the `remove-ai-slops`/`programming` prohibition on implementation-mirroring tests that create false confidence.

A two-sided control also proved false rejection: moving the still-safe graph-hypothesis sentence from the data-only bullet into its own bullet exited `1` with `FAIL: graph prose contradicts inferred fact=false`. The implementation therefore recognizes a finite sentence layout, not the required meaning.

### MEDIUM — the advertised 78-control harness has only 76 distinct input bodies

Static evaluation of the harness definitions, before its execution loop, produced:

```text
HARNESS_STATIC mutants=70 positives=7 total_with_valid=78
duplicate_body_groups=2 duplicate_cases=4
```

The byte-identical duplicate pairs are:

- `schema-vulnerability-kev-date-added` and `schema-vulnerability-kev_date_added`
- `schema-vulnerability-kev-due-date` and `schema-vulnerability-kev_due_date`

Thus the command executes 78 result lines but only 76 distinct documents. These duplicate omission tests inflate coverage without exercising another behavior. The exact current code-quality reviewer independently confirmed both byte-identical pairs; this is unresolved regression-test slop.

### MEDIUM — current evidence makes incompatible checker-coverage claims

- The exact executable harness emitted 78 passing result lines in this review.
- `global-final-v3/debugging-runtime-audit.md`, while claiming the same target/checker hashes, says the persisted harness emitted 62 named controls.
- `global-final-v3/context-mining-review.md` says no implementation-mirroring test or slop was found, but the fresh eight false-success cases and two duplicate-body groups above directly contradict that statement.
- At the time this report was written, no exact-hash `global-final-v3/code-quality-review.md` artifact was present. Older code-quality reports bind superseded target/checker hashes and are historical only. A current security review is present and independently rejects the same exact build, but it does not replace the required code-quality report.

Counts and success prose therefore cannot support release approval. The aggregate gate must use a current code-quality artifact and reconcile the debugging count before any completion claim.

### Evidence input gap

No notepad path was supplied in the assignment, and a repository search found no notepad artifact for this goal. The course plan itself does not require a notepad, so this is not a syllabus-content defect; it remains an explicit gap against the final-gate input contract and cannot be silently inferred away.

## originalIntent

Deliver exactly one Korean external Markdown syllabus for HoSeo University fourth-year computer-science students. It must teach a cumulative path from NCP/Linux and safe Hermes automation through public CTI provenance/normalization, LLM Wiki, UA knowledge-graph validation, reproducible graph analysis, and source-checked conclusions. The design must preserve evidence, provide honest live/fallback assessment routes, use individual practical exams, and avoid cloud, Hermes, cron, UA, canonical-wiki, raw, protected-path, Git-stage, or external-state mutation during production and verification.

## desiredOutcome

The user should receive one readable GFM syllabus with ten required top-level sections; observable `LO1`–`LO5`; 13 instructional weeks plus exam-only weeks 8 and 15; grading of 20/40/40 with exact 40-point rubrics; six capability-bounded fallback tracks; fixed technology, safety, accessibility, teardown, fixture, and dated-source contracts; and an exact-build evidence chain that detects malformed and materially contradictory variants without pinning harmless Korean prose.

## userOutcomeReview

The exact syllabus text itself satisfies the visible course outcome. No material content omission was found.

### Fixed 15-week flow

| Weeks | Visible flow | Result |
| --- | --- | --- |
| 1–3 | orientation/diagnostic/provenance → cloud/NCP networking → NCP VM or approved fallback | PASS |
| 4–7 | safe Hermes install/operation → CTI sources/provenance → idempotent collector → scheduling/recovery/midterm rehearsal | PASS |
| 8 | three-hour individual midterm, no new lecture | PASS |
| 9–14 | LLM Wiki architecture → canonical lint → UA generation/validation → graph model/metrics → reproducible source verification → end-to-end recovery/teardown | PASS |
| 15 | three-hour individual final, no new lecture | PASS |

Independent parsing found weeks `[1..15]` in order; instructional weeks `[1..7,9..14]`; exam weeks `[8,15]`; and 15 unique `W01`–`W15` topic IDs.

### Goal and constraint coverage

| Contract | Direct result |
| --- | --- |
| Exactly one new product deliverable | PASS — protected scope has the 142 baseline files plus only `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` |
| Ten exact, unique, ordered H2 sections | PASS — 10 |
| Observable `LO1`–`LO5`, scheduled and assessed | PASS |
| Fixed week format and sequence | PASS — 13 instructional rows and exam-only weeks 8/15 |
| Attendance/midterm/final and formative team boundary | PASS — `20/40/40`; 2–3-person work has no separate weight; individual exam evidence required |
| Midterm and final rubrics | PASS — `10+10+12+8=40` and `10+10+10+10=40` |
| Technology and lineage | PASS — NCP/Linux, Hermes, CTI, LLM Wiki, UA, graph analysis, and the full evidence lineage are visible |
| Six live/fallback tracks | PASS — NCP, Hermes, CTI API, LLM enrichment, UA generation, graph analysis; Docker Hermes persistence is `fixture-only` |
| Safety, privacy, accessibility, cost, teardown | PASS — public data only; offensive/PII/credential activity prohibited; captions/transcripts/alternatives supplied; NCP budget and full teardown specified |
| Source/fixture contract | PASS — `as_of: 2026-07-29`, Hermes pin, dated CISA/NVD/EPSS observations, ATT&CK `v19.1` fixture versus `official_latest`, and non-silent refresh |
| Graph/UA truth boundary | PASS — partial/stale rejected, structural invariants required, inferred relations remain hypotheses pending source proof |
| Forbidden scope expansion | PASS — no HA, multi-AZ, VPN/bastion, production SOC, offensive operations, model tuning, or separately graded project |
| Protected repository and external state | PASS — 142 hashes unchanged, no staged path, and no task-owned process/server/cloud/Hermes/cron/UA state remained |

The content is therefore usable, but the shipped build is not releasable because its checker and evidence overstate what was verified.

## Current F2/F3 evidence review

Both current receipts bind to the assigned HEAD, target hash, and checker hash; neither older F2/F3 report was reused.

| Artifact | Direct inspection | Result |
| --- | --- | --- |
| `F2-source-fidelity-v3.md` | Exact hashes; primary-source/volatility/YAML review; `as_of` and official-source contract; explicit skill-perspective section | Current and substantively supports the syllabus's source claims |
| `F3-scenario-audit-v3.md` | Exact hashes; checker/Pandoc/Glow evidence; NCP/Hermes/CTI/LLM/UA/graph/accessibility paths; malformed UTF-8 and stale-UA controls | Current and substantively supports the visible student/instructor paths |

These receipts support the document as written, but they do not cure the fresh checker false successes above.

## Exact execution evidence

| Command/check | Exit and observable |
| --- | --- |
| `git rev-parse HEAD` | `0`; `8857bdd924bc0e155b7dd64a8a471692b7b7ab85` |
| `shasum -a 256 <target> <checker>` | `0`; exact assigned SHA-256 values |
| `ruby -c <checker>` | `0`; `Syntax OK` |
| `ruby <checker> <target>` | `0`; `PASS headings=10 weeks=15 topic_ids=15 milestones=7 evidence_ids=49 fallbacks=6 weights=20/40/40 rubrics=40/40 contract=PASS` |
| `ruby task-8-regression.rb` | `0`; 78/78 output lines had expected `PASS` verdicts; temporary log removed |
| Independent core/YAML parser | `0`; 10 headings, 15 ordered weeks, 13 instructional, 2 exams, 20/40/40, both rubric sums, 7 milestones, 49 unique evidence IDs, 6 scoped fallback rows; Boolean/String/Integer YAML types correct |
| `pandoc -f gfm -t html <target>` | `0`; 53,501 bytes, 10 H2, 11 tables, 0 active-content matches |
| `glow -s notty -w 160 <target>` | `0`; 91,214 bytes, 541 lines, maximum rendered line width 158 |
| `glow -s notty -w 400 <target>` | `0`; 132,794 bytes, 321 lines, all 15 topic IDs visible |
| Fresh protected-manifest recomputation | `0`; 142 entries, 0 missing, 0 mismatches, sole scope addition is the syllabus |
| `git diff --cached --quiet` | `0`; nothing staged |

The first attempted adversarial stream through `/dev/stdin` only exercised the checker's regular-file guard and was discarded. Every reported adversarial verdict was rerun against an isolated regular file.

## ULTRAQA

| Class | Result | Evidence |
| --- | --- | --- |
| Malformed input | PASS | Invalid UTF-8 regular file exited `1`: `syllabus is not valid UTF-8` |
| Prompt injection / data-only | PARTIAL/FAIL | The named direct policy inversion exits `1`, and passive prompt text remains inert; an equivalent “external command is called” rewrite exits `0`, so semantic coverage is incomplete |
| Stale state | PASS | Typed `ua.partial_stale.accept: true` mutation exits `1`; target/checker hashes are exact |
| Dirty worktree | PASS | Baseline state was already dirty; all 142 protected hashes match, sole protected-scope addition is the syllabus, staged count is 0 |
| Misleading success | FAIL | Eight harmful semantic rewrites print the full checker success line |
| Repeated interruption | PASS | Three truncated regular-file inputs (60/120/180 lines) each exit `1`; current QA evidence also records SIGTERM interruption exit `143` followed by full harness recovery exit `0` |
| Long/hung | N/A | No required command hung or crossed the 30-second execution window; the harness completed in about 11 seconds |
| Flaky | N/A | No nondeterministic result was triggered; fixed-input checker/harness runs were deterministic |
| Cancel/resume | Covered by interruption probe | Cancellation was triggered only for the isolated QA harness; the clean rerun succeeded and no durable runtime state exists |

## Direct `remove-ai-slops` and `programming` pass

- Checker pure LOC: 188; harness pure LOC: 120. Neither violates the 250-pure-LOC ceiling.
- Both have bounded, single-purpose responsibilities; the checker has no shell, network, cloud, Hermes, cron, UA, or external-write surface.
- Typed YAML and exact table/ID/arithmetic checks are appropriate machine-consumed contracts.
- No deletion-only test, test that merely verifies a requested production removal, unnecessary production abstraction, or unrelated normalization was found.
- Blocking slop remains: finite prose-regex tests accept eight material synonym contradictions and reject a harmless bullet split, while two exact duplicate mutant bodies inflate the advertised test count. This is implementation-mirroring, false-confidence maintenance burden under both required skill perspectives.
- Existing historical code-quality reports explicitly discuss these skill perspectives but bind superseded hashes. The current context report's contrary “no slop” conclusion is unsupported by the fresh executable evidence.

## Checked artifact paths

- `AGENTS.md`, `SCHEMA.md`, `index.md`, recent `log.md`
- `.omo/drafts/hoseo-data-analysis-cloud-platform-course.md`
- `.omo/plans/hoseo-data-analysis-cloud-platform-course.md`
- `.omo/boulder.json`, `.omo/start-work/ledger.jsonl`
- `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.log`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-baseline-status.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-protected-sha256.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-protected-sha256.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-validation.log`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/F2-source-fidelity-v3.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/F3-scenario-audit-v3.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/global-final-v3/debugging-runtime-audit.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/global-final-v3/qa-execution-review.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/global-final-v3/context-mining-review.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/global-final-v3/security-review.md`
- Historical code-quality and final-gate reports, inspected only to confirm they bind older hashes
- `omo:review-work`, `omo:remove-ai-slops`, and `omo:programming` skill contracts

## Exact evidence gaps required to clear the gate

1. Replace or remove the open-prose regexes as semantic proof; keep structured contracts and use exact-hash human/source review for prose. Add persistent controls that distinguish the eight fresh contradictions without rejecting harmless reformatting.
2. Replace the two duplicate mutant bodies with distinct contract cases, retaining truthful control and distinct-input counts.
3. Regenerate the debugging receipt so its harness count matches the exact executable artifact.
4. Produce and inspect a current exact-hash code-quality report with explicit `remove-ai-slops`/`programming`, overfit, duplicate-test, and false-confidence coverage; older reports are not coverage.
5. Supply the required notepad path or explicitly declare that no notepad exists for this goal in the authoritative gate input.
6. Rerun the affected exact-build goal, quality, security, QA, context, F1, and F4 gates after repair; prior success prose cannot be reused across changed checker/harness bytes.

## Cleanup receipt

All review-created regular-file fixtures were inside `Dir.mktmpdir` roots and were absent after their blocks. `/tmp` searches found no `hoseo-global-v3*` or `hoseo-goal-v3*` residue. The temporary 78-line harness log was removed. Final process inspection found no task-owned checker, harness, Pandoc, or Glow process. No server, listener, container, browser, cloud resource, Hermes state, cron state, UA state, Git stage, or external system was created or changed. Only this owned report was added.

FAIL
