# QA execution review — global final v4

## Binary verdict: PASS

Reproduced at `HEAD 8857bdd924bc0e155b7dd64a8a471692b7b7ab85` against the caller-pinned bytes:

- syllabus: `65ed06d96716202509679a3a3ef57c4a0d446c2bb77998a454ed2885d2123d66` — matched;
- checker: `487470cea93eeb62ca199216f4db0385a3816a40428d725f5a9f419a9520f5ba` — matched;
- regression harness: `ba031c00f4382d0e78408a0e1a9e17c410b561fae18e9b6afcbebabde5258dab` — matched.

The worktree was already dirty before QA. It was recorded, not treated as freshness/success evidence, and not modified. This QA lane wrote only this report and `F3-scenario-audit-v4.md`.

## manualQa

### surfaceEvidence

| Scenario ID | Criterion reference | Surface / exact invocation | Verdict | Artifact refs |
|---|---|---|---|---|
| GQ-01 | Current byte identity, structural and YAML contract | `shasum -a 256 <syllabus> <checker> <harness>`; `ruby …/syllabus_check.rb output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` | PASS — all assigned digests match; checker exit 0 with 10 headings, 15 topics/weeks, 7 milestones, 49 IDs, 6 fallbacks, 20/40/40 and 40/40 rubrics. | R-01, R-02, R-03 |
| GQ-02 | Full regression/mutation lane | `ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb` | PASS — exit 0; 38 distinct cases, 28 required rejection and 10 required acceptance. | R-03 |
| GQ-03 | Pandoc rendered surface | `pandoc -f gfm -t html5 --standalone <syllabus> -o <isolated-temp>/syllabus.html` | PASS — exit 0; 63,427-byte HTML, 10 H2, 11 tables, zero active-content matches. | R-01, R-04 |
| GQ-04 | Glow and CJK/table terminal surface | `NO_COLOR=1 COLUMNS=160 glow -w 160 -s dark <syllabus>` and `…400…`; `node …/visual-qa.mjs tui-check <capture> --cols 160|400` | PASS — 160: 565 lines, max 158, zero overflow/misaligned border; 400: 331 lines, max 398, same results; both report wide CJK columns. | R-01, R-04 |
| GQ-05 | Manual NCP/Hermes/CTI/LLM/UA/graph/exam/accessibility path | Focused `rg -n -i` walk over the current source for named operational, fallback, exam, accessibility and safety terms, followed by direct section reading. | PASS — each operational path distinguishes live evidence from fixture claim/lost competency; UA rejects stale/partial, graph requires source-check, exams are individual, and accessible alternatives are explicit. | R-01, R-04 |

### adversarialCases

| Scenario ID | Criterion reference | Adversarial class | Expected behavior | Verdict | Artifact refs |
|---|---|---|---|---|---|
| GA-01 | Missing/corrupt/UTF-8 | Missing file, invalid UTF-8, broken required H2; direct isolated checker calls. | Exit nonzero, diagnosable failure. | PASS — each exit 1; diagnostics identify unreadable path, invalid UTF-8, and required ordered headings. | R-02, R-04 |
| GA-02 | Typed safety / active payload | Flip YAML `accept:false` to `true`; insert `<script>alert(1)</script>`; direct isolated checker calls. | Exit nonzero, no payload execution. | PASS — each exit 1 with typed mismatch / forbidden active-content diagnostic. | R-02, R-04 |
| GA-03 | Fallback swaps and misleading layout | Harness header order, NCP lost/claim and live-ID swaps, duplicate cardinality and evidence-ID cases. | All must reject. | PASS — included in 28/28 rejected cases. | R-03 |
| GA-04 | Stale/unsafe semantics | Harness UA, Hermes, graph/data-only/accessibility/offensive/credential contract mutations. | All must reject; target passes only on current values. | PASS — 28/28 rejects and valid target acceptance. | R-02, R-03 |
| GA-05 | Safe paraphrase | Nine current safe wording/entity cases plus baseline. | All accepted. | PASS — 10/10 accepts. | R-03 |
| GA-06 | Prompt injection | Passive Markdown comment asks for secret exfiltration; checker executes on isolated copy. | No action/tool/network execution; record lexical-detection limitation honestly. | PASS (limitation) — checker accepts inert comment; no external action occurred. Course policy treats untrusted text as data-only and current SHA gate prevents substitution. | R-01, R-02, R-04 |
| GA-07 | Dirty state / repeatability | `git status --short`; `git diff --check`; twice-run checker stdout `cmp -s`. | Report dirt without relying on it; stable result. | PASS — dirty pre-state observed, diff check clean, both checker exits 0 and outputs identical. | R-02, R-04 |
| GA-08 | Interruption/recovery | TERM an isolated harness process after 0.15s, wait, then execute a new harness run. | Interrupted run fails; recovery succeeds. | PASS — signal exit 0, interrupted exit 143/0 stdout bytes, recovery exit 0. | R-03, R-04 |
| GA-09 | Hung/flaky / cleanup | Completion observed for all primary commands; exact temp paths and process patterns inspected after run. | No skip/N/A: either observe a failure or verify clean completion. | PASS — no hang/flaky event; all temporary captures/fixtures deleted; no QA-owned process/port/container/staging remained. | R-04 |

### artifactRefs

| ID | Kind | Description | Path |
|---|---|---|---|
| R-01 | target document | Exact current 259-line syllabus. | `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` |
| R-02 | checker | Current exact-hash typed-contract and structural checker. | `.omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb` |
| R-03 | harness | Current exact-hash 38-case mutation harness. | `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb` |
| R-04 | QA transcript | Fresh complete matrix and cleanup receipt. | `.omo/evidence/hoseo-data-analysis-cloud-platform-course/F3-scenario-audit-v4.md` |

No QA artifact other than the two requested reports persists. Isolated render files, mutated fixtures, process output, and test directories were removed after their output/exit data were recorded.
