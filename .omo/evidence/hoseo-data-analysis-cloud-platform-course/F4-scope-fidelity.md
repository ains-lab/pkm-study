# F4 — Scope, safety, and dirty-worktree fidelity audit

Audit time: `2026-07-29T07:11:05Z` (`2026-07-29T16:11:05+0900`)

## Binary verdict

**APPROVE.** The task-attributable persistent write set is a subset of the authorized syllabus, designated evidence, and root orchestration state. Todo 1 and Todo 8 contain the same 142 protected path/hash pairs, a fresh recomputation has zero missing/extra/hash-mismatched paths, the six pre-existing output files are byte-identical, staging is empty, and the only status-line addition over the 51-line dirty baseline is the new syllabus.

This approval is attribution-specific, not a claim that the whole machine was quiescent. Two concurrent/local-state observations are disclosed below: ignored `.obsidian/workspace.json` changed during assembly and now references the new syllabus, and three pre-existing Hermes cron metadata files continue to refresh after Todo 8. No course ledger command created, configured, or ran Hermes/cron/NCP/UA state; no non-cron Hermes file changed after the baseline; the concurrent files were preserved and not treated as task-owned output.

## Allowed write set

The plan-authorized set is:

1. Product artifact: `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` only.
2. Designated attempt evidence: `.omo/evidence/hoseo-data-analysis-cloud-platform-course/**`, including Todo 1–8 artifacts and F1–F4 receipts.
3. Designated scoped gate evidence: `.omo/evidence/hoseo-data-analysis-cloud-platform-course-task-1-gate-review.md`.
4. Root orchestration state: `.omo/plans/hoseo-data-analysis-cloud-platform-course.md`, `.omo/start-work/ledger.jsonl`, `.omo/boulder.json`, and transient `.omo/lazycodex-executor-verify/**` hook state.

The syllabus is an external deliverable, not a canonical wiki page. No other `output/`, canonical, raw, generated graph, editor configuration, or external operational path is task-owned.

## Actual attributable write set

### Product

- `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` — absent from the Todo 1 manifest, created by Todo 7, SHA-256 `b87d72f0227c1e59d33e13e6db011d132156644eb8536f4dcb6c2036e3d41210`.

### Todo and final-wave evidence

- Root scoped evidence: `.omo/evidence/hoseo-data-analysis-cloud-platform-course-task-1-gate-review.md`.
- Todo 1: `task-1-baseline-status.txt`, `task-1-protected-sha256.txt`, `task-1-source-ledger.md`, `task-1-failure.txt`, `task-1-adversarial-verify.md`.
- Todo 2: `task-2-course-contract.md`, `task-2-missing-lo.md`, `task-2-contract-check.txt`, `task-2-adversarial-verify.md`.
- Todo 3: `task-3-ncp-module.md`, `task-3-ncp-check.txt`, `task-3-adversarial-verify.md`.
- Todo 4: `task-4-hermes-cti-module.md`, `task-4-hermes-cti-check.txt`, `task-4-adversarial-verify.md`.
- Todo 5: `task-5-wiki-ua-graph-module.md`, `task-5-wiki-ua-graph-check.txt`, `task-5-adversarial-verify.md`.
- Todo 6: `task-6-governance-assessment.md`, `task-6-governance-check.txt`, `task-6-adversarial-verify.md`.
- Todo 7: `task-7-assembly-check.txt`, `task-7-adversarial-verify.md`.
- Todo 8: `syllabus_check.rb`, `corrupt-syllabus.md`, `task-8-validation.log`, `task-8-syllabus.html`, `task-8-render.txt`, `task-8-protected-sha256.txt`, `task-8-adversarial-matrix.md`, `task-8-adversarial-verify.md`.
- Concurrent final receipts: `F3-scenario-audit.md` was present at the audit freeze; `F2-document-source-quality.md` arrived at `2026-07-29T16:11:44+0900` while this receipt was being written and was included in the post-write inventory and scan.
- This receipt: `F4-scope-fidelity.md`.

F1 was not present at the post-write verification point; its eventual designated receipt path remains within the allowed set.

### Root orchestration state

- `.omo/plans/hoseo-data-analysis-cloud-platform-course.md` — Todo checkboxes/orchestration state updated after the baseline.
- `.omo/start-work/ledger.jsonl` — task/adversarial completion ledger updated after the baseline.
- `.omo/boulder.json` — allowed root state but its mtime (`2026-07-29T14:21:28+0900`) predates the Todo 1 baseline; no post-baseline attribution.
- `.omo/lazycodex-executor-verify/` — concurrent root hook directory currently exists but is empty; it is not a product/evidence artifact and was not removed.

Before this F4 receipt and the concurrent F2 arrival, a post-baseline mtime inventory found 36 files excluding `.git`: 35 course/evidence/orchestration or product files and one concurrent ignored workspace file. Post-write verification, including F2 and F4, found 38: 37 allowed files and the same one concurrent workspace file. The 37 allowed files comprise 34 strict-post-baseline evidence files (the baseline receipt itself is the timestamp boundary and is not counted by strict `-newer`), one product, and two root orchestration files. There was no uncategorized post-baseline repository file.

## Dirty-worktree fidelity and full relevant diff review

Todo 1 captured 51 pre-existing porcelain lines. Fresh `git status --short` has 52 lines with exactly one added line and no removed baseline line:

```text
?? output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
```

The evidence and orchestration roots were already represented by baseline untracked directory lines, so Git porcelain cannot enumerate their later children. They were therefore inventoried explicitly above by exact path and mtime. The current 11 tracked diff names equal the 11 baseline tracked modifications; ten are protected by the SHA manifest, and the remaining unrelated tracked draft `.omo/drafts/pkm-study-open-source-readme.md` has mtime `2026-07-21T10:01:59+0900`, before the course baseline. No tracked path was added to or removed from that baseline name set.

The full relevant untracked product content and every Todo/F3 evidence/ledger artifact were opened or deterministically compared. The retained corrupted fixture differs from the syllabus only in the intended two negative mutations: midterm `40% → 30%` and removal of week 8. Fresh Pandoc and Glow streams are byte-identical to the retained Todo 8 HTML and terminal artifacts. `git diff --name-only` necessarily excludes untracked files; its output contains only the inherited 11 tracked paths and is not used to hide the syllabus/evidence inventory.

No staged path exists: `git diff --cached --quiet` exits `0`; cached name count is `0`.

## Protected-manifest comparison

| Check | Result |
|---|---|
| Todo 1 declared rows | `142` |
| Todo 8 rows | `142` |
| Todo 1 vs Todo 8 exact path set | `true` |
| Todo 1 vs Todo 8 exact path→SHA-256 map | `true` |
| Fresh protected current rows | `142` |
| Missing / extra / SHA mismatch | `0 / 0 / 0` |
| Protected family counts | `SCHEMA=1`, `index=1`, `log=1`, canonical=`31`, raw=`43`, `.ua=`59`, pre-existing output=`6` |

Consequences:

- `SCHEMA.md`, `index.md`, and `log.md` retain their baseline bytes.
- All Markdown below `entities/`, `concepts/`, `comparisons/`, and `queries/` retains its baseline bytes.
- Every `raw/` file retains its baseline bytes and exact path.
- Every `.ua/` file, including generated graph/meta/fingerprint/trash state captured by Todo 1, retains its baseline bytes and exact path. No UA generation occurred in the course execution.
- All six pre-existing output artifacts retain their baseline hashes. Current `output/` has exactly those six plus the new syllabus; no existing output was overwritten.

## Safety and operational guardrails

| Guardrail | Result | Evidence |
|---|---|---|
| No NCP mutation | PASS | Eight completed-task ledger entries contain no NCP create/start/stop/delete command. NCP activity is prospective curriculum prose; execution used only bounded first-party documentation availability checks. |
| No Hermes install/config/gateway operation | PASS | The ledger has no Hermes mutation command; worker/final receipts consistently record document-only local checks. No non-cron file under `/Users/sysmoon/.hermes` is newer than the baseline. |
| No task-issued cron creation/run | PASS with concurrent-state disclosure | No completed-task command creates/runs/configures cron. Three redacted cron metadata files, including one empty lock, refresh after Todo 8 under a pre-existing concurrent scheduler; this is not attributed to the course and was not touched. |
| No UA generation/mutation | PASS | Ledger mutation-command count is zero; all 59 protected `.ua/` path/hashes match. Read-only `jq` checks against the pinned graph are explicitly labeled non-generation. |
| No live CTI corpus/collector mutation | PASS | Todo 1 made the explicitly planned bounded first-party source/date checks, streamed responses, and retained only dated facts/hashes. No live collector, publish, raw capture, or canonical promotion ran. |
| No canonical/raw/generated wiki change | PASS | Exact manifest comparison above; zero path or hash drift. |
| No pre-existing output overwrite | PASS | Six baseline outputs unchanged; exactly one new output path. |
| No offensive assignment | PASS | Nine prohibited-activity occurrences in the syllabus all occur in negative policy contexts; unsafe contexts `0`, assigned activity `false`. Public-data-only, no CVE→ATT&CK fact edge, and source-before-fact graph guards are explicit. |
| No staging/commit/revert | PASS | Staged count `0`; baseline status lines preserved; plan ledger specifies `Commit: N`. |

The task ledger contains 13 course rows overall, eight `task-completed` rows covering tasks `1` through `8`, 48 recorded command descriptions, and zero NCP/Hermes/cron/UA mutation command records. Bounded source HTTP reads were allowed by Todo 1 and did not mutate remote state.

## Redacted secret and PII scan

The initial scan was limited to the new syllabus and evidence present at the audit freeze: 34 files, 536,693 bytes. After the concurrent F2 receipt and this F4 receipt were written, the same scan was expanded to all 36 current syllabus/evidence files; total matches remained `0`. No matched value was printed.

```text
private_key=0
aws_access_key=0
github_token=0
openai_key=0
slack_token=0
bearer_secret=0
jwt=0
url_credentials=0
credential_assignment=0
email=0
korean_rrn=0
korean_mobile=0
private_ipv4=0
```

Results: initial `SECRET_PII_SCAN_EXIT=0`; expanded post-write `POST_WRITE_SCAN_EXIT=0`.

## Concurrent and pre-existing state

- All 51 baseline porcelain entries remain. They include inherited modified canonical/generated/index/log paths and inherited untracked raw/canonical/output/orchestration directories; the protected manifest proves the protected subset did not drift during this course execution.
- `.obsidian/workspace.json` is ignored by `.gitignore`, not present in porcelain, and not in the protected manifest. Its mtime is `2026-07-29T15:17:29+0900`, after the baseline, and its current JSON references the new syllabus but not the course evidence directory. This is volatile editor state outside the attributable task write set. With no baseline hash, byte-for-byte before/after proof is unavailable. It was preserved without edit/revert and is not included in approval evidence for task-owned writes.
- `/Users/sysmoon/.hermes/cron` has three redacted metadata files newer than both the baseline and Todo 8; one is an empty `.lock`, two are 17-byte metadata files. Their recurring post-Todo-8 refresh demonstrates a concurrent pre-existing scheduler, not global external-state quiescence. No content value/path identifier was printed, no non-cron Hermes file changed after baseline, and F4 performed no Hermes command or mutation.
- F3 wrote `F3-scenario-audit.md` concurrently inside the designated evidence root before the audit freeze. F2 arrived while F4 was being written. Both are allowed final-wave evidence and were included in the expanded redacted scan. F1 was not yet present at post-write verification.

These concurrent states are not silently normalized or reverted. The verdict means no task-attributable write escapes the allowed set; it does not claim unrelated UI/scheduler state remained globally unchanged.

## Cleanup

Eight named task QA/negative-fixture paths and all `/tmp/hoseo-{t1,t3,t5,t6,t7,t8}-*` matches are absent. The task-specific negative JSON fixtures are absent. The only related leftover is the empty root orchestration hook directory `.omo/lazycodex-executor-verify/` (`0` files), which F4 did not remove because it is concurrent orchestration state outside this verifier's ownership.

Cleanup result: `CLEANUP_REFINED_EXIT=0` with `task_temp_present=0`, `matching_tmp_paths=0`, `root_hook_files=0`.

## Exact commands and exits

All commands ran from `/Users/sysmoon/.codex/projects/pkm-study` and were read-only except the final `apply_patch` that created this receipt.

| Invocation | Exit / observable |
|---|---|
| `pwd -P` | `0`; exact vault root confirmed. |
| `git status --short` plus Ruby set comparison against the block after `exact_git_status_short_before_task_owned_writes:` | `0`; baseline `51`, current `52`, added syllabus only, removed `0`. |
| baseline modified-name extraction vs `git diff --name-only` | `0`; current tracked count `11`, exact baseline tracked name set. |
| `git diff --cached --quiet` and cached name count | `0`; staged count `0`. |
| Ruby parse of Todo 1 and Todo 8 manifests plus fresh SHA-256/current-path enumeration excluding only the new syllabus | `0`; `142/142`, exact map, missing/extra/mismatch `0/0/0`. |
| Ruby comparison of manifest output rows to `find output -maxdepth 1 -type f` | `0`; pre-existing `6`, current `7`, unchanged `true`, added syllabus only. |
| `find . -type f -newer task-1-baseline-status.txt` with Ruby allowed/concurrent classification | `0`; pre-write inventory `36`, allowed course/orchestration `35`, concurrent ignored workspace `1`, unexpected `0`. |
| `git diff --no-index --check /dev/null output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` | raw `1` (normal new-file difference), diagnostic bytes `0`, normalized PASS. |
| `diff --unified=0` real syllabus vs `corrupt-syllabus.md` | raw `1` (expected difference); only weight `40→30` and week 8 removal. |
| fresh `pandoc -f gfm -t html ... | cmp -s - task-8-syllabus.html` | `0`; retained HTML byte-identical, 37,901 bytes. |
| fresh `COLUMNS=420 glow -w 400 -s dark ... | cmp -s - task-8-render.txt` | `0`; retained render byte-identical, 109,584 bytes. |
| Ruby parse of `.omo/start-work/ledger.jsonl` restricted to this plan | `0`; completed tasks `1..8`, mutation command records `0`. |
| Ruby prohibited-activity context scan over the syllabus | `0`; occurrences `9`, unsafe contexts `0`, assigned `false`. |
| Ruby redacted secret/PII scan over syllabus plus current evidence | `0`; 34 files, all 13 categories zero. |
| Expanded post-write secret/PII scan after concurrent F2 and this F4 receipt | `0`; 36 current syllabus/evidence files, total matches `0`. |
| Post-write mtime attribution inventory | `0`; files `38`, allowed `37`, concurrent ignored workspace `1`, unexpected `0`. |
| Ruby post-baseline `/Users/sysmoon/.hermes` metadata classification | `0`; cron after baseline/task8 `3/3`, non-cron after baseline `0`; content not printed. |
| Ruby task-temp cleanup and empty hook-state check | `0`; task temp present `0`, matching temp paths `0`, hook files `0`. |

## Final decision rule

`APPROVE` is issued because the attributable persistent set is wholly inside the allowed write set, every protected path/hash and pre-existing output is unchanged, no staged state exists, all task-issued operational safeguards hold, the syllabus assigns no offensive activity, and the scoped secret/PII scan is clean. Concurrent ignored editor state and pre-existing scheduler metadata are explicitly excluded from attribution, preserved, and disclosed rather than used as silent success evidence.
