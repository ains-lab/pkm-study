# HoSeo syllabus global debugging audit

## Verdict

**PASS** — runtime audit completed against Git HEAD `8857bdd924bc0e155b7dd64a8a471692b7b7ab85`, syllabus SHA-256 `b87d72f0227c1e59d33e13e6db011d132156644eb8536f4dcb6c2036e3d41210`, and checker SHA-256 `4eb64f0ee5acb571547e07b9431d30bdff0fe14af8f5306fd3a72960b075ee16`.

## Environment and boundaries

- Surface: local Ruby CLI checker, local Pandoc/Glow renderers, and tmux terminal CLI interaction.
- Runtime: Ruby `2.6.10p210`; Pandoc `3.9.0.2`; Glow `2.1.1`; tmux `3.6b`.
- No NCP, Hermes, cron, CTI, UA, network service, or live cloud operation was invoked.
- The repository was already dirty before this audit. Audit probes used `/tmp/hoseo-debug-audit.C8aeK7` only; the sole retained audit artifact is this file.

## Hypothesis matrix

| ID | Claim and distinguishing runtime check | Result |
|---|---|---|
| H1 | Semantic false-success remains. Run valid, four harmful semantic mutations, and a safe semantic paraphrase through the real checker. A false success would be exit 0 for a harmful mutation. | **Refuted.** Valid and safe control exit 0; every harmful control exits 1 with a named diagnostic. |
| H2 | Retained HTML/Glow is stale or semantically divergent. Fresh-render current syllabus and compare normalized plain text, heading/table counts, and required-content counts with retained renderings. | **Refuted.** Source, fresh HTML, and retained HTML have identical plain-text SHA-256; both HTML files have 10 `h2` and 10 `table` elements and matched required-content counts. |
| H3 | Protected/write scope drift or a hidden checker/render side effect exists. Compare 142 protected hashes and Git status/staging before versus after all runtime probes. | **Refuted.** `142/142` protected paths present, zero hash mismatches; pre/post porcelain status snapshots identical; staged path count zero. |
| H4 | Corrupt/safe controls emit misleading exits/logs. Inspect exact stdout/stderr/exit values for valid, corrupt, harmful, and safe inputs. | **Refuted.** Success responses have exit 0, one PASS line, zero stderr; corrupt/harmful inputs have exit 1 and named stderr diagnostics; no success-shaped error signal was observed. |

## Exact runtime invocations and observed values

```sh
ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb \
  output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
```

Exit `0`; stdout exactly:

```text
PASS headings=10 weeks=15 instructional=13 exams=8,15 weights=20/40/40 mid=10+10+12+8 final=10+10+10+10 milestones=7 fallbacks=6 lo=LO1-LO5
```

Stderr was empty (`0` bytes).

The following copies were recreated from the current syllabus in a disposable directory and supplied to the same CLI:

| Control | Altered behavior | Exit | Distinguishing stderr |
|---|---|---:|---|
| corrupt structural | Week 8 changed from individual exam to instructional row | 1 | `instructional rows must be exactly weeks 1-7 and 9-14`; `missing week 8 or week 15 exam`; `fixed topic mismatch for week 8` |
| harmful milestone | Replaced M1 evidence/guard fields with meaningless prose | 1 | Six named `milestone M1 ... semantics invalid` diagnostics |
| harmful fallback | Claimed a fixture proves live NCP provisioning/public connection | 1 | `fallback NCP allowed-claim semantics invalid`; `... overstates fixture capability` |
| harmful credential | Required credential disclosure and prohibited redaction | 1 | `credential safety policy missing safe prohibition`; `credential safety policy permits disclosure` |
| harmful graph | Promoted a graph relation to fact before source validation | 1 | `graph inference is promoted as fact` |
| safe graph paraphrase | Retained source-validation-before-hypothesis meaning using alternate wording | 0 | same PASS stdout; empty stderr |

### Fresh-render comparison

```sh
pandoc --from=gfm --to=html5 --standalone \
  output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md \
  --output=/tmp/hoseo-debug-audit.C8aeK7/fresh.html
glow -w 400 output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
```

- Pandoc: exit `0`, stderr `0` bytes.
- Glow: exit `0`; 400-column rendering was 236 lines, equal to the retained transcript's 236 lines. Byte identity is not expected because terminal width/ANSI renderer output differs.
- Source Markdown plain text, fresh HTML converted to plain text, and retained HTML converted to plain text all SHA-256 to `b33d739a15cd226f3012a6fb395b6067c9d5e023f5645fa6ff6fb21b46641afb`.
- Fresh/retained HTML structural fingerprint: `h2=10`, `table=10` each.
- Fresh/retained HTML required-content counts were identical: `PASS=11`, `M1=1`, `NCP=23`, `Hermes=18`, `CTI API=1`, `UA generation=1`, `graph analysis=2`, `as_of: 2026-07-29=2`.
- ANSI-stripped Glow fingerprints also matched for all checked distinguishing labels: course overview, 15-week schedule, milestones, source criteria, `CVE-to-ATT&CK`, and `fixture-only`.

### Protected-path and side-effect checks

```sh
ruby -rdigest -e '<read manifest paths; recompute each Digest::SHA256.file>' \
  .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-protected-sha256.txt
git status --porcelain=v1
git diff --cached --name-only
```

- Declared protected paths: `142`; present: `142`; missing: `0`; hash mismatches: `0`.
- Pre/post `git status --porcelain=v1` snapshot diff: `0` lines.
- Pre/post staged-path snapshot diff: `0` lines; current staged-path count: `0`.
- Rechecked target SHA-256 and checker SHA-256 against the values in the verdict; both match.

## Manual QA and silent-failure scan

The CLI was exercised through a real tmux surface:

```sh
tmux new-session -d -s hoseo-syllabus-qa \
  'cd /Users/sysmoon/.codex/projects/pkm-study; ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md; qa_rc=$?; printf "TMUX_QA_EXIT=%s\n" "$qa_rc"; exec zsh'
tmux capture-pane -p -t hoseo-syllabus-qa:0.0 -S -200
```

Captured terminal output contained the same PASS line and `TMUX_QA_EXIT=0`.

- Valid checker: stdout 140 bytes, stderr 0 bytes; no `FAIL`, `error`, `exception`, or traceback token.
- Safe paraphrase: exit 0 with the same clean PASS shape.
- Corrupt and four harmful controls: stdout empty, stderr non-empty with `FAIL:` diagnostics, exit 1.
- No success exit with error stderr, error text in success stdout, or write-without-readback behavior was observed.

## manualQa matrix

```yaml
surfaceEvidence:
  - scenarioId: QA-1
    criterionReference: valid syllabus checker acceptance
    surface: tmux terminal CLI
    exactInvocation: ruby syllabus_check.rb output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
    verdict: PASS
    artifactRefs: [audit-report]
  - scenarioId: QA-2
    criterionReference: retained artifact semantic fidelity
    surface: Pandoc and Glow CLI
    exactInvocation: pandoc --from=gfm --to=html5 --standalone <syllabus>; glow -w 400 <syllabus>
    verdict: PASS
    artifactRefs: [audit-report]
  - scenarioId: QA-3
    criterionReference: protected paths and write scope
    surface: Ruby Digest plus Git CLI
    exactInvocation: Ruby SHA-256 recomputation over the 142-path manifest; git status --porcelain=v1; git diff --cached --name-only
    verdict: PASS
    artifactRefs: [audit-report]
adversarialCases:
  - scenarioId: ADV-1
    criterionReference: meaningful milestone evidence required
    adversarialClass: semantic false-success
    expectedBehavior: checker rejects meaningless M1 fields
    verdict: PASS
    artifactRefs: [audit-report]
  - scenarioId: ADV-2
    criterionReference: fallback must not overclaim live NCP capability
    adversarialClass: semantic overclaim
    expectedBehavior: checker rejects fixture-to-live provisioning/public-connect claim
    verdict: PASS
    artifactRefs: [audit-report]
  - scenarioId: ADV-3
    criterionReference: credential disclosure prohibition
    adversarialClass: unsafe policy inversion
    expectedBehavior: checker rejects required disclosure/redaction prohibition
    verdict: PASS
    artifactRefs: [audit-report]
  - scenarioId: ADV-4
    criterionReference: graph inference guard
    adversarialClass: unsupported fact promotion
    expectedBehavior: checker rejects fact promotion before source validation
    verdict: PASS
    artifactRefs: [audit-report]
  - scenarioId: ADV-5
    criterionReference: structural schedule invariants
    adversarialClass: corrupt schedule
    expectedBehavior: checker exits nonzero with named week-8 diagnostics
    verdict: PASS
    artifactRefs: [audit-report]
artifactRefs:
  - id: audit-report
    kind: Markdown runtime-audit report
    description: Contains complete commands, observed values, QA transcript summary, hypothesis evidence, and cleanup receipt.
    path: .omo/evidence/hoseo-data-analysis-cloud-platform-course/global-debugging-audit.md
```

## Partial-evidence limitations

This audit validates local artifact generation, the checker, and terminal behavior. It intentionally does not prove any live NCP/Hermes/cron/CTI/UA behavior or remote service availability. Those operations were out of scope and were not simulated as successful.

## Cleanup receipt

- Temporary mutant/render/transcript directory: `/tmp/hoseo-debug-audit.C8aeK7` — deleted after this report was written.
- tmux session `hoseo-syllabus-qa` — killed.
- Root `.debug-journal.md` — removed.
- `.git/info/exclude` restored to its exact prior SHA-256 `6671fe83b7a07c8932ee89164d1f2793b2318058eb8b98dc5c06ee0a5a3b0ec1`.
- No product, checker, plan, or ledger file was edited by this audit.
