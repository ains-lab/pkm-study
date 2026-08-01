# F4 v4 — scope, safety, and dirty-worktree fidelity gate

`recommendation: REJECT`

`binary_verdict: REJECT`

## blockers

1. The required supporting code-quality review is not current for this build. The two explicit code-quality reports are bound to checker SHA-256 values `b5923d587e4c7934932e2ec9936e17d25015bb44eed6c6d9399fc1429d928450` and `4eb64f0ee5acb571547e07b9431d30bdff0fe14af8f5306fd3a72960b075ee16`, not the current `efab908d52db0049be5d7f1afaf7d78f814bbd9dc9360fe802c1577cfe2041cd`. `F2-source-fidelity-v3.md` is bound to the current SHA and mentions both required skills, but it explicitly limits its slop conclusion to the F2 document/source lane and says the checker run is only supporting structure evidence. It does not perform a checker/test maintainability and overfit review. The final-gate protocol requires a current, supported code-review artifact with the same `remove-ai-slops` and `programming` coverage before approval.

The F4-specific scope and safety facts below are clean. The rejection is solely the missing current supporting code-quality gate, not a protected-path, staging, secret, safety, or user-visible syllabus defect.

## originalIntent

Create one Korean 15-week syllabus for HoSeo University fourth-year computer-science students. It should connect NCP/Linux, safe Hermes automation, public CTI normalization, LLM Wiki/UA generation, and reproducible graph analysis through one evidence-preserving workflow, with honest fallbacks, two individual practical exams, accessibility, safety, cost, and provenance controls. Execution must not provision or mutate live NCP, Hermes, cron, canonical/raw wiki content, or UA state.

## desiredOutcome

The sole new product is `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`, accompanied only by designated course evidence/orchestration receipts. The 142 protected baseline paths, including six pre-existing output artifacts, remain an exact path/hash set. HEAD stays at `8857bdd924bc0e155b7dd64a8a471692b7b7ab85`, staging remains empty, unrelated dirty-worktree content is preserved, and neither the product nor evidence contains secrets, PII, prompt-execution behavior, or offensive assignments.

## userOutcomeReview

The user-visible syllabus is present at the requested path and has the required target SHA-256 `75df0f2733c5bf898b78ee531cbc13700aafcc359b4f7ea15d3a0c296d2c1e51`. A complete direct read and a fresh `pandoc -f gfm -t plain` conversion show an honest six-track fallback surface, Docker/Hermes `fixture-only`, explicit rejection of partial/stale UA, public-data-only CTI, credential/PII restrictions, captions/transcripts and accessible alternatives, complete NCP teardown, and explicit prohibitions on malware execution, exploit proof-of-concepts, active scanning, attack automation, and automatic patching/response. The plain surface exits 0, contains all eight normalized safety/fallback anchors, and has no UTF-8 replacement character.

The new product is the only addition within the protected/output scope. All pre-existing vault and output content remains byte-identical. From the user's scope-and-safety perspective, F4 itself passes. Final approval is withheld because the gate bundle lacks a current code-quality review of the exact checker/test revision.

## Build identity

| Item | Required | Recomputed | Result |
|---|---|---|---|
| HEAD | `8857bdd924bc0e155b7dd64a8a471692b7b7ab85` | `8857bdd924bc0e155b7dd64a8a471692b7b7ab85` | PASS |
| syllabus SHA-256 | `75df0f2733c5bf898b78ee531cbc13700aafcc359b4f7ea15d3a0c296d2c1e51` | same | PASS |
| checker SHA-256 | `efab908d52db0049be5d7f1afaf7d78f814bbd9dc9360fe802c1577cfe2041cd` | same | PASS |

## Allowed versus actual writes

Allowed task-owned writes are the new syllabus, `.omo/evidence/hoseo-data-analysis-cloud-platform-course/**`, the two goal-scoped root evidence reports, and the course execution's plan/ledger orchestration records. The course draft and Boulder state predated the baseline cutoff and were not post-baseline writes.

A repository-wide mtime inventory from the recorded baseline time `2026-07-29T05:23:42Z`, excluding `.git`, found 70 files before this report: 66 course evidence files, one product, the course plan and start-work ledger, and one ignored `.obsidian/workspace.json`. This report is the one additional allowed course-evidence write. No unexpected repository path was found. The ignored workspace file is concurrent volatile editor state; it was neither edited nor reverted by this audit.

The final inventory after the bounded wait for a current code-quality receipt was 76 files: 72 course evidence files, one product, two course orchestration files, and the same ignored editor-state file, with zero unexpected paths. The six evidence additions since the first inventory are this F4 report, `F1-plan-compliance-v4.md`, and four sibling `global-final-v3` lane reports. They are concurrent designated evidence, not product, protected, or unrelated writes. The expected `global-final-v3/code-quality-review.md` was still absent after two bounded waits.

The exact `git status --short` comparison is `51` baseline lines to `52` current lines, with zero removed lines and exactly one added top-level line:

```text
?? output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
```

The evidence and orchestration roots were already represented as untracked at baseline, so they were inventoried directly rather than inferred from porcelain directory collapsing.

## Protected manifest and output fidelity

The space-safe Ruby comparison parsed each manifest line as `64-hex SHA + two spaces + full path`, enumerated regular files with Ruby `Find`, and hashed files with `Digest::SHA256.file`; it performed no shell word splitting.

```text
MANIFEST expected=142 current_protected=142 missing=0 added=0 mismatches=0 scope_total=143 scope_additions=1
SCOPE_ADDITIONS output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
OUTPUTS baseline=6 mismatches=0
VERDICT PASS
```

The six byte-identical pre-existing outputs are:

- `output/ai-second-brain-infographic.png`
- `output/ai-second-brain-mind-map.json`
- `output/ai-second-brain-slides.pdf`
- `output/ai-second-brain-technical-blog.md`
- `output/second-brain-pkm-architecture.architecture.json`
- `output/second-brain-pkm-architecture.html`

Therefore `SCHEMA.md`, `index.md`, `log.md`, canonical pages, `raw/`, all 59 baseline `.ua` files, and all six old output files retain the Todo 1 bytes and exact protected path set. The current protected/output scope is the same 142 files plus only the syllabus.

## Git and full-diff fidelity

- `git diff --cached --name-only`: exit 0, staged paths `0`.
- `git diff --name-only`: exit 0, `11` tracked paths, exactly the inherited baseline modifications.
- `git diff --check`: exit 0, diagnostics `0`.
- Full tracked binary diff was consumed and hashed as `60719f24d5cd8c274d28c360c2f1dd99a4d1eb289069547f1efbe23eebabb43f`; its stat is 11 files, 3,863 insertions, and 799 deletions. Those paths already appeared in the Todo 1 dirty baseline, and every protected member matches the Todo 1 file hash.
- The new untracked target was read in full separately; `git diff --name-only` correctly cannot list an untracked file, so status and the protected-scope set comparison are the authoritative addition checks.

No commit, stage, revert, normalization, or disappearance of a baseline dirty path occurred.

## Safety and operational boundaries

| Guardrail | Direct result | Evidence |
|---|---|---|
| No canonical/raw/SCHEMA/index/log/.ua mutation | PASS | Exact 142-path set and SHA comparison: 0 missing, 0 added, 0 mismatch. |
| No existing output overwrite | PASS | Six baseline output hashes, 0 mismatch; syllabus is sole scope addition. |
| No task-issued NCP/Hermes/cron/UA mutation | PASS within attributable scope | 31 ledger rows and 84 command descriptions; mutation-signature counts are NCP `0`, Hermes `0`, cron `0`, UA generation `0`, mutating HTTP `0`, git stage/commit `0`. |
| External Hermes state | DISCLOSED, not attributed | Read-only mtime count after baseline: three files, all pre-existing cron metadata; non-cron Hermes count `0`. No Hermes command or file content was invoked/read by this audit. |
| Secret/PII exposure | PASS | Final redacted scan of the target plus all 73 current course evidence files: 0 private keys, GitHub/AWS/OpenAI keys, bearer/JWT, URL credentials, credential assignments, email addresses, Korean RRN/mobile numbers, or private IPv4 candidates. Candidate values were never printed. |
| Offensive assignment | PASS | The syllabus places all prohibited classes in an explicit prohibition and states they are not collection, assignment, or automation targets. |
| Prompt-like external text | PASS | Five prompt-injection categories returned 0 except one inert evidence line that documents a redacted `rg` scan pattern. It is not external source content and has no execution path. |

No remote NCP control plane was queried because doing so would exceed this read-only audit. The negative operational conclusion is task-attribution-specific: it is supported by the task ledger, unchanged local/protected state, and absence of mutating commands, not a claim that every external system on the machine was globally quiescent.

## Direct `remove-ai-slops` and `programming` pass

The current checker and retained regression harness were read completely and rerun rather than accepted from receipts.

- `syllabus_check.rb`: 205 total lines, 188 nonblank/noncomment lines; one bounded read-only CLI responsibility and below the 250-line ceiling.
- `task-8-regression.rb`: 128 total lines, 120 nonblank/noncomment lines; 78 deterministic controls using `Dir.mktmpdir` and the production CLI.
- Fresh execution: Ruby syntax PASS; exact target exits 0; regression result is `78/78` expected verdicts.
- No whole-file digest oracle, `canonical_milestones`, `canonical_fallbacks`, full Korean line snapshots, full row snapshots, dynamic evaluation, network call, needless production extraction, broad exception swallowing, or hidden mutation exists.
- The typed YAML contract is a small machine-consumed map. Stable topic/role/track IDs, multiplicity, row shape, arithmetic, schemas, and safety polarity are appropriate structural seams. Five semantic paraphrases plus two padding controls are expected accepts, demonstrating that natural-language prose is not pinned.
- The 70 negative controls are not deletion-only or tautological removal tests: they exercise typed contract values/keys, exact ID/multiplicity, assessment arithmetic, input boundaries, active content, schema carry-through, and explicit unsafe inversions through the real CLI. No unresolved direct slop/overfit finding remains.

The direct pass is clean, but the required supporting code-review report for this exact checker SHA is absent, which is the blocker stated above.

## Manual QA and ULTRAQA

| Class | Result | Reason/evidence |
|---|---|---|
| Dirty worktree | PASS | Baseline/current porcelain `51 → 52`; only target added, no baseline line removed; 142/0 manifest result. |
| Stale state | PASS with disclosed historical receipts | Historical Todo 8 receipts are hash-bound to older revisions. Current `task-8-protected-sha256.txt`, `task-8-adversarial-verify-v5.md`, F2 v3, target, and checker all bind the required SHA pair; fresh commands reproduced it. |
| Misleading receipts | PASS for F4 facts | No success prose was trusted. Protected, Git, render, secret, checker, and regression results were independently rerun. The missing current code-quality receipt remains a final-gate blocker rather than being papered over. |
| Prompt-like external text | PASS | One candidate is the literal scan regex in `task-4-adversarial-verify.md`; it is inert review documentation, not an instruction-bearing external source. |
| Repeated interruption | PASS | Todo 1 records that prior interruption left no partial baseline artifact; current hashes, exact protected set, current v5 receipt, and deterministic reruns show no resumed stale product. |
| Malformed input | N/A to F4 | F4 compares fixed existing artifacts and does not accept arbitrary user input. The neighboring checker boundary is independently covered by missing-path/invalid-UTF8/corrupt controls, but that is Todo 8 rather than an F4 mutation surface. |
| Hung command | N/A | All F4 commands are finite local reads/hashes; no network, server, scheduler, polling loop, or background job is used. |
| Flaky behavior | N/A | The audit uses immutable file bytes, deterministic set comparisons, and local process exits; no clock/random/network-dependent assertion decides the verdict. |

Fresh plain-surface result:

```text
PANDOC_PLAIN_NORMALIZED exit=0 required=8/8 replacement_chars=0
```

## Cleanup receipt

The regression harness used `Dir.mktmpdir` and removed its fixtures automatically. Four exact known task temp paths were checked; two stale prior render files existed and were unlinked, leaving `remaining=0`. No broad path or glob was deleted. Final pre-report process/staging check found lingering `pandoc=0`, `glow=0`, `ruby=0` after excluding the checking process, and staged paths `0`.

## Checked artifact paths

- `.omo/plans/hoseo-data-analysis-cloud-platform-course.md` (complete, including F4)
- `SCHEMA.md`, `index.md`, and the latest `log.md` entries
- `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` (complete)
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-baseline-status.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-protected-sha256.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-protected-sha256.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-validation.log`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb` (complete)
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb` and `task-8-regression.log`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-adversarial-matrix.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-adversarial-verify-v5.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-yaml-contract-repair.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-syllabus.html` and `task-8-render.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/final-gate/code-quality-review.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course-code-review.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/F2-source-fidelity-v3.md`
- `.omo/start-work/ledger.jsonl`
- Current porcelain, staged/tracked/full-diff surfaces, protected/output inventories, redacted secret/PII scan, prompt-like scan, and redacted external Hermes mtime counts

## Exact evidence gaps

- No code-quality report bound to checker SHA `efab908d52db0049be5d7f1afaf7d78f814bbd9dc9360fe802c1577cfe2041cd` directly covers checker/test maintainability, implementation-mirroring, useless/excessive/deletion-only/tautological tests, production slop, and full-prose snapshot absence. The sibling current-build quality lane remained live through two bounded waits and had not produced `global-final-v3/code-quality-review.md` at finalization. This is the sole approval blocker.
- No remote NCP audit was performed; the no-mutation conclusion is limited to task-attributable commands and observable local state.
- Three external Hermes cron metadata files changed after the repository baseline through concurrent scheduler activity. No task command or non-cron Hermes change was found, but the repository baseline did not hash external scheduler state.

## Exact command/result ledger

| Invocation | Observable result |
|---|---|
| `pwd -P` | `/Users/sysmoon/.codex/projects/pkm-study` |
| `git rev-parse HEAD`; `shasum -a 256 <target> <checker>` | exact required HEAD and both exact required hashes |
| space-safe Ruby `Find` + `Digest::SHA256.file` manifest comparison | `expected=142`, `missing=0`, `added=0`, `mismatches=0`, six old outputs `mismatches=0`, sole addition target |
| Ruby baseline/current `git status --short` set comparison | `baseline=51`, `current=52`, `added=1`, `removed=0`, target only |
| `git diff --cached --name-only`; `git diff --name-only`; `git diff --check` | staged `0`; inherited tracked diff paths `11`; whitespace diagnostics `0` |
| `git diff --no-ext-diff --binary \| shasum -a 256` | `60719f24d5cd8c274d28c360c2f1dd99a4d1eb289069547f1efbe23eebabb43f` |
| redacted target/course-evidence secret and PII scan | 74 files; all 11 categories `0` |
| task-ledger mutation-signature scan | 31 rows, 84 command descriptions; all six mutation classes `0` |
| `ruby -c <checker>`; checker on target; retained regression harness | syntax PASS; target PASS; regression `78/78` |
| `pandoc -f gfm -t plain <target>` | exit 0, 43,826 bytes, 377 lines, normalized anchors `8/8`, replacement chars `0` |
| exact temp cleanup and process/staging audit | checked `4`, removed `2`, remaining `0`; lingering task tools `0`; staged paths `0` |
