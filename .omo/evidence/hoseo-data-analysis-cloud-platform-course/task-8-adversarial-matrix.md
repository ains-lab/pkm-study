# Todo 8 adversarial matrix — stable contracts

| Class | Real probe / observable | Verdict |
|---|---|---|
| malformed input | Corrupt copy, duplicate week/weight/M1/fallback, missing path, and invalid UTF-8 all invoke the checker and exit 1 with `FAIL:` diagnostics. | PASS |
| stable-ID stuffing | Replacing all 49 `M#-*` IDs with a generic token exits 1; a Korean topic paraphrase that retains the W-ID exits 0. | PASS |
| stale state | Converting the M6 partial/stale rejection and nonzero validator into success/zero exits 1. | PASS |
| polarity inversions | Removing captions/transcript alternatives, prohibiting wording, or data-only/no-execution wording exits 1. | PASS |
| active content | `<script>`, event-handler HTML, `javascript:`, and `data:text/html` controls each exit 1; generated Pandoc HTML has active count 0. | PASS |
| carry-through omission | Each Hermes/NVD/schema contract omission (`messaging/browser` through `fixture_release`) exits 1. | PASS |
| dirty worktree | Fresh baseline recomputation: 142 protected paths, 0 hash mismatches; only the syllabus adds to the baseline scope. | PASS |
| misleading success | The valid target has checker PASS, while every applicable harmful mutant fails; Pandoc and two Glow widths render the same target. | PASS |
| prompt injection | Checker has no command, network, eval, or document-instruction execution path; its input boundary is a UTF-8 file read. | PASS |
| cancel/resume, hangs, flaky work | No task starts a remote job, long-running service, browser, or mutable external integration; all tests are bounded local deterministic operations. | N/A |

Cleanup: control copies used `Dir.mktmpdir` and were removed; no QA runtime resources were created.

## Stable-contract repair extension

| Class | Persistent harness control | Verdict |
|---|---|---|
| complete vulnerability schema | Each of the 13 required `vulnerability` row fields, including `description`, `kev_date_added`, and `kev_due_date`, is removed independently. | PASS: all exit 1 |
| scoped operations | Week 4 `headless`, week 7 `changedPaths`, NVD `Retry-After`, and each raw-manifest field are removed only at their defining row/paragraph. | PASS: all exit 1 |
| meaningful stable cells | M1 with correct IDs but gibberish, all ID-only cells, and M1 token stuffing are rejected. | PASS: all exit 1 |
| fallback limits | Each of the six fallback rows is replaced with nonempty gibberish while retaining its track identity. | PASS: all exit 1 |
| polarity and graph safety | Negated M6/NVD rejection, graph-fact promotion, and token-preserving offensive/data-only/credential/accessibility inversions are rejected. | PASS: all exit 1 |
| grading integrity | A fourth weighted `과제 10%` row is rejected. | PASS: exit 1 |
| Korean paraphrases | NVD, accessibility, offensive, data-only, and credential phrases are rewritten with equivalent Korean wording while technical IDs/numbers remain. | PASS: all exit 0 |

Harness: `task-8-regression.rb`; complete fresh transcript: `task-8-regression.log`. Cleanup is automatic through `Dir.mktmpdir`.

## Second semantic-repair extension

| Class | Persistent harness control | Verdict |
|---|---|---|
| milestone token stuffing | Correct M1 IDs retain only superficial category tokens followed by nonsense. | PASS: exits 1; each cell also requires category-specific context |
| fallback token stuffing | Hermes retains the live-track keywords but replaces every other contract cell with nonsense. | PASS: exits 1; each fallback column has a concrete semantic family |
| M6 misleading success | `partial/stale/duplicate/dangling` remains visible but the text records a zero return. | PASS: exits 1 |
| graph fact promotion | `relation`, `원문`, and `가설` remain visible while the sentence says it is treated as true. | PASS: exits 1 |
| data-only execution | The policy preserves `data-only` and `실행 금지` tokens but proceeds to execute a command. | PASS: exits 1 |
| accessibility denial | The policy claims captions/transcript provision but explicitly withholds delivery from students. | PASS: exits 1 |
| offensive execution | The policy says a prohibition label is attached while the exercise executes the activity. | PASS: exits 1 |
| credential transfer | The policy says credentials are not inserted, then transfers an API key into the prompt. | PASS: exits 1 |
| semantic positive control | Equivalent Korean NVD, accessibility, offensive-safety, data-only, and credential prohibitions keep the technical contract. | PASS: all exit 0 |

Current transcript: 57 controls, all PASS. This local matrix is not an independent review; a new verifier must test checker SHA `f16029dbf2aaf00f0f06c6d9e76f8bac76d95321b2f3c2952365f30f98807a7f`.

## Canonical-contract repair extension

| Class | Persistent control | Verdict |
|---|---|---|
| v3 token-preserving inversions | The seven exact independent v3 M1/M6/graph/data-only/accessibility/offensive/credential mutations are named `v3-*`. | PASS: each exits 1 |
| milestone contract completeness | Each of 49 M1–M7 evidence cells is individually replaced. | PASS: each exits 1 with a named canonical-cell mismatch |
| fallback contract completeness | Each of 36 fallback description cells is individually replaced. | PASS: each exits 1 with a named canonical-cell mismatch |
| carry/policy completeness | Hermes, NVD, UA, seven-policy coverage, and weeks 4/7 each receive a whole-line/row mutation. | PASS: each exits 1 |
| malformed, corrupt, missing, invalid UTF-8 | Real checker process sees each input boundary. | PASS: corrupt/missing/invalid exit 1; valid exits 0 |

Current harness: 153 controls, all PASS. Exact approved output contracts are explicit maps/arrays in the checker; no whole-file hash and no open-ended Korean semantic classifier is used. Fresh independent verification is required for checker SHA `de2cd490ff6f38289e25162ba68be640646682c80676c57854f6c5623e8f8241`.

## YAML-contract migration

| Class | Persistent probe / observable | Verdict |
|---|---|---|
| typed contract tamper | 14 isolated YAML omissions/value/type changes, including UA, graph, accessibility, offensive, untrusted, credential, Hermes, NVD, milestone, and fallback paths. | PASS: all exit 1 with named contract mismatch |
| semantic positive | M1, M2 fallback, accessibility, week 4, and NVD Korean/order rewrites retain stable IDs and typed values. | PASS: all exit 0 |
| direct contradiction | Result-code zero, graph fact confirmation, command execution, learner-access denial, offensive activity, and prompt-key transfer remain scoped negative probes. | PASS: all exit 1 |
| migrated prose padding | M1 padding has no reliable generic Korean semantic oracle once typed role IDs are intact; it is expected exit 0 and paired with `contract-milestone-role-omission` exit 1. | PASS: explicit migration |

Current harness: 78 controls (8 accepts, 70 rejects), all PASS. Current checker SHA is `efab908d52db0049be5d7f1afaf7d78f814bbd9dc9360fe802c1577cfe2041cd`; target SHA is `75df0f2733c5bf898b78ee531cbc13700aafcc359b4f7ea15d3a0c296d2c1e51`.

## Entity-safe machine-contract extension

| Class | Persistent real-CLI probe | Verdict |
|---|---|---|
| entity-encoded active content | Numeric/hex-decoded `javascript:`, `data:text/html`, and `iframe srcdoc` copies are passed to the checker. | PASS: each exits 1 with no stdout or traceback. |
| YAML cardinality and typed Hermes | Duplicate contract heading/fence and six new Hermes value tamper cases use the real checker process. | PASS: each exits 1. |
| exact headers and fallback binding | Duplicated assessment/milestone/fallback headers and NCP `LOST`/`CLAIM` plus `LIVE`/`FIXTURE` swaps are run on temporary copies. | PASS: each exits 1. |
| structural contracts | Duplicate week, fourth grade weight, milestone role-ID swap, raw-manifest omission, and normalized-schema omission remain real CLI negatives. | PASS: each exits 1. |
| bounded Korean prose scope | Week 4 headless, week 7 state, UA, graph relation, M1, accessibility, NVD, and offensive-policy Korean rewrites retain machine IDs/YAML but alter prose. | PASS: each exits 0; open prose semantics are an exact-hash F1/F3/security review responsibility. |
| result-channel integrity | Harness uses `Open3.capture3`; accepts require exactly one PASS line/empty stderr, rejects require nonzero/empty stdout/FAIL-only stderr/no trace. | PASS: 31 total, 9 accepts, 22 rejects, 31 distinct mutation bodies. |

Current target SHA: `65ed06d96716202509679a3a3ef57c4a0d446c2bb77998a454ed2885d2123d66`. Checker SHA: `579ecfac2a506109d44936859a2763d7df883ec83eccd3ca63a63c0510417441`. Harness SHA: `e8e43e706ab143a16bca5fdfa77d863dd052df2c9fb3edcc588462c4ad7e8725`. Cleanup is `Dir.mktmpdir` auto-removal plus verified removal of the whitespace temporary file.

Follow-up table-order RED→GREEN: a copy with exactly one of each header but the assessment/milestone headers swapped was initially accepted. `table-header-order-swap` now exits 1. Current checker SHA: `348737f9b4c08db4ff5efb4fa9f0e9a64dece56f8a91b791491acacb055b5050`; current harness SHA: `89ac7ad8dbb9a74c24a86f5131aad20ae451f59e2c0011c96d73860385ddf006`; current result: 32 total / 9 accepts / 23 rejects / 32 distinct.

## Document-wide contract-cardinality extension

| Class | Persistent real-CLI probe | Verdict |
|---|---|---|
| outside-safety contract heading | A second `### 자동 검증 계약` is appended after the final H2. | PASS: exit 1, empty stdout, FAIL-only stderr. |
| outside-safety YAML mapping | A second fenced `yml` mapping is appended after the final H2. | PASS: exit 1, empty stdout, FAIL-only stderr. |
| contract location | The accepted YAML/YML mapping must be the sole document-wide block and must be the body immediately under the sole contract heading inside the safety H2. | PASS: real target exits 0. |

Current target SHA: `65ed06d96716202509679a3a3ef57c4a0d446c2bb77998a454ed2885d2123d66`. Checker SHA: `a6aa94cf76559af64d5ab9728f163325b29ae588912d07da47fd7196e8c8abcc`. Harness SHA: `110aae094a9e9621c31562447eb5085354dcb8ee01a3049aa3dd54adb03b4bd4`. Current result: 34 total / 9 accepts / 25 rejects / 34 distinct / 0 failures.

Case-fold extension: an appended fenced `YAML` mapping was a RED false-success when only lower-case labels were counted. `contract-uppercase-yaml-outside-safety` now rejects it. Current checker SHA: `1d74b277145e69424d6f6a3ab4af4615d11e203dc858c13390990aa7179934e6`; harness SHA: `360f4ed5913d0899215df57c9541cad6e09b8e1b1a85c0786008ca9762e49d17`; result: 35 total / 9 accepts / 26 rejects / 35 distinct / 0 failures.

## Fixed-point entity-decoding extension

| Class | Persistent capture3 probe | Verdict |
|---|---|---|
| five-layer active entity | Five nested `&amp;` layers around escaped active-link markup. | PASS: decoded active URI is rejected. |
| deep nested entity | Sixty-five nested layers around the same payload. | PASS: decoding bound fails closed. |
| benign entity text | A copyright numeric entity before the first H2. | PASS: exit 0 with one PASS line and empty stderr. |

Current target SHA: `65ed06d96716202509679a3a3ef57c4a0d446c2bb77998a454ed2885d2123d66`. Checker SHA: `487470cea93eeb62ca199216f4db0385a3816a40428d725f5a9f419a9520f5ba`. Harness SHA: `ba031c00f4382d0e78408a0e1a9e17c410b561fae18e9b6afcbebabde5258dab`. Current result: 38 total / 10 accepts / 28 rejects / 38 distinct / 0 failures.
