# HoSeo global-gate failure debugging

## Verdict

**PASS — root causes are runtime-confirmed and the repair instructions below are evidence-complete.** This is an investigation only: the syllabus, shipped checker, plan, and ledger were not changed.

Pinned reproduction: `HEAD=8857bdd924bc0e155b7dd64a8a471692b7b7ab85`; syllabus SHA-256 `b87d72f0227c1e59d33e13e6db011d132156644eb8536f4dcb6c2036e3d41210`; checker SHA-256 `4eb64f0ee5acb571547e07b9431d30bdff0fe14af8f5306fd3a72960b075ee16`. Runtime: Ruby `2.6.10p210`.

## Exact invocation and observed output

All mutations and copied checkers lived only in `/tmp/hoseo-debug-global-gate`; `shipped_check.rb` was a byte copy of the pinned checker. General invocation was:

```sh
ruby /tmp/hoseo-debug-global-gate/<checker>.rb \
  /tmp/hoseo-debug-global-gate/<mutant>.md 2>&1
```

Baseline:

```text
$ ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
PASS headings=10 weeks=15 instructional=13 exams=8,15 weights=20/40/40 mid=10+10+12+8 final=10+10+10+10 milestones=7 fallbacks=6 lo=LO1-LO5
exit=0
```

| Scenario | Shipped checker | Targeted temporary toggle |
|---|---|---|
| duplicate week 1 (an extra identical row, 16 physical rows) | `PASS`; exit `0` | `FAIL: weeks must be the exact multiplicity set 1..15`; exit `1` |
| duplicate attendance row (same 20% identity) | `PASS`; exit `0` | `FAIL: grading rows must have exact unique identities and weights`; exit `1` |
| replace M7 with a full duplicate M1 row | `PASS`; exit `0` | `FAIL: milestones must have exact unique M1-M7 identities`; exit `1` |
| replace graph-analysis fallback row with a full duplicate NCP row | `PASS`; exit `0` | `FAIL: fallbacks must have exact unique required track identities`; exit `1` |
| M1 token stuffing (`PASS fixture`, `오류`, `JSON report`, `fixture 불가`, `secret 없음`, `LO1 출석`) | `PASS`; exit `0` | `FAIL: M1 requires its explicit verified diagnostic contract`; exit `1` |
| week-2 `cloud·NCP networking` → `클라우드·NCP 네트워크` | `FAIL: fixed topic mismatch for week 2`; exit `1` | `PASS`; exit `0` |
| M6 `partial/stale/... nonzero로 거절` → `...성공으로 인정` | `PASS`; exit `0` | `FAIL: UA partial/stale state must be rejected explicitly`; exit `1` |
| accessibility `자막과 대본을 제공한다` → `제공하지 않는다` | `PASS`; exit `0` | `FAIL: accessibility policy must affirm captions and transcript`; exit `1` |
| offensive activity and untrusted content changed to permitted/executed | `PASS`; exit `0` | `FAIL: offensive activity must be prohibited explicitly`; `FAIL: untrusted content must be data-only explicitly`; exit `1` |
| prepend `<script>` plus `javascript:` link | `PASS`; exit `0` | `FAIL: active script or javascript URI is forbidden`; exit `1` |
| actual shipped syllabus against carry-through check | `PASS`; exit `0` | `FAIL: final assembly omitted required Hermes/CTI/NVD carry-through contract`; exit `1` |
| temporary input with all carry-through clauses restored | n/a | `PASS`; exit `0` |

The temporary H1 checker first preserves arrays for ID/multiplicity assertions and only then builds lookup maps. The H2 copy requires an explicit M1 contract sentence and permits the Korean topic synonym. The H3 copy adds scoped positive/negative policy predicates and blocks active HTML/URI schemes. The H4 copy asserts Task 4 carry-through phrases. Each temporary checker itself passed `ruby -c`; its baseline/complete input passed where applicable.

## Confirmed causes

1. **H1 — lossy collection assembly.** `each_with_object({})` for week IDs and `to_h` for weights overwrite duplicates. Milestones and fallbacks use count-only checks. The green→red toggles above confirm the cause.
2. **H2 — prose token buckets.** Required English tokens are treated as semantics. A meaningless row satisfies all buckets; a Korean equivalent fails. The two opposite runtime toggles confirm the cause.
3. **H3 — unscoped polarity/active-content checks.** Presence of labels/tokens does not establish that partial data is rejected, accessibility is supplied, offensive behavior is forbidden, or untrusted text is inert. No HTML/URI active-content guard exists. Each requested inversion passed until its predicate was toggled.
4. **H4 — no final carry-through contract.** The shipped syllabus lacks the Task 4 clauses searched below, yet the shipped checker reports success. A final-assembly assertion fails on the actual input and passes only when a temporary completed input supplies those clauses.

## Actual omission search

Exact command:

```sh
for q in 'messaging/browser' '학생 workspace' 'wakeAgent' 'changedPaths' \
  'resultsPerPage' 'startIndex' '페이지/날짜 batch' 'value_state' \
  'state_reason' 'published_at' 'fixture_release'; do
  rg -n -F "$q" output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md || true
done
```

stdout was empty for every query (the command exits `0` because of `|| true`). These are the missing carry-through areas: separate messaging/browser approval; workspace/tool allowlist; Hermes gate facts (`wakeAgent`, `changedPaths`, and trusted gate output); NVD batching/pagination; and the normalized CTI fields including vulnerability timestamps, value state/reason, and ATT&CK fixture release.

## Minimal repair requirements

### Task 7 — syllabus writer

- Restore the omitted Hermes boundaries from the approved Task 4 brief: messaging/browser require separate approval; student workspace/tool allowlist; trust `wakeAgent`, `reason`, and `changedPaths` rather than recalculating a gate.
- Restore NVD page/date batching and pagination, minimum six-second pacing, bounded retry/defer behavior.
- Restore the complete normalized `vulnerability`, `signal`, and `attack` schemas, including `published_at`, `last_modified_at`, `value_state`, `state_reason`, and ATT&CK `fixture_release` fields.
- Add stable machine-consumed identifiers/evidence fields for fixed weekly topics and milestone obligations. Do not try to make free prose semantically decidable by expanding keyword lists.
- Keep required policy claims in their policy sections with explicit polarity: partial/stale rejects/nonzero; captions/transcript/accessibility provided; offensive actions prohibited; untrusted content is data only and not executed. Preserve inert Markdown (no active scripts or JavaScript URIs).

### Task 8 — checker writer

- Parse rows as arrays and assert exact ID multisets before converting to maps: weeks `1..15`, grading categories, `M1..M7`, and six fallback tracks, each exactly once.
- Replace natural-language keyword buckets with checks of the stable IDs/evidence fields supplied by Task 7; retain a limited normalization map only where a deliberately supported synonym is specified.
- Add explicit scoped predicates for UA partial/stale rejection, accessibility provision, offensive-action prohibition, data-only untrusted content, and a document-wide active-content denylist (`<script`, event-handler HTML, `javascript:`; render the resulting HTML as a second surface check).
- Add a final carry-through assertion for every required Task 4/plan contract. It must fail when any required Hermes, NVD, or normalized-schema field is omitted.
- Handle missing input and invalid UTF-8 at the CLI boundary before any regex traversal, emitting one stable `FAIL:` message and exit `1` rather than a Ruby backtrace.

## Failing-first controls to persist

- Each H1 duplicate/missing identity mutation listed above.
- H2 token-stuffed milestone must fail; documented Korean-equivalent topic text must pass.
- H3 stale/partial success, accessibility inversion, offensive/data-only inversion, `<script>`, `on*=` HTML handler, and `javascript:` link must fail; valid baseline must pass.
- H4 one mutant per required carry-through clause plus a complete-schema positive control.
- Missing file and invalid UTF-8 must return `FAIL:` with exit `1`, no traceback.

## manualQa

### surfaceEvidence

| scenario id | criterion reference | surface | exact invocation | verdict | artifactRefs |
|---|---|---|---|---|---|
| MQ-1 | H1 collection multiplicity | terminal CLI via tmux | `tmux send-keys -t hoseo-debug-qa 'ruby /tmp/hoseo-debug-global-gate/shipped_check.rb /tmp/hoseo-debug-global-gate/h1-duplicate-week.md; printf "SHIPPED_EXIT=%s\\n" "$?"'` followed by the exact-ID checker command | PASS: transcript shows shipped `PASS`/`0`, toggle `FAIL`/`1` | A1 |
| MQ-2 | H2–H4 runtime toggles | CLI | tabled Ruby invocations above, with stdout/stderr merged by `2>&1` | PASS | A1 |
| MQ-3 | adjacent silent failure | CLI | `ruby .../syllabus_check.rb /tmp/hoseo-debug-global-gate/does-not-exist.md 2>&1`; invalid-byte input likewise | PASS finding: both exit `1` but print raw backtraces | A1 |

### adversarialCases

| scenario id | criterion reference | adversarial class | expected behavior | verdict | artifactRefs |
|---|---|---|---|---|---|
| AC-1 | H1 | duplicate/missing identity | shipped red is required after repair | confirmed defect | A1 |
| AC-2 | H2 | false positive + false negative | stuffed text red; Korean equivalent green | confirmed defect | A1 |
| AC-3 | H3 | polarity and active-content inversion | all malformed policy/content paths red | confirmed defect | A1 |
| AC-4 | H4 | omitted final carry-through | actual missing clause red | confirmed defect | A1 |

### artifactRefs

| id | kind | description | path |
|---|---|---|---|
| A1 | investigation report | commands, runtime outputs, root causes, QA matrix, and cleanup | `.omo/evidence/hoseo-data-analysis-cloud-platform-course/global-gate-failure-debug.md` |

## Silent-failure scan

`rg -n 'rescue|begin|system\\(|exec\\(|`|Open3|eval|exit 0|abort|File\\.binread|valid_encoding|to_h|each_with_object|\\.length ==' syllabus_check.rb` found no command/network/eval execution, but did find the lossy `each_with_object`, `to_h`, and count checks. Missing-path and invalid-UTF-8 real runs exit `1` with uncaught `Errno::ENOENT` and `ArgumentError` backtraces. This is an adjacent reporting defect, not a claim that the checker silently succeeds.

## Cleanup

Temporary checker copies, mutants, invalid UTF-8 fixture, and tmux transcript were created only under `/tmp/hoseo-debug-global-gate` and tmux session `hoseo-debug-qa`; both are journaled for removal. No network, cloud, Hermes, cron, gateway, browser, or repository product artifact was changed.
