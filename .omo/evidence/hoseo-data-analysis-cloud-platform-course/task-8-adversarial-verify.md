# Todo 8 AdversarialVerify — final repair rerun

```yaml
AdversarialVerify:
  task: "8. Validate structure, failure detection, rendering, and protected-state integrity"
  reviewed_at_utc: 2026-07-29T07:00:36Z
  verdict: confirmed
  confidence: 0.99
  scope: "Todo 8 only; no final-gate requirements"
  independent_reviewer: true
  only_persistent_write: ".omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-adversarial-verify.md"
```

## Verdict

`confirmed`. Every Todo 8 acceptance criterion passed independent fresh reproduction after the order-insensitive graph-inference repair. The real syllabus passes; the named corrupt copy fails and explicitly names both missing week 8 and the grading mismatch; all four harmful semantic controls fail with specific diagnostics; the complete prior safe paraphrase and the isolated exact sentence `원문 검증 전에는 가설로만 취급한다` both pass. No prior blocker or regression remains in the scoped suite.

Pandoc and Glow succeed with nonempty, intact 10-heading/10-table output; `git diff --no-index --check` has the expected difference exit with zero diagnostics; all 142 protected paths/hashes and the Todo 8 receipt exactly match Todo 1; status differs from the baseline only by the syllabus; and the syllabus still has Todo 7's exact hash.

## Fresh real and named corrupt-copy checks

```sh
ruby -c .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb
ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb \
  output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb \
  .omo/evidence/hoseo-data-analysis-cloud-platform-course/corrupt-syllabus.md
```

```text
Syntax OK
PASS headings=10 weeks=15 instructional=13 exams=8,15 weights=20/40/40 mid=10+10+12+8 final=10+10+10+10 milestones=7 fallbacks=6 lo=LO1-LO5
FRESH_CHECK_EXITS real=0 corrupt=1 missing_week_named=1 grading_named=1
FAIL: weeks must be the unique fixed set 1..15
FAIL: missing week 8 or week 15 exam
FAIL: fixed topic mismatch for week 8
FAIL: grading mismatch: weights must be attendance/midterm/final 20/40/40
```

The retained corrupt copy still differs from the real syllabus only by removing week 8 and changing the midterm weight from 40% to 30%.

## Semantic controls

All controls copied the real syllabus into `/tmp/hoseo-t8-finalverify.yOejKX/` and used `apply_patch` for only the stated mutation.

### Prior harmful milestone control

M1's semantic cells were replaced by meaningless nonempty words.

```text
CONTROL=milestone-semantic-corrupt exit=1
FAIL: milestone M1 happy-path semantics invalid
FAIL: milestone M1 failure-path semantics invalid
FAIL: milestone M1 artifact-machine-evidence semantics invalid
FAIL: milestone M1 fallback semantics invalid
FAIL: milestone M1 safety-cost semantics invalid
FAIL: milestone M1 assessment-link semantics invalid
```

### Prior harmful fallback control

The NCP fixture falsely claimed complete live provisioning/public-connectivity proof, no lost competency, and permission to make the live claim.

```text
CONTROL=fallback-semantic-corrupt exit=1
FAIL: fallback NCP preserved-competency semantics invalid
FAIL: fallback NCP lost-competency semantics invalid
FAIL: fallback NCP allowed-claim overstates fixture capability
```

### Prior harmful credential-policy control

The policy required credentials in prompts/logs and refused redaction.

```text
CONTROL=safety-semantic-corrupt exit=1
FAIL: credential safety policy missing safe prohibition
```

### Harmful graph factual-promotion control

The graph/LLM sentence was changed to say relations are treated as facts before source verification.

```text
CONTROL=graph-fact-promotion exit=1
FAIL: graph inference is promoted as fact
GRAPH_PROMOTION_NAMED=1
```

### Safe controls

The complete prior safe paraphrase changed the CVE/ATT&CK, price-threshold, and graph-inference sentences without weakening them. The isolated graph control contains the exact requested sentence `원문 검증 전에는 가설로만 취급한다`.

```text
CONTROL=safe-paraphrase exit=0
PASS headings=10 weeks=15 instructional=13 exams=8,15 weights=20/40/40 mid=10+10+12+8 final=10+10+10+10 milestones=7 fallbacks=6 lo=LO1-LO5
CONTROL=graph-safe-order exit=0
PASS headings=10 weeks=15 instructional=13 exams=8,15 weights=20/40/40 mid=10+10+12+8 final=10+10+10+10 milestones=7 fallbacks=6 lo=LO1-LO5
SAFE_SENTENCE_COUNT=1
```

The checker now accepts safe graph-guard concepts in either natural Korean order and separately rejects positive fact promotion. This closes the earlier brittle exact/order-dependent check without weakening the negative control.

## No-index whitespace and fresh rendering

```sh
ws_output=$(git diff --no-index --check /dev/null \
  output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md 2>&1)
ws_exit=$?
pandoc -f gfm -t html -o "$qa/fresh.html" \
  output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
COLUMNS=420 glow -w 400 -s dark \
  output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md \
  > "$qa/fresh-glow.txt"
```

```text
NO_INDEX_CHECK raw_exit=1 diagnostics_bytes=0
RENDER_FRESH pandoc=0 glow=0 html_bytes=37901 glow_bytes=109584 glow_lines=236 html_cmp=0 glow_cmp=0
SURFACE_FRESH h2=10 headings_exact=true tables_open=10 tables_close=10 glow_nonempty=true glow_headings=10 ellipsis=0 replacement=0 terms=9/9
```

No-index exit `1` is the expected added-file difference; an empty diagnostic stream is the whitespace PASS. Fresh Pandoc and Glow outputs are byte-identical to the retained artifacts.

Manual ANSI-stripped Glow inspection covered all ten ordered headings, the 20/40/40 table, both rubric tables, all 15 weeks and exam-only weeks 8/15, M1–M7, platform and six-track fallback tables, Docker `fixture-only`, safety/accessibility, recovery, and ATT&CK refresh material. Wide cells wrap without clipping. No ellipsis, replacement character, malformed heading, or unclosed table was found.

## Protected state, target immutability, and worktree

Fresh Ruby 2.6-compatible recomputation:

```text
PROTECTED_FRESH base_rows=142 current=142 exact_set=true mismatches=0
TASK8_RECEIPT rows=142 exact_set=true content_equal=true
WRITE_SCOPE_FRESH baseline=51 current=52 added=["?? output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md"] removed=[] staged=0
```

Current target hash:

```text
b87d72f0227c1e59d33e13e6db011d132156644eb8536f4dcb6c2036e3d41210  output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
```

It exactly matches both Todo 7 receipts. The target mtime remains `2026-07-29T06:17:57Z`; Todo 7 receipts are later (`06:20:28Z`, `06:28:12Z`); the final repaired checker is newer (`06:57:11Z`). The real syllabus and every protected file remained unchanged.

## Secret, PII, and input-as-data check

The target plus all eight current Todo 8 artifacts were scanned as nine files total:

```text
SECRET_PII_FRESH files=9 private_key=0 github_token=0 aws_access_key=0 slack_token=0 bearer_secret=0 jwt=0 credential_assignment=0 email=0 korean_rrn=0 korean_mobile=0
INPUT_AS_DATA injection_matches=0 checker_dangerous_api=0 file_read_only=true
```

The checker reads the supplied path as data and performs no shell, process, network, `eval`, or tool execution.

## Adversarial matrix

| Class | Verdict | Fresh observable |
|---|---|---|
| `malformed_input` | PASS | Named corrupt copy exits `1` and names both faults; milestone, fallback, credential, and graph-fact mutations all fail specifically. |
| `prompt_injection` | PASS | Input remains data-only; injection and execution-API scans are zero. |
| `stale_state` | PASS | Fresh checker, render, hash, and status runs reproduce retained evidence; artifact chronology follows the immutable target. |
| `dirty_worktree` | PASS | Exact 142-path/hash match; status adds only the syllabus; staged paths zero. |
| `misleading_success_output` | PASS | All harmful controls fail, both safe controls pass, and exit/output parsing agrees with direct artifact inspection. |
| `cancel_resume` | PASS | Real target remains Todo 7's hash; all evidence is complete/nonempty and negative controls are isolated copies. |
| `repeated_interruptions` | PASS | Fresh deterministic reruns bind to immutable target/hash and complete artifacts rather than completion prose. |
| `hung_long_commands` | N/A | Only finite local reads, parses, hashes, diffs, and renders ran; no server, network, cloud, Hermes, cron, or UA operation occurred. |
| `flaky_tests` | N/A | All scoped checks are deterministic over fixed local files; repeated runs agree. |

## Cleanup

The only QA directory was `/tmp/hoseo-t8-finalverify.yOejKX`. Its nine generated files were deleted after validating the exact `/tmp/hoseo-t8-finalverify.*` prefix, and the empty directory was removed with `rmdir`.

```text
CLEANUP_PASS files_removed=9 temp_absent=true
```

This receipt is the verifier's only persistent write. The checker, corrupt copy, validation log/matrix, retained renders, real syllabus, plan, Boulder state, ledger, protected files, and all other paths were left unchanged.
