# F1 — Plan compliance and assessment-alignment audit

Verdict: **APPROVE**

Audit date: `2026-07-29`

Target: `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`
Target SHA-256: `b87d72f0227c1e59d33e13e6db011d132156644eb8536f4dcb6c2036e3d41210`

Every plan Must-have, every atomic Todo 1–8 acceptance condition, and every Success criterion below is `PASS`. The syllabus has no unfinished marker or unsupported weighted category. This audit opened the complete plan, complete Korean syllabus, every Todo 1–8 brief/check/negative fixture/hash/render/adversarial receipt, the full 236-line Glow surface, and the full Pandoc HTML as a 196-line text surface. Worker success prose was corroboration only; the verdict uses fresh parsing, arithmetic, hash comparison, rendering, and direct semantic inspection.

## Commands and direct observables

| Check | Invocation/result | Status |
|---|---|---|
| Official checker syntax and real target | `ruby -c .../syllabus_check.rb` → `0`; `ruby .../syllabus_check.rb output/...syllabus.md` → `0`, `PASS headings=10 weeks=15 instructional=13 exams=8,15 weights=20/40/40 mid=10+10+12+8 final=10+10+10+10 milestones=7 fallbacks=6 lo=LO1-LO5` | PASS |
| Named negative control | Same checker on `corrupt-syllabus.md` → `1`; names `missing week 8 or week 15 exam` and `grading mismatch` once each | PASS |
| Negative-fixture integrity | Independent Ruby reconstruction proves the corrupt copy differs only by midterm `40%→30%` and removal of week 8; real target hash remains the value above | PASS |
| Independent syllabus parser | Separate Ruby logic, not the Todo 8 checker, recounts 10 H2, weeks 1–15, 13 instructional rows, exams 8/15, 20+40+40, 10+10+12+8, 10+10+10+10, seven milestones, six fallback tracks, and seven prerequisites; exit `0` | PASS |
| Independent Todo evidence parser | Separate Ruby assertions over the real Todo 1–8 artifacts output `TODO1=PASS ... TODO8=PASS`; exit `0` | PASS |
| Whitespace | `git diff --no-index --check /dev/null <syllabus>` → normal added-file exit `1`, diagnostic bytes `0` | PASS |
| Fresh render parity | Fresh Pandoc stream vs `task-8-syllabus.html`: `cmp=0`; fresh `COLUMNS=420 glow -w 400 -s dark` vs `task-8-render.txt`: `cmp=0` | PASS |
| Render structure | Independent HTML/Glow parser: 10 exact normalized H2, 10 tables, row counts `8,6,4,6,6,16,8,5,7,7`, table widths `3,3,3,3,3,11,7,3,7,3`, no U+FFFD or ellipsis; exit `0` | PASS |
| Protected paths and deliverable scope | Todo 1 manifest = Todo 8 manifest = fresh protected set: 142 paths, 0 hash mismatches; baseline status 51/current 52 with only the syllabus added; staged paths 0; new output set contains only the syllabus | PASS |
| Secret/PII scan | Pre-write scan of the syllabus plus all 34 current evidence files: 35 files, zero private-key, AWS/GitHub/Slack token, bearer, JWT, embedded-auth, email, Korean RRN, or mobile matches | PASS |
| Placeholder scan | `rg` for `TODO|TBD|PLACEHOLDER|{{|<insert|[insert` on the syllabus → raw exit `1` (no match) | PASS |

The first independent semantic runner returned nonzero for two reviewer predicates that were too literal: it required the word `PASS` in every happy-path cell and the word `fixture` inside every cell already governed by the `instructor fixture` header. Direct row inspection showed no content defect. A refined row-specific semantic parser retained the capability-loss and allowed-claim checks and exited `0`. Likewise, the first render helper had a reviewer `NoMethodError`, and a second attempt compared wrapped H2 text without whitespace normalization; neither was reported as product success. The corrected full render parser above exited `0`.

## Manual LO-to-week-to-assessment alignment

| Outcome | Observable syllabus behavior | Scheduled weeks independently found | Individual exam alignment | Status |
|---|---|---|---|---|
| LO1 | Configure, validate, and explain NCP/approved Linux networking, cost boundary, and teardown | `2,3,8` | Midterm environment/network evidence 10; shares individual troubleshooting/safety 8 | PASS |
| LO2 | Inspect safe Hermes operation and distinguish changed/no-change/semantic failure with last-good recovery | `4,7,8` | Midterm safe install/health 10; shares individual troubleshooting/safety 8 | PASS |
| LO3 | Record and normalize public CTI; reproduce join/dedupe/state/rate-limit validation | `1,5,6,7,8,9,14` | Midterm CTI collection/data quality 12; shares troubleshooting/safety 8. Later recurrence reinforces lineage without adding a weight | PASS |
| LO4 | Lint evidence-preserving Wiki content and generate/validate UA with honest live/fallback claims | `1,9,10,11,14,15` | Final Wiki schema/provenance/lint 10; UA generation/validation 10; contributes to interpretation/recovery 10 | PASS |
| LO5 | Reproduce directed/projection metrics and source-check a conclusion or rejected inference | `12,13,14,15` | Final graph-metric reproducibility 10; source-checked interpretation/recovery 10 | PASS |

The alignment is not merely lexical. The outcomes use observable verbs, schedule rows name student artifacts plus happy/failure evidence, and the exam tables name the same evidence families. Attendance and the 2–3-person formative activity cannot substitute for a missing technical evidence family (`syllabus:42,54-60`).

## Plan Must-have checklist

| ID | Plan requirement | Exact inspected evidence | Status |
|---|---|---|---|
| M01 | Exactly one Korean external deliverable at the required path | `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md:1-193`; Todo 1 manifest excludes it, fresh output-set comparison finds it as the sole new output | PASS |
| M02 | Ten unique required top-level sections | Syllabus H2 at `3,16,34,52,82,104,124,148,158,178`; HTML/Glow independent H2 check | PASS |
| M03 | Five observable outcomes, IDs LO1–LO5 used throughout | Definitions `syllabus:36-40`; mapping `44-50`; schedule `88-102`; rubrics `64-80`; independent alignment table above | PASS |
| M04 | Exactly 15 weeks; 13×60+120; weeks 8/15 three-hour individual exams with no lecture | Schedule `syllabus:86-102`; independent counts `15/13/8,15` | PASS |
| M05 | Fixed week-by-week topic sequence | Each row `syllabus:88-102` matched the plan’s required topic terms with independent Ruby assertions | PASS |
| M06 | Attendance/midterm/final = 20/40/40; formative 2–3-person activity unweighted; individual exams | `syllabus:7,54-60,95,102`; exactly three parsed weighted rows, total 100 | PASS |
| M07 | Midterm 10+10+12+8 = 40 | `syllabus:62-70`; exact named-row comparison and arithmetic | PASS |
| M08 | Final 10+10+10+10 = 40 | `syllabus:72-80`; exact named-row comparison and arithmetic | PASS |
| M09 | Honest live/fallback paths for six tracks; Docker Hermes persistence fixture-only | Platform/fallback tables `syllabus:128-146`, especially `133,137-144`; systemd live boundary `18` | PASS |
| M10 | ATT&CK v19.1 dated fixture, official-latest check, controlled refresh | `syllabus:180,189,191`; Todo 1 ledger `task-1-source-ledger.md:54-72` | PASS |
| M11 | Captions/transcripts/accessibility; public CTI; credential/retention/deletion/cost/teardown; fixture metadata | Global video rule `syllabus:84`; fixture contract `146`; policies `150-155`; preflight `162-167` | PASS |
| M12 | Tests-after, local/read-only verification, no provisioning/install/cron/live collection/wiki/UA mutation | Todo 7 assembly precedes Todo 8 checks (`task-7-assembly-check.txt:28-34`; `task-8-validation.log:1-67`); protected hashes and F4 operational audit show no task-issued mutation | PASS |

## Guardrail checklist

| ID | Must-NOT condition | Exact inspected evidence | Status |
|---|---|---|---|
| G01 | No real NCP/Hermes/cron/UA operation during production/verification | `task-8-adversarial-verify.md:145-178`; `F4-scope-fidelity.md` Safety and operational guardrails | PASS |
| G02 | No protected raw/canonical/schema/index/log/.ua/pre-existing-output/editor mutation | 142-path exact manifests and fresh recomputation; `F4-scope-fidelity.md` Protected-manifest comparison | PASS |
| G03 | No malware/PoC/scanning/victim log/PII/credential/login-scraping/automatic response assignment | Negative policy `syllabus:150-152`; milestone M4 `113`; unsafe-context count 0 in F4 | PASS |
| G04 | No graph-inference fact promotion, unexplained CVSS/EPSS/KEV score, or invented CVE→ATT&CK fact edge | `syllabus:100,151,156,193`; Task 8 harmful graph promotion control fails | PASS |
| G05 | No volatile price/catalog/EPSS/release/version/graph counts as permanent thresholds | `syllabus:154,180,186-189,193`; F2 volatile-claim audit | PASS |
| G06 | No curriculum expansion into HA/multi-AZ/VPN/production SOC/offense/fine-tuning/separately graded project | Full syllabus manual inspection; exactly three weights and no expansion assignment | PASS |
| G07 | No commit/stage/revert/normalization of unrelated worktree data | Staged count 0, baseline lines preserved, one new product status line; F4 attribution audit | PASS |

## Todo 1–8 acceptance checklist

### Todo 1

| ID | Acceptance condition | Exact inspected evidence | Status |
|---|---|---|---|
| T1.1 | Required baseline/hash/ledger receipts are nonempty | `task-1-baseline-status.txt`, `task-1-protected-sha256.txt`, `task-1-source-ledger.md`; failure receipt also nonempty; independent `test -s` equivalent | PASS |
| T1.2 | Ledger has `as_of`, fixture/latest, Hermes pin, NVD 2.0, and required official URLs | `task-1-source-ledger.md:3-72`; independent required-string set | PASS |
| T1.3 | Baseline predates task-owned implementation writes | `task-1-baseline-status.txt:5-7`; mtime comparison; `task-1-source-ledger.md:82-93` | PASS |
| T1.4 | No Todo 1 write escaped its evidence boundary | `task-1-adversarial-verify.md:32-45,92-113`; current protected set remains identical | PASS |

### Todo 2

| ID | Acceptance condition | Exact inspected evidence | Status |
|---|---|---|---|
| T2.1 | Exactly five LO headings | `task-2-course-contract.md:25-43`; fresh count 5 | PASS |
| T2.2 | Seven named prerequisites each have diagnosis and remediation | `task-2-course-contract.md:13-21`; independent nonempty-cell parse | PASS |
| T2.3 | Exact 11 instructional columns, exam schema, weights/team/accessibility phrases | `task-2-course-contract.md:53-109`; exact schema-string and phrase checks | PASS |
| T2.4 | Every LO maps to technology, week, and exam component | `task-2-course-contract.md:45-51`; set comparison LO1–LO5 | PASS |
| T2.5 | Missing-LO control fails | `task-2-missing-lo.md` differs only by the LO5 mapping row; `task-2-contract-check.txt:44-52,84-99` | PASS |

### Todo 3

| ID | Acceptance condition | Exact inspected evidence | Status |
|---|---|---|---|
| T3.1 | Exactly week 2/3 sections and live/fallback evidence tables | `task-3-ncp-module.md:20-61`; independent heading/table inspection | PASS |
| T3.2 | All eight fixture fields and non-circular canonical hash contract | `task-3-ncp-module.md:63-96`; independent field-set and documented digest inspection | PASS |
| T3.3 | TCP 22 restricted; `0.0.0.0/0` explicitly fails | `task-3-ncp-module.md:34-43`; failure receipt `task-3-ncp-check.txt:59-81` | PASS |
| T3.4 | Stop-only rejected; public-IP release and residual-cost warning required | `task-3-ncp-module.md:47-61` | PASS |
| T3.5 | Exact Docker/Hermes fixture-only platform rule | `task-3-ncp-module.md:98-107` | PASS |

### Todo 4

| ID | Acceptance condition | Exact inspected evidence | Status |
|---|---|---|---|
| T4.1 | Weeks 4–7 plus exam-only week 8 | `task-4-hermes-cti-module.md:10-120`; parsed headings `[4,5,6,7,8]` | PASS |
| T4.2 | Midterm named values 10,10,12,8 total 40 | `task-4-hermes-cti-module.md:104-114`; fresh sum | PASS |
| T4.3 | Raw manifest, normalized record, join/dedupe/state fields complete | `task-4-hermes-cti-module.md:35-63`; independent exact-field checks | PASS |
| T4.4 | Idempotent rerun yields zero new duplicates | `task-4-hermes-cti-module.md:59,75,85` | PASS |
| T4.5 | Triggered, skipped, semantic-failure/last-good, and redacted observations | `task-4-hermes-cti-module.md:77-100`; corrupt success mappings rejected in `task-4-adversarial-verify.md:55-89` | PASS |
| T4.6 | NVD 5/30s, keyed 50/30s, six-second pacing, bounded retry, 429 fixture | `task-4-hermes-cti-module.md:28-33,69-86`; Todo check `24-66` | PASS |

### Todo 5

| ID | Acceptance condition | Exact inspected evidence | Status |
|---|---|---|---|
| T5.1 | Weeks 9–14 instructional and exam-only week 15 | `task-5-wiki-ua-graph-module.md:9-79`; parsed `[9..15]`, six time markers | PASS |
| T5.2 | Final rubric four 10-point rows total 40 | `task-5-wiki-ua-graph-module.md:104-112`; fresh sum | PASS |
| T5.3 | Live and fallback UA paths share invariants but distinguish freshness/enrichment | `task-5-wiki-ua-graph-module.md:31-40,81-102,114-118` | PASS |
| T5.4 | Directed/raw vs undirected/simple, loop/multiedge/weight/tie/tolerance policy | `task-5-wiki-ua-graph-module.md:42-59` | PASS |
| T5.5 | Three metric families, verified/rejected interpretations, all lineage IDs | `task-5-wiki-ua-graph-module.md:53-73`; exact lineage at `71` | PASS |
| T5.6 | Dangling endpoint fails nonzero/`DANGLING_EDGE` and unsourced relation is rejected | `task-5-wiki-ua-graph-check.txt:39-57`; confirmation `task-5-adversarial-verify.md:102-131` | PASS |

### Todo 6

| ID | Acceptance condition | Exact inspected evidence | Status |
|---|---|---|---|
| T6.1 | Exactly three weighted rows totaling 100 and six fallback rows | `task-6-governance-assessment.md:10-29`; independent table parser | PASS |
| T6.2 | Required project/individual/policy/access/retention/secret/prohibition phrases | `task-6-governance-assessment.md:5-18,31-49`; exact phrase set | PASS |
| T6.3 | Every fallback has nonempty preserved/lost/allowed-claim cells | `task-6-governance-assessment.md:22-29`; parsed six complete rows | PASS |
| T6.4 | Blank Hermes lost-competency control fails | `task-6-governance-check.txt:51-82`; same parser returns `FAIL incomplete fallback row` | PASS |

### Todo 7

| ID | Acceptance condition | Exact inspected evidence | Status |
|---|---|---|---|
| T7.1 | Output exists, nonempty UTF-8/LF, final newline | Real binary read; `task-7-assembly-check.txt:36-45` | PASS |
| T7.2 | Required H2 appear exactly once | `task-7-assembly-check.txt:47-50`; fresh exact list | PASS |
| T7.3 | Weeks/format/exams/LO/weights/rubrics/fallbacks parse correctly | `task-7-assembly-check.txt:56-60`; independent F1 parser above | PASS |
| T7.4 | No scaffold/unfinished token | `task-7-assembly-check.txt:52-54`; fresh syllabus-only scan | PASS |
| T7.5 | Missing brief blocks target creation | `task-7-assembly-check.txt:3-28`; independent adversarial reproduction `task-7-adversarial-verify.md:85-112` | PASS |

### Todo 8

| ID | Acceptance condition | Exact inspected evidence | Status |
|---|---|---|---|
| T8.1 | Real syllabus checker exits 0 | Fresh official run; `task-8-validation.log:1-6` | PASS |
| T8.2 | Corrupt copy exits nonzero and names week/weight faults | Fresh official run; `task-8-validation.log:7-16`; exact-two-mutation reconstruction | PASS |
| T8.3 | Pandoc and Glow exit 0 with nonempty intact outputs | Byte-identical fresh renders; `task-8-validation.log:20-26`; full surfaces inspected | PASS |
| T8.4 | Whitespace check has no diagnostics | Fresh raw exit 1, diagnostic bytes 0; `task-8-validation.log:17-19` | PASS |
| T8.5 | Todo 1/8 protected manifests match and fresh hashes match | `task-8-protected-sha256.txt:1-146`; fresh 142/142/0 comparison | PASS |
| T8.6 | Final status adds only allowed syllabus/evidence state; no staging | Fresh status comparison and F4 inventory; `task-8-validation.log:27-35` | PASS |

## Success-criterion checklist

| ID | Success criterion | Exact inspected evidence | Status |
|---|---|---|---|
| S01 | Exactly one new deliverable; GFM/terminal readable | Fresh output-set comparison; Pandoc/Glow exact parity and full manual inspection | PASS |
| S02 | 15 weeks, 13 instructional formats, exam-only 8/15, fixed sequence | `syllabus:86-102`; independent parser | PASS |
| S03 | Observable LO1–LO5 scheduled and assessed; grading/rubrics arithmetically consistent | `syllabus:36-80`; manual alignment table above | PASS |
| S04 | Requested technology progression has concrete artifacts, happy/failure evidence, safety | Schedule `88-102`; milestones `108-116` cover NCP, Hermes, CTI, Wiki, UA/analysis | PASS |
| S05 | Six honest fallback rows; Docker never demonstrates Hermes systemd persistence | `syllabus:128-146`; row-by-row capability-loss audit | PASS |
| S06 | CTI provenance/normalization/idempotency/API hygiene/ATT&CK currency without offensive or unstable claims | `syllabus:92-100,113,118,150-156,180-191` | PASS |
| S07 | UA invariants plus live freshness or fresh report over pinned fallback | `syllabus:98,115,120,143,174` | PASS |
| S08 | Graph projection policies, three metric families, verified and rejected interpretations | `syllabus:99-100,116,122,144,193` | PASS |
| S09 | Protected manifests match; no forbidden repo/external mutation attributable to this work | Fresh 142-path comparison; F4 `APPROVE` and explicit concurrent-state attribution | PASS |
| S10 | Todo 8 and F1–F4 approve with receipts; do not declare completion before explicit user acceptance | Todo 8 confirmation `task-8-adversarial-verify.md:14-18`; F2 `APPROVE` at `F2-document-source-quality.md:7-13`; F3 `APPROVE` at `F3-scenario-audit.md:1-3`; F4 `APPROVE` at `F4-scope-fidelity.md:5-9`; this F1 receipt. No user-acceptance claim is made here | PASS |

## Adversarial findings and evidence caveats

- Misleading success: the real checker pass is corroborated by a different Ruby parser, exact arithmetic, full rendered-surface parsing, and direct Korean reading. The corrupt copy produces the opposite result and changes exactly two intended facts.
- Stale evidence: `task-5-wiki-ua-graph-check.txt:32-36` mislabeled local `12:10:15` as UTC. `task-5-adversarial-verify.md:17-20,94-100` corrects it to `03:10:15Z` and explicitly rejects that snapshot as live freshness evidence. F1 did not use the mislabeled timestamp.
- Unrelated gate noise: `.omo/evidence/hoseo-data-analysis-cloud-platform-course-task-1-gate-review.md:3-7` says `REJECT` only because unrelated code-review/notepad inputs were absent; the same file says Todo 1 content passes (`9-13`). The scoped independent Todo 1 receipt confirms it (`task-1-adversarial-verify.md:14-18`). Per the F1 instruction, unrelated global-gate requirements are not imported into this audit.
- Dirty scope: ignored Obsidian workspace state and pre-existing Hermes cron metadata changed concurrently, as F4 discloses. They are not task-attributable, were not modified/reverted by F1, and were not used as success evidence. Repository protected content, six pre-existing outputs, and task-issued operational state remain unchanged.
- Unsupported grading/category check: the final assessment table has exactly three weighted rows (`20/40/40`), no fourth category, and the project is explicitly formative/unweighted. Each exam remains individual.
- Secrets/PII: the final pre-write high-signal scan over 35 files returned zero matches in all ten categories. Prohibited terms in the syllabus occur only in negative policy contexts.

## Cleanup

F1 created no temporary file, process, server, browser context, container, cloud resource, Hermes/cron state, CTI capture, wiki mutation, or UA generation. Failure reproduction used the retained evidence-only corrupt copy and in-memory parsing; no QA temporary path required cleanup. The only persistent F1 write is this receipt.

Final verdict: **APPROVE**
