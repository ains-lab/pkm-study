# Global final v4 — Security review

```yaml
recommendation: REJECT
verdict: FAIL
binary_verdict: FAIL
severity: HIGH
review_commit_sha: 8857bdd924bc0e155b7dd64a8a471692b7b7ab85
target: output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
target_sha256: 65ed06d96716202509679a3a3ef57c4a0d446c2bb77998a454ed2885d2123d66
checker: .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb
checker_sha256: 487470cea93eeb62ca199216f4db0385a3816a40428d725f5a9f419a9520f5ba
harness: .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb
harness_sha256: ba031c00f4382d0e78408a0e1a9e17c410b561fae18e9b6afcbebabde5258dab
review_scope: exact current syllabus/checker/harness; review-work Security lane executed inline without subagents
```

## Original intent

The user requested a safe Korean 15-week HoSeo University syllabus covering NCP, Hermes Agent, public CTI, LLM Wiki, Understand Anything, and source-checked graph analysis. The plan prohibits credentials/PII, malware execution, exploit proof-of-concepts, active scanning, automatic response, untrusted-content execution, live verification-time external mutation, graph-hypothesis promotion, and partial/stale UA success.

## Desired outcome

The exact syllabus should communicate those rules without contradiction. Its local checker should fail closed for malformed input, unsafe typed policy values, ambiguous contract cardinality, raw or encoded renderer-active content, and misleading success, while having no network, shell, cloud, Hermes, cron, UA-generation, secret, or data-exposure surface.

## User-outcome review

The exact target prose at the assigned hash passes manual security review. It uses only public CTI, prohibits offensive and automatic-response activities, excludes credentials from prompt/config/stdout/log/history, treats untrusted source/LLM/graph text as inert data, keeps graph relations hypothetical until source validation, rejects partial/stale UA, provides accessible materials, requires full NCP teardown, and constrains Hermes/NVD safely. All 20 Markdown destinations are HTTPS; the current target has no raw HTML, executable scheme, URL userinfo, secret, or PII finding. Fresh Pandoc rendering contains zero active-content matches.

The checker intentionally says `prose_semantics=REVIEWED_EXTERNALLY`. This exact-hash review is the authority for the current Korean prose; the checker is not rejected for lacking generic Korean semantic inference. It is rejected because four machine-bound security controls fail under concrete adversarial inputs.

## Blocking findings

### HIGH — control-obfuscated executable Markdown links bypass the active-content gate

`syllabus_check.rb:28-53` reaches a CGI-decoding fixed point, then matches literal `javascript\s*:`/`vbscript\s*:`. It does not remove ASCII tab, LF, or CR *inside* a URI scheme, and Ruby CGI does not decode the HTML5 named references `&Tab;` and `&NewLine;`.

Six isolated non-noop Markdown-link mutations all exited `0`, emitted the normal 169-byte PASS line, and had empty stderr:

| Mutation | Checker | Pandoc/URL observation |
| --- | --- | --- |
| `[x](java&#x09;script:alert(1))` | false accept | `href` contains a tab; removing tab yields `javascript:alert(1)` |
| `[x](java&#x0a;script:alert(1))` | false accept | `href` contains LF; removing LF yields `javascript:alert(1)` |
| `[x](java&Tab;script:alert(1))` | false accept | Pandoc emits a tab-bearing `href` |
| `[x](java&NewLine;script:alert(1))` | false accept | Pandoc emits an LF-bearing `href` |
| `[x](ja&#x0d;vascript:alert(1))` | false accept | `href` contains CR; URL normalization yields the `javascript:` scheme |
| `[x](jav&#x09;ascript:alert(1))` | false accept | alternate in-word tab position still normalizes to `javascript:` |

Node's URL parser resolves `java\tscript:`, `java\nscript:`, and `ja\rvascript:` to protocol `javascript:`. A rendered syllabus can therefore carry an active link while the security checker prints full success. This is the same adversarial class as the prior entity-URI HIGH finding, not a prose-semantics issue.

**Remediation:** parse and canonicalize every Markdown destination after HTML5 entity decoding; remove URL-Standard ASCII tab/LF/CR within the candidate before checking dangerous schemes. Keep the document-wide raw-HTML rejection. Add retained controls for numeric and named tab/LF/CR obfuscations, including nested entity forms.

### HIGH — YAML source cardinality can hide contradictory policy while `machine_contract=PASS`

`YAML.safe_load` at `syllabus_check.rb:109` normalizes a mapping before `actual.keys.sort` is checked at lines 134-143. It does not reject duplicate mapping keys. Both controls below exited `0` with the ordinary success line:

```yaml
contract_version: "9.9"
contract_version: "1.0"
```

```yaml
malware_execution: true
malware_execution: false
```

The last value satisfies Ruby's expected hash, while the source remains ambiguous and contains a contradictory unsafe declaration. A second YAML document appended inside the sole fence also passed; `YAML.load_stream` counted two documents while `safe_load` compared only the first. In addition, the document-wide scan misses GFM-valid three-space-indented and tilde YAML fences. Pandoc recognizes each appended block as a second YAML code block, while the checker emits normal success. Other consumers can therefore observe a materially different contract from the one checked.

**Remediation:** parse exactly one YAML stream document; reject duplicate scalar keys at every mapping node before `safe_load`; and count the actual GFM fence surface, including up-to-three-space indentation and tilde fences. Add duplicate-key, multi-document, indented-fence, and tilde-fence controls.

### MEDIUM — source-size limit can be bypassed by shrinking entity input

The checker performs `File.binread` without a pre-read size policy and checks only the next decoded buffer (`syllabus_check.rb:12-13,28-42`). Prepending `&amp;` 200,001 times created a 1,037,289-byte document, above the configured 1,000,000-byte boundary; the first decode shrank it to 237,285 bytes, and the checker exited `0` with normal success.

**Remediation:** bound the source file before reading/decoding (`File.size` plus a post-read race-safe length check) and keep the round bound. If decoded-size growth is separately relevant, document that invariant and test both source and decoded limits. Add the shrinking-entity case to the retained harness.

### MEDIUM — a non-string YAML key escapes the bounded error channel

Adding root key `1: unexpected` reaches `actual.keys.sort` at `syllabus_check.rb:138`. The process exits nonzero, but stderr is a 470-byte `ArgumentError` stack trace rather than bounded `FAIL:`-only output. This leaks implementation detail and proves that the YAML boundary is only partially parsed before interior operations.

**Remediation:** verify every mapping key is a string before sorting/recursing and convert this expected boundary failure into the stable `FAIL:` diagnostic path. Retain a black-box channel assertion for numeric and collection keys.

## Passing security evidence

- Exact HEAD/target/checker/harness hashes matched before and after QA.
- Both Ruby files pass `ruby -w -c`; AST parsing succeeds and contains zero xstring literal.
- The exact target and three repeated valid runs return one identical success line with empty stderr.
- The retained harness reports `38/38`, with 10 accepted and 28 rejected distinct bodies; it is incomplete for the findings above.
- Raw `<script>`, raw `iframe srcdoc`, literal JavaScript/data-HTML Markdown URIs, ordinary entity-encoded JavaScript/data-HTML URIs, and nested active entities at depths 1, 5, and 63 reject.
- Depths 64 and 65 reject with `encoded content exceeds safe decoding bound`.
- Simple unsafe YAML values, unknown keys, ordinary unindented extra backtick fences/headings, aliases, and custom Ruby tags reject with `FAIL:` diagnostics and no traceback.
- Missing path, invalid UTF-8, truncation, and malformed YAML fail closed with empty stdout and `FAIL:`-only stderr.
- Target/checker/harness and the final target plus 86 course-evidence files (87 files total) have zero findings in 11 redacted secret/PII categories: private keys, GitHub/AWS/OpenAI keys, bearer tokens, JWTs, URL credentials, secret assignments, email, Korean RRN, and Korean mobile numbers.
- The checker uses only `cgi` and `yaml`, reads one file, and has no write, eval/xstring, process, network, cloud, Hermes, cron, browser, or UA-generation call. The harness writes only its `Dir.mktmpdir` fixtures and invokes the pinned checker through `Open3.capture3`.
- No new dependency or supply-chain surface was added.

## Review-work Security checklist

| Area | Verdict | Evidence |
| --- | --- | --- |
| Input validation / XSS | **FAIL HIGH** | control-obfuscated `javascript:` links accepted and render active |
| Auth/AuthZ | N/A | local read-only CLI; no privileged action or user identity surface |
| Secrets/credentials | PASS | redacted scans all zero; exact prose forbids collection/exposure |
| Data exposure / PII | PASS | checker emits only bounded diagnostics/counts and no file body/path on boundary errors |
| Dependencies | PASS | Ruby stdlib `cgi`/`yaml`; no new package or lockfile |
| Cryptography | N/A | no cryptographic implementation; SHA is syllabus evidence prose only |
| File/path | **FAIL MEDIUM** | unbounded `File.binread`; encoded source over configured limit accepted; no content disclosure observed |
| Network | N/A/PASS | no network API, CORS, TLS, listener, or external service in executable surface |
| Error leakage | **FAIL MEDIUM** | common failures are clean, but a non-string YAML key emits an `ArgumentError` traceback |
| Supply chain | PASS | no dependency change, dynamic require/load, shell installer, or fetched executable |
| Contract ambiguity | **FAIL HIGH** | duplicate YAML key shadowing accepted as typed PASS |

## Manual-QA matrix

| Scenario | Expected | Actual | Verdict |
| --- | --- | --- | --- |
| Valid target | one clean PASS | exit `0`, stdout 169, stderr 0 | PASS |
| Retained harness | 38 distinct declared results | all 38 pass | PASS but insufficient |
| Benign `&#169;` | accept | accepted | PASS |
| Raw script / `srcdoc` | reject | both reject | PASS |
| Literal and ordinary entity JavaScript/data URI | reject | four reject | PASS |
| Active entity depths 1/5/63 | reject active | all reject | PASS |
| Active entity depths 64/65 | fail closed | both reject at bound | PASS |
| Remaining decoded body over 1,000,000 bytes | reject | rejected | PASS |
| Encoded source over 1,000,000 that shrinks | reject | **accepted** | FAIL |
| Numeric tab/LF JavaScript | reject | **both accepted** | FAIL |
| HTML5 named tab/LF JavaScript | reject | **both accepted** | FAIL |
| Numeric CR / alternate in-word tab JavaScript | reject | **both accepted** | FAIL |
| Unsafe YAML boolean/string/unknown key | reject | reject | PASS |
| Extra YAML fence/heading | reject | reject | PASS |
| YAML alias/custom object | reject safely | reject safely | PASS |
| Duplicate YAML key shadowing | reject | **two accepted** | FAIL |
| Second YAML document / indented fence / tilde fence | reject | **three accepted** | FAIL |
| Malformed path/bytes/YAML syntax/truncation | bounded reject | reject, no trace | PASS |
| Non-string YAML root key | bounded reject | nonzero with traceback | FAIL |
| Prompt-like comment | inert data | accepted; no marker/action | PASS |

## ULTRAQA

| Class | Verdict | Evidence |
| --- | --- | --- |
| malformed | **FAIL** | common cases are bounded; non-string YAML key escapes with traceback |
| active content | **FAIL** | six control/named-entity scheme bypasses produce full success |
| prompt injection | PASS for execution safety | inert comment causes no command, network call, marker, or state change |
| stale | PASS | exact hashes rechecked before/after; historical success prose not trusted |
| dirty worktree | PASS with scope attribution | protected `142/142`, target sole protected addition, no removed baseline line, staged 0 |
| misleading PASS | **FAIL** | 12 independent unsafe/ambiguous/oversize cases print the normal success summary |
| interruption | PASS | two harness runs terminated by signal 15; clean rerun succeeds with exact count and no residue |
| hung | N/A | no hang observed; all commands finite/local |
| flaky | N/A | no flake observed; valid-run output shape was identical across three runs |

## Scope/mutation final snapshot

The paired F4 report contains the full protected/status explanation. At report finalization the exact post-baseline inventory was:

```text
post_baseline_files=93 classified=93 unexpected=0
course_evidence=86 root_evidence=2 course_orchestration=2
executor_orchestration=1 product=1 editor_volatile=1
protected_expected=142 protected_current=142 missing=0 added=0 mismatches=0
scope_total=143 sole_protected_scope_addition=output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
status_baseline=51 status_current=53 removed=0 added=2 staged=0
```

The extra `.omo/lazycodex-executor-verify/` status line is a 15-byte session-attempt counter whose UUID matches the course session ID; it predates this lane and is classified as course orchestration. No protected or unrelated product file was added, removed, normalized, staged, or reverted.

Course-ledger scan: 29 rows, 72 command descriptions, and zero mutation signatures for NCP, Hermes, cron, UA generation, mutating HTTP, or git stage/commit. This is an attribution result, not a remote audit.

## Direct `remove-ai-slops` and `programming` review

The production checker and harness are under 250 pure LOC, single-purpose, dependency-light, and free of broad rescue, dead wrappers, needless abstraction, whole-prose snapshots, deletion-only tests, tautological tests, and duplicate mutant bodies. Safe paraphrase controls test absence of a prose oracle rather than pinning desired Korean sentences. The exact target is prose, so its meaning is reviewed manually rather than asserted through a generic language regex.

The unresolved slop is false-confidence coverage and ineffective boundary code: the harness omits URL canonicalization, duplicate YAML key, and shrinking-oversize cases, while the ordinary `38/38` PASS is cited as if it proves those classes. The post-decode-only size check and reliance on CGI's non-HTML5 entity set create maintenance burden and a misleading security claim. Under the programming perspective, trust-boundary parsing is incomplete and fail-open.

The exact-current-hash `global-final-v4/code-quality-review.md` explicitly performs both skill perspectives and returns `FAIL`. It independently reproduces duplicate YAML keys, multi-document streams, alternate GFM fences, and the non-string-key traceback, and it identifies additional remaining prose predicates. Its coverage supports this direct pass but is not substituted for it. This report does not depend on a future lane or notepad.

## Checked artifact paths

- `.omo/plans/hoseo-data-analysis-cloud-platform-course.md`
- `.omo/drafts/hoseo-data-analysis-cloud-platform-course.md`
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
- in-memory Pandoc target/mutant render surfaces, Node URL normalization, redacted secret scan, status/staging/diff data, and isolated CLI mutation outputs

## Exact evidence gaps

1. No retained control covers numeric or HTML5 named ASCII whitespace inside an executable URI scheme.
2. No retained control rejects duplicate YAML keys, a second YAML stream document, alternate GFM YAML fences, or non-string keys.
3. No retained control rejects an oversized encoded source that shrinks below the post-decode check.
4. The neighboring QA PASS is contradicted by the direct false-success matrix; the current debugging report independently confirms the oversize case.
5. The exact-current-hash code-quality report has the required skill coverage and is `FAIL`; its supported findings remain unresolved.
6. No remote NCP/Hermes/cron control-plane inspection was performed; task-attributable mutation evidence is clean.

## Cleanup receipt

All custom inputs used exact temporary roots and were removed. Two interrupted harness runs left zero new harness directory. Prompt marker, mutation/render file, task Ruby process, task listening port, and staged path counts are zero. No server, browser, container, cloud resource, external credential, NCP/Hermes/cron/UA action, or repository file other than the two requested reports was created or changed by this lane.

## Final decision

**FAIL — HIGH.** The exact syllabus prose is safe, but the pinned validator can certify renderer-active executable links and ambiguous unsafe YAML, and it does not enforce its stated encoded-source size boundary.
