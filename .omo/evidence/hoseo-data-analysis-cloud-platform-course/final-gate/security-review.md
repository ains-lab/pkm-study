# Final gate security review

```yaml
recommendation: REJECT
verdict: FAIL
severity: HIGH
review_commit_sha: 8857bdd924bc0e155b7dd64a8a471692b7b7ab85
target_sha: d062c7427f7b8a715f357f7d6f7e307f677fcd3b455c9b709c899ef192d52bee
checker_sha: b5923d587e4c7934932e2ec9936e17d25015bb44eed6c6d9399fc1429d928450
review_scope: security final gate for the Korean Markdown syllabus and Ruby checker
```

## Original intent

Create one Korean 15-week HoSeo University syllabus that teaches NCP, Hermes Agent, public CTI collection, LLM Wiki, Understand Anything, and graph analysis through a safe evidence-preserving workflow. The plan explicitly excludes malware execution, exploit proof-of-concepts, active scanning, PII or credential collection, and automatic patching/response (`.omo/plans/hoseo-data-analysis-cloud-platform-course.md:23-44`). Its verification must remain local and read-only (`.omo/plans/hoseo-data-analysis-cloud-platform-course.md:46-54`).

## Desired outcome

The user should receive a syllabus whose safety policy is unambiguous and a checker that fails closed for malformed input, active HTML/execution URIs, unsafe policy polarity, and misleading success. The supporting Task 8 and review artifacts must bind to the exact current syllabus and checker hashes.

## User-outcome review

The current syllabus text itself states the intended safe policy: it prohibits offensive and automatic-response activity, forbids credentials in prompts/logs, treats untrusted content as data-only, and forbids active HTML/execution URIs (`output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md:160-168`). The CLI also handles missing paths, invalid UTF-8, and the five required active-content classes correctly.

The shipped verification outcome is nevertheless unsafe. The checker accepts harmful policy rewrites when the attacker preserves its expected words. It therefore can print a full success line for a syllabus that requires offensive activity, executes untrusted content, or inserts credentials. This is false assurance on the exact safety boundary the plan requires.

## Blockers

### HIGH — token-preserving security polarity inversions pass

The safety assertions at `.omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb:100-105` are prose-token regexes. Fresh temporary mutations retained the expected terms while reversing the meaning:

| Control | Harmful meaning | Actual result |
|---|---|---|
| `offensive-token-preserving` | requires the listed offensive/automatic-response activity, while saying only that a review table should contain the words “explicitly prohibited” | exit `0`; full `PASS headings=10 ... carry=PASS` |
| `data-only-token-preserving` | treats untrusted external content as executable instructions, while retaining `data-only` and “never execute” as review-table text | exit `0`; full `PASS headings=10 ... carry=PASS` |
| `credential-token-preserving` | requires tokens/API keys/cookies in prompts, logs, and fixtures, while retaining a later “do not put API keys” phrase | exit `0`; full `PASS headings=10 ... carry=PASS` |

These controls were made only in `Dir.mktmpdir('hoseo-security-overfit-')`; the directory was automatically removed. This reproduces the overfit/false-confidence class already identified in `.omo/evidence/hoseo-data-analysis-cloud-platform-course-code-review.md:17-19,35-39` and shows it remains unresolved in the current checker.

### HIGH gate-integrity gap — required reviews do not bind to the current artifacts

- The code-review report remains `FAIL` and binds to syllabus SHA `b87d72f...` and checker SHA `4eb64f0e...`, not the current `d062c742...` / `b5923d58...` pair (`.omo/evidence/hoseo-data-analysis-cloud-platform-course-code-review.md:3-9,69-74`). Its `omo:remove-ai-slops`/`omo:programming` perspective is explicit, but it is stale and its blocker is supported by the fresh controls above.
- The Task 8 adversarial receipt records the former syllabus SHA `b87d72f...` (`.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-adversarial-verify.md:137-143`), while the newer validation transcript records the current target SHA (`.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-validation.log:3-5`). The Task 8 evidence set is internally inconsistent.
- No notepad path was supplied, and a search below `.omo/` found no notepad artifact. This required gate input cannot be inspected.

## Fresh security evidence

| Area | Result | Evidence |
|---|---|---|
| Current target | PASS | SHA-256 exactly `d062c7427f7b8a715f357f7d6f7e307f677fcd3b455c9b709c899ef192d52bee`; checker exits `0` with one stable `PASS` line. |
| Ruby syntax | PASS | `ruby -c .../syllabus_check.rb` succeeds. |
| Missing path | PASS | exit `1`; `FAIL: syllabus path is missing or unreadable`; no backtrace and no path echo (`syllabus_check.rb:3-7`). |
| Invalid UTF-8 | PASS | exit `1`; `FAIL: syllabus is not valid UTF-8`; no backtrace (`syllabus_check.rb:9-18`). |
| `<script>` | PASS | exit `1`; `FAIL: active script or executable URI is forbidden`. |
| `onerror` HTML | PASS | exit `1`; same stable diagnostic. |
| `javascript:` | PASS | exit `1`; same stable diagnostic. |
| `vbscript:` | PASS | exit `1`; same stable diagnostic. |
| `data:text/html` | PASS | exit `1`; same stable diagnostic. The common control is `syllabus_check.rb:34`. |
| Rendered HTML | PASS | retained Task 8 HTML contains zero `<script>`, event-handler attributes, `javascript:`, `vbscript:`, or `data:text/html` matches. |
| Arbitrary code execution | PASS | Ruby AST parses with zero xstring literals. Static inspection finds zero `system`/`exec`/`spawn`/`fork`, `popen`, `eval`, network APIs, or dynamic loads. The checker has one `File.binread` and no file-write API (`syllabus_check.rb:9-10`). |
| Prompt injection | PASS for execution safety | An inert untrusted-instruction comment remains data: checker exits `0`, creates no requested marker, and the checker has no execution surface. The syllabus reinforces data-only treatment at lines 168 and 192. |
| Links | PASS | 20 Markdown destinations; all use `https`; zero executable schemes and zero URL-embedded credentials. |
| Secrets/PII | PASS | Redacted scan of the target plus eight Task 8 artifacts: private keys `0`, known token prefixes `0`, token assignments `0`, Bearer secrets `0`, JWTs `0`, Korean RRN `0`, e-mail addresses `0`. Candidate values were never printed. |
| Unsafe operational prescriptions | PASS in current text | Explicit prohibitions appear at syllabus lines 162-168; cost/teardown controls at 166; bounded outage/retry behavior at 181-188. |
| External dependencies | PASS | Checker uses Ruby core APIs only and contains no `require`; it performs no network, shell, cloud, Hermes, cron, browser, or UA action. |
| Error leakage | PASS for exercised boundaries | Missing/unreadable and invalid-encoding errors are stable, concise, path-free, and backtrace-free. |

Residual low-risk note: `File.binread` has no explicit size cap and accepts any regular-file path, including a symlink. In this local, user-invoked, read-only checker it does not print file contents and is not the release blocker; it would need a size/realpath policy before use as an untrusted multi-user service.

## Manual-QA channel

The required terminal surface was invoked against a temporary harmful copy containing `<script>alert(1)</script>`:

```text
ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb /var/folders/m4/fpkc7fq93zb3zk2s92fqn79m0000gn/T/hoseo-final-security-20260729-65411-1dzp76j/script.md
```

Observable: exit `1`, exactly `FAIL: active script or executable URI is forbidden`, and no stack trace. The containing `Dir.mktmpdir` was removed automatically after the check.

## ULTRAQA matrix

| Class | Verdict | Evidence or applicability |
|---|---|---|
| malformed input | PASS | Missing path and invalid UTF-8 both fail closed with stable diagnostics and no trace. |
| prompt injection | PASS | Injected instruction text remained inert, produced no marker, and the checker has no execution API. |
| stale state | FAIL | Code review and Task 8 adversarial receipt bind to former target/checker hashes; current validation log binds to the new target. |
| dirty worktree | PASS | Fresh protected recomputation: expected `142`, current `142`, missing/extra/mismatch `0/0/0`; the syllabus is the only added protected-scope path; staged count `0`. |
| misleading success | FAIL | All three token-preserving unsafe-policy mutants exit `0` with the full success line. |
| security polarity inversion | FAIL | The checker detects simple phrase removal but not meaning reversal that preserves its regex tokens. |
| flaky | PASS | Three consecutive runs on the current target produced byte-identical stdout/stderr and exit status. |
| cancel/resume | N/A | The checker is a single read/parse/exit CLI with no checkpoint, transaction, background job, or persistent partial state to resume. Interruption merely aborts the process. |
| hung/long | N/A | The reviewed target is a fixed 205-line local file; the checker has no network call, retry loop, server, watcher, or background process. The unbounded-read residual is documented separately above. |
| repeated interruptions | N/A | There is no durable in-progress state or resume protocol whose correctness could diverge after multiple interruptions. Each invocation starts from the immutable file bytes. |

## Remove-AI-slops and programming review

The current 118-pure-LOC checker is not oversized, has a single responsibility, introduces no dependency, contains no needless production abstraction, and has no deletion-only or removal-only test artifact. Stable identity checks at lines 36-98 test machine-readable contracts rather than mirroring implementation internals.

The security assertions at lines 100-105 fail the overfit criterion: they assert natural-language token order and can be satisfied by hostile token stuffing. The three passing harmful controls prove false confidence rather than merely theoretical brittleness. This violates the programming criteria for trustworthy boundary validation and creates maintenance burden. The existing code-review report explicitly performs the same skill-perspective check, but it is stale, remains `FAIL`, and its central overfit finding is independently reproduced here.

## Checked artifact paths

- `.omo/drafts/hoseo-data-analysis-cloud-platform-course.md`
- `.omo/plans/hoseo-data-analysis-cloud-platform-course.md`
- `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/corrupt-syllabus.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-validation.log`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-syllabus.html`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-render.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-protected-sha256.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-adversarial-matrix.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-adversarial-verify.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course-code-review.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/F4-scope-fidelity.md`
- `.omo/start-work/ledger.jsonl`

## Exact evidence gaps

1. No current-hash code-review report exists for syllabus `d062c742...` and checker `b5923d58...`.
2. No current-hash replacement for the stale Task 8 adversarial receipt exists.
3. No notepad path or notepad artifact was supplied.
4. No negative control demonstrates rejection of token-preserving security polarity reversals; fresh controls demonstrate the opposite.

## Cleanup receipt

All malformed, active-content, prompt-injection, and overfit controls were created only inside two `Dir.mktmpdir` blocks (`hoseo-final-security-*` and `hoseo-security-overfit-*`). Both paths were absent after block exit. No repository fixture, server, browser context, port, process, cloud resource, Hermes state, cron state, or other external state was created or left running. One Ruby 2.6-incompatible static-scan expression failed after the first temp block had already cleaned up; it was explicitly rerun with a compatible counter and completed successfully.

## Final decision

Security gate fails because the checker can certify three harmful policy inversions and the required supporting review set is stale/incomplete. The active-content, CLI error, link, secret/PII, and execution-surface checks are green but do not override these blockers.
