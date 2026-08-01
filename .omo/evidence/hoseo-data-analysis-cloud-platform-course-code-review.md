# Hoseo syllabus code/document quality review

- Verdict: **FAIL**
- Confidence: **0.99**
- `codeQualityStatus`: **BLOCK**
- `recommendation`: **REQUEST_CHANGES**
- Build: `8857bdd924bc0e155b7dd64a8a471692b7b7ab85`
- Syllabus SHA-256: `b87d72f0227c1e59d33e13e6db011d132156644eb8536f4dcb6c2036e3d41210`
- Checker SHA-256: `4eb64f0ee5acb571547e07b9431d30bdff0fe14af8f5306fd3a72960b075ee16`

## Scope and evidence inspected

The review read the complete syllabus, checker, plan, `AGENTS.md`, Task 8 validation transcript, adversarial matrix and receipt, protected-state receipt, and neighboring F1/F2 review conventions. The two reviewed targets are untracked relative to the single initial repository commit, so there is no `HEAD^` diff; their complete current bodies were reviewed as added-file content. No notepad path was supplied or found. That absence did not prevent direct review because the plan and named evidence artifacts were available.

Fresh checks reproduced the declared target hashes, Ruby syntax success, the real-syllabus `PASS`, and the retained corrupt-copy nonzero exit. All additional mutants below were generated in memory and passed to the checker over `/dev/stdin`; no review fixture was persisted.

## Skill-perspective check

The `omo:remove-ai-slops` and `omo:programming` skills were read and applied before judging maintainability and test relevance. The diff violates both perspectives: the checker contains prose-token assertions that mirror requested words rather than observable semantics, accepts token-stuffed nonsense, rejects a meaning-preserving Korean paraphrase, and omits negative controls for collection identity. This creates maintenance burden and false confidence. The 120-pure-LOC checker is not oversized, has a single broad responsibility, and does not introduce needless abstractions; the violations are test shape and boundary/error handling.

## Findings

### CRITICAL

None.

### HIGH / MAJOR

#### 1. Collection checks do not enforce uniqueness or the required identities

- File/lines: `.omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb:18-21`, `:45-48`, `:61-64`, `:82-84`
- Current: week rows and grading rows are collapsed into hashes, silently overwriting duplicate keys. Milestones and fallback tracks are checked only by row count, not by the exact ID set. Fresh in-memory controls all exited `0`: duplicate week 1; duplicate attendance; remove M7 and duplicate M1; remove `graph analysis` and duplicate NCP. Each violates an explicit course contract while the checker prints the full success line.
- Suggestion: retain parsed rows as arrays long enough to assert exact multiplicity, then require `1..15`, `출석/중간고사/기말고사`, `M1..M7`, and the six named fallback tracks each exactly once before building lookup maps. Add persistent negative controls for every duplicate/missing-identity class.

#### 2. The claimed semantic checks are brittle keyword buckets and can produce both false positives and false negatives

- File/lines: `.omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb:27-35`, `:66-79`, `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-validation.log:47-67`, `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-adversarial-matrix.md:5-10`
- Current: the fixed-topic dictionary requires incidental English spellings inside Korean prose. Replacing `cloud·NCP networking` with the meaning-preserving `클라우드·NCP 네트워크` exits `1`. Conversely, replacing M1's six semantic cells with `PASS fixture`, `오류`, `JSON report`, `fixture 불가`, `secret 없음`, and `LO1 출석` exits `0`. The retained adversarial evidence therefore does not establish semantic robustness or protection against misleading success.
- Suggestion: do not test natural-language meaning through implementation-mirroring token lists. Keep executable checks to stable machine-consumed structure and identifiers, and review prose semantically. If topic semantics must be automated, introduce explicit stable topic/evidence IDs in a machine-readable contract and test those IDs. Add a token-stuffing false-positive control and meaning-preserving Korean paraphrase controls.

### MEDIUM / MINOR

#### 3. Invalid paths and invalid UTF-8 produce raw Ruby backtraces instead of stable diagnostics

- File/lines: `.omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb:2-3`, `:12-13`
- Current: heading regexes run before `text.valid_encoding?` is checked. Invalid UTF-8 exits with `ArgumentError: invalid byte sequence in UTF-8`; a missing path exits with an uncaught `Errno::ENOENT` backtrace. Both are nonzero, but neither honors the checker's `FAIL: ...` error-reporting convention.
- Suggestion: validate encoding before any regex/string traversal and handle expected file-boundary errors at the CLI boundary, emitting one concise stable diagnostic and exit `1` without a backtrace.

#### 4. LO1's formal wording overstates what an approved Linux fallback can demonstrate

- File/lines: `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md:36`, contrasted with `:139`
- Current: LO1 grammatically requires an “NCP 또는 승인된 Linux 대체 환경” to configure and validate VPC/subnet, ACG, public IP, cost alert, and teardown evidence. The fallback matrix correctly says the Linux/fixture path loses actual provisioning, public connectivity, alert, and release capability. The formal outcome is therefore broader than the honest fallback assessment route.
- Suggestion: split the observable behavior: configure the controls on live NCP, or validate the same design/teardown evidence from the approved fixture while explicitly not claiming provisioning.

#### 5. The 11-column weekly table is difficult to use at ordinary document widths

- File/lines: `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md:86-102`
- Current: weekly data rows are approximately 419-574 characters, and the document has 49 lines over 240 characters. The retained terminal proof renders at 400 columns, which does not test common 120-160-column viewing. The content is complete, but students and instructors must scan dense wrapped cells containing repeated fallback/safety/rubric phrases.
- Suggestion: keep the required 11 fields but shorten cells through M1-M7 and policy references, then add a normal-width render check. Avoid deleting required evidence fields.

### LOW / NITPICK

#### 6. Operational claims are traceable but their citations are distant

- File/lines: `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md:91`, `:172`, with source rows at `:185`, `:187`
- Current: Hermes approval/cron defaults and NVD retry behavior are sourced only through the consolidated final ledger. This is valid but makes claim-to-source tracing slower in a dense teaching document.
- Suggestion: add compact footnote markers or short source labels at the operational clauses while retaining the final ledger as the bibliography.

## Blocking issues

1. Enforce exact identity and multiplicity for weeks, weighted categories, milestones, and fallback tracks, with negative controls that prove each duplicate/missing case fails.
2. Replace or remove prose-token “semantic” assertions so token-stuffed nonsense fails and meaning-preserving Korean paraphrases do not fail merely because English constants changed.

The syllabus content is substantially complete and generally coherent, but the verification artifact currently emits misleading success for core contract violations. Approval is blocked until both HIGH/MAJOR findings are corrected and independently rerun.
