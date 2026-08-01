# Global final v3 security review

```yaml
recommendation: REJECT
verdict: FAIL
severity: HIGH
review_commit_sha: 8857bdd924bc0e155b7dd64a8a471692b7b7ab85
target: output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
target_sha256: 75df0f2733c5bf898b78ee531cbc13700aafcc359b4f7ea15d3a0c296d2c1e51
checker: .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb
checker_sha256: efab908d52db0049be5d7f1afaf7d78f814bbd9dc9360fe802c1577cfe2041cd
review_scope: exact current syllabus and checker; read-only security lane
```

## Original intent and desired outcome

The user asked for one Korean 15-week HoSeo University syllabus that teaches NCP, safe Hermes automation, public-data-only CTI, LLM Wiki, UA, and source-checked graph analysis. The plan excludes credentials/PII, offensive activity, automatic response, live external mutation during verification, graph-hypothesis promotion, and partial/stale UA success.

The expected security outcome is a safe syllabus plus a local, read-only checker that fails closed for malformed input, unsafe typed policy values, active HTML/execution URIs, and misleading safety polarity while never provisioning cloud resources or invoking Hermes, cron, UA, or external APIs.

## User-outcome review

The exact current syllabus is safe as written. Its visible policy prohibits credential collection and offensive activity, treats untrusted content as data-only, keeps graph relations hypothetical until source verification, provides accessibility materials, rejects partial/stale UA, constrains Hermes to approval/allowlist/one gateway/local-only, and bounds NVD retries while preserving last-good state. Its 20 Markdown destinations are all `https`, with zero executable schemes or URL-embedded credentials.

The shipped checker does not safely certify that outcome. It prints the complete success line for browser-active content hidden behind HTML character references and for six harmful Korean security-policy rewrites outside its finite regex vocabulary. These are release-blocking false negatives on the plan's explicit safety boundary.

## Blocking findings

### HIGH — entity-encoded active content bypasses the document-wide gate

The active-content expression at `syllabus_check.rb:37` scans the undecoded Markdown bytes for literal `<script`, event attributes, `javascript:`, `vbscript:`, and `data:text/html`. Three isolated mutations that a renderer/browser decodes all exited `0` with the full checker success line:

| Mutation | Expected | Actual | Observable |
|---|---:|---:|---|
| Raw HTML link whose scheme is `java&#x73;cript:` | 1 | 0 | Full `PASS headings=10 ... contract=PASS` |
| `iframe srcdoc` whose script delimiters are `&lt;` / `&gt;` | 1 | 0 | Full checker PASS |
| Raw HTML link whose scheme is `data&#x3a;text/html` and payload contains entity-encoded script | 1 | 0 | Full checker PASS |

Pandoc rendered the combined control with exit `0` and retained both the encoded URI and `srcdoc`. Ruby stdlib HTML decoding of that rendered surface produced both `javascript:alert(1)` and `<script>alert(1)</script>`. A harmful syllabus mutation can therefore pass the security checker and become active when rendered to HTML.

Remediation: fail closed on raw active HTML, decode HTML character references before checking schemes/tags, and add persistent negative controls for entity-encoded `javascript`, `data:text/html`, and `srcdoc` script. Since the deliverable requires inert Markdown and currently needs no raw HTML elements, rejecting raw HTML elements is safer than maintaining a partial dangerous-tag list.

### HIGH — security prose checks remain implementation-mirroring and overfit

The scoped prose guards at `syllabus_check.rb:167-180` enumerate particular Korean words and short word-order windows. The named v3 regression phrases now fail, but equivalent harmful meanings that use other ordinary Korean wording all exit `0` with the full checker PASS:

| Mutation | Expected | Actual |
|---|---:|---:|
| Offensive classes stay labelled prohibited but are actually tried during instruction | 1 | 0 |
| Untrusted material stays labelled data-only but its directions are followed | 1 | 0 |
| The policy says credentials are excluded, then copies a secret token into the chat input | 1 | 0 |
| A graph relation is called a hypothesis, then adopted without verification | 1 | 0 |
| Captions/transcripts are said to be provided but are unusable by students | 1 | 0 |
| Partial/stale UA is documented as nonzero rejection but is passed regardless of the result | 1 | 0 |

The typed YAML contract is a sound stable boundary, but it does not prevent visible Korean prose from contradicting the unchanged YAML. The regex tests mirror the currently known attack sentences and create false confidence rather than semantic assurance.

Remediation: do not present natural-language regex matching as proof of policy meaning. Keep machine enforcement on structured typed fields/IDs, move any additional security policy needed by automation into a structured table or contract, and make an exact-hash semantic security review the authority for open Korean prose. Remove or narrow implementation-mirroring prose tests instead of extending the synonym list. The direct `remove-ai-slops`/`programming` pass rejects the current shape because the six controls above prove false confidence.

## Passing security evidence

- Ruby syntax exit `0`; exact target exit `0`; persisted 78-case regression harness exit `0`.
- Direct `<script>`, literal `javascript:`, and ordinary event-handler HTML each exit `1` with `FAIL: active script or executable URI is forbidden`.
- Unsafe YAML mutations for accessibility, untrusted execution, credential prompt, offensive malware permission, graph fact promotion, UA accept/exit, Hermes separate approval/allowlist/delivery, and NVD retry/last-good all exit `1` with their exact typed-contract path.
- The requested direct prose controls for credential insertion, offensive permission, graph fact promotion, partial/stale zero success, and untrusted command execution each exit `1` with a specific contradiction diagnostic.
- Independent YAML parsing confirms: accessibility all `true`; offensive all `false`; untrusted execution `false`; credentials prompt/log/history `false`; graph fact `false`; UA accept `false` with `nonzero`; Hermes approval `true`, allowlist `true`, gateway `1`, delivery `local-only`, outputs `wakeAgent/reason/changedPaths`; NVD interval `6`, retries `3`, state `deferred_rate_limited`, preserve-last-good `true`.
- Secret/PII scan over the target, checker, and regression harness found zero private-key blocks, known token prefixes, bearer values, JWTs, assigned secrets, URL credentials, Korean resident-registration numbers, or email addresses. Candidate values were never printed.
- Ruby AST parses. The checker has one `File.binread`, zero file-write, shell/eval/process-spawn, or network calls, and only the stdlib `yaml` require. There is no cloud, Hermes, cron, browser, UA, or dependency/supply-chain execution surface.
- Missing path, invalid UTF-8, and malformed YAML each exit `1` with a stable specific diagnostic and no backtrace or source disclosure.
- An inert prompt-injection comment exits `0` but creates no requested marker. This is correct data-only behavior, not prompt-injection detection coverage.

## Manual QA mutation matrix

All mutations were written only inside `Dir.mktmpdir` directories and invoked the production checker as a separate Ruby process.

| Case | Exit | Specific observable |
|---|---:|---|
| valid target | 0 | full contract PASS |
| persisted regression harness | 0 | all 78 expected exits matched |
| script / literal JavaScript URI / event handler | 1 / 1 / 1 | active-content diagnostic |
| YAML accessibility false | 1 | `contract root.accessibility.captions value/type mismatch` |
| YAML untrusted execution true | 1 | `contract root.untrusted_external.execution value/type mismatch` |
| YAML credential prompt true | 1 | `contract root.credentials.prompt value/type mismatch` |
| YAML offensive malware true | 1 | `contract root.offensive.malware_execution value/type mismatch` |
| YAML graph fact true | 1 | `contract root.graph.inferred_relation.fact value/type mismatch` |
| YAML UA accept true / exit zero | 1 / 1 | named UA value/type mismatch |
| YAML Hermes approval false / allowlist false / public delivery | 1 / 1 / 1 | named Hermes value/type mismatch |
| YAML NVD retries four / preserve-last-good false | 1 / 1 | named NVD value/type mismatch |
| requested credential/offensive/graph/UA/untrusted prose regressions | 1 / 1 / 1 / 1 / 1 | specific contradiction diagnostics |
| entity-encoded JavaScript / srcdoc script / data HTML | 0 / 0 / 0 | **unexpected full success** |
| six semantic synonym policy inversions | 0 / 0 / 0 / 0 / 0 / 0 | **unexpected full success** |

## ULTRAQA

| Class | Verdict | Evidence |
|---|---|---|
| malformed input | PASS | Missing path, invalid UTF-8, and invalid YAML all fail closed with stable diagnostics. |
| prompt injection | PASS | Passive instruction text remains inert; exit `0`, marker absent, and checker has no execution/network surface. |
| stale state | PASS | Target/checker hashes equal the assigned pair; current `task-8-adversarial-verify-v5.md` and `F3-scenario-audit-v3.md` bind to the same pair. |
| dirty worktree | PASS (scoped) | Existing worktree had 52 status lines; staged paths remained `0`; exact target/checker hashes stayed unchanged. No unrelated file was normalized or reverted. |
| misleading success | **FAIL** | Nine harmful active-content/semantic controls emitted the full success line. |
| repeated interruption | PASS | Two fresh checker processes received SIGINT and terminated by signal 2; the subsequent exact-target run exited `0` with the unchanged PASS line and hashes. No partial state exists. |
| hung/long command | N/A | No hang or unbounded external operation was triggered; checker and harness completed locally. |
| flaky | N/A | No flaky behavior was triggered. |
| cancel/resume | N/A | The checker has no resumable job, checkpoint, transaction, or external state. Repeated process interruption is covered separately. |

## Remove-AI-slops and programming pass

The checker is 188 pure LOC and the regression harness 120 pure LOC; neither is oversized. The checker has one responsibility, no new dependency, no deletion-only test, and no unnecessary production extraction. Typed YAML parsing, exact structural identities, and error-boundary handling are appropriate.

The prose-polarity tests are unresolved implementation-mirroring slop: they pin individual harmful sentences and encourage adding more regex vocabulary, while six equivalent controls pass. The active-content tests similarly cover literal tokens but omit renderer-equivalent entity encodings. This creates maintenance burden and false security assurance. The earlier code-review report explicitly applies the same skills perspective, but it is bound to older hashes; this lane's decision rests on the fresh exact-hash reproductions above.

## Checked artifact paths

- `.omo/plans/hoseo-data-analysis-cloud-platform-course.md`
- `.omo/drafts/hoseo-data-analysis-cloud-platform-course.md`
- `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.log`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-adversarial-matrix.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-adversarial-verify-v5.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-yaml-contract-repair.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/F3-scenario-audit-v3.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/final-gate/security-review.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course-code-review.md`

## Cleanup and external-state receipt

All security, malformed-input, prompt-injection, semantic-overfit, and active-content copies were automatically removed; each temp path was explicitly absent after its `Dir.mktmpdir` block. No transient log or render file was persisted. The prompt-injection marker was absent. Final process inspection found no checker/regression/temp-name PID and zero Ruby listening sockets. Staged paths remained zero. Target and checker hashes remained exactly `75df0f...` and `efab908d...`. No network request, NCP/Hermes/cron/UA action, port, browser session, or other external operation was performed.

## Final decision

**FAIL — HIGH.** The exact syllabus text is safe, but its checker can certify browser-active encoded payloads and materially unsafe policy rewrites. The literal active-content gate and finite security-prose regexes must be replaced with fail-closed structured/canonical checks before security approval.
