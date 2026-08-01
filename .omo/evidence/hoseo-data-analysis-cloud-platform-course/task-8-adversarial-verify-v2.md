# Todo 8 AdversarialVerify v2 — post-remediation independent rerun

```yaml
AdversarialVerify:
  task: "8. Validate structure, failure detection, rendering, and protected-state integrity"
  verdict: needs-fix
  confidence: 0.99
  independent_reviewer: true
  target_sha256: d062c7427f7b8a715f357f7d6f7e307f677fcd3b455c9b709c899ef192d52bee
  checker_sha256: b5923d587e4c7934932e2ec9936e17d25015bb44eed6c6d9399fc1429d928450
  only_persistent_write: .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-adversarial-verify-v2.md
```

## Verdict

`needs-fix`. The remediated checker passes the real target, rejects the named corrupt copy with both required diagnostics, and reproduces every persisted Task 8 control. Rendering, protected state, whitespace, boundary errors, target immutability, and sensitive-data checks also pass.

Confirmation is nevertheless blocked because the global-review requirements are not fully closed:

1. The approved Task 4 `vulnerability` schema requires `description`, `kev_date_added`, and `kev_due_date`, but removing any one field from its schema row still produces checker exit `0` and the full `PASS` line. The checker at lines 111–119 simply omits all three from `schema_contracts`.
2. Stable milestone IDs are structurally enforced but semantically vacuous. A copied M1 row retaining all seven correct IDs in their correct cells while replacing every evidence claim with `무의미` exits `0`. The persisted “token-stuffed milestone without stable IDs” control is green, but it proves only that labels exist.
3. Literal overfit remains. The meaning-preserving NVD rewrite `페이지/날짜 batch 사이에는 최소 6초` → `페이지와 날짜 단위 묶음 사이에는 6초 이상 간격` exits `1`. Equivalent accessibility (`제공한다` → `함께 배포한다`) and offensive-policy (`명시적으로 금지` → `일절 허용하지 않음`) rewrites also exit `1`.
4. The claimed “final carry-through” coverage is incomplete. Removing required Task 4 Hermes clauses (`non-root`, `headless`, `hermes doctor`, `Asia/Seoul`, one gateway, `local-only`, `approvals.mode: smart`, manual approval, or `cron_mode: deny`), required NVD clauses (`Retry-After`, timeout, network error, HTTP 429, or no-publish), or any of the eight raw-manifest field markers individually still exits `0`. These are required by the plan/approved brief but absent from the checker contract.

These are direct false-success/false-negative reproductions, not style objections. Under the instruction “confirmed only if all global-review blockers are closed,” the gate cannot be confirmed.

## Inputs inspected

Read completely or structurally inspected before the rerun:

- `.omo/plans/hoseo-data-analysis-cloud-platform-course.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/global-gate-failure-debug.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/global-debugging-audit.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course-code-review.md`
- updated Task 7 assembly/adversarial receipts
- current syllabus and the complete 131-line checker
- every current `task-8-*` artifact, including retained Pandoc HTML and both retained Glow surfaces
- the Task 1 protected manifest and baseline status receipt

## Baseline, checker, and named corrupt copy

Exact invocations:

```sh
ruby -c .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb
ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb \
  output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb \
  .omo/evidence/hoseo-data-analysis-cloud-platform-course/corrupt-syllabus.md
shasum -a 256 output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md \
  .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb
```

Observed:

```text
Syntax OK
valid_exit=0
PASS headings=10 weeks=15 topic_ids=15 milestones=7 evidence_ids=49 fallbacks=6 weights=20/40/40 rubrics=40/40 carry=PASS
valid_stderr_bytes=0

corrupt_exit=1
FAIL: weeks must be the exact ordered multiplicity set 1..15
FAIL: missing week 8 or week 15 exam
FAIL: weekly topic IDs must be exact W01-W15 slugs once each
FAIL: instructional and exam week format mismatch
FAIL: grading mismatch: rows must have exact unique identities and weights
```

The corrupt copy differs from the target only by changing midterm `40%` to `30%` and removing the week-8 row. The required missing-week-8 and grading diagnostics each occur once; stdout is empty and no traceback occurs.

## Persisted adversarial controls

Each fixture was made from the exact target in `/tmp/hoseo-t8-v2.8qBWO7`, the mutation count/target was asserted before execution, and the real checker was invoked as:

```sh
ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb \
  /tmp/hoseo-t8-v2.8qBWO7/<control>.md
```

A failure control counted only when exit was `1`, stdout was empty, every stderr line began `FAIL:`, there was no traceback token, and the intended diagnostic matched. A positive control counted only for exit `0`, empty stderr, and one `PASS` line.

| Controls | Exact mutation | Expected / actual | Result |
|---|---|---:|---|
| duplicate/missing week | add an exact week-1 row / remove week 8 | `1 / 1` each | PASS |
| duplicate/missing grade | add an exact attendance row / remove final grade row | `1 / 1` each | PASS |
| duplicate/missing M1 | add an exact M1 row / remove M1 | `1 / 1` each | PASS |
| duplicate/missing fallback | add an exact NCP row / remove graph-analysis row | `1 / 1` each | PASS |
| token-stuffed M1 without stable IDs | replace all seven M1 IDs with generic prior prose tokens | `1 / 1` | PASS |
| Korean topic paraphrase | replace `cloud·NCP networking` with `클라우드·NCP 네트워크`; retain W02 ID | `0 / 0` | PASS |
| wrong stable IDs | alter W02 ID / alter `M4-MACHINE` | `1 / 1` each | PASS |
| stale/partial success | retain `M6-FAIL`, invert rejection/nonzero to success/zero | `1 / 1` | PASS |
| accessibility inversion | invert both affirmative provision clauses | `1 / 1` | PASS |
| offensive inversion | change explicit prohibition to permission | `1 / 1` | PASS |
| data-only inversion | change inert evidence to executable instructions | `1 / 1` | PASS |
| active content | prepend `<script>`, `onerror=`, `javascript:`, `vbscript:`, or `data:text/html` independently | `1 / 1` all five | PASS |

Independent parsing, separate from the checker, produced:

```text
INDEPENDENT_IDS PASS topics=15 topic_unique=15 evidence=49 evidence_unique=49 correct_cells=49 all_once=true
```

The exact ordered topic IDs are W01–W15 from `W01-orientation-diagnostic-provenance` through `W15-final-individual-practical`. The 49 IDs are the Cartesian set M1–M7 × `HAPPY`, `FAIL`, `ARTIFACT`, `MACHINE`, `FALLBACK`, `SAFETY`, `ASSESS`; every ID occurs exactly once in its matching row and cell.

### Persisted carry-omission matrix

Global removal of each persisted literal independently produced a stable nonzero failure with the intended carry diagnostic:

```text
messaging/browser workspace allowlist wakeAgent reason changedPaths
resultsPerPage startIndex published_at last_modified_at value_state state_reason fixture_release
```

Result: `13/13 PASS`.

Removal of each persisted NVD composite term independently also failed with `NVD batching/retry/defer carry-through missing`:

```text
페이지/날짜 batch | 최소 6초 | 최대 3회 | deferred_rate_limited | last_good
```

Result: `5/5 PASS`.

For the complete approved normalized schemas, each field marker was removed only from its own record row. Results were `36/39` correctly rejected. The three false successes were exactly:

```text
vulnerability.description       exit=0 PASS ... carry=PASS
vulnerability.kev_date_added    exit=0 PASS ... carry=PASS
vulnerability.kev_due_date      exit=0 PASS ... carry=PASS
```

This is the principal persisted-contract blocker.

## Boundary behavior

Exact invocations:

```sh
ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb \
  /tmp/hoseo-t8-v2.8qBWO7/does-not-exist.md
ruby -e 'File.binwrite(ARGV[0], "\xFF\xFE\xFA".b)' \
  /tmp/hoseo-t8-v2.8qBWO7/invalid-utf8.md
ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb \
  /tmp/hoseo-t8-v2.8qBWO7/invalid-utf8.md
```

```text
missing: exit=1 stdout_bytes=0 stderr_lines=1
FAIL: syllabus path is missing or unreadable
invalid UTF-8: exit=1 stdout_bytes=0 stderr_lines=1
FAIL: syllabus is not valid UTF-8
traceback_matches=0 for both
```

## Vacuity and literal-overfit probes

All probes retained every unrelated byte and used the same checker invocation.

| Probe | Expected | Actual | Finding |
|---|---:|---:|---|
| M1 keeps all seven correct IDs in correct cells; every evidence value becomes `무의미` | reject | `0` | stable-ID control is vacuous about evidence meaning |
| NVD “페이지/날짜 batch / 최소 6초” becomes equivalent Korean “페이지와 날짜 단위 묶음 / 6초 이상 간격” | accept | `1` | literal overfit |
| accessibility “제공한다” becomes equivalent “함께 배포한다” | accept | `1` | literal overfit |
| offensive prohibition becomes equivalent “일절 허용하지 않음” | accept | `1` | literal overfit |

The first probe prints the same full `PASS ... carry=PASS` line. The positive paraphrases emit clean `FAIL:` diagnostics, proving that the result is caused by hard-coded surface wording rather than malformed input.

The broader approved-brief omission audit also found clean exit-0 false successes after independently deleting each required Hermes operational clause, each adjacent required NVD retry/no-publish clause, and each of the eight raw-manifest field markers. This confirms that the carry assertion at checker lines 107–120 is a partial literal list, not the complete Task 4 contract claimed by Todo 8.

## Rendering and manual QA

Exact invocations:

```sh
pandoc --standalone --from gfm --to html5 \
  output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md \
  -o /tmp/hoseo-t8-v2.8qBWO7/fresh.html
NO_COLOR=1 COLUMNS=180 glow -w 160 -s dark \
  output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md \
  > /tmp/hoseo-t8-v2.8qBWO7/glow-160.txt
NO_COLOR=1 COLUMNS=420 glow -w 400 -s dark \
  output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md \
  > /tmp/hoseo-t8-v2.8qBWO7/glow-400.txt
```

```text
PANDOC_HTML bytes=47416 utf8=true h2=10 tables=11/11
active={script:0,event:0,javascript:0,vbscript:0,data_html:0} active_total=0
GLOW_160 bytes=97643 lines=504 headings=10 ellipsis=0 replacement=0
GLOW_400 bytes=128323 lines=276 headings=10 ellipsis=0 replacement=0
```

Fresh HTML SHA-256 is `14964393a04d35cc4a87415da4a6ca8c39a91e6120b291f032d29ceb5bd1aa65` and is byte-identical to retained `task-8-syllabus.html`.

Manual QA inspected both ANSI-normalized Glow surfaces. All ten headings, 20/40/40 grading, both rubrics, weeks 1–15, W08/W15 exam-only rows, M1–M7, all milestone cells, six fallback rows, Docker `fixture-only`, normalized schemas, NVD recovery, accessibility, and source ledger are present. At width 160, long IDs wrap across lines but remain complete; at width 400 the same cells remain intact with fewer wraps. No ellipsis, replacement character, clipped terminal edge, missing row, or malformed table was found. The render surfaces pass; they do not cure the checker false successes above.

## Whitespace, protected state, status, target, and sensitive data

```sh
git diff --no-index --check /dev/null \
  output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
```

Raw exit is the expected new-file difference `1`; diagnostic bytes are `0`.

Fresh Ruby 2.6-compatible SHA-256 recomputation over the Task 1 manifest and comparison with the retained Task 8 receipt produced:

```text
PROTECTED base=142 current=142 missing=0 hash_mismatches=0
TASK8_RECEIPT rows=142 exact_set=true receipt_mismatches=0
```

Fresh status comparison:

```text
baseline_rows=51 current_rows=53 staged=0 removed=[]
added=["?? .omo/lazycodex-executor-verify/",
       "?? output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md"]
```

The `.omo/lazycodex-executor-verify/` directory pre-existed this verifier turn and was preserved as concurrent harness state. The verifier did not edit it. No protected path changed.

High-signal scan over the syllabus, checker, and six pre-existing Task 8 artifacts (`8` files total) found:

```text
private_key=0 github_token=0 aws_access_key=0 slack_token=0
bearer_secret=0 jwt=0 credential_assignment=0 email=0
korean_rrn=0 korean_mobile=0
```

Final pre-report hashes remained:

```text
d062c7427f7b8a715f357f7d6f7e307f677fcd3b455c9b709c899ef192d52bee  output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
b5923d587e4c7934932e2ec9936e17d25015bb44eed6c6d9399fc1429d928450  .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb
```

## Required repair before confirmation

1. Add `description`, `kev_date_added`, and `kev_due_date` to the `vulnerability` checker contract and persist one omission control per field.
2. Either encode full Hermes, NVD, raw-manifest, and policy obligations as stable machine-consumed fields/IDs and validate those structures, or narrow the checker’s claimed coverage and retain manual semantic gates. The current partial literal list must not be described as “every Task 4/plan contract.”
3. Make milestone evidence fields machine-decidable beyond the presence of their labels, or explicitly treat their prose as manual QA. A correct ID beside arbitrary text must not prove evidence completeness.
4. Replace exact Korean prose predicates with stable policy fields or a deliberately bounded normalization contract, then persist meaning-preserving positive paraphrases alongside the inversion negatives.

## Cleanup

The QA root was validated against the exact `/tmp/hoseo-t8-v2.*` prefix before deletion. Its 128 files (mutants, stdout/stderr captures, fresh HTML, two Glow renders, and audit logs) were individually removed with `find ... -type f -delete`; the empty directory was removed with `rmdir`.

```text
CLEANUP_PASS path=/tmp/hoseo-t8-v2.8qBWO7 files_removed=128 dirs_before=1 temp_absent=true
```

No process, server, tmux session, browser, port, container, cloud resource, Hermes operation, cron/scheduler, live CTI request, wiki mutation, UA generation, or other runtime resource was created. This v2 receipt is the verifier’s only persistent write.
