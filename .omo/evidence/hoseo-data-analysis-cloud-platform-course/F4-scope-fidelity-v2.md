# F4 v2 — scope, safety, dirty-worktree fidelity, and final-gate review

```yaml
recommendation: REJECT
reviewed_head: 8857bdd924bc0e155b7dd64a8a471692b7b7ab85
target: output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
target_sha256: d062c7427f7b8a715f357f7d6f7e307f677fcd3b455c9b709c899ef192d52bee
checker: .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb
checker_sha256: de2cd490ff6f38289e25162ba68be640646682c80676c57854f6c5623e8f8241
scope_guardrails: PASS
final_gate: FAIL
```

## Recommendation

**REJECT.** The F4-specific scope, protected-state, safety, and dirty-worktree guardrails pass on the exact build above. Release approval is nevertheless blocked by two final-gate requirements: the current checker is an overfit natural-language snapshot validator, and no code-quality report bound to this checker SHA covers that risk. A missing notepad path is an additional input-evidence gap.

## Blockers

1. **The current checker pins non-machine-consumed Korean prose exactly.** `canonical_milestones`, `canonical_fallbacks`, `canonical_lines`, and `canonical_weeks` compare 49 milestone cells, 36 fallback cells, seven complete prose lines, and two complete operational rows for exact equality (`syllabus_check.rb:83-155`). A direct read-only probe changed `fixture ID/hash와 다섯 진단 PASS` to the meaning-preserving `fixture 식별자·해시와 진단 다섯 건 PASS`; the document remained semantically valid, but the checker exited 1 with `M1 진단·provenance HAPPY canonical cell mismatch`. This is the implementation-mirroring/prose-snapshot overfit rejected by the loaded `remove-ai-slops` and `programming` criteria. The 153-result regression harness mirrors those same canonical values, so its green result does not resolve the maintenance burden or false-negative risk.
2. **No current code-quality report supports approval.** `.omo/evidence/hoseo-data-analysis-cloud-platform-course/final-gate/code-quality-review.md` is a `FAIL` report for checker SHA `b5923d…`; `.omo/evidence/hoseo-data-analysis-cloud-platform-course-code-review.md` is a `FAIL` report for checker SHA `4eb64f…`. `F2-source-fidelity-v2.md` binds the current `de2cd4…` checker and mentions both skills, but explicitly excludes checker maintainability and regression risk from its lane. Thus there is no code-review artifact bound to `de2cd490…` that performs and supports the required slop/overfit pass.
3. **The required notepad path was not supplied or discoverable among the named artifacts.** The plan, draft, evidence tree, ledger, and manual QA artifacts were available, so this does not weaken the F4 scope facts below; it does leave the final-gate input bundle incomplete.

## originalIntent

Create one Korean 15-week syllabus for HoSeo University fourth-year computer-science students. The course should connect NCP/Linux, safe Hermes automation, public CTI normalization, LLM Wiki/UA generation, and reproducible graph analysis through one evidence-preserving workflow, with honest fallbacks, individual practical exams, accessibility, safety, cost, and provenance controls. It must not provision or mutate live NCP, Hermes, cron, wiki, or UA state.

## desiredOutcome

One new external deliverable at `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`, plus designated local verification evidence. All 142 pre-existing protected paths and six pre-existing output artifacts must remain byte-identical; no staging, commit, unrelated rewrite, secret/PII disclosure, offensive assignment, or task-issued external operation is allowed.

## userOutcomeReview

The user-visible syllabus itself is present, readable, safe, and correctly isolated from the canonical vault. Pandoc and Glow both render the exact target successfully, the checker accepts the exact target, and the retained regression harness passes. The document prohibits offensive activity, treats untrusted inputs as inert data, provides fallback and accessibility routes, and does not overwrite any prior output.

However, a green checker is not sufficient user-outcome evidence when it rejects a harmless meaning-preserving edit solely because full Korean prose differs. Until the checker is reduced to stable machine-consumed structure/identifiers with semantic prose reviewed directly, and a fresh code-quality report approves that exact revision, the bundle does not satisfy the final review standard.

## Allowed versus actual writes

### Allowed write set

- Product: `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` only.
- Designated evidence: `.omo/evidence/hoseo-data-analysis-cloud-platform-course/**` and the two goal-scoped root evidence reports.
- Root orchestration state required by `start-work`: the course plan, `.omo/start-work/ledger.jsonl`, `.omo/boulder.json`, and transient `.omo/lazycodex-executor-verify/**` hook receipts.

### Actual attributable set

A strict post-baseline mtime inventory found 63 repository files before this report: 62 course product/evidence/orchestration files, one concurrent ignored `.obsidian/workspace.json`, and zero unexpected files. Current porcelain has 53 lines versus the 51-line Todo 1 baseline. No baseline line disappeared; the only added top-level entries are:

```text
?? .omo/lazycodex-executor-verify/
?? output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
```

The first is a root verification-hook receipt containing only an `attempts` counter; it is not a product or vault artifact. The evidence and orchestration roots were already represented as untracked directories at baseline, so their task-owned children were inventoried directly. The ignored workspace file is volatile concurrent editor state and was preserved without edit or revert.

The current 11 tracked diff paths are exactly inherited baseline modifications. Ten are protected and byte-identical to their Todo 1 hashes; the remaining unrelated draft has an mtime of `2026-07-21T10:01:59Z`, before the course baseline. `git diff --check` reports no whitespace diagnostic. No tracked course write exists.

## Protected manifest and output fidelity

An independent recomputation parsed all 142 Todo 1 path/hash pairs and enumerated the current protected scope rather than trusting the Todo 8 summary.

| Check | Result |
|---|---|
| Todo 1 protected entries | 142 |
| Missing protected paths | 0 |
| SHA-256 mismatches | 0 |
| Current protected/output scope | 143 files |
| Added scope path | only `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` |
| Protected families | `SCHEMA=1`, `index/log=2`, canonical=31, raw=43, `.ua`=59, pre-existing output=6 |
| Current output inventory | the same six prior files plus the new syllabus |

Consequently, no `SCHEMA.md`, `index.md`, `log.md`, canonical page, raw record, `.ua` artifact, or pre-existing output changed or appeared after the baseline. The Todo 8 receipt's `protected_hash_mismatches: 0` is independently confirmed.

## Safety and operational boundaries

| Guardrail | Result | Direct evidence |
|---|---|---|
| No staging or commit | PASS | HEAD remains `8857bdd924bc0e155b7dd64a8a471692b7b7ab85`; `git diff --cached --name-status` is empty. |
| No task-issued NCP/Hermes/cron/UA mutation | PASS with attribution boundary | 29 course ledger events contain 72 command descriptions and zero matches for NCP provisioning, Hermes install/gateway/cron mutation, cron run/create/tick, `understand-knowledge`, or mutating HTTP verbs. All 59 protected `.ua` files match. |
| Concurrent Hermes state | DISCLOSED, not task-owned | Three external Hermes files newer than baseline are all pre-existing cron metadata; non-cron count is zero. No content, identifier, or secret was read or printed, and no Hermes command was invoked in this audit. |
| No canonical/raw/generated wiki change | PASS | Exact current path-set and SHA comparison above. |
| No existing output overwrite | PASS | All six baseline output hashes match; target is the sole addition. |
| No offensive assignment | PASS | Prohibited-activity lines have zero unsafe positive contexts; six required public-data/data-only/PII/scanning/automatic-response/graph-hypothesis safety contracts are present. |
| No secret or PII | PASS | Redacted scan of 59 target/evidence files found zero matches in 12 categories: private keys, AWS/GitHub/OpenAI tokens, bearer/JWT, URL credentials, credential assignments, email, Korean RRN/mobile, and private IPv4. No candidate value was printed. |

The NCP conclusion is attribution-specific: no remote cloud control plane was queried, because that would exceed this read-only audit. The evidence proves no recorded task command or repository/external-local mutation; it does not claim global external quiescence.

## Direct remove-ai-slops and programming pass

- Source size is not a blocker: `syllabus_check.rb` is 180 lines/168 pure lines and has one bounded CLI responsibility; `task-8-regression.rb` is 134/124.
- Boundary behavior is sound: Ruby syntax passes; valid target exits 0; missing/invalid/corrupt controls are retained by Task 8; the 153-result harness exits 0; Pandoc and Glow exit 0.
- No needless production abstraction, broad exception swallowing, network execution, dynamic evaluation, hidden side effect, or oversized module was found.
- **Unresolved overfit remains:** exact natural-language snapshots and their implementation-mirroring mutation suite test the current wording, not a machine-consumed contract. The direct semantic paraphrase probe above proves a false negative. This is enough to block approval even though the exact current artifact is accepted.

## Checked artifact paths

- `.omo/drafts/hoseo-data-analysis-cloud-platform-course.md`
- `.omo/plans/hoseo-data-analysis-cloud-platform-course.md`
- `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-baseline-status.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-protected-sha256.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-protected-sha256.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-validation.log`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.log`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-adversarial-verify-v4.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-syllabus.html`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-render.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/final-gate/code-quality-review.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course-code-review.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/F2-source-fidelity-v2.md`
- `.omo/start-work/ledger.jsonl`
- current `git status`, tracked/staged diff surfaces, current protected/output inventories, and redacted external-state counts

## Exact evidence gaps

- No code-quality approval exists for checker SHA `de2cd490…`.
- No notepad path was supplied.
- No NCP control plane was queried; absence of task-issued remote mutation is supported by task records and local state, not by a remote audit.
- The pre-existing concurrent scheduler and ignored Obsidian workspace prevent a claim that all machine state was globally quiescent; neither is attributed to this course execution.

## Command evidence

| Invocation | Observable result |
|---|---|
| `git rev-parse HEAD`; target/checker `shasum -a 256` | exact required HEAD and both exact hashes |
| `git status --short`; baseline/current set comparison | `51 → 53`, added two, removed zero |
| `git diff --name-status`; `git diff --cached --name-status`; `git diff --check` | inherited 11 tracked paths; staged 0; diagnostics 0 |
| independent Ruby manifest/path/hash recomputation | expected 142, current 143, missing 0, mismatch 0, added target only |
| post-baseline mtime classification | 63 files: allowed 62, concurrent 1, unexpected 0 |
| redacted target/evidence secret/PII scan | 59 files; all 12 categories zero |
| ledger mutation-signature scan | 29 events, 72 command descriptions, mutation matches 0 |
| `ruby -c`; checker on exact target; persisted regression harness | syntax PASS; target PASS; regression exit 0 |
| Pandoc GFM and Glow terminal render to stdout | both exit 0 |
| process-substitution paraphrase probe | valid source exits 0; meaning-preserving M1 paraphrase exits 1 with canonical-cell mismatch |

## Final decision rule

F4's write-scope and safety facts are clean, but final approval requires both a direct non-overfit implementation/test pass and a supporting current code review. Those conditions are not met. The only recommendation is **REJECT**.
