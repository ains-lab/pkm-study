# Todo 7 independent adversarial verification v4

## Binary verdict

**CONFIRMED / PASS.** I independently inspected the current deliverable rather than relying on prior receipts. The tested target is `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`; its SHA-256 was `65ed06d96716202509679a3a3ef57c4a0d446c2bb77998a454ed2885d2123d66` before and after all checks, exactly matching the required value.

Scope note: the worktree was already dirty with numerous unrelated paths before this QA. This QA did not stage files, start processes, contact external services, or edit the target/checker/plan/ledger/Boulder/protected content. It created only this report; temporary copies and renderer outputs under `/tmp/hoseo-t7-v4-qa` were removed.

## Surface invocation log

| Surface | Exact invocation | Exit | Observed result |
|---|---|---:|---|
| Markdown/data surface | `ruby - <<'RUBY' … YAML.safe_load + section/week/rubric/M-ID/F-ID/placement/Hermes/prose/content assertions … RUBY` against target | 0 | `h2=10 weeks=15 instructional=13 exams=2 M=49 F=36 hermes_keys=11` |
| Adversarial temporary Markdown surface | `cp target /tmp/hoseo-t7-v4-qa/lost-claim-swapped.md`; swap only the Hermes LOST and CLAIM IDs; `ruby - <<'RUBY' … column-role placement assertion … RUBY` | 41 | `REJECT fallback role placement: HERMES expected LOST in column 5, found F-HERMES-CLAIM` |
| GFM rendering | `pandoc -f gfm -t html -o /tmp/hoseo-t7-v4-qa/syllabus.html target` | 0 | 56,193-byte HTML output |
| Terminal rendering, 160 columns | `glow -s dark -w 160 target > /tmp/hoseo-t7-v4-qa/glow-160.txt` | 0 | 107,965 bytes, 565 lines; ANSI-stripped maximum 158 columns, all required labels present, zero `…`/`...` truncation markers |
| Terminal rendering, 400 columns | `glow -s dark -w 400 target > /tmp/hoseo-t7-v4-qa/glow-400.txt` | 0 | 150,759 bytes, 331 lines; ANSI-stripped maximum 398 columns, all required labels present, zero truncation markers |
| Whitespace surface | `git diff --no-index --check /dev/null target >/tmp/hoseo-t7-v4-qa/whitespace.txt 2>&1` | 1 expected for no-index addition | 0-byte diagnostics file; no whitespace error |
| Repeated independent reads | Three runs of `ruby -e '… final newline …' target` followed by `shasum -a 256 target` | 0 each | All three hashes equal the required SHA-256 |
| Cleanup | `find /tmp/hoseo-t7-v4-qa -maxdepth 1 -type f -delete; rmdir /tmp/hoseo-t7-v4-qa` | 0 | Temporary copies/renders absent |

## manualQa matrix

### surfaceEvidence

| Scenario ID | Criterion reference | Surface | Exact invocation | Verdict | Artifact refs |
|---|---|---|---|---|---|
| T7-S01 | Todo 7 acceptance; Scope; Success: format and exact top-level sections | Markdown/Ruby parser | `ruby - <<'RUBY' … s.scan(/^## (.+)$/) … expected 10-heading array … RUBY` | PASS — UTF-8, LF, final newline, and exactly the ordered ten H2 sections | A1 |
| T7-S02 | Scope / Success: fixed 15-week sequence and exam-only weeks | Markdown schedule-table parser | `ruby - <<'RUBY' … rows=schedule.lines.grep(/^\\|\\s*\\d+\\s*\\|/); weeks==(1..15).to_a; instructional.length==13; exams==[8,15] … RUBY` | PASS — 15 unique weeks, 13 instructional 60+120 rows, only weeks 8 and 15 are three-hour/no-new-lecture exams | A1 |
| T7-S03 | Scope: LO and grading/rubric alignment | Markdown/Ruby parser | `ruby - <<'RUBY' … LO1..LO5 definitions/schedule; 20/40/40; mid [10,10,12,8]; final [10,10,10,10] … RUBY` | PASS | A1 |
| T7-S04 | Success: every milestone evidence family | Markdown ID parser | `ruby - <<'RUBY' … scan(/\\bM[1-7]-(?:HAPPY|FAIL|ARTIFACT|MACHINE|FALLBACK|SAFETY|ASSESS)\\b/) … == 49 unique … RUBY` | PASS — exactly 49 unique M IDs | A1 |
| T7-S05 | Scope / Todo 6 parity: six complete live/fallback tracks | Markdown table and placement parser | `ruby - <<'RUBY' … F IDs == tracks.product(roles); each ID verified in its own semantic column … RUBY` | PASS — exactly 36 unique `F-TRACK-ROLE` IDs, six per track, correctly placed | A1 |
| T7-S06 | Extended Hermes contract | YAML/Ruby parser plus visible prose review | `ruby - <<'RUBY' … YAML.safe_load(fenced_yaml); typed checks of messaging_browser, workspace_tool_allowlist, gateway_count, delivery, gate_outputs, install_mode, doctor_required, timezone, cron_mode, observation_states, preserve_last_good; prose token checks … RUBY` | PASS — typed YAML exposes the six extended Hermes fields and additional safety fields; visible Korean prose agrees on non-root, local delivery, smart/manual approval boundary, deny cron, separately approved messaging/browser, trusted gate outputs, headless/doctor, Asia/Seoul, one scheduler, and last-good preservation | A1 |
| T7-S07 | Todo 4/5 and guardrails: CTI, UA, graph, safety contracts | Markdown/Ruby content assertions | `ruby - <<'RUBY' … required CTI/UA/graph/safety literals … RUBY` | PASS — CTI provenance/rate handling, UA invariants, projection/rejected-inference policy, and prohibited activities are present | A1 |
| T7-S08 | Verification strategy: GFM/terminal readability | Pandoc and Glow terminal surfaces | `pandoc -f gfm -t html …`; `glow -s dark -w 160 …`; `glow -s dark -w 400 …` | PASS — renderer exits zero; 160-column output wraps rather than clips and 400-column output is readily legible | A1 |

### adversarialCases

| Scenario ID | Criterion reference | Adversarial class | Expected behavior | Verdict | Artifact refs |
|---|---|---|---|---|---|
| T7-A01 | Six-track fallback contract | malformed swap | A copy with Hermes `F-HERMES-LOST` and `F-HERMES-CLAIM` swapped must fail even though all 36 IDs still exist | PASS — independent column-placement parser exited 41 and named the wrong column/ID | A1 |
| T7-A02 | Todo 7 integrity | stale hash | Current target must equal the specified SHA after all QA operations | PASS — before/after and three repeated SHA reads all equal `65ed06d96716202509679a3a3ef57c4a0d446c2bb77998a454ed2885d2123d66` | A1 |
| T7-A03 | Must NOT / dirty-worktree boundary | dirty worktree | Existing unrelated dirty paths must not be normalized, staged, or reverted by QA | PASS — `git status --short` remained dirty; QA changed only this designated evidence report and did not stage/revert anything | A1 |
| T7-A04 | Verification strategy | misleading PASS output | A successful-looking artifact must be structurally parsed, not accepted from previous status text | PASS — fresh independent Ruby/YAML/table checks and real renderers, including the negative swap, determined the verdict | A1 |
| T7-A05 | Failure/recovery resilience | repeated interruption | Repeated independent parser invocations must leave the immutable deliverable unchanged | PASS — three parser/hash runs all passed with the identical target digest | A1 |
| T7-A06 | Runtime-only class | prompt injection | N/A — this is a static Markdown/YAML deliverable; no model prompt, external text execution, or service invocation exists on this QA surface. The document’s data-only/no-execution policy was nevertheless asserted in T7-S07. | N/A (reason recorded) | A1 |
| T7-A07 | Runtime-only class | hung command | N/A — no long-running runtime path belongs to the static target. All actual parser and renderer commands completed within the QA invocation window. | N/A (reason recorded) | A1 |
| T7-A08 | Runtime-only class | flaky test | N/A — checks were deterministic local parsers/renderers over a hash-pinned file; no network, clock threshold, or probabilistic test was used. | N/A (reason recorded) | A1 |

### artifactRefs

| ID | Kind | Description | Path |
|---|---|---|---|
| A1 | QA report | Non-empty independent evidence: complete commands, outputs, binary verdict, surface and adversarial matrices | `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-7-adversarial-verify-v4.md` |

## Final integrity check

`shasum -a 256 output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` after cleanup returned `65ed06d96716202509679a3a3ef57c4a0d446c2bb77998a454ed2885d2123d66`.
