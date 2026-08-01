# Todo 8 repaired-checker adversarial gate

```yaml
recommendation: REJECT
verdict: needs-fix
target_sha256: d062c7427f7b8a715f357f7d6f7e307f677fcd3b455c9b709c899ef192d52bee
checker_sha256: c3ff6989382c5f1e9a6185f70b26fb37c4d870894c9dbadc46d9ad312fc8419d
independent_reviewer: true
only_persistent_write: .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-repair-adversarial-verify.md
```

## blockers

1. The checker still accepts implementation-mirroring token stuffing as semantic evidence. A table-valid M1 row with all correct stable IDs but payloads such as `PASS 바나나바나나`, `FAIL 바나나바나나`, `receipt 바나나바나나`, `JSON 바나나바나나`, `fixture 바나나바나나`, `금지 바나나바나나`, and `LO1 바나나바나나` exits `0` with the full success line. A table-valid Hermes fallback row whose six evidence/limit cells are nonsense while one cell stuffs `non-root doctor gateway systemd fixture` also exits `0`.
2. The polarity checks remain blacklist-overfit. Each of these harmful, meaning-equivalent variants exits `0`: M6 says the rejection words are only recorded and the validator returns zero; graph relations retain a hypothesis label but are treated as true; data-only says `실행 금지` but then performs the command; accessibility says captions/transcripts are provided but not delivered; prohibited offensive work is labeled forbidden but performed; credentials are labeled excluded but passed to the prompt.
3. The retained harness does not expose those false successes. Its M1 gibberish case uses the exact word `무의미`, which production code explicitly blacklists at checker lines 30-33; its semantic cases use phrases that match the production negative regexes at lines 107 and 132-140. This is an implementation-mirroring test shape that creates false confidence.
4. The existing code-review reports explicitly mention `omo:remove-ai-slops`, `omo:programming`, implementation mirroring, and overfit, but they are bound to superseded checker hashes (`4eb64f...` or `b5923d...`). No code-quality review is bound to current checker `c3ff6989...`; the old coverage is therefore unsupported for this repair. The direct current-SHA pass above independently confirms the unresolved class.
5. No notepad path was supplied and no goal notepad artifact was found. This is recorded as an evidence gap, not inferred as a pass.

## originalIntent

Independently verify that the repaired Todo 8 Ruby CLI reliably certifies the Korean 15-week syllabus: accept the valid document and safe Korean paraphrases, reject corrupt structure and every formerly accepted harmful semantic mutation, preserve the target and protected vault state, and leave no QA runtime resource behind.

## desiredOutcome

The user should receive the unchanged, readable syllabus plus a checker whose success line cannot be obtained by stable-ID stuffing, keyword stuffing, negated safety language, graph-fact promotion, unsupported grading rows, malformed input, or stale evidence. The proof chain should be current-hash, black-box, reproducible, two-sided, and maintainable.

## userOutcomeReview

The syllabus itself remains substantively usable. The exact Glow command exits `0`; the 400-column surface shows both 40% examinations, W08 and W15, and M1-M7 evidence IDs in readable table rows. The target passes the checker, the named corrupt copy fails, all 142 protected hashes remain unchanged, and the target hash is stable.

The repaired checker does not yet provide the desired trustworthy certification. It passes all specifically retained controls but also passes semantically harmful variants that preserve its expected tokens while reversing or emptying the contract. A user could therefore receive a normal `carry=PASS` result for a document that instructs unsafe behavior or supplies nonsensical evidence.

## exact command evidence

### Syntax, persistent harness, valid target, and corrupt target

- `ruby -c .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb` -> exit `0`, `Syntax OK`.
- `ruby -c .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb` -> exit `0`, `Syntax OK`.
- `ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb` -> exit `0`; valid plus five Korean paraphrases were accepted and all 44 retained harmful mutants were rejected.
- `ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` -> exit `0`:

```text
PASS headings=10 weeks=15 topic_ids=15 milestones=7 evidence_ids=49 fallbacks=6 weights=20/40/40 rubrics=40/40 carry=PASS
```

- `ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb .omo/evidence/hoseo-data-analysis-cloud-platform-course/corrupt-syllabus.md` -> exit `1`. It reported the exact-week, missing W08/W15 exam, topic-ID, instructional/exam-format, and grading failures; no trace occurred.

### Fresh required independent controls

Every row below used its own `Dir.mktmpdir`, invoked the real CLI, and was absent after block exit.

| Control | Expected / actual | First observable |
|---|---:|---|
| vulnerability `description` omission | `1 / 1` | vulnerability schema missing |
| W07-only `changedPaths` omission | `1 / 1` | week 7 recovery contract missing |
| M1 correct IDs plus literal `무의미` | `1 / 1` | M1-HAPPY meaningful evidence missing |
| Hermes fallback literal `무의미` | `1 / 1` | fallback evidence/limits missing |
| M6 literal negated rejection | `1 / 1` | nonzero rejection contract missing |
| graph literal fact promotion | `1 / 1` | source-checked hypothesis missing |
| token-preserving data-only inversion from the retained harness | `1 / 1` | data-only policy missing |
| extra `과제 10%` grading row | `1 / 1` | exact grading identities/weights mismatch |

All five requested Korean positive controls independently exited `0`: NVD pacing, accessibility, offensive-work prohibition, data-only handling, and credential handling. Each temporary directory was absent after its block.

### Independent overfit/slop controls

These controls are not in the retained harness. They preserve the same unsafe meaning while avoiding only the implementation's small literal blacklist. Every case should fail; every case instead exited `0` with the normal full success line:

```text
m1-token-stuffed-nonsense                 actual=0
hermes-fallback-token-stuffed-nonsense   actual=0
m6-token-stuffed-unsafe-zero              actual=0
graph-promotion-paraphrase                actual=0
data-only-inversion-paraphrase            actual=0
accessibility-inversion-paraphrase        actual=0
offensive-inversion-paraphrase            actual=0
credential-inversion-paraphrase           actual=0
```

All eight copies were table-valid UTF-8 files under separate temporary directories. Every directory was absent after the corresponding block.

## manual QA channel

Required terminal invocation, exactly:

`glow -w 400 output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`

Exit: `0`. Direct inspection showed a readable Korean terminal document. The current retained 400-column surface independently exposes:

- `중간고사 | 40%` and `기말고사 | 40%`;
- `W08-midterm-individual-practical` and `W15-final-individual-practical` in intact schedule rows;
- `M1-HAPPY` through the M1 evidence family and `M7-ASSESS` through the M7 evidence family;
- no ellipsis or replacement-character marker in the inspected 400-column rows.

`script/qa/web-terminal-visual-qa.mjs` is absent. No browser, xterm, or TUI automation resource was started. One attempted in-memory PTY recapture waited for terminal interaction and was explicitly terminated; the original exact Glow invocation had already completed successfully, and no Glow process remained.

## ULTRAQA

| Class | Result | Evidence |
|---|---|---|
| malformed input | PASS | Named corrupt target exits `1`; missing path exits `1` with one stable diagnostic; invalid UTF-8 exits `1` with one stable diagnostic; no trace. |
| prompt injection | PASS | An inert comment requesting a marker file exits `0`; the marker is absent. Static inspection finds no shell, network, eval, or input-execution path. |
| stale state | PASS for hashes | Final target/checker hashes equal the bound values. Current code-review coverage remains missing, listed as a blocker. |
| dirty worktree | PASS | Fresh manifest parse: declared/unique `142/142`, missing `0`, mismatches `0`; protected scope is those files plus only the syllabus. Staged path count is `0`. |
| misleading success | FAIL | Eight independently rephrased or token-stuffed harmful documents exit `0` with the full success line. |
| cancel/repeated interruption | PASS for cleanup | A deliberate `Interrupt` inside a temp-fixture block left the directory absent. Three repeated valid-copy invocations were byte-stable exit `0`; all temp directories were removed and the target stayed unchanged. |
| hung/long command | N/A after bounded checks | Checker and harness have no loop, service, network, retry, or external job. All substantive commands completed promptly. The interactive PTY capture was terminated and left no process. |
| flaky | N/A after deterministic repeats | Three repeated valid-copy runs produced identical exit/output; fixed local input, no clock/random/network dependency. |

## direct remove-ai-slops and programming review

The current checker is 160 nonblank/noncomment lines, below the 250-line limit, and has one bounded CLI responsibility. It uses Ruby core APIs, has no production write, network, command execution, dead dependency, broad exception swallowing, speculative abstraction, or needless parser extraction. Its structural exact-set checks for headings, weeks, topics, grading identities, rubrics, schema fields, and stable IDs are useful black-box contracts.

The unresolved defect is test/validation shape:

- checker lines 30-33 equate “meaningful” with length, letters, and absence of four blacklist tokens;
- lines 87-102 and 115-124 accept required semantic words anywhere in otherwise nonsensical cells;
- lines 107 and 132-149 use positive token buckets plus narrow negative-phrase blacklists;
- harness lines 37-58 use the same banned words and negative phrases, so the suite mirrors production rather than independently distinguishing the prohibited outcome;
- the five positive paraphrases show only five hand-selected rewordings, not semantic robustness.

This is unresolved AI-slop/overfit: excessive or useless coverage is not the issue by count; the issue is false-confidence tests that pass the implementation's blacklist while missing behaviorally equivalent failures. No deletion-only, tautological expected-value, or unnecessary production extraction finding overrides this blocker.

## checked artifact paths

- `SCHEMA.md`, `index.md`, and recent `log.md`
- `.omo/drafts/hoseo-data-analysis-cloud-platform-course.md`
- `.omo/plans/hoseo-data-analysis-cloud-platform-course.md`
- `.omo/start-work/ledger.jsonl`
- `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.log`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/corrupt-syllabus.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-validation.log`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-adversarial-matrix.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-adversarial-verify-v2.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-adversarial-verify-v3.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-render.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-protected-sha256.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course-code-review.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/final-gate/goal-constraint-review.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/final-gate/code-quality-review.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/final-gate/security-review.md`
- `omo:remove-ai-slops` and `omo:programming` skill contracts

## exact evidence gaps

1. No persistent regression distinguishes token-stuffed but grammatically valid M1 and fallback rows from real evidence.
2. No persistent negative family covers meaning-preserving unsafe paraphrases outside the current narrow blacklist.
3. No code-quality report is bound to current checker SHA `c3ff6989...`; earlier skill-perspective reports are stale and cannot support this repair.
4. No notepad path/artifact was supplied.

## final hashes and cleanup receipt

```text
d062c7427f7b8a715f357f7d6f7e307f677fcd3b455c9b709c899ef192d52bee  output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
c3ff6989382c5f1e9a6185f70b26fb37c4d870894c9dbadc46d9ad312fc8419d  .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb
```

All custom mutants lived under `Dir.mktmpdir` and were absent after block exit. No `t8-*` temporary directory, Glow process, server, browser context, port, container, cloud resource, Hermes/cron state, wiki/UA mutation, or other external mutation remained. The target, checker, plan, ledger, protected paths, and prior evidence were not edited; this report is the only persistent write.
