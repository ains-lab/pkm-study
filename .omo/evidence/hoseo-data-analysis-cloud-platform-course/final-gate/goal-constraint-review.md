# Goal & Constraint Final-Gate Review

review_commit_sha: `8857bdd924bc0e155b7dd64a8a471692b7b7ab85`  
target_sha: `d062c7427f7b8a715f357f7d6f7e307f677fcd3b455c9b709c899ef192d52bee`  
recommendation: `REJECT`

## blockers

1. The independent review chain is stale after the target and checker repair. `task-7-adversarial-verify.md`, `task-8-adversarial-verify.md`, and F1/F3/F4 bind to the superseded target SHA `b87d72f...`; the current target was written later at 2026-07-29 16:39:06 KST and the current checker later still at 16:47:31 KST. `task-8-adversarial-verify.md` also reports the superseded 10-table surface and old checker output. The ledger ends with failed global-review records for the old SHA and has no current repair/final-review completion record.
2. The only code/document review report, `.omo/evidence/hoseo-data-analysis-cloud-platform-course-code-review.md`, is explicitly `FAIL`, is bound to target `b87d72f...` and checker `4eb64f0e...`, and predates both repaired artifacts. It contains the required `omo:remove-ai-slops`/`omo:programming` perspective section, but that coverage is unsupported for the current target/checker. No current-SHA code review report closes it.
3. The direct `omo:remove-ai-slops`/`omo:programming` pass found unresolved test overfit in the current checker. `syllabus_check.rb:107-109` requires literal tokens anywhere in the document and an order-sensitive Korean/English phrase sequence. The corresponding `task-8-validation.log:54-66` controls merely delete each literal and prove that the implementation-mirroring assertion fires; they do not prove that meaning-preserving policy/schema paraphrases remain accepted. This is prose-pinning that creates maintenance burden and false confidence, even though the stable W/M identity checks are appropriate machine-consumed contracts.
4. No notepad path or notepad artifact was supplied or found. The final-gate input contract requires that path to be checked, so this is an explicit evidence gap rather than an inferred pass.

## originalIntent

Deliver exactly one Korean external syllabus for fourth-year HoSeo University computer-science students. It must teach a cumulative CTI-to-Wiki-to-UA-to-graph-analysis workflow over 15 weeks while preserving evidence, providing honest live/fallback routes, using individual practical exams, and avoiding cloud, Hermes, cron, UA, canonical-wiki, raw, or protected-path mutation during document production and validation.

## desiredOutcome

The user should receive one readable GFM syllabus with the ten required H2 sections; observable LO1-LO5; 13 instructional weeks plus individual exam-only weeks 8 and 15; 20/40/40 grading and exact 40-point rubrics; six capability-bounded fallback tracks; dated fixture/source rules; safety, privacy, cost, and accessibility policies; and a current, non-overfit evidence chain proving those claims.

## userOutcomeReview

The current syllabus content itself satisfies the desired visible outcome:

- It is one Korean file at `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` with the ten exact ordered H2 sections.
- LO1-LO5 are observable and mapped to weeks and assessment.
- Weeks 1-7 and 9-14 use the required `60분 비동기 동영상 + 120분 대면 실습`; W08 and W15 are three-hour individual exams with no new lecture.
- The grade table is 20/40/40; the midterm is 10+10+12+8 and the final is 10+10+10+10.
- The six fallback rows are NCP, Hermes, CTI API, LLM enrichment, UA generation, and graph analysis. Their preserved/lost/allowed claims are bounded; Docker labels Hermes persistence `fixture-only`.
- Hermes separate messaging/browser approval, trusted gate fields, NVD pagination/batching, normalized CTI schemas, dated ATT&CK v19.1 policy, public-data-only restrictions, credential/redaction rules, teardown, captions/transcripts, and accessible alternatives are present.

The shipped artifact is therefore substantively usable, but the requested final-gate outcome is not complete because the current-SHA review/evidence chain is stale and the checker still contains unsupported prose-token tests.

## Fresh command evidence

### Current checker

Invocation:

`ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`

Result: exit `0`.

```text
PASS headings=10 weeks=15 topic_ids=15 milestones=7 evidence_ids=49 fallbacks=6 weights=20/40/40 rubrics=40/40 carry=PASS
```

Ruby syntax also passed with `Syntax OK`.

### Required corrupt-copy control

Invocation:

`ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb .omo/evidence/hoseo-data-analysis-cloud-platform-course/corrupt-syllabus.md`

Result: exit `1`, including both required diagnostics:

```text
FAIL: missing week 8 or week 15 exam
FAIL: grading mismatch: rows must have exact unique identities and weights
```

It also named the expected ordered-week, topic-ID, and instructional/exam-format consequences.

### Target identity

Invocation:

`shasum -a 256 output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`

Result: exit `0`; SHA-256 exactly matched `d062c7427f7b8a715f357f7d6f7e307f677fcd3b455c9b709c899ef192d52bee`.

### Protected scope

`shasum -a 256 -c task-1-protected-sha256.txt` exited `0` and reported every one of the 142 protected paths `OK`; its only warning concerned the ten non-hash header lines in the receipt. A fresh protected-scope enumeration counted 143 files: the same 142 baseline files plus the syllabus. `git diff --cached --quiet` exited `0`, so no path is staged.

No raw, canonical, `.ua`, `SCHEMA.md`, `index.md`, `log.md`, or pre-existing `output/` hash changed from the Task 1 manifest. Current porcelain contains unrelated/baseline dirty state and a later orchestration directory, but no protected-path drift.

## Manual QA — terminal/CLI

Exact invocation:

`glow -w 400 output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`

Result: exit `0`; visible output contained Korean H2 headings, the `중간고사 40%` and `기말고사 40%` rows, W08 midterm and W15 final rows, and both 40-point rubric tables. Direct inspection of the wrapped schedule rows showed intact column alignment and continuation lines, with no merged, missing, or malformed table row. No xterm/browser session was used because the vault has no prescribed xterm script and this review channel is terminal/CLI.

## ULTRAQA

| Class | Result | Evidence / applicability |
|---|---|---|
| `malformed_input` | PASS | The retained corrupt copy exits 1 and names both the missing week-8 exam and grading mismatch. |
| `stale_state` | FAIL | The target SHA is current, but Task 7/8 independent receipts, F1/F3/F4, the code review, and ledger final-review records are bound to the superseded target/checker. |
| `dirty_worktree` | PASS | All 142 baseline protected hashes verify and the protected-scope count is exactly baseline plus the syllabus; nothing is staged. |
| `misleading_success_output` | FAIL | Fresh checker/render results support the target, but stale approvals and the literal-token carry-through tests cannot support a final success claim. |
| `prompt_injection` | PASS | Direct inspection of `syllabus_check.rb` shows only file reading and string/regex checks; it contains no shell, process, network, `eval`, or document-instruction execution path. |
| `cancel_resume` | N/A | This review covers fixed local files and starts no resumable job or external state transition. |
| `hung/long commands` | N/A | Every command is a bounded local read, parse, hash, or render and completed immediately; no service or polling loop is involved. |
| `flaky tests` | N/A | Checker, hash, corrupt-copy, and render probes are deterministic over fixed local artifacts and use no clock, network, or randomness. |
| `repeated interruptions` | N/A | The reviewed surface has no interruption-sensitive runtime state; completeness is assessed from immutable file content and hashes. |

## Slop and maintainability review

- Acceptable: the 131-line Ruby checker is not oversized, has one responsibility, handles missing paths/invalid UTF-8 cleanly, performs no execution, and uses stable W01-W15 and M1-M7 identifiers to prevent duplicate/missing identity false positives.
- Blocking: `carry_terms.all? { text.include?(term) }` is an anywhere-in-document token bucket, while the NVD carry regex pins exact word order. The omission matrix mirrors these implementations and includes no safe carry-policy paraphrase control. This is the precise overfit/slop class prohibited by the required review criteria.
- No useless production abstraction, parser extraction, dead code, or deletion-only production test was found beyond that prose-pinning family. The stable IDs are treated as intentional because the current Task 8 contract explicitly consumes them.

## Checked artifact paths

- `AGENTS.md`
- `SCHEMA.md`
- `index.md`
- recent `log.md`
- `.omo/plans/hoseo-data-analysis-cloud-platform-course.md`
- `.omo/start-work/ledger.jsonl`
- `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-baseline-status.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-protected-sha256.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-7-assembly-check.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-7-adversarial-verify.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/corrupt-syllabus.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-validation.log`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-adversarial-matrix.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-adversarial-verify.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-protected-sha256.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-render.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course-code-review.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/F1-plan-compliance.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/F2-document-source-quality.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/F3-scenario-audit.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/F4-scope-fidelity.md`
- `omo:remove-ai-slops` and `omo:programming` skill contracts

## Exact evidence gaps required for approval

1. A current-SHA code/document review that reruns the required skill-perspective and overfit/slop coverage against target `d062c742...` and the current checker, with all findings closed.
2. A current independent Task 8 adversarial receipt bound to the repaired target/checker, replacing the receipt that embeds `b87d72f...`.
3. Fresh F1-F4/final-review receipts and ledger records bound to the repaired target/checker, rather than the superseded approvals/failures.
4. Removal or independent justification and two-sided controls for the current checker's literal carry-term/prose-order assertions.
5. The required notepad path/artifact, or an explicit authoritative statement that this goal has no notepad requirement.

## Cleanup receipt

This review used only bounded read-only commands and wrote only this required report. It created no temporary files, background or persistent processes, browser contexts, terminal sessions, ports, cloud resources, Hermes/cron/UA operations, or external mutations. All invoked CLI processes exited. Product files, plan, ledger, prior evidence, protected paths, and other agents' artifacts were not changed.

FAIL
