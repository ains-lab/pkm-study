# F4 v5 — scope, safety, and dirty-worktree fidelity gate

```yaml
recommendation: REJECT
binary_verdict: REJECT
scope_verdict: PASS
safety_verdict: FAIL
severity: HIGH
reviewed_head: 8857bdd924bc0e155b7dd64a8a471692b7b7ab85
target_sha256: 65ed06d96716202509679a3a3ef57c4a0d446c2bb77998a454ed2885d2123d66
checker_sha256: 487470cea93eeb62ca199216f4db0385a3816a40428d725f5a9f419a9520f5ba
harness_sha256: ba031c00f4382d0e78408a0e1a9e17c410b561fae18e9b6afcbebabde5258dab
review_mode: read-only except this report and the paired security report
```

## Blockers

1. **HIGH — renderer-active entity URI bypass.** The checker decodes numeric references but tests only literal `javascript:`/`vbscript:` and does not canonicalize URL-Standard ASCII tab, LF, or CR inside a scheme. Temporary copies containing `[x](java&#x09;script:alert(1))`, `[x](java&#x0a;script:alert(1))`, `[x](java&Tab;script:alert(1))`, `[x](java&NewLine;script:alert(1))`, `[x](ja&#x0d;vascript:alert(1))`, and `[x](jav&#x09;ascript:alert(1))` all exited `0` with the complete 169-byte success line. Pandoc emitted control-bearing `href` values; removing tab/LF/CR yields `javascript:alert(1)`, and Node's URL parser resolves these obfuscated values to the `javascript:` protocol. This is a fail-open active-content gate at `syllabus_check.rb:28-53`.
2. **HIGH — YAML source cardinality is not fail-closed.** `YAML.safe_load` plus post-parse key equality does not reject duplicate mapping keys or a second document inside the one fence. A contract containing `malware_execution: true` followed by the expected `false`, one containing `contract_version: "9.9"` followed by `"1.0"`, and a two-document stream all exited `0` with `machine_contract=PASS`. The document-wide fence count also misses GFM-valid three-space-indented and tilde YAML fences; each extra contradictory block passed. The source is ambiguous across consumers even when Ruby's selected object matches the expected hash (`syllabus_check.rb:99-145`).
3. **MEDIUM — the encoded-size guard is bypassable.** A 1,037,289-byte document made by prepending `&amp;` 200,001 times shrank below 1,000,000 bytes on its first decode and exited `0`. The code checks only `next_decoded.bytesize` after a changed round and never rejects an oversized source before `File.binread`/decode (`syllabus_check.rb:12-13,28-42`). The stated fail-closed size boundary is therefore not enforced and the local CLI retains an avoidable memory/CPU denial-of-service surface.
4. **MEDIUM — malformed non-string YAML keys leak a traceback.** Adding numeric root key `1: unexpected` reaches `actual.keys.sort` and exits with an `ArgumentError` stack trace rather than bounded `FAIL:`-only stderr. Other malformed cases are clean, but this typed-boundary class violates the advertised channel contract.

The exact syllabus prose, protected manifest, staging state, and attributable operational scope are otherwise clean. The recommendation is rejected by the four checker-bound safety failures above, not by generic Korean-semantics expectations, a future review lane, or a missing notepad.

## Original intent

Create one Korean 15-week syllabus for HoSeo University fourth-year computer-science students. It must connect NCP/Linux, safe Hermes automation, public CTI normalization, LLM Wiki/UA generation, and reproducible source-checked graph analysis through an evidence-preserving workflow with honest fallbacks, two individual practical exams, accessibility, cost, privacy, and safety controls. Verification must remain local and read-only and must not provision NCP, install or mutate Hermes, run cron, mutate the wiki, or regenerate UA.

## Desired outcome

The user receives only `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` as the new product, plus designated evidence/orchestration receipts. The 142 protected baseline paths and six pre-existing output artifacts remain byte-identical; HEAD remains pinned; staging stays empty; unrelated dirty state is preserved. The exact target prose is reviewed manually for meaning, while the checker safely enforces machine-consumed structure, typed policy values, malformed-input boundaries, and renderer-active content.

## User-outcome review

The exact target itself is safe and coherent. A complete read confirmed public-data-only CTI, credential/PII exclusion, offensive-activity and automatic-response prohibitions, data-only handling of untrusted content, graph hypotheses pending source verification, partial/stale UA rejection, captions/transcripts and accessible alternatives, bounded NVD retries with last-good preservation, NCP budget/terminate/public-IP cleanup, and the six honest live/fallback claims. Its 20 Markdown destinations are all HTTPS; none contains userinfo or a normalized executable scheme. Fresh Pandoc rendering exited `0` with 56,193 bytes, 10 H2 sections, 11 tables, and zero active-content matches.

The checker correctly labels open prose as `prose_semantics=REVIEWED_EXTERNALLY`; this review does not require it to infer generic Korean meaning. The user-visible target at the pinned hash passes that semantic review. The shipped validation surface still fails the desired outcome because it certifies adversarial active links, ambiguous safety YAML, and one oversize encoded document.

## Build identity and mutation invariants

| Item | Required | Recomputed before and after QA | Result |
| --- | --- | --- | --- |
| HEAD | `8857bdd924bc0e155b7dd64a8a471692b7b7ab85` | exact | PASS |
| syllabus | `65ed06d96716202509679a3a3ef57c4a0d446c2bb77998a454ed2885d2123d66` | exact | PASS |
| checker | `487470cea93eeb62ca199216f4db0385a3816a40428d725f5a9f419a9520f5ba` | exact | PASS |
| harness | `ba031c00f4382d0e78408a0e1a9e17c410b561fae18e9b6afcbebabde5258dab` | exact | PASS |
| Ruby syntax | both Ruby files | `Syntax OK`, exit `0` | PASS |
| valid target | accept on the real CLI | exit `0`, one 169-byte PASS line, empty stderr | PASS |
| retained harness | all distinct controls behave as declared | `38/38`; 10 accepts, 28 rejects, 38 distinct | PASS but incomplete |
| deterministic valid run | stable output | 3 runs, one exit/stdout/stderr shape | PASS |
| post-QA artifact hashes | unchanged | all three exact | PASS |

## Exact adversarial mutation matrix

Every mutation was non-no-op, written only under `Dir.mktmpdir`, and executed through the production CLI with separate stdout/stderr capture.

| Class | Cases | Expected | Actual |
| --- | ---:| --- | --- |
| Benign entity and inert prompt comment | 2 | accept without side effect | 2 accept; marker absent |
| Raw script/iframe `srcdoc` | 2 | reject | 2 reject with active-content diagnostic |
| Literal Markdown `javascript:` / `data:text/html` | 2 | reject | 2 reject |
| Ordinary numeric-entity JavaScript/data URI | 2 | reject | 2 reject |
| Nested active entity depths 1, 5, 63 | 3 | reject active content | 3 reject |
| Nested active entity depths 64, 65 | 2 | fail closed at round limit | 2 reject with decoding-bound diagnostic |
| Changed decode remaining above 1,000,000 bytes | 1 | reject | reject |
| Numeric tab/LF inside `javascript` scheme | 2 | reject | **2 accepted with normal PASS** |
| HTML5 `&Tab;` / `&NewLine;` inside scheme | 2 | reject | **2 accepted with normal PASS** |
| Numeric CR / alternate in-word tab inside scheme | 2 | reject | **2 accepted with normal PASS** |
| Oversized encoded source that shrinks below limit | 1 | reject | **accepted with normal PASS** |
| Unsafe typed values, unknown key, extra YAML fence | 4 | reject | 4 reject |
| YAML alias and custom Ruby tag | 2 | reject safely | 2 reject with `Psych::BadAlias` / `Psych::DisallowedClass`, no trace |
| Duplicate safe/unsafe YAML key shadowing | 2 | reject ambiguity | **2 accepted with `machine_contract=PASS`** |
| Second YAML document inside the sole fence | 1 | reject stream cardinality | **accepted with `machine_contract=PASS`** |
| Extra indented / tilde GFM YAML fences | 2 | reject document cardinality | **2 accepted with normal PASS** |
| Invalid UTF-8, truncation, malformed YAML syntax | 3 | bounded `FAIL:` only | 3 reject; empty stdout, no trace |
| Non-string YAML root key | 1 | bounded `FAIL:` only | **nonzero, but `ArgumentError` traceback** |

The retained harness's `38/38` result does not cover the 12 false-success controls above or the traceback escape. Counts alone are therefore not approval evidence.

## Protected manifest and output fidelity

The Todo 1 manifest was parsed as `64-hex + two spaces + full path`; current files were enumerated without shell word splitting and hashed directly.

```text
MANIFEST expected=142 protected_now=142 scope_total=143
missing=0 added=0 mismatches=0
scope_additions=output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
OUTPUT_BASELINE count=6 mismatches=0
```

The six unchanged prior outputs are `ai-second-brain-infographic.png`, `ai-second-brain-mind-map.json`, `ai-second-brain-slides.pdf`, `ai-second-brain-technical-blog.md`, `second-brain-pkm-architecture.architecture.json`, and `second-brain-pkm-architecture.html`. `SCHEMA.md`, `index.md`, `log.md`, canonical pages, `raw/`, and all baseline `.ua` files also match exactly.

## Dirty-worktree and write-scope matrix

| Surface | Baseline | Current/final observation | Result |
| --- | ---:| ---:| --- |
| `git status --short` | 51 lines | 53 lines | disclosed |
| Removed baseline status lines | — | 0 | PASS |
| Added status lines | — | target plus `.omo/lazycodex-executor-verify/` | attributable |
| Staged paths | 0 | 0 | PASS |
| Tracked diff paths | 11 inherited | 11 | PASS |
| `git diff --check` | — | exit `0`, 0 diagnostics | PASS |
| Full tracked binary diff | inherited | SHA-256 `60719f24d5cd8c274d28c360c2f1dd99a4d1eb289069547f1efbe23eebabb43f` | unchanged |

The 15-byte `.omo/lazycodex-executor-verify/...json` contains only `{"attempts":1}`; its first UUID equals the course execution session ID recorded throughout the ledger. It was created before this lane and is classified as task-orchestration state, not a product/protected-path write. It was neither edited nor removed.

At the final report snapshot, the post-baseline mtime inventory and classification are recorded in the paired security report's final-snapshot block. All paths fall into course evidence, two goal-root evidence receipts, course orchestration, the syllabus product, or ignored volatile Obsidian workspace state; unexpected product/protected writes are zero.

## Operational, secret, and privacy boundaries

| Guardrail | Result | Direct evidence |
| --- | --- | --- |
| No NCP/Hermes/cron/UA mutation | PASS within task attribution | 29 course-ledger rows / 72 command descriptions; mutation signatures for NCP, Hermes, cron, UA generation, mutating HTTP, and git stage/commit were all `0`. Checker/harness source has no network/cloud/Hermes/cron/UA API. |
| No protected wiki/UA write | PASS | exact 142-path/hash comparison, zero mismatch/add/remove |
| No staging | PASS | staged paths `0` before and after QA |
| Secrets/PII | PASS | target/checker/harness: all 11 redacted categories `0`; final target plus 86 course-evidence files (87 files): all categories `0` |
| External instructions | PASS for execution safety | injected prompt-like comment stayed inert, no marker/network/process/action |
| Offensive assignment | PASS in exact prose | every offensive class is prohibited and excluded from collection, assignments, and automation |

No remote control plane or external Hermes directory was queried. The operational conclusion is deliberately limited to task-attributable commands, protected local state, and the exact executable sources; it is not a claim that every external system was globally quiescent.

## Direct `remove-ai-slops` and `programming` review

Both source files were read completely. The checker is 209 lines / 192 nonblank noncomment lines; the harness is 102 / 90. Each is a bounded single-purpose script below the 250-pure-LOC ceiling. There is no broad rescue, eval/xstring, shell/network call, dead wrapper, needless dependency, deletion-only test, full-document digest oracle, canonical Korean snapshot, or useless duplicate mutant body. The harness correctly proves every mutation is non-noop, keeps 38 bodies distinct, and checks stdout/stderr contracts separately.

The direct pass nevertheless finds unresolved maintenance and false-confidence slop: the retained suite omits URL-canonicalization, duplicate-key, and shrinking-oversize controls, while its all-green count is presented by neighboring QA as complete active/YAML coverage. The production code's post-decode-only size check is ineffective for the encoded-input boundary, and `CGI.unescapeHTML` is not an HTML5 named-reference decoder. These are security behavior gaps, not a request for more prose-token tests.

The exact-current-hash `global-final-v4/code-quality-review.md` now explicitly applies both `remove-ai-slops` and `programming` and returns `FAIL`. It independently reproduces duplicate-key, multi-document, alternate-fence, and non-string-key boundary defects and identifies additional exact-prose predicates. Report coverage therefore supports rather than replaces this direct pass. No future lane or notepad is required or cited.

## ULTRAQA disposition

| Class | Verdict | Evidence |
| --- | --- | --- |
| malformed input | **FAIL** | common cases reject cleanly, but a non-string YAML key emits an `ArgumentError` traceback |
| active content | **FAIL** | six tab/LF/HTML5 entity scheme mutations emit full success; Pandoc surface normalizes to `javascript:` |
| prompt injection | PASS for inertness | comment accepted as data, no execution or marker |
| stale state | PASS | pinned hashes recomputed before/after; stale receipts not trusted |
| dirty worktree | PASS with attribution disclosure | 142/0 protected comparison, no removed baseline status, staged 0 |
| misleading PASS | **FAIL** | active URI, duplicate YAML, and shrinking-oversize documents receive the ordinary full PASS line |
| repeated interruption | PASS | two harness processes terminated by signal 15; clean recovery exited 0 with exact 38-count line; no temp residue |
| hung | N/A | no hang observed; all commands were finite local operations |
| flaky | N/A | no flake observed; three valid runs and recovery were deterministic |

## Cleanup receipt

All custom copies used exact `Dir.mktmpdir` roots and were absent after their blocks. Two interrupted harness runs left zero new `t8-regression*` directory. Prompt marker, security/boundary/HTML5/oversize temp roots, task Ruby process, task listening port, and staged path counts are zero. No server, browser, container, cloud resource, Hermes state, cron state, UA state, or render artifact was created.

## Checked artifact paths

- `.omo/plans/hoseo-data-analysis-cloud-platform-course.md`
- `.omo/drafts/hoseo-data-analysis-cloud-platform-course.md`
- `SCHEMA.md`, `index.md`, latest `log.md`
- `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-baseline-status.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-protected-sha256.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-protected-sha256.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-adversarial-verify-v9.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/global-final-v3/security-review.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/global-final-v3/code-quality-review.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/global-final-v4/qa-execution-review.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/global-final-v4/debugging-runtime-audit.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/global-final-v4/code-quality-review.md`
- `.omo/start-work/ledger.jsonl`
- current status/staging/full-diff surfaces, redacted secret/PII scan, Pandoc output in memory, and isolated mutation outputs

## Exact evidence gaps

- No retained negative controls cover numeric or HTML5 named tab/LF/CR inside executable schemes, duplicate YAML mapping keys, multi-document streams, alternate GFM YAML fences, non-string keys, or an oversized encoded source that shrinks under the post-decode threshold.
- The neighboring QA PASS is too narrow: it runs the retained harness but does not test these false-success classes. The current debugging audit independently confirms the oversize false success.
- The exact-current-hash code-quality report has the required skill coverage and is itself `FAIL`; its supported contract-boundary findings remain unresolved.
- No remote NCP/Hermes/cron audit was performed; the no-mutation finding is task-attribution-specific.

## Final decision

**REJECT.** Scope and exact target prose pass, but the pinned checker fails closed neither for renderer-active control-obfuscated schemes nor duplicate YAML key ambiguity, and it accepts an encoded document larger than its configured size boundary.
