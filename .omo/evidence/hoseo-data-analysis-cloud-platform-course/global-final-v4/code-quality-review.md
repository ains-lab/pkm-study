# Global final v4 — code and document quality review

## Decision

```yaml
verdict: FAIL
codeQualityStatus: BLOCK
recommendation: REQUEST_CHANGES
confidence: HIGH
review_mode: read-only-except-report
reviewed_head: 8857bdd924bc0e155b7dd64a8a471692b7b7ab85
target: output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
target_sha256_required: 65ed06d96716202509679a3a3ef57c4a0d446c2bb77998a454ed2885d2123d66
target_sha256_observed: 65ed06d96716202509679a3a3ef57c4a0d446c2bb77998a454ed2885d2123d66
checker: .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb
checker_sha256_required: 487470cea93eeb62ca199216f4db0385a3816a40428d725f5a9f419a9520f5ba
checker_sha256_observed: 487470cea93eeb62ca199216f4db0385a3816a40428d725f5a9f419a9520f5ba
regression_harness: .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb
regression_harness_sha256_required: ba031c00f4382d0e78408a0e1a9e17c410b561fae18e9b6afcbebabde5258dab
regression_harness_sha256_observed: ba031c00f4382d0e78408a0e1a9e17c410b561fae18e9b6afcbebabde5258dab
reportPath: .omo/evidence/hoseo-data-analysis-cloud-platform-course/global-final-v4/code-quality-review.md
only_persistent_write: .omo/evidence/hoseo-data-analysis-cloud-platform-course/global-final-v4/code-quality-review.md
```

The exact target is a coherent, source-aware syllabus, and the repaired checker now has useful typed-contract, exact-header, table-order, 49 milestone-ID, 36 fallback-ID, fixed-point entity-decoding, and channel-aware regression coverage. The pinned target, checker, and harness hashes all match; Ruby syntax, the valid target, all retained 38 controls, Pandoc, and both requested Glow widths execute successfully.

Approval remains blocked. The checker still derives required facts from exact Korean prose fragments, so seven straightforward meaning-preserving edits fail. Its YAML boundary also accepts duplicate keys, silently ignores a contradictory second YAML document, and misses additional GFM-valid YAML fences with three-space indentation or tilde delimiters; all five harmful copies print the ordinary 169-byte success line. A mapping with a non-string key exits nonzero but escapes the advertised error channel with an `ArgumentError` traceback. The retained harness does not cover these adjacent contract-boundary cases and therefore remains green while the production checker is wrong.

No future review lane or notepad was treated as a prerequisite. The dirty worktree was attributed by exact hashes; no unrelated change is a finding in this report.

## Blockers

1. Remove the remaining Korean prose predicates at `syllabus_check.rb:69-70,89,183,185,198`. Encode the instructional/exam duration, team cardinality/weighting, Docker/Hermes boundary, raw-manifest fields, and value-state contract as typed data or stable structural IDs instead of sentence fragments.
2. Parse exactly one YAML document with unique string keys. Reject duplicate keys at every depth and reject additional documents rather than relying on `YAML.safe_load`, which uses the last duplicate key and reads only the first stream document here.
3. Count the actual Markdown fence surface, including GFM-valid fences indented by up to three spaces and tilde fences, so a second contradictory YAML block cannot coexist with the declared contract.
4. Validate mapping-key types before sorting or descending. Every malformed contract must produce nonzero exit, empty stdout, bounded `FAIL:`-only stderr, and no traceback.
5. Add retained black-box controls for all cases above. Keep `capture3`, non-noop checks, distinct-body checks, and channel assertions; safe Korean paraphrases must accept, while duplicate-key, multi-document, extra-fence, and non-string-key cases must cleanly reject.

## Findings by severity

### CRITICAL

None.

### HIGH

#### H1. The checker still uses Korean prose as a machine oracle

The repair removed the former full milestone/fallback/policy snapshots, but exact natural-language predicates remain:

- `syllabus_check.rb:69-70` recognizes instructional and exam rows only through the exact phrases `60분 비동기 동영상 + 120분 대면 실습` and `3시간 개인 실기시험, 신규 강의 없음`.
- `syllabus_check.rb:89` requires the literal `2~3인` and a narrow `별도 (점수|가중치)가 없` expression.
- `syllabus_check.rb:183` requires `Docker` then `Hermes` then `fixture-only` within fixed character gaps.
- `syllabus_check.rb:185` requires the sentence prefix `CTI raw manifest 필드는`.
- `syllabus_check.rb:198` requires `absent`, `null`, and `unknown` in one fixed order and distance.

Seven non-noop, meaning-preserving copies were independently run through the real checker. Every one incorrectly exited 1 with empty stdout:

| Safe mutation | Expected | Actual | Diagnostic |
| --- | ---: | ---: | --- |
| All 13 instructional rows: `비동기 동영상 60분 + 대면 실습 120분` | 0 | 1 | `FAIL: instructional and exam week format mismatch` |
| Both exam rows: `신규 강의 없이 3시간 개인 실기시험` | 0 | 1 | same |
| `2~3인` → `두 명 또는 세 명` | 0 | 1 | `FAIL: team must be 2-3 and unweighted` |
| `별도 가중치가 없고` → `추가 배점을 두지 않고` | 0 | 1 | same |
| `CTI raw manifest 필드는` → `CTI raw manifest에는` | 0 | 1 | `FAIL: CTI raw manifest contract missing` |
| Preserve all state tokens/fields but order them `unknown`, `absent`, `null` | 0 | 1 | `FAIL: absent/null/unknown state contract missing` |
| Preserve the Docker/Hermes fixture-only meaning but change sentence order | 0 | 1 | `FAIL: Docker/Hermes must be fixture-only` |

This directly violates the requested no-Korean-prose-oracle criterion. It also contradicts the success line's claim that `prose_semantics=REVIEWED_EXTERNALLY`: these semantics are still partially and brittly machine-gated.

#### H2. Duplicate YAML keys and a second YAML document receive the normal success output

`YAML.safe_load` at `syllabus_check.rb:108-112` is applied to one captured string. The recursive comparator at `syllabus_check.rb:133-145` compares only the mapping returned by Psych; it never proves source-level key uniqueness or stream cardinality.

Three harmful structured controls exited 0 with the exact ordinary PASS line, 169 stdout bytes, and empty stderr:

| Harmful contract copy | Actual behavior |
| --- | --- |
| Insert `contract_version: "0.0"` immediately before the original `contract_version: "1.0"` | Last duplicate wins; checker passes |
| Insert `transcripts: false` immediately before the original `transcripts: true` | Last duplicate wins; checker passes |
| Append `---`, `contract_version: "9.9"`, and `offensive.malware_execution: true` inside the sole YAML fence | `YAML.load_stream` sees two documents, but `YAML.safe_load` returns only the first and checker passes |

Independent parsing confirmed `YAML_STREAM documents=2 safe_load_contract_version=1.0`. A consumer using YAML stream semantics or first-key semantics sees a different contract from the checker. A success line claiming `machine_contract=PASS` is therefore misleading.

#### H3. Document-wide contract cardinality ignores valid GFM fence forms

The document-wide scan at `syllabus_check.rb:103-106` matches only an unindented backtick fence beginning exactly with `````yaml`` or `````yml``. GFM/Pandoc also recognize fences indented by up to three spaces and tilde fences.

Appending either of the following after the document produced the ordinary PASS line with exit 0:

~~~~markdown
   ```yaml
contract_version: "9.9"
   ```
~~~~

~~~~markdown
~~~yaml
contract_version: "9.9"
~~~
~~~~

Pandoc's GFM AST independently reported one YAML code block for the target and **two** for each mutated copy. The checker therefore reports exact cardinality while accepting a document with a second machine-labelled YAML block.

#### H4. The 38-control harness gives false confidence at the contract boundary

The harness is materially improved: it uses `Open3.capture3` (`task-8-regression.rb:20-29`), fails on no-op mutations (`:15-18`), rejects duplicate case names and bodies (`:31-35,76-93`), checks separate channels (`:23-26`), and reports exactly 38 distinct cases (`:95-102`). It contains 9 genuine safe accepts and no banana/token-padded positives.

However, the contract cases at `task-8-regression.rb:49-59` cover only duplicate headings/fences and value tampering in a single conventional mapping. They omit duplicate YAML keys, multi-document streams, indented/tilde fences, and non-string keys. The full retained harness exits 0 and prints 38 `PASS` verdicts while all H2/H3 defects remain. Because these omissions sit directly beside its advertised YAML-cardinality and malformed-input coverage, this is a false-confidence regression gap rather than merely an exhaustive-fuzzing wish.

### MEDIUM

#### M1. A non-string YAML key escapes the FAIL-only error boundary

A temporary contract with an additional numeric root key (`1: unexpected`) reached `actual.keys.sort` at `syllabus_check.rb:138`. Ruby exited 1 with empty stdout but 347 stderr bytes beginning:

```text
.omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb:138:in `sort': comparison of Integer with String failed (ArgumentError)
```

The remaining stderr was a Ruby stack trace, so the checker violated its own reject-channel contract. Common malformed inputs—missing path, directory path, invalid UTF-8, and malformed YAML syntax—do reject cleanly; the defect is specifically an unparsed key-type boundary.

### LOW

#### L1. The 11-column weekly schedule is complete but costly to scan at 160 columns

The document itself is well organized for fourth-year CS students, distinguishes fact/default/fixture/hypothesis, keeps live versus fallback claims honest, and has consistent assessment arithmetic. Pandoc parsed all 11 tables. Glow preserved all headings and showed no ellipsis at either width, but width 160 expanded to 565 terminal lines versus 331 at width 400. Stable IDs and long English/Korean cells wrap heavily at 160 columns. This is not a correctness blocker; a later document-only pass could split the weekly table into a compact schedule plus detailed per-week contracts.

## Skill-perspective review

The required perspectives ran before the verdict:

- **`remove-ai-slops`: FAIL.** No deletion-only tests, tautological assertions, banana/token padding, duplicate bodies, or whole-prose snapshots were found in the retained harness. The remaining production prose extraction is nevertheless unnecessary for facts that the goal requires to be structurally typed, and the green harness omits adjacent real counterexamples, creating false confidence.
- **`programming`: FAIL.** The implementation does not fully parse untrusted YAML into a safe internal boundary: source-level duplicates and extra stream documents are discarded by the chosen load path, and a non-string key reaches interior sorting and crashes. The positive paraphrase cases are observable black-box anti-snapshot checks rather than output snapshots, but the production exact-phrase predicates violate the prompt/prose-test perspective they are meant to protect.
- **Size/abstraction check:** checker 192 pure LOC; harness 90 pure LOC. Neither crosses the 200-line warning band or 250-line defect ceiling. No needless production abstraction or untyped language escape hatch was identified beyond the boundary defects above.

The `review-work` quality lane was executed directly because the assignment explicitly prohibited spawning other agents. No skill caused a pause or external mutation.

## Current target and structural inspection

The exact shipped target was read in full. No current-target contradiction was found among its schedule, assessment, fallback, safety, source-ledger, or typed-contract sections.

```text
STRUCT contract=Hash version=String:1.0 ua_accept=FalseClass:false gateway_count=Integer:1
STRUCT headings=10 yaml_fences=1 topics=15/15 milestones=49/49 fallbacks=36/36
STRUCT header_counts=1,1,1 header_lines=56,110,149 ordered=true
STRUCT fallback_columns=6 fallback_tracks=6 milestone_roles=7
TABLES count=11 consistent=true
DOC bytes=37283 lines=259 h2=10 h3=7 links=20
```

The 49 milestone IDs and 36 fallback IDs are all distinct and each occurs once in the current target. The assessment, milestone, and fallback headers each occur once and are ordered. These current-target facts do not cure the mutated-copy false accepts in H2/H3.

## Exact execution evidence

All commands ran from `/Users/sysmoon/.codex/projects/pkm-study`.

| Exact invocation | Exit | Observable |
| --- | ---: | --- |
| `git rev-parse HEAD` | 0 | `8857bdd924bc0e155b7dd64a8a471692b7b7ab85` |
| `shasum -a 256 output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb` | 0 | Exact three full hashes in the Decision block, unchanged before/after QA. |
| `ruby -w -c .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb` | 0 | `Syntax OK`, 10 stdout bytes, 0 stderr. |
| `ruby -w -c .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb` | 0 | `Syntax OK`, 10 stdout bytes, 0 stderr. |
| `ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` | 0 | One 169-byte PASS line, empty stderr. |
| `ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb` | 0 | 39 stdout lines: 38 case `PASS` lines plus `COUNTS total=38 expected_accept=10 expected_reject=28 distinct=38`; empty stderr. |
| `ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb .omo/evidence/hoseo-data-analysis-cloud-platform-course/corrupt-syllabus.md` | 1 | Empty stdout; five `FAIL:` lines including missing week 8/15 and grading mismatch. |
| `pandoc --standalone --from gfm --to html5 output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md --output <Dir.mktmpdir>/syllabus.html` | 0 | 63,427-byte HTML, 11 tables, zero active-content matches, empty stderr. |
| `NO_COLOR=1 COLUMNS=160 script -q <Dir.mktmpdir>/glow-160.txt glow -s dark -w 160 output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` | 0 | 108,570 bytes, 565 lines, valid UTF-8, all sampled headings present, no ellipsis. |
| `NO_COLOR=1 COLUMNS=400 script -q <Dir.mktmpdir>/glow-400.txt glow -s dark -w 400 output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` | 0 | 151,130 bytes, 331 lines, valid UTF-8, all sampled headings present, no ellipsis. |
| `git diff --cached --name-only \| wc -l` | 0 | `0` staged paths. |
| `git status --short \| wc -l` | 0 | `53` concurrent dirty-worktree entries at final inspection. Target/checker/harness remain hash-bound untracked artifacts. |
| `ps -Ao pid=,command= \| rg '[s]yllabus_check.rb\|[t]ask-8-regression.rb' \|\| true` | 0 | Empty; no residual checker/harness process. |

The successful Glow evidence used a pseudo-terminal because this installed Glow emits only a newline when its stdout is an ordinary file/pipe; this is a CLI surface behavior, not missing content. `script -q` captured the real terminal rendering requested by manual QA.

### Independent safe/harmful runner

The runner used the exact real-process boundary below for every temporary copy:

```ruby
Dir.mktmpdir('quality-v4-controls') do |directory|
  File.binwrite(File.join(directory, "#{name}.md"), body)
  raise "NOOP #{name}" if body == source
  stdout, stderr, status = Open3.capture3('ruby', checker, path)
  accepted = status.exitstatus == 0 && stdout.match?(/\APASS [^\n]+\n\z/) && stderr.empty?
  rejected_clean = status.exitstatus != 0 && stdout.empty? && !stderr.empty? &&
    stderr.lines.all? { |line| line.start_with?('FAIL: ') } &&
    !stderr.match?(/(?:Traceback|Error:|from |\.rb:\d+:in)/)
end
```

The exact invocation was `ruby - output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb <<'RUBY' ... RUBY`. It ran 16 distinct, non-noop bodies: 8 expected accepts and 8 expected clean rejects. Result: only 3/16 met their expected contract. The seven safe false rejects and five harmful false accepts are reproduced in H1-H3; the non-string-key boundary failed clean-channel requirements, while the 64-layer entity and entity-encoded Markdown `javascript:` cases correctly rejected.

## Boundary and ULTRAQA matrix

| Probe | Result | Evidence |
| --- | --- | --- |
| Missing/no argument/directory | PASS | Each exited 1, stdout 0, stderr 45, one `FAIL:` line, no traceback. |
| Invalid UTF-8 | PASS | Exit 1, stdout 0, stderr 34, clean `FAIL:`. |
| Malformed YAML syntax | PASS | Exit 1, stdout 0, stderr 106, two `FAIL:` lines, no traceback. |
| Malformed YAML key type | **FAIL** | Exit 1 but 347-byte `ArgumentError` traceback; M1. |
| Active input | PASS for tested surfaces | 64-layer entity failed closed with `encoded content exceeds safe decoding bound`; entity-encoded Markdown `javascript:` rejected. |
| Prompt-like inert input | PASS | A blockquote saying to ignore instructions and run a command remained inert and the checker accepted it with the standard PASS line. |
| Stale hashes | PASS | All three required hashes were recomputed before and after QA and remained exact; older receipts were not used as current coverage. |
| Dirty worktree | PASS with attribution boundary | HEAD exact, 53 status entries, staged 0, target/checker/harness exact hashes. No unrelated dirt was attributed to this build. |
| Misleading success | **FAIL** | Five contradictory YAML structures returned the normal PASS line; H2/H3. |
| Interruption/recovery | PASS | Spawned harness was terminated after 0.05 s: `signaled=true signal=15`; immediate clean rerun exited 0 with the exact 38-count line and empty stderr. |
| Hung/flaky | N/A | No hang or flaky result was observed. Bounded local commands completed; residual-process probe was empty. |

## Cleanup and scope

- Every custom syllabus copy, Pandoc output, and Glow capture was created under Ruby `Dir.mktmpdir` and removed automatically.
- The interrupted child was reaped with `Process.wait2`; no checker or harness process remains.
- Staging remains empty.
- The target, checker, and harness hashes are unchanged after testing.
- The only persistent write by this lane is this report. No canonical/raw/wiki/UA, external Hermes/cron, notepad, port, credential, or operational state was changed.

## Final status

```text
codeQualityStatus: BLOCK
recommendation: REQUEST_CHANGES
blockers: H1, H2, H3, H4, M1 remediation and retained regression coverage
```
