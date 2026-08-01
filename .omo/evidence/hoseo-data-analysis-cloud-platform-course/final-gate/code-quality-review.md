# Todo 8 Ruby checker code-quality final gate

## Decision

- `verdict`: **FAIL**
- `codeQualityStatus`: **BLOCK**
- `recommendation`: **REQUEST_CHANGES**
- `review_commit_sha`: `8857bdd924bc0e155b7dd64a8a471692b7b7ab85`
- `target_sha` (required): `d062c7427f7b8a715f357f7d6f7e307f677fcd3b455c9b709c899ef192d52bee`
- `target_sha` (observed): `d062c7427f7b8a715f357f7d6f7e307f677fcd3b455c9b709c899ef192d52bee`
- Checker SHA-256: `b5923d587e4c7934932e2ec9936e17d25015bb44eed6c6d9399fc1429d928450`
- Scope inspected in full: `syllabus_check.rb`, the syllabus, Todo 8 validation log, adversarial matrix, adversarial verification receipt, protected receipt, and the plan's verification/Todo 8/success sections.

The checker is a bounded, deterministic, Ruby 2.6-compatible local CLI and its structural identity checks are sound. Approval is nevertheless blocked because several harmful documents still receive the same success summary as the valid target, and one retained PASS receipt describes a different checker/output revision.

## Blockers

1. Enforce milestone and fallback semantics, not only nonempty cells and implementation-mirroring ID tokens.
2. Reject negated M6/NVD requirements and graph-inference promotion without pinning arbitrary Korean prose.
3. Parse the complete assessment table and reject any weighted category beyond attendance, midterm, and final.
4. Replace or explicitly supersede the stale Todo 8 adversarial verification receipt, then regenerate evidence bound to both the target hash and checker hash.
5. Persist reproducible black-box adversarial cases for the above contracts so later checker revisions cannot silently restore these false positives.

## Findings

### CRITICAL

None.

### HIGH

#### H1. Stable M IDs and nonempty cells are accepted as a substitute for milestone/fallback semantics

The milestone loop checks row width, nonempty cells, exact ID placement, and global ID multiplicity, but it does not validate the stated happy/failure/artifact/machine/fallback/safety/assessment meaning except for the M6 failure cell ([syllabus_check.rb](../syllabus_check.rb):74-88). Five fallback rows receive only identity, width, and nonempty checks; only NCP receives a scoped semantic assertion ([syllabus_check.rb](../syllabus_check.rb):90-98).

This contradicts the plan's semantic assertion that every practical milestone contain meaningful evidence families and that no fallback overclaim capability ([plan](../../../plans/hoseo-data-analysis-cloud-platform-course.md):46-54). It also creates false confidence from tests that mirror marker constants, which the `remove-ai-slops` and `programming` review perspectives explicitly reject.

Fresh black-box probes against temporary copies:

```text
milestone-gibberish: exit=0 stdout=122 stderr=0
PASS headings=10 weeks=15 topic_ids=15 milestones=7 evidence_ids=49 fallbacks=6 weights=20/40/40 rubrics=40/40 carry=PASS

fallback-gibberish: exit=0 stdout=122 stderr=0
PASS headings=10 weeks=15 topic_ids=15 milestones=7 evidence_ids=49 fallbacks=6 weights=20/40/40 rubrics=40/40 carry=PASS
```

The first probe retained the seven exact `M1-*` IDs in their expected cells while replacing every semantic value with `무의미`. The second retained the Hermes row identity and seven nonempty cells while replacing every cell with `무의미`.

#### H2. Scoped semantic regexes are polarity-brittle and omit graph fact promotion

The M6 and NVD checks look for positive substrings in order ([syllabus_check.rb](../syllabus_check.rb):87-89, [syllabus_check.rb](../syllabus_check.rb):107-120). A sentence can therefore contain `거절` or `최소 6초` while explicitly saying the rule is not followed. The safety checks cover accessibility, offensive activity, data-only treatment, and credentials, but there is no negative control for promoting graph/LLM inference to fact ([syllabus_check.rb](../syllabus_check.rb):100-105).

Fresh harmful probes all returned the normal PASS summary:

```text
m6-inversion: exit=0    # "거절하지 않고 validator nonzero도 사용하지 않는다"
nvd-inversion: exit=0   # no pacing/retry bound, no defer, deletes last-good
graph-promotion: exit=0 # all graph/LLM relations declared facts without source review
```

This is not merely incomplete prose linting. The plan explicitly requires rejection/nonzero behavior for partial/stale UA, bounded NVD retry/defer/last-good preservation, and forbids treating graph-inferred relations as facts. The correct repair should use bounded structural or stable polarity-bearing contracts, not exact Korean sentence snapshots.

#### H3. The assessment parser ignores additional weighted categories

`grade_rows` selects only the three expected names, then compares those selected rows with `20/40/40` ([syllabus_check.rb](../syllabus_check.rb):60-64). It never rejects a fourth weighted data row. A temporary syllabus containing the unchanged three rows plus `| 과제 | 10% | 별도 가중치 |` returned:

```text
extra-weight: exit=0 stdout=122 stderr=0
PASS headings=10 weeks=15 topic_ids=15 milestones=7 evidence_ids=49 fallbacks=6 weights=20/40/40 rubrics=40/40 carry=PASS
```

The plan requires exactly three weighted categories and a final verifier with no unsupported weighted category ([plan](../../../plans/hoseo-data-analysis-cloud-platform-course.md):125-130, [plan](../../../plans/hoseo-data-analysis-cloud-platform-course.md):149-155). The success output is therefore materially misleading for a grading-contract violation.

#### H4. A retained Todo 8 PASS receipt is stale and asserts behavior absent from the reviewed checker

The current checker emits `topic_ids=15 ... evidence_ids=49 ... carry=PASS`, as independently observed and as recorded in the newer validation log ([task-8-validation.log](../task-8-validation.log):12-21). By contrast, the retained adversarial verification receipt records an older `instructional=13 ... lo=LO1-LO5` summary ([task-8-adversarial-verify.md](../task-8-adversarial-verify.md):20-38), claims diagnostics that do not exist in the current checker for milestone semantics, fallback semantics, and graph promotion ([task-8-adversarial-verify.md](../task-8-adversarial-verify.md):42-102), and binds the syllabus to obsolete SHA `b87d72f...` ([task-8-adversarial-verify.md](../task-8-adversarial-verify.md):127-143).

Observed current target SHA is `d062c742...`. The stale receipt's claims are also contradicted by the H1/H2 live probes. This makes the evidence architecture internally inconsistent and blocks reliance on the claimed final repair.

### MEDIUM

#### M1. Review-commit SHA alone does not bind the reviewed artifacts

`review_commit_sha` is the current HEAD, but the evidence tree and syllabus are untracked (`?? .omo/evidence/` and `?? output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`). The commit SHA therefore cannot identify the checker/evidence bytes. This report compensates by recording the target and checker SHA-256 values, but future receipts should bind every relied-on executable/report artifact or explicitly identify a supersession chain.

#### M2. Adversarial claims are prose receipts, not a retained reproducible suite

The current validation log and matrix list temporary controls and expected outcomes ([task-8-validation.log](../task-8-validation.log):35-83, [task-8-adversarial-matrix.md](../task-8-adversarial-matrix.md):3-16), but the temporary fixtures and their executable mutation harness are absent. Only the two-fault `corrupt-syllabus.md` is retained. That allowed the stale receipt and current checker to disagree without an automatic gate catching it. A small black-box mutation harness would be justified here; tests that merely mirror constants or Korean sentences would not be.

### LOW

#### L1. Stable-ID failures do not identify the missing suffix/cell

Each of seven per-milestone checks emits the same message, and final `errors.uniq` collapses them ([syllabus_check.rb](../syllabus_check.rb):79-85, [syllabus_check.rb](../syllabus_check.rb):126-131). A missing `M1-HAPPY` reports only `M1 requires its explicit verified diagnostic contract`, so repairers must manually inspect all seven cells. The failure is safe but less actionable than it should be.

## Verified strengths and exact evidence

### Ruby 2.6 compatibility and syntax

The installed runtime is the required generation, not a later-version proxy:

```text
ruby 2.6.10p210 (2022-04-12 revision 67958) [universal.arm64e-darwin25]
Syntax OK
```

`ruby -w -c` and `ruby -w` produced no warnings. The checker has 118 nonblank/noncomment lines, below the 200-line healthy threshold. Its responsibility is one bounded syllabus validation CLI; no needless abstraction, untyped escape hatch, TypeScript suppression, unrelated code, network client, process launcher, or dynamic evaluation was found.

### Required manual-QA channel

Exact invocation:

```sh
ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
```

Observed:

```text
PASS headings=10 weeks=15 topic_ids=15 milestones=7 evidence_ids=49 fallbacks=6 weights=20/40/40 rubrics=40/40 carry=PASS
exit=0 stdout_bytes=122 stderr_bytes=0
```

Thus the requested `evidence_ids=49` observable is present, with no stderr or backtrace.

### Failure mode and CLI boundary

The named corrupt artifact exits 1, produces no stdout, and reports both required core defects on stderr along with dependent failures:

```text
FAIL: weeks must be the exact ordered multiplicity set 1..15
FAIL: missing week 8 or week 15 exam
FAIL: weekly topic IDs must be exact W01-W15 slugs once each
FAIL: instructional and exam week format mismatch
FAIL: grading mismatch: rows must have exact unique identities and weights
```

No argument, nonexistent path, and a mode-000 unreadable copy each exited 1 with one stable line and no backtrace. An invalid UTF-8 copy exited 1 with `FAIL: syllabus is not valid UTF-8` and no backtrace.

The checker correctly rejected fresh duplicate/missing row identities and a hostile stable-ID mutation:

```text
stable-id:          exit=1 (missing/duplicated M1/M2 HAPPY contract)
duplicate-week:     exit=1 (ordered multiplicity and exam-format diagnostics)
duplicate-milestone exit=1 (exact M1-M7 identity diagnostic)
duplicate-fallback: exit=1 (exact six-track identity diagnostic)
schema omission:    exit=1 (attack schema carry-through diagnostic)
accessibility invert exit=1 (affirmative caption/transcript diagnostic)
```

Week, grade, milestone, and fallback identities are collected as row arrays before comparison; no lossy map hides multiplicity. W01-W15 topic IDs and all 49 M IDs are position-checked and globally unique. The implementation is deterministic over a fixed UTF-8 file: it has no time, randomness, environment, network, concurrency, or external mutable state. It is bounded by one file read plus fixed-size line/regex scans. Those strengths do not cure the semantic false positives above.

### Target freshness and dirty-worktree protection

Fresh recomputation found:

```text
TARGET_SHA expected=d062c7427f7b8a715f357f7d6f7e307f677fcd3b455c9b709c899ef192d52bee
TARGET_SHA actual=d062c7427f7b8a715f357f7d6f7e307f677fcd3b455c9b709c899ef192d52bee
PROTECTED_RECOMPUTE rows=142 missing=0 mismatches=0
RECEIPT_COMPARE base=142 final=142 exact=true
```

The protected receipt is valid even though the surrounding worktree is intentionally dirty. No staged path or protected-file mutation was introduced by this review.

## ULTRAQA disposition

| Probe | Result | Evidence/reason |
|---|---|---|
| malformed file / invalid UTF-8 | PASS | Corrupt, missing, unreadable, and invalid-UTF-8 inputs exit 1 without a trace. |
| stale input state | PASS | Required and observed target SHA match exactly. |
| dirty worktree | PASS | 142 protected paths, zero missing/hash mismatches; baseline/final receipt rows are byte-equal. |
| misleading success | **FAIL** | Five semantic/grading hostile mutants returned the normal PASS summary; stale receipt claims the opposite behavior. |
| prompt injection | N/A | Static inspection found only `File.file?` and `File.binread`; no `system`, `exec`, `spawn`, `Open3`, `eval`, network, or instruction-execution path. Input is inert data. |
| cancel/resume | N/A | One-shot local process; no resumable job or durable runtime state. |
| hung command | N/A | Finite local file/line scans; no unbounded loop, wait, network, service, or subprocess. |
| flaky tests | N/A | Fixed local inputs and deterministic operations; repeated valid runs were identical. |
| repeated interruptions | N/A | No background work or incremental checkpoint is used by the CLI. |

## Required skill-perspective check

- `remove-ai-slops`: **ran**. The production checker is compact and avoids dead code, needless abstraction, broad exception swallowing, and irrelevant parsing. It **violates** this perspective by substituting marker/keyword presence for meaningful behavior and producing false confidence; the absent reproducible adversarial harness allowed stale evidence to survive.
- `programming`: **ran** using its shared boundary, testing, determinism, and implementation-mirroring criteria. Ruby has no language-specific reference in that skill. The checker appropriately validates at the file-input boundary and contains no typed-language escape hatch, but it **violates** the test-shape perspective because the retained checks mirror constants/prose fragments without distinguishing several prohibited outcomes.
- Prompt/prose-test perspective: no prompt test or natural-language snapshot test exists. The problem is the inverse: several prose contracts are under-specified or polarity-unsafe. Repairs must not add brittle full-sentence pins.

## Cleanup receipt

All hostile copies lived under a validated task-specific temporary directory beneath the evidence root. After recording exit/output observations, every temporary file was removed and the empty directory was removed. The target SHA remained unchanged. This review started no server, browser context, terminal session, port, container, cloud resource, scheduler, external write, or lingering process.
