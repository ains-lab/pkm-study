# Final QA execution review — PASS

- `review_commit_sha`: `8857bdd924bc0e155b7dd64a8a471692b7b7ab85`
- `target_sha`: `d062c7427f7d6f7e307f677fcd3b455c9b709c899ef192d52bee`
- Surface: terminal CLI (Markdown document and Ruby checker); no web application surface.
- Verdict: **PASS**. All 34 P0/P1 scenarios passed; 2 P2 scope/render observations passed. The target SHA-256 was unchanged before, during, and after the run.

## Fresh binary evidence

The real target command was invoked after the temporary-copy matrix:

```text
ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
exit=0
PASS headings=10 weeks=15 topic_ids=15 milestones=7 evidence_ids=49 fallbacks=6 weights=20/40/40 rubrics=40/40 carry=PASS
```

Additional in-memory/read-only results:

```text
pandoc -f gfm -t html <target>: exit=0, html_bytes=43541, active_matches=0, stderr_bytes=0
git diff --no-index --check /dev/null <target>: exit=1, diagnostics_bytes=0
Task-1 protected manifest: rows=142, unique_paths=142, mismatches=0
SHA-256 target before=after=d062c7427f7d6f7e307f677fcd3b455c9b709c899ef192d52bee
```

`exit=1` for the no-index whitespace command is the expected “files differ” status; zero diagnostic bytes is the pass condition.

## `manualQa` matrix

| Scenario ID(s) | Criterion reference | Surface / exact invocation | Actual result | Verdict | Artifact refs |
|---|---|---|---|---|---|
| P0-01 valid-target | Task 8 checker acceptance | `ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` | exit 0; `weeks=15`, `milestones=7`, `weights=20/40/40` | PASS | A1 |
| P0-02 corrupt-target | Failure control: missing exam and grading corruption reject | `ruby syllabus_check.rb "$TMP/P0-corrupt-target.md"` where the owned `Dir.mktmpdir("hoseo-final-qa-")` copy changed W08 to W07 and final 40% to 30% | exit 1; grading/rubric failures | PASS | A1 |
| P0-03 duplicate-week | Exact ordered week multiplicity | `ruby syllabus_check.rb "$TMP/P0-duplicate-week.md"` with week 2 changed to 1 | exit 1; exact-week and instructional/exam failures | PASS | A1 |
| P0-04 invalid-utf8 | UTF-8 gate | `ruby syllabus_check.rb "$TMP/invalid-utf8.md"` with one trailing `0xFF` | exit 1; `syllabus is not valid UTF-8` | PASS | A1 |
| P0-05 missing-file | Unreadable-path gate | `ruby syllabus_check.rb "$TMP/does-not-exist.md"` | exit 1; missing/unreadable | PASS | A1 |
| P1-01 token-stuffed-IDs | Unique explicit M1–M7 evidence IDs | `ruby syllabus_check.rb "$TMP/token-stuffed-milestone-ids.md"` with duplicated M1–M7 HAPPY tokens appended | exit 1; explicit-contract failures | PASS | A1 |
| P1-02 active-script | Inert Markdown only | `ruby syllabus_check.rb "$TMP/active-script.md"` with `<script>` | exit 1; active script/URI forbidden | PASS | A1 |
| P1-03 active-event-handler | Inert Markdown only | `ruby syllabus_check.rb "$TMP/active-event-handler.md"` with `onerror=` | exit 1; active script/URI forbidden | PASS | A1 |
| P1-04 javascript-URI | Inert Markdown only | `ruby syllabus_check.rb "$TMP/javascript-uri.md"` with `javascript:` link | exit 1; active script/URI forbidden | PASS | A1 |
| P1-05 data-html-URI | Inert Markdown only | `ruby syllabus_check.rb "$TMP/data-html-uri.md"` with `data:text/html` link | exit 1; active script/URI forbidden | PASS | A1 |
| P1-06 stale-success inversion | Partial/stale UA must reject nonzero | `ruby syllabus_check.rb "$TMP/partial-stale-success-inversion.md"` after replacing the reject phrase | exit 1; M6 and UA rejection checks failed | PASS | A1 |
| P1-07 accessibility inversion | Caption/transcript affirmation | `ruby syllabus_check.rb "$TMP/accessibility-inversion.md"` after changing provision to denial | exit 1; accessibility policy failure | PASS | A1 |
| P1-08 offensive inversion | Malware/exploit/scanning/automatic-response prohibition | `ruby syllabus_check.rb "$TMP/offensive-inversion.md"` after changing explicit prohibition | exit 1; offensive-policy failure | PASS | A1 |
| P1-09 data-only inversion | Untrusted content must not execute | `ruby syllabus_check.rb "$TMP/data-only-inversion.md"` after changing to execution | exit 1; data-only policy failure | PASS | A1 |
| P1-10a…m carry-term omissions (13) | Required carry terms | For each term, `ruby syllabus_check.rb "$TMP/carry-<term>.md"`; all occurrences globally replaced: `messaging/browser`, `workspace`, `allowlist`, `wakeAgent`, `reason`, `changedPaths`, `resultsPerPage`, `startIndex`, `published_at`, `last_modified_at`, `value_state`, `state_reason`, `fixture_release` | 13/13 exit 1; each reported carry-through/schema failure | PASS | A1 |
| P1-11 prompt-injection | Checker must treat input as data and never execute it | `ruby syllabus_check.rb "$TMP/prompt-injection.md"`; the copy included an inert `<script>touch $TMP/PROMPT_INJECTION_EXECUTED</script>` string | exit 1; marker file absent | PASS | A1 |
| P1-12a…c repeat/interruption resilience (3) | No stale or misleading success | Three fresh `ruby syllabus_check.rb "$TMP/valid.md"` invocations in the same owned temporary scope | 3/3 exit 0, identical PASS summary; target hash unchanged | PASS | A1 |
| P1-13 Pandoc active-content scan | Generated content must remain inert | `pandoc -f gfm -t html output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` captured in memory, then scanned for script/event/executable-URI patterns | exit 0; 43,541 bytes; 0 active matches | PASS | A1 |
| P1-14 Glow narrow render | Terminal rendering at constrained width | `glow -w 160 output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` | exit 0; terminal output contained 20/40/40, W08, W15, M1–M7 IDs; expected narrow wrapping only | PASS | A1 |
| P1-15 Glow manual terminal gate | Required terminal invocation | `glow -w 400 output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` | exit 0; visibly contained `20%`, `40%`, `W08-midterm-individual-…`, `W15-final-individual-practical`, and `M1-HAPPY` through `M7-HAPPY`; tables were complete with no ellipsis/malformed table at 400 columns | PASS | A1 |
| P1-16 protected 142-hash recomputation | Task 1 protected state | Ruby SHA-256 recomputation of every declared row in `task-1-protected-sha256.txt` | 142 rows, 142 unique paths, 0 mismatches | PASS | A1 |
| P1-17 whitespace | No whitespace diagnostics | `git diff --no-index --check /dev/null output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` | exit 1, 0 diagnostic bytes | PASS | A1 |
| P1-18 target unchanged | No target mutation | `shasum -a 256 output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` before/after every temp run | exact expected SHA both times | PASS | A1 |
| P2-01 dirty worktree | Do not normalize concurrent changes | `git status --short`; `git diff --cached --name-only` | pre-existing unrelated dirty paths observed; staged-path count 0; none changed by QA | PASS | A1 |
| P2-02 prescribed web-terminal capture | Surface applicability | `test -f script/qa/web-terminal-visual-qa.mjs` | absent; browser/xterm capture is **not applicable** for this repo and was not launched | PASS | A1 |

Notes on the narrow render: the 160-column view wraps long Korean table cells as expected, while the required manual gate is the 400-column invocation. The 400-column output showed complete W08/W15 rows and non-ellipsized milestone IDs.

## `adversarialCases`

| Scenario ID | Criterion reference | Adversarial class | Expected behavior | Verdict | Artifact refs |
|---|---|---|---|---|---|
| P0-02…05 | Task 8 failure control | structure, encoding, path | nonzero exit | PASS (4/4) | A1 |
| P1-01…05 | Script/ID boundary | token stuffing and active content | nonzero exit | PASS (5/5) | A1 |
| P1-06…09 | Policy inversion | stale success, accessibility, offensive, data-only | nonzero exit | PASS (4/4) | A1 |
| P1-10a…m | Carry-through completeness | full global omission of every required term | nonzero exit | PASS (13/13) | A1 |
| P1-11 | Prompt injection | executable-looking untrusted input | nonzero exit and no marker side effect | PASS | A1 |
| P1-12a…c | Cancel/resume/repeat | stale state or misleading success | stable exit 0 on valid temp copy; no target change | PASS (3/3) | A1 |

No hung/long-running or flaky class was observed: all bounded checker/render runs completed deterministically in the same terminal session. The initial `pgrep` returned only its own short-lived probe process; an immediate `ps` follow-up was empty.

## Cleanup receipt

All malformed copies lived under `Dir.mktmpdir("hoseo-final-qa-")` and Ruby removed each directory at block exit. Final check: `remaining_temp_dirs=0`. QA launched no server, browser, container, port listener, or external mutation. No target, checker, plan, ledger, raw/canonical content, or protected path was edited.

## `artifactRefs`

| ID | Kind | Description | Path |
|---|---|---|---|
| A1 | Markdown QA execution record | Fresh terminal invocations, binary results, matrix, adverse cases, and cleanup receipt. Non-empty and redacted. | `.omo/evidence/hoseo-data-analysis-cloud-platform-course/final-gate/qa-execution-review.md` |
