# Global final v3 — code and document quality review

## Decision

```yaml
verdict: FAIL
codeQualityStatus: BLOCK
recommendation: REQUEST_CHANGES
confidence: HIGH
review_mode: read-only
reviewed_head: 8857bdd924bc0e155b7dd64a8a471692b7b7ab85
target: output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
target_sha256_required: 75df0f2733c5bf898b78ee531cbc13700aafcc359b4f7ea15d3a0c296d2c1e51
target_sha256_observed: 75df0f2733c5bf898b78ee531cbc13700aafcc359b4f7ea15d3a0c296d2c1e51
checker: .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb
checker_sha256_required: efab908d52db0049be5d7f1afaf7d78f814bbd9dc9360fe802c1577cfe2041cd
checker_sha256_observed: efab908d52db0049be5d7f1afaf7d78f814bbd9dc9360fe802c1577cfe2041cd
regression_harness: .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb
regression_harness_sha256: c5faba61f79a29a0b11a43e6bb953409a3b25263af88d0567c641707baef9bc8
reportPath: .omo/evidence/hoseo-data-analysis-cloud-platform-course/global-final-v3/code-quality-review.md
only_persistent_write: .omo/evidence/hoseo-data-analysis-cloud-platform-course/global-final-v3/code-quality-review.md
```

The current revision materially improves on the prior `FAIL`: the 49 milestone-cell, 36 fallback-cell, policy-line, and week-row Korean snapshots are gone, and the checker now parses an explicit typed YAML contract with Ruby `YAML.safe_load`. The exact shipped document is coherent and the ordinary valid, corrupt, malformed, render, and persisted-regression paths execute cleanly.

Approval is still blocked. Fresh controls show that the remaining substring polarity rules reject safe Korean formulations while accepting direct contradictions and prose-decoy injection. The typed contract is also not bound to the cardinality and headers of the document structures it claims to describe: a second contradictory contract, duplicate table headers, and a lost-competency/allowed-claim swap all receive the normal success line. The retained regression harness omits these cases, treats keyword-padded nonsense as valid positive coverage, can silently turn a positive mutation into a no-op, and counts two duplicate mutant bodies twice.

The assignment explicitly removed any future-lane or notepad prerequisite. No missing notepad is used as a finding or blocker in this report.

## Blockers

1. Replace the substring-based Korean polarity oracle with a bounded, uniquely located, machine-readable contract binding. Do not repair the false results by adding more Korean synonyms or full-sentence snapshots.
2. Enforce exactly one `### 자동 검증 계약` block and bind the declared milestone roles and fallback columns/tracks to the actual table headers and field placement/multiplicity.
3. Add retained black-box controls for the safe false-reject and harmful false-accept cases below. Every positive mutation must be proved non-noop, and reject cases must assert nonzero exit, empty stdout, `FAIL:`-only stderr, and no traceback.
4. Remove the two nonsense-as-success cases and the two duplicate mutant bodies. Safe paraphrases, not token-padded corrupt prose, must carry the anti-snapshot requirement.

## Findings by severity

### CRITICAL

None.

### HIGH

#### H1. Scoped polarity checks remain a brittle natural-language oracle and reject valid paraphrases

The checker uses substring blacklists such as `무의미`, `제공하지`, `간격을 두지 않`, and `허용한다` without grammatical scope (`syllabus_check.rb:146,151,167-180`). These are smaller than the removed full-sentence snapshots, but they still make ordinary meaning-preserving Korean edits fail.

Fresh non-noop positive controls, each preserving the typed values and intended policy, produced:

| Case | Expected | Actual | First diagnostic |
|---|---:|---:|---|
| M1 says it excludes meaningless markers and submits hash-backed evidence | 0 | 1 | `FAIL: M1-HAPPY evidence payload is incomplete` |
| Accessibility says there will be no case where captions/transcripts are not provided, then affirms delivery | 0 | 1 | `FAIL: accessibility prose contradicts the contract` |
| NVD says requests without spacing are forbidden, then affirms 6-second pacing/retry/last-good | 0 | 1 | `FAIL: NVD prose contradicts the typed retry contract` |
| Offensive policy says there is no exception that permits the listed activities | 0 | 1 | `FAIL: offensive prose contradicts the contract` |

This reproduces the core maintenance failure from F1/F4 v2 in a narrower form. The five existing positive rewrites and two additional straightforward rewrites passed, but a quality gate cannot claim paraphrase tolerance while equally safe negative formulations fail solely because a banned token appears inside an affirmative rule.

#### H2. First-match and positive-token checks allow harmful contradictions to return the normal PASS summary

Several policy checks use `text.lines.find` and inspect only the first matching line (`syllabus_check.rb:167-180`). Week 4 and NVD checks require positive tokens but cover only a short list of negations (`syllabus_check.rb:162-165,179-180`). A safe line can therefore mask a later contradiction, and an unlisted but direct inversion can retain the tokens.

Fresh non-noop harmful controls produced the exact success output `PASS headings=10 weeks=15 topic_ids=15 milestones=7 evidence_ids=49 fallbacks=6 weights=20/40/40 rubrics=40/40 contract=PASS` with exit 0, 125 stdout bytes, and empty stderr:

| Harmful control that was accepted | Expected |
|---|---:|
| Change NVD prose from preserving `last_good_*` to deleting it | 1 |
| Keep the text ``cron_mode: deny`` but explicitly allow cron execution in the week-4 row | 1 |
| Add a later bullet saying captions and transcripts are not provided | 1 |
| Add a later bullet saying commands from untrusted external responses are executed | 1 |

These are not obscure synonym attacks. They directly contradict `preserve_last_good: true`, `cron_mode: deny`, `accessibility.transcripts: true`, or `untrusted_external.execution: false`. Returning the ordinary PASS line is materially misleading.

#### H3. The typed YAML contract is not bound to exact document identity/multiplicity or table semantics

`assert_contract` correctly checks the parsed mapping's exact keys, values, and Ruby types (`syllabus_check.rb:80-130`), but the checker does not require exactly one contract heading/fence and does not compare the real milestone, grading, or fallback headers to the declared schema (`syllabus_check.rb:63-69,132-160`). The fallback body check only requires six long, non-placeholder cells; it cannot distinguish a lost competency from an allowed claim.

All of these harmful structural copies exited 0 with the same 125-byte PASS line and empty stderr:

| Accepted corruption | Expected |
|---|---:|
| Add a second `### 자동 검증 계약` whose UA contract says `accept: true` and `exit: zero` | 1 |
| Change milestone header `Fail` to a duplicate `Happy` | 1 |
| Change fallback header `lost competency` to a duplicate `preserved competency` | 1 |
| Change assessment header `학습성과 및 증거` to a duplicate `비중` | 1 |
| Swap the NCP row's `lost competency` and `allowed claim` cells while preserving Markdown shape | 1 |

The current target itself has the right headers and fallback meanings, but the checker does not verify the contract-to-document binding that its success output implies. This fails the requested exact identity/multiplicity and harmful-structural-control criteria.

#### H4. The regression harness classifies corrupt keyword padding as positive success evidence

The harness constructs `m1-token-stuffed-nonsense` and `v3-m1-semantic-padding` with payloads such as `PASS 바나나바나나` and seven M1 cells made from a contract keyword plus `바나나` (`task-8-regression.rb:59-67,80-96`). It then deletes those cases from the reject set and adds them to `positives`, expected exit 0 (`task-8-regression.rb:95-96,118-126`). Both returned the checker PASS summary in the retained run.

These are not safe paraphrases. They are precisely token-padded harmful prose. Safe rephrases already prove that unrestricted Korean wording is not snapshotted, so preserving these two tests adds no valid behavioral distinction. It instead inflates the reported positive surface and normalizes a generic PASS for a document whose educational milestone prose is corrupt. Under `remove-ai-slops`, this is useless/misleading test coverage; under `programming`, it is the same token-mirroring false confidence that prompt/prose tests must avoid. The correct repair is to delete these two expected-success cases, not to add a Korean semantic parser.

### MEDIUM

#### M1. Positive mutations can silently become no-ops, and the harness does not assert output channels

`verdict` writes the provided body, calls `Open3.capture2e`, and compares only the exit status (`task-8-regression.rb:15-21`). Positive bodies are built with `String#sub`, but the harness never asserts `body != source` before running them (`task-8-regression.rb:112-126`). If the target wording changes so a positive substitution no longer matches, the unmodified valid target will still exit 0 and the claimed paraphrase test will remain green. This is especially risky because positive-control absence was the central F1/F4 v2 blocker.

Current positive bodies were independently checked and are non-noop, so this is a maintainability/regression-risk finding rather than a claim that today's five safe positives did not execute. The harness should also use separate stdout/stderr capture and assert the checker channel contract; `capture2e` would not catch a future reject that prints `PASS` before exiting 1.

#### M2. The reported 78 controls contain only 76 distinct document bodies

Independent SHA-256 grouping of `valid + mutants + positives` found two duplicate groups generated at `task-8-regression.rb:25-29`:

```text
HARNESS_IDENTITY total=78 distinct_bodies=76 duplicate_groups=2
DUPLICATE_BODY sha256=27f3a6e9dea7828f0da00ae86ae209a15d325ac24ff15519d43bc3b6eec88a58 names=schema-vulnerability-kev-date-added,schema-vulnerability-kev_date_added
DUPLICATE_BODY sha256=96cc52c56fba7ea831bda61992da7bc84870cf213438371950f5a74a43842207 names=schema-vulnerability-kev-due-date,schema-vulnerability-kev_due_date
```

Both bodies differ from the source, but each pair is byte-identical. This is direct test duplication and makes the 78-control evidence count inaccurate as a distinct-scenario count.

### LOW

#### L1. The 160-column terminal schedule is intact but unnecessarily difficult to scan

Glow at width 160 retained every heading/table and no ellipsis marker, but the 11-column schedule expands to 551 lines and breaks stable identifiers across visual lines (for example `FAIL_UNRESTR` / `ICTED_SSH`). Width 400 is substantially clearer at 322 lines. This is not a correctness blocker—the source and both renders are complete—but a future document-only revision should consider a compact weekly summary plus narrower detail tables if 160-column terminal use is important.

## Prior blocker/root-fix verification

| Prior F1/F4 v2 issue | Current result | Evidence |
|---|---|---|
| Full Korean milestone/fallback/policy/week snapshots | **Resolved** | No `canonical_milestones`, `canonical_fallbacks`, `canonical_lines`, or `canonical_weeks`; full checker inspection and `rg` found only historical report mentions. |
| Typed contract absent | **Resolved in isolation** | `YAML.safe_load` with aliases disabled; exact recursive key/value/type comparison; typed-string false control rejected. |
| Meaning-preserving positive controls absent | **Partially resolved** | Five retained safe rewrites and two additional straightforward safe rewrites pass; H1 shows four equally valid scoped-negative rewrites still fail. |
| Harmful polarity controls | **Partially resolved** | Retained direct controls pass, but H2 shows direct delete/allow and decoy contradictions still pass. |
| Exact assessment/milestone/fallback multiplicity | **Partially resolved** | Row identities and weights are exact; H3 shows headers, contract-block cardinality, and fallback field semantics are unbound. |
| Current checker-bound code review absent | **Resolved by this artifact, verdict FAIL** | This report binds the full required target/checker hashes above. |

## Document-quality inspection

The exact shipped syllabus was read in full. Its current content is clear for a fourth-year CS audience, distinguishes documented facts/course defaults/fixtures/hypotheses, and consistently connects the lineage from CTI raw evidence through Wiki/UA/graph analysis. No current-document contradiction was found among the schedule, milestone, safety, retry, fallback, or source-ledger sections.

Independent structure results:

```text
DOC_CONTRACT headings=10 exact_order=true tables=11 widths=5,5,5,5,5,13,10,4,5,9,5 all_consistent=true
SCHEDULE rows=15 weeks=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15 row_widths=13
ASSESSMENT grade=출석:20,중간고사:40,기말고사:40 rubric_values=10,10,12,8,40,10,10,10,10,40
MILESTONE rows=7 widths=10
FALLBACK rows=6 tracks=NCP,Hermes,CTI API,LLM enrichment,UA generation,graph analysis widths=9
YAML type=Hash accept_type=FalseClass accept=false
DOCUMENT_STRUCTURE PASS
```

The six current fallback rows correctly separate live evidence, instructor fixture, preserved competency, lost competency, and allowed claim. The midterm rubric is 10+10+12+8=40; the final rubric is 10+10+10+10=40; weighted categories are exactly 20/40/40. The H3 finding is about the checker accepting corrupted copies, not a defect in these current target values.

## Exact command and execution evidence

All commands ran from `/Users/sysmoon/.codex/projects/pkm-study`.

| Exact invocation | Exit | Observable |
|---|---:|---|
| `git rev-parse HEAD` | 0 | `8857bdd924bc0e155b7dd64a8a471692b7b7ab85` |
| `sha256sum output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb` | 0 | Exact full hashes in the Decision block. |
| `ruby -w -c .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb` | 0 | stdout `Syntax OK` (10 bytes), stderr 0 bytes. |
| `ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` | 0 | Exact 125-byte PASS line, stderr 0 bytes. |
| `ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb` | 0 | 78 output lines, 78 printed `PASS` verdicts, stderr 0 bytes; only 76 distinct bodies per M2. |
| `ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb .omo/evidence/hoseo-data-analysis-cloud-platform-course/corrupt-syllabus.md` | 1 | stdout 0; stderr 330 bytes; includes missing week 8 and grading mismatch. The retained corrupt file predates the typed YAML addition, so it also reports missing machine contract. |
| `pandoc --standalone --from gfm --to html5 output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md --output <temp>/syllabus.html` | 0 | 60,735 bytes, 11 tables, stderr 0, active-content matches 0. |
| `NO_COLOR=1 COLUMNS=160 glow -s dark -w 160 output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md > <temp>/glow-160.txt` | 0 | 105,263 bytes, 551 lines, stderr 0, ellipsis matches 0. |
| `NO_COLOR=1 COLUMNS=400 glow -s dark -w 400 output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md > <temp>/glow-400.txt` | 0 | 146,824 bytes, 322 lines, stderr 0, ellipsis matches 0. |
| Ruby 2.6-compatible `Digest::SHA256.file` recomputation over `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-protected-sha256.txt` | 0 | `entries=142 missing=0 mismatches=0`. |
| `git diff --cached --name-only` | 0 | 0 staged paths. |
| `git status --short` | 0 | 52 dirty-worktree status lines; the target/checker/harness are untracked and therefore identified by SHA-256, not HEAD. |

The first reviewer-only protected-manifest helper attempt used Ruby's post-2.6 `filter_map` and exited 1 with `NoMethodError`; it was immediately retried with `each_with_object`, which produced the successful 142/0/0 result above. This helper failure did not touch the repository and is disclosed rather than hidden.

### Independent positive/harmful runner

The custom controls used this exact execution shape:

```text
ruby - CHECKER TARGET <<'RUBY'
# File.binread(TARGET); assert every mutated body != source;
# Dir.mktmpdir; File.binwrite one case; Open3.capture3('ruby', CHECKER, case_path)
# require exit 0 + PASS stdout + empty stderr for positives;
# require exit 1 + empty stdout + FAIL:-only stderr for harmful cases.
RUBY
```

The 20-case primary matrix process exited 1 because seven harmful cases returned 0. The six-case scoped-polarity/structural matrix process exited 1 because four safe cases returned 1 and two harmful structural cases returned 0. Each subprocess exit and first diagnostic is reproduced in H1-H3. All case bodies were created from the exact target hash in the Decision block, and each runner aborted on a no-op mutation.

Boundary runner results, using the same `Dir.mktmpdir`/`Open3.capture3` shape:

```text
no-argument exit=1 PASS stdout=0 stderr=45 FAIL: syllabus path is missing or unreadable
missing-path exit=1 PASS stdout=0 stderr=45 FAIL: syllabus path is missing or unreadable
directory-path exit=1 PASS stdout=0 stderr=45 FAIL: syllabus path is missing or unreadable
invalid-utf8 exit=1 PASS stdout=0 stderr=34 FAIL: syllabus is not valid UTF-8
malformed-yaml exit=1 PASS stdout=0 stderr=106
  FAIL: machine contract YAML parse error: Psych::SyntaxError
  FAIL: machine contract must be a YAML mapping
```

## ULTRAQA disposition

| Probe | Result | Evidence/reason |
|---|---|---|
| Malformed path/bytes/YAML | PASS | All exit 1 with empty stdout, stable `FAIL:` stderr, and no traceback. |
| Prompt/prose injection | **FAIL** | Later accessibility/data-execution contradictions and a second contradictory YAML contract are ignored; checker exits 0. |
| Stale hashes | PASS for this review | HEAD and all three full artifact hashes were recomputed before and after testing. Prior PASS receipts with older hashes were treated as stale, not current evidence. |
| Dirty worktree | PASS with attribution boundary | 52 status lines, staged count 0, protected manifest 142/0/0; SHA-256 binds the untracked build. |
| Misleading PASS | **FAIL** | Nine novel harmful/structural copies and both retained keyword-padded nonsense positives receive the normal PASS line. |
| Repeated valid execution / flakiness | PASS, no flake observed | Valid checker was deterministic; the full harness ran twice during review and exited 0 both times. |
| Long/hung operation | N/A | Only bounded local file reads, regex/YAML parsing, local Ruby subprocesses, Pandoc, and Glow were observed; no hang or external wait. |
| Repeated interruption/resume | N/A | Checker and harness are one-shot local processes with no durable resume state. |

## Required skill-perspective check

- `review-work`: **ran as the assigned Code and Document Quality leaf lane**. The explicit no-spawn/owned-report instruction superseded the skill's aggregate five-agent orchestration; no subagent was created.
- `remove-ai-slops`: **ran** over production checker and tests. The checker has one bounded responsibility, 188 pure LOC, no dead helper, broad rescue, network, eval, or oversized-module defect. It **violates** the perspective through substring-based pseudo-semantics, two useless harmful-positive tests, two duplicate mutant bodies, and success evidence that overstates distinct/relevant coverage.
- `programming`: **ran** using the shared boundary, determinism, TDD, prompt/prose, and implementation-mirroring criteria. The skill has no Ruby-specific reference. The typed YAML boundary and specific Psych rescue are sound. It **violates** the test-shape perspective because positive substitutions can no-op, output channels are merged, corrupt prose is asserted as positive, and policy regexes mirror token presence rather than a stable machine contract.
- Full Korean snapshot check: **passed**. The removed canonical sentence/cell maps are absent. The remaining scoped token regexes are not full snapshots, but H1/H2 show they still violate the anti-overfit/false-confidence intent.

## Cleanup and scope receipt

All custom documents used `Dir.mktmpdir` and were automatically removed. The Pandoc/Glow shell directory was created with `mktemp -d`, its exact files were deleted, and the empty directory was removed; `render_dir_exists=no`. The base-command capture directory was likewise removed; `qa_dir_exists=no`. No server, browser, port, container, network operation, cloud resource, scheduler, or background process was started.

No target, checker, harness, plan, ledger, Boulder state, canonical page, raw source, generated UA artifact, or prior evidence file was edited. The target, checker, and harness SHA-256 values remained exactly those in the Decision block after testing. The only persistent write by this lane is this report.

## Final recommendation

`REQUEST_CHANGES`. The current syllabus content and baseline error boundaries are good, and the previous full-snapshot design is genuinely removed. The remaining false rejects, false accepts, unbound structural contract, and misleading regression cases are still HIGH-severity quality blockers. Approval requires a fresh review of the repaired exact checker/harness hashes after all four blockers are resolved.
