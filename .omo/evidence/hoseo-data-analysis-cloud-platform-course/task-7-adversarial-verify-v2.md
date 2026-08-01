# Todo 7 post-remediation AdversarialVerify v2

```yaml
AdversarialVerify:
  task: "7. Assemble the single Korean 15-week syllabus"
  build_target_sha256: "d062c7427f7b8a715f357f7d6f7e307f677fcd3b455c9b709c899ef192d52bee"
  verdict: confirmed
  confidence: 0.995
  independent_reviewer: true
  implementation_or_rewrite_by_reviewer: false
  only_persistent_write: ".omo/evidence/hoseo-data-analysis-cloud-platform-course/task-7-adversarial-verify-v2.md"
```

## Verdict

**confirmed.** The reviewed syllabus byte hash is exactly the requested post-remediation target, `d062c7427f7b8a715f357f7d6f7e307f677fcd3b455c9b709c899ef192d52bee`. Fresh execution of checker snapshot `b5923d587e4c7934932e2ec9936e17d25015bb44eed6c6d9399fc1429d928450`, an independent structure-and-human-content parser, Pandoc, Glow at 160 and 400 columns, protected-state verification, sensitive-data scans, and isolated adverse controls agreed. A later concurrent Todo 8 checker edit is disclosed in the exact-scope postscript and does not change this target-bound Todo 7 verdict.

The remediation is present in human-readable course content, not only in stable IDs: the Hermes approval/workspace/gate boundaries, NVD pagination and bounded deferral, three complete normalized schemas and value-state distinctions, honest two-path LO1, exact weekly topics, seven semantically populated milestone rows, policy polarities, and inert-Markdown boundary all match the approved briefs. No needs-fix item was found for Todo 7.

## Scope and inputs read

The review read the complete plan, global failure debugging report, global debugging audit, code/document review, current syllabus, current checker, updated Task 7 assembly check, Todo 1 dated source ledger, and every Todo 2–6 brief. It also read `SCHEMA.md`, `index.md`, and the latest `log.md` entries as required by the vault guide. Worker PASS prose was not accepted without reopening the underlying syllabus/brief and rerunning its observable.

This lane did not edit the syllabus, checker, plan, ledger, briefs, prior evidence, protected wiki content, `.ua/`, or external state. No NCP, Hermes, cron, browser, live CTI, LLM, or UA operation ran.

## Fresh positive results

| Criterion | Verdict | Fresh observable |
|---|---|---|
| Build identity | PASS | `shasum -a 256` returned `d062c7427f7b8a715f357f7d6f7e307f677fcd3b455c9b709c899ef192d52bee` for the syllabus. |
| Checker snapshot at review start | PASS | SHA `b5923d...`; exit `0`: `PASS headings=10 weeks=15 topic_ids=15 milestones=7 evidence_ids=49 fallbacks=6 weights=20/40/40 rubrics=40/40 carry=PASS`. |
| H2 contract | PASS | Exact ordered unique ten headings. |
| Schedule | PASS | Weeks `1..15` exactly once; instructional weeks exactly 1–7 and 9–14; exam-only weeks exactly 8 and 15. |
| Weekly topic IDs | PASS | Exact ordered W01–W15 slug list; every full `topic_id` occurs once. |
| Human weekly topics | PASS | All 15 display cells independently matched the fixed brief topics: orientation/diagnostic/provenance through final individual practical. |
| LO alignment | PASS | LO1–LO5 each defined once and present in schedule and assessment; every LO has an assessed evidence route. |
| Grading | PASS | Exactly attendance/midterm/final `20/40/40`; no fourth weighted category; 2–3-person work remains formative and unweighted. |
| Rubrics | PASS | Midterm `10+10+12+8=40`; final `10+10+10+10=40`. |
| Milestone IDs | PASS | M1–M7 exact identities; 49 full IDs occur once and in their corresponding Happy/Fail/Artifact/Machine/Fallback/Safety/Assess cells. |
| Human milestone content | PASS | All 49 cells retained non-ID descriptions and matched the appropriate Todo 2–6 happy/failure/artifact/machine/fallback/safety/assessment obligation. |
| Fallbacks | PASS | Exactly NCP, Hermes, CTI API, LLM enrichment, UA generation, graph analysis; every row is complete and preserves/losses/allowed claims are honest. |
| Encoding/whitespace | PASS | Valid UTF-8, LF only, final newline; no-index whitespace check had the normal added-file exit `1` and zero diagnostics. |

The independent parser's exact terminal result was:

```text
CONTRACT_PASS h2=10 weeks=15 topics=15 human_topics=15 instructional=13 exams=8,15 lo=5 weights=20/40/40 rubrics=10+10+12+8/10+10+10+10 milestones=7 evidence_ids=49 human_milestone_cells=49 fallbacks=6 schemas=3 policies=PASS inert=PASS
```

## Human-content parity with the briefs

| Brief | Direct Korean semantic comparison | Verdict |
|---|---|---|
| Todo 1 source ledger | `as_of: 2026-07-29`, immutable Hermes commit, dated CISA/EPSS observations, NVD 2.0 limits, ATT&CK v19.1 fixture/current distinction, and no-silent-refresh procedure are retained without turning volatile observations into thresholds. | PASS |
| Todo 2 course contract | Fourth-year audience, evidence lineage, prerequisites/remediation, LO1–LO5, 15-week cadence, two individual exams, assessment arithmetic, captions/transcript/accessibility, and policy-owned absence handling remain aligned. | PASS |
| Todo 3 NCP | Live VPC/subnet/ACG/public-IP/budget/terminate route is distinct from Linux/fixture reasoning; TCP 22 scope, stop-only rejection, public-IP release, residual cost, Docker limitation, and fixture metadata/hash rules are present. | PASS |
| Todo 4 Hermes/CTI | Non-root/headless/doctor, one scheduler, local-only, Asia/Seoul, approval and secret boundaries, allowed CTI sources, raw manifest, normalized records, dedupe, idempotency, negative fixtures, 429 handling, and last-good behavior are present. | PASS |
| Todo 5 Wiki/UA/graph | Raw immutability, canonical lint-before-UA, `understand-knowledge`, complete batches/freshness/structural invariants, pinned fallback report, directed/projection policy, three metric families, exact lineage, verified insight, and rejected inference remain present. | PASS |
| Todo 6 governance | Three weights, individual evidence, six fallback tracks, public-data-only scope, offensive/PII/credential prohibitions, retention/deletion ownership, teardown, accessibility, outage recovery, and golden-fixture preflight are retained. | PASS |

The exact weekly and milestone ID checks were deliberately supplemented with the human-text comparisons above. In particular, M1 describes diagnostic/provenance evidence; M2 NCP/Linux; M3 Hermes safety; M4 CTI collection; M5 Wiki lint; M6 UA validation; and M7 graph analysis/lineage. Their seven cells preserve the corresponding brief's actual evidence and limitations, rather than token-stuffed filler.

## Remediation-specific verification

### Hermes boundaries

PASS. The operating assumptions explicitly constrain Hermes to a non-root account and one student workspace path; allow only `read`, `list`, `search`, and reviewed wrapper tools; use one gateway scheduler with local-only delivery; retain `approvals.mode: smart`, manual approval/re-design for risky expansion, and `cron_mode: deny`; and require separate explicit approval for messaging and browser use. The text explicitly trusts gate-supplied `wakeAgent`, `reason`, and `changedPaths` and forbids the agent from recomputing the changed state.

### NVD and CTI records

PASS. The NVD contract records `resultsPerPage` and `startIndex`, uses small page/date batches, spaces batches by at least six seconds, honors `Retry-After`, bounds retry to three, quarantines as `deferred_rate_limited`, does not publish, and preserves `last_good_run_id`/`last_good_sha256`.

The raw manifest has all eight fields. The normalized tables retain complete human-readable field sets:

- `vulnerability`: source/native/CVE identifiers, `published_at`, `last_modified_at`, description, KEV dates, raw/source-version linkage, retrieval time, `value_state`, and `state_reason`.
- `signal`: source/native/CVE identifiers, signal type/score/percentile/date, raw/source-version linkage, retrieval time, `value_state`, and `state_reason`.
- `attack`: source/native/STIX identifiers, object metadata and version flags, `fixture_release`, fixture hash, `as_of`, `value_state`, and `state_reason`.

`absent`, `null`, and `unknown` have distinct definitions and may not be replaced by empty or inferred values. Uppercase CVE joining and exact dedupe tuple are retained.

### Honest LO1 and fallback claims

PASS. LO1 now bifurcates the observable outcome: live NCP students configure and verify provider controls, while approved fallback students validate Linux service work and NCP fixture design/teardown evidence without claiming provisioning. The NCP matrix repeats the lost live capabilities and bounds the allowed fixture claim. Docker cannot claim NCP provisioning or Hermes systemd persistence.

### Policy polarities and inert content

PASS. Partial/stale UA is explicitly rejected with nonzero validation; captions, transcripts, and accessible alternatives are affirmatively provided; offensive activity is explicitly prohibited; untrusted external/LLM/graph content is data-only and never executed; credentials are forbidden from evidence paths; and the document declares inert Markdown only. Source and rendered-HTML scans found no script tag, event handler, or executable URI.

## Render and direct Korean surface QA

Exact invocations:

```sh
pandoc -f gfm -t html5 output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md -o <temp>/syllabus.html
COLUMNS=180 NO_COLOR=1 glow -w 160 -s dark output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md > <temp>/glow-160.txt
COLUMNS=420 NO_COLOR=1 glow -w 400 -s dark output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md > <temp>/glow-400.txt
```

Results:

```text
PANDOC_PASS bytes=43541 h2=10 tables=11 active_html=0
GLOW_PASS width=160 bytes=97643 lines=504 ellipsis=0 required_fragments=18
GLOW_PASS width=400 bytes=128323 lines=276 ellipsis=0 required_fragments=18
```

Ruby was `2.6.10p210`, Pandoc `3.9.0.2`, and Glow `2.1.1`. ANSI was stripped before semantic searches. At 160 columns, long topic slugs wrap across successive lines within the topic column, but their fragments are present without ellipsis or truncation; the compact schedule remains dense but legible. At 400 columns, rows are substantially easier to scan. Direct Korean inspection covered all headings, outcomes, grading/rubrics, W01–W15 human topics, M1–M7 human cells and IDs, all three schema rows, six fallbacks, policy/preflight/recovery, and dated source rows. No malformed/merged table cell or reversed human meaning was observed.

## Adversarial and missing-clause controls

All mutations were isolated under `/tmp/hoseo-t7-v2-qa-20260729`; the real syllabus hash remained unchanged. Checker snapshot `b5923d...` was invoked as:

```sh
ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb <temp-mutant>
```

| Temp control | Exit | Distinguishing diagnostic/result |
|---|---:|---|
| valid target | 0 | Full `PASS ... carry=PASS` line |
| remove messaging/browser approval | 1 | final carry-through contract omitted |
| remove trusted gate fields | 1 | final carry-through contract omitted |
| remove NVD pagination/batching/retry paragraph | 1 | carry-through omitted; NVD batching/retry/defer missing |
| remove `vulnerability` schema row | 1 | vulnerability schema missing |
| remove `signal` schema row | 1 | signal schema missing |
| remove `attack` schema row | 1 | attack schema missing |
| remove absent/null/unknown distinction | 1 | state contract missing |
| invert captions/accessibility provision | 1 | accessibility policy missing affirmative provision |
| invert offensive prohibition | 1 | offensive activity prohibition missing |
| invert data-only/no-execution rule | 1 | data-only rule missing |
| inject `<script>` | 1 | active script/executable URI forbidden |
| inject HTML event handler | 1 | active script/executable URI forbidden |
| inject `javascript:` link | 1 | active script/executable URI forbidden |
| remove week 8 | 1 | exact ordered week multiplicity failed |
| duplicate week 14 in place of 15 | 1 | exact ordered week multiplicity failed |
| duplicate weighted category | 1 | exact unique grading identities/weights failed |
| duplicate M6 identity in place of M7 | 1 | exact M1–M7 identities failed |
| duplicate NCP fallback identity | 1 | exact fallback identities failed |
| change week-2 prose to the Korean equivalent `클라우드·NCP 네트워크` while retaining its stable ID | 0 | full PASS, confirming the repaired checker no longer requires incidental English topic prose |
| missing file | 1 | single stable `FAIL: syllabus path is missing or unreadable`, no traceback |
| invalid UTF-8 | 1 | single stable `FAIL: syllabus is not valid UTF-8`, no traceback |

The temp mutations were applied with `apply_patch`. Its post-edit LSP hook reported that `/tmp` paths were outside the request working directory; this was a harness-only diagnostic after the temp bytes had been updated. The subsequent checker reads established the mutation outcomes above. No repository artifact was changed by those patch operations.

## Protected state, write scope, and sensitive-data checks

Fresh recomputation of the Todo 1 manifest returned:

```text
PROTECTED_PASS declared=142 present=142 exact_set=true mismatches=0
```

The recomputation compared the exact sorted path set and every SHA-256 while excluding only the future syllabus, exactly as the manifest declares. `git diff --cached --name-only` was empty.

A high-signal scan over the target, checker, Task 7 receipt, and all course evidence files returned:

```text
SECRET_PII_PASS files=39 private_key=0 github_token=0 aws_key=0 bearer_secret=0 jwt=0 rrn=0 email=0 korean_mobile=0
```

The patterns distinguish prohibited-term prose from actual secret values. No secret, token, key, PII, email address, resident-registration number, or mobile number was found.

## Manual QA schema

```yaml
surfaceEvidence:
  - scenarioId: QA-1
    criterionReference: current post-remediation syllabus acceptance
    surface: local Ruby CLI
    exactInvocation: ruby syllabus_check.rb output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
    verdict: PASS
    artifactRefs: [this-report]
  - scenarioId: QA-2
    criterionReference: ordinary-width and wide-width readability
    surface: Glow 160/400 plus Pandoc HTML/plain
    exactInvocation: glow -w 160; glow -w 400; pandoc -f gfm -t html5/plain
    verdict: PASS
    artifactRefs: [this-report]
  - scenarioId: QA-3
    criterionReference: brief-to-human-content parity
    surface: direct Korean semantic inspection
    exactInvocation: read every W01-W15 topic cell, every M1-M7 evidence cell, schema/fallback/policy/source sections
    verdict: PASS
    artifactRefs: [this-report]
adversarialCases:
  - scenarioId: ADV-1
    criterionReference: Hermes/NVD/schema carry-through
    adversarialClass: missing-clause controls
    expectedBehavior: every omitted clause exits nonzero
    verdict: PASS
    artifactRefs: [this-report]
  - scenarioId: ADV-2
    criterionReference: policy polarity and inert Markdown
    adversarialClass: inversion and active-content injection
    expectedBehavior: every unsafe mutation exits nonzero
    verdict: PASS
    artifactRefs: [this-report]
  - scenarioId: ADV-3
    criterionReference: exact identity/multiplicity
    adversarialClass: missing or duplicate week/grade/milestone/fallback
    expectedBehavior: every malformed collection exits nonzero
    verdict: PASS
    artifactRefs: [this-report]
  - scenarioId: ADV-4
    criterionReference: stable IDs without brittle English token matching
    adversarialClass: meaning-preserving Korean paraphrase
    expectedBehavior: Korean-equivalent topic text remains accepted
    verdict: PASS
    artifactRefs: [this-report]
artifactRefs:
  - id: this-report
    kind: post-remediation Markdown verification receipt
    path: .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-7-adversarial-verify-v2.md
```

## Cleanup

The isolated QA directory contained 51 generated copies/renders/logs and no subdirectory. Each file was deleted and the now-empty exact directory was removed; `test ! -e /tmp/hoseo-t7-v2-qa-20260729` passed. No temp mutant, invalid-input fixture, render, process, server, browser context, cloud resource, Hermes operation, cron, CTI response, or UA artifact remains. The final exact workspace write-scope comparison is recorded below.

## Exact post-write scope receipt

A full regular-file SHA-256 snapshot excluding `.git` was captured before this lane's work and compared after this receipt was created. The snapshot grew from 336 to 345 files. The lane-owned delta is exactly this report. Concurrent agents created Task 8 and final-gate evidence during the review and updated their own hook/audit state; those paths were preserved and were not read as Todo 7 success evidence, edited, reverted, or deleted by this lane.

```text
lane_owned_added=["./.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-7-adversarial-verify-v2.md"]
concurrent_added=["./.omo/evidence/hoseo-data-analysis-cloud-platform-course/final-gate/code-quality-review.md", "./.omo/evidence/hoseo-data-analysis-cloud-platform-course/final-gate/context-mining-review.md", "./.omo/evidence/hoseo-data-analysis-cloud-platform-course/final-gate/executor-failure-confirmation.md", "./.omo/evidence/hoseo-data-analysis-cloud-platform-course/final-gate/goal-constraint-review.md", "./.omo/evidence/hoseo-data-analysis-cloud-platform-course/final-gate/qa-execution-review.md", "./.omo/evidence/hoseo-data-analysis-cloud-platform-course/final-gate/security-review.md", "./.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-adversarial-verify-v2.md", "./.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb"]
concurrent_changed=["./.omo/evidence/hoseo-data-analysis-cloud-platform-course/final-gate/debugging-runtime-audit.md", "./.omo/lazycodex-executor-verify/019fac50-a6aa-7651-82a3-acc5b091a489-019fac90-46c1-7280-9522-4a89eb534832.json"]
removed=[]
git_status_snapshot_diff_lines=0
staged_pre=0
staged_post=0
```

The syllabus and Task 7 assembly check retained their pre-review hashes; the syllabus remained exactly `d062c7427f7b8a715f357f7d6f7e307f677fcd3b455c9b709c899ef192d52bee`. The protected 142-path manifest still has zero set or hash mismatch. Therefore concurrent activity does not weaken the Todo 7 verdict or this lane's exact-write claim.

### Subsequent concurrent Todo 8 checker update

After this receipt was first written, a concurrent Todo 8 lane changed `syllabus_check.rb` from the tested SHA `b5923d587e4c7934932e2ec9936e17d25015bb44eed6c6d9399fc1429d928450` to `1c57123e66cfbb25832a56aad30d07a6fb2df770ccb3e32dc4e7a068cde88467`. Its mtime (`2026-07-29T18:22:11+0900`) is later than this receipt's initial mtime (`2026-07-29T18:21:45+0900`) and far later than the unchanged target mtime (`2026-07-29T16:39:06+0900`). A post-update run against the unchanged target exited `1`, naming M4/M6 happy cells and three fallback rows as not meaningful. Direct inspection contradicts those false negatives: M4 states raw-to-three-record normalization, dedupe, and zero rerun growth; M6 states complete batches/fresh artifacts or pinned hash/fresh report; and all three named fallback rows contain live evidence, fixture, manifest/hash, preserved competency, lost competency, and bounded allowed claim. The independent parser also passed all 49 human milestone cells and all six complete fallback rows.

Per the parent instruction that Todo 8 checker modification is independent and the Todo 7 result is reusable while the target hash remains unchanged, this late checker result is recorded as concurrent verifier evolution, not a Todo 7 content regression. This lane did not edit that checker.
