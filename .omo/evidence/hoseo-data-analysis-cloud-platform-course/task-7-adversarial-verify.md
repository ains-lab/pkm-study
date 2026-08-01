# Todo 7 AdversarialVerify

```yaml
AdversarialVerify:
  task: "7. Assemble the single Korean 15-week syllabus"
  reviewed_at_utc: 2026-07-29T06:38:00Z
  verdict: confirmed
  confidence: 0.99
  scope: "Todo 7 assembly only; scoped review, not the final Global Review gate"
  independent_reviewer: true
  implementation_or_rewrite_by_reviewer: false
  only_persistent_write: ".omo/evidence/hoseo-data-analysis-cloud-platform-course/task-7-adversarial-verify.md"
```

## Verdict

`confirmed`. Every Todo 7 criterion passed independent reproduction against the assembled syllabus and the confirmed Todo 1–6 briefs/receipts. The syllabus is a nonempty UTF-8/LF/final-newline file with exactly the ten required H2 sections, 15 uniquely numbered weeks, 13 exact `60분 비동기 동영상 + 120분 대면 실습` rows, and only weeks 8 and 15 as `3시간 개인 실기시험, 신규 강의 없음`.

The outcome, schedule, and assessment sections all use LO1–LO5. The grade table is exactly 20/40/40; the midterm is exactly 10+10+12+8=40; the final is exactly 10+10+10+10=40. All seven milestones contain happy path, failure path, student artifact plus machine evidence, fallback with preserved/lost scope, safety/cost, and assessment linkage. The platform table keeps Docker Hermes persistence `fixture-only`; the fallback table has exactly six complete, honest rows.

The target preserves the validated brief facts and distinctions rather than merely repeating acceptance literals: NCP documentation unavailability is a dated availability observation rather than feature absence; Hermes is pinned to the brief’s immutable commit; CISA, NVD, EPSS, and ATT&CK values match the dated Todo 1 ledger semantically; live and fixture claims remain distinct; graph/LLM relations remain hypotheses until source checked. No placeholder, permanent volatile count/price threshold, unsupported offensive assignment, secret, or PII was found.

## Inputs read

- `AGENTS.md`, the complete plan including Todo 7, `SCHEMA.md`, `index.md`, and recent `log.md`
- Todo 1 baseline, protected-hash manifest, source ledger, failure receipt, and adversarial confirmation
- Todo 2–6 briefs, worker checks, and independent adversarial confirmations
- `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`
- `task-7-assembly-check.txt`

No worker PASS prose was accepted without reopening the corresponding artifact and reproducing its claim.

## Independent acceptance results

| Criterion | Result | Direct observable |
| --- | --- | --- |
| Encoding/file integrity | PASS | 30,790 bytes; valid UTF-8; LF only; final LF present |
| Required H2 contract | PASS | Exact ordered unique set of 10 headings |
| Schedule | PASS | Weeks `1..15` once each; 13 instructional rows; exams exactly `8,15` |
| Fixed topic sequence | PASS | All 15 rows independently matched their required topic/activity terms |
| LO alignment | PASS | LO1–LO5 each defined once and present in schedule and assessment |
| Grade weights | PASS | `20/40/40`, total 100, no fourth weighted category |
| Midterm rubric | PASS | Named rows `10+10+12+8=40` |
| Final rubric | PASS | Named rows `10+10+10+10=40` |
| Formative team rule | PASS | `2~3인`, project has no separate score/weight, exams require individual evidence |
| Milestones | PASS | M1–M7; seven required columns; every cell nonempty and semantically populated |
| Lineage | PASS | Exact seven-stage chain from CTI response through checked conclusion |
| Platform limits | PASS | NCP/Linux/WSL2 live scope separated; Docker Hermes persistence is fixture-only |
| Fallback matrix | PASS | Exactly NCP, Hermes, CTI API, LLM enrichment, UA generation, graph analysis; all seven cells per row nonempty |
| CTI contract | PASS | Raw 8 fields, normalized record distinctions, uppercase join, exact dedupe key, absent/null/unknown, bounded 429/last-good rules |
| UA contract | PASS | Complete batch/freshness plus all graph invariants for live; pinned hash plus fresh report and no-enrichment claim for fallback |
| Graph analysis | PASS | Directed provenance; unweighted simple undirected projection; loop/multiedge/weight/tie policy; three metric families and tolerance |
| Governance | PASS | Public-data-only, credential/redaction, retention/deletion, cost/full teardown, accessibility, outage and preflight rules |
| Statement types | PASS | Documented fact, course default, semester fixture, and hypothesis are explicitly separated |
| Unsupported content | PASS | No scaffold marker, unsupported permanent volatile threshold, or offensive assignment |

The main inline Ruby parser reported only one initial failing helper predicate: it searched the ledger for literal `5/30s`/`50/30s`, while the validated ledger states the same facts as prose (“5/50 requests in a rolling 30-second window”). The other assembly predicates passed. A corrected semantic source comparison then passed all ten fact checks below. This was a verifier-literal error, not a syllabus defect.

## Source-fact parity with confirmed briefs

Exact invocation:

```sh
ruby - output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md \
  .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-source-ledger.md <<'RUBY'
# Independently compare: as_of, Hermes pin, CISA catalogVersion, NVD API and
# semantically equivalent rate wording, EPSS response date, ATT&CK fixture/latest,
# NCP unavailable-not-absence wording, no-overwrite refresh, and volatile threshold rule.
RUBY
```

Result: exit `0`.

```text
SOURCE_SEMANTIC_PARITY_PASS checks=10 keys=as_of,hermes_pin,cisa_catalog,nvd_api,nvd_rates_semantic,epss_date,attack_fixture_latest,ncp_unavailable_not_absence,refresh_no_overwrite,volatile_not_threshold
```

Manual comparison against the briefs also confirmed:

- Todo 3’s non-circular fixture hash rule appears as top-level `sha256` exclusion, recursive key sorting, preserved array order, compact UTF-8 JSON, and versioned replacement rather than overwrite.
- Todo 4’s Hermes/CTI rules retain non-root operation, doctor, local-only delivery, one scheduler, approval boundary, redaction, exact raw/dedupe contracts, last-good, and safe negative fixtures.
- Todo 5’s Wiki/UA/graph progression retains lint-before-UA, complete batches, freshness, structural invariants, projection policy, tolerance, exact lineage, verified insight, and rejected inference.
- Todo 6’s assessment/governance rules retain policy-owned absence/retention decisions, six complete fallback tracks, full teardown, captions/transcripts, and accessible alternatives.

## Missing-brief fail-closed reproduction

An isolated temp directory was used; the real target’s hash and mtime were captured before and after. The gated hypothetical assembly included the six real briefs plus a nonexistent temp path and copied the real target to a hypothetical temp target only if every `test -s` passed.

Exact command shape:

```sh
qa_dir=$(mktemp -d /tmp/hoseo-t7-adversarial.XXXXXX)
missing_brief="$qa_dir/missing-brief.md"
hypothetical_target="$qa_dir/would-be-target.md"
briefs=(task-1-source-ledger.md task-2-course-contract.md task-3-ncp-module.md \
        task-4-hermes-cti-module.md task-5-wiki-ua-graph-module.md \
        task-6-governance-assessment.md "$missing_brief")
for brief in "${briefs[@]}"; do
  if ! test -s "$brief"; then gate=23; break; fi
done
if [ "$gate" -eq 0 ]; then cp "$real_target" "$hypothetical_target"; fi
```

Result: exit `0` for the enclosing assertions.

```text
PRECHECK_REJECT missing_or_empty=/tmp/hoseo-t7-adversarial.GdjSy4/missing-brief.md
MISSING_BRIEF_PREFLIGHT_PASS gate=23 hypothetical_target_absent=true real_target_untouched=true hash=b87d72f0227c1e59d33e13e6db011d132156644eb8536f4dcb6c2036e3d41210 mtime=1785305877
TEMP_DIR_CONTENTS_AFTER_PREFLIGHT=0
```

Thus the missing brief failed before hypothetical target creation, and the real syllabus was not touched.

## Render and direct manual QA

Exact renderer invocations:

```sh
pandoc -f gfm -t html --wrap=none -o "$qa_dir/syllabus.html" output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
pandoc -f gfm -t plain --columns=400 -o "$qa_dir/syllabus.txt" output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
COLUMNS=420 NO_COLOR=1 glow -w 400 -s dark output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md > "$qa_dir/glow.txt"
```

Results: all exits `0`.

```text
RENDER_PASS html_bytes=37901 h2=10 tables=10 plain_bytes=37163 glow_bytes=109584 glow_lines=236 korean_chars=4646 ellipsis=0 ansi_stripped=true
DIRECT_INSPECTION_PASS samples=10 ellipsis=0
```

Glow’s dark style emits ANSI spans even with `NO_COLOR`; the first raw-substring helper therefore missed headings split by color codes and the styled `fixture-only` word. It was not counted as a document failure. Stripping ANSI control sequences and rerunning the exact content checks passed. Direct inspection at width 400 found intact Korean for all ten headings, the 20/40/40 and both rubric tables, weeks 8/15, M1–M7, the platform/fallback tables, policy/preflight content, and the dated ATT&CK row. No ellipsis, clipped header, merged cell, or malformed pipe/table semantic was observed.

## Protected state and exact write scope

The protected-manifest checker reparsed all SHA rows, enumerated the current protected roots while excluding only the future syllabus, recomputed every hash, and compared exact sorted path sets.

```sh
ruby -rdigest - .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-protected-sha256.txt <<'RUBY'
# Parse declared manifest; enumerate SCHEMA/index/log, canonical dirs, raw, .ua,
# and output except the new syllabus; compare set/order and every SHA-256.
RUBY
```

Result: exit `0`.

```text
PROTECTED_PASS declared=142 rows=142 unique=142 sorted=true current=142 exact_set=true mismatches=0
```

An earlier reviewer command incorrectly combined a pipe with `ruby -` and a heredoc, causing Ruby to parse the piped filename stream as source and exit nonzero with `uninitialized constant SCHEMA`. That harness result was disclosed and discarded; the corrected direct enumerator above passed. No file was changed by either invocation.

Write-scope comparison against Todo 1’s exact captured status:

```text
WRITE_SCOPE_PASS baseline=51 current=52 added=["?? output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md"] removed=[] protected_target=false task7_files=1 staged=0 chronology=briefs<target<=check
b87d72f0227c1e59d33e13e6db011d132156644eb8536f4dcb6c2036e3d41210  output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
e38bdce20778f51f49969d4e0d5027d5b6a4fbc7b53c884854dcb9a8eea81a40  .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-7-assembly-check.txt
WHITESPACE_PASS no_index_exit=1 diagnostics=0
```

The no-index exit `1` is the normal added-file difference. Before this verifier receipt, the exact `task-7-*` set was only `task-7-assembly-check.txt`; the other Task 7 write is the new syllabus. The evidence directory was already represented by `?? .omo/evidence/` in the Todo 1 baseline, while the only new top-level status line is the syllabus. No path is staged.

## Secret, PII, prompt, and safety scan

The target and assembly check were scanned for private keys, common GitHub/AWS/Slack token forms, bearer values, JWTs, non-redacted credential assignments, email, Korean resident-registration numbers, and Korean mobile numbers.

```text
SECRET_PII_PASS files=2 private_key=0 github_token=0 aws_access_key=0 slack_token=0 bearer_secret=0 jwt=0 credential_assignment=0 email=0 korean_rrn=0 korean_mobile=0
PROMPT_INJECTION_SHAPE_PASS rg_exit=1 matches=0 source_data_only=true
```

Direct semantic review distinguished prohibited terms used in negative policy statements from assignments. Malware execution, exploit proof-of-concepts, active scanning, credential collection, login-gated scraping, attack automation, and automatic patching/response are explicitly outside the task/automation scope. Graph relations without source proof are explicitly rejected rather than assigned as fact.

## Adversarial matrix

| Class | Verdict | Probe and observable |
| --- | --- | --- |
| `malformed_input` | PASS | A missing temp brief set gate `23`; the hypothetical target remained absent and the real target hash/mtime stayed unchanged. |
| `prompt_injection` | PASS | Brief/web/raw/LLM/graph text is source data only; injection-shape scan found zero matches; unsupported relations route to hypothesis/rejected inference. |
| `stale_state` | PASS | Dated fact/default/fixture/hypothesis labels, `as_of`, immutable Hermes pin, ATT&CK fixture/latest distinction, fresh live/report gates, and no-silent-refresh rule all passed semantic review. |
| `dirty_worktree` | PASS | All 142 protected paths and hashes match, status delta is exactly the new syllabus, assembly-check scope is exact, and staged paths are zero. |
| `misleading_success_output` | PASS | Worker prose was ignored; independent parse, semantic brief comparison, Pandoc, ANSI-normalized Glow, manual table reading, hashes, and opposite missing-brief outcome agree. Three verifier harness mistakes were recorded rather than mislabeled as passes. |
| `cancel_resume` | PASS | Complete brief set is a creation gate; UA partial/stale results cannot merge; Hermes/CTI failure preserves last-good without relabeling it as current success. |
| `repeated_interruptions` | PASS | Complete-input gate plus final target encoding/structure is deterministic; expected UA batch-set mismatch and stale artifacts remain failures after any interruption. |
| `hung_long_commands` | N/A | This review used finite local parsing, hashing, and rendering only; no server, poll, network request, cloud operation, agent installation, cron, or UA run occurred. |
| `flaky_tests` | N/A | All acceptance probes are deterministic over fixed local files. Dated volatile values are evidence comparisons, not live pass thresholds. |

## Cleanup

The only QA directory was `/tmp/hoseo-t7-adversarial.GdjSy4`. Its five generated render/diagnostic files were individually unlinked and the now-empty directory was removed with `rmdir` after validating the exact `/tmp/hoseo-t7-adversarial.*` prefix.

```text
CLEANUP_PASS temp_absent=true receipt_absent_before_write=true
```

No temporary fixture, copied target, process, server, browser context, container, cloud resource, Hermes installation/configuration, cron job, live CTI response, canonical/wiki change, or UA generation remains. This receipt is the verifier’s only persistent write. No unrelated final-gate programming input was required or applied.

Post-write self-check: this receipt is nonempty UTF-8/LF with a final newline; the syllabus and assembly-check hashes above remain unchanged; all 142 protected hashes still match; the final `task-7-*` set is exactly the assembly check plus this receipt; and the expanded three-file secret/PII scan remains zero.
