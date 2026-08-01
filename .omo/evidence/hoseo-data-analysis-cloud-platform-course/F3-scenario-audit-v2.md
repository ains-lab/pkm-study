# F3 syllabus scenario and rendered-surface audit v2

- `review_commit_sha`: `8857bdd924bc0e155b7dd64a8a471692b7b7ab85`
- `target_sha`: `d062c7427f7b8a715f357f7d6f7e307f677fcd3b455c9b709c899ef192d52bee`
- `checker_sha`: `de2cd490ff6f38289e25162ba68be640646682c80676c57854f6c5623e8f8241`
- Scope: read-only student/instructor scenario audit. No NCP, Hermes, cron, CTI collection, LLM request, UA generation, package installation, or external-state operation was performed.
- Verdict: **APPROVE**.

## Observable terminal and parser evidence

Surface and exact invocations:

```text
ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
pandoc -f gfm -t html output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
script -q /dev/null glow -w 400 output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
```

Results observed in this audit:

- The checker exited `0`: `PASS headings=10 weeks=15 topic_ids=15 milestones=7 evidence_ids=49 fallbacks=6 weights=20/40/40 rubrics=40/40 carry=PASS`.
- Pandoc exited `0`, produced 43,541 HTML bytes, and produced zero stderr bytes.
- PTY-backed Glow at 400 columns exited `0` and produced 128,651 bytes. It visibly retained the 10 headings, schedule, M1--M7 table, fallback matrix, safety section, W08/W15 and the required evidence IDs. There were zero ellipsis and replacement-character matches. The long W08/W15 topic IDs wrapped at a hyphen across two table lines (`...individual-` then `practical`); this is ordinary wrapping, not loss or an overclaim.
- Controlled temporary copies were rejected: missing/renamed W08 topic plus a 30% final grade (`exit 1`); appended `<script>` (`exit 1`); and an inverted partial/stale-UA rule (`exit 1`). `Dir.mktmpdir` removed all three copies at block exit.
- A high-signal scan of the syllabus, generated HTML and terminal rendering found no private-key, AWS-key, bearer-token, or Korean resident-number pattern.

## Student/instructor scenario walk-through

### A. School NCP and systemd Linux available

| Checkpoint | Observed route | Verdict |
|---|---|---|
| Prerequisites and activity | Weeks 2--3 require the networking/IAM diagnostic, then VPC/subnet/ACG/public-IP/budget reasoning and restricted SSH/service/teardown. Week 4 uses the non-root Hermes install/health route, and week 7 requires changed/no-change/semantic-failure receipts. | PASS |
| Evidence and assessment | The student produces redacted provider/ACG/terminal/curl/budget/teardown evidence, `hermes doctor` and redacted configuration evidence, then individual midterm command/manifest/hash/failure evidence. The 10+10+12+8 midterm rubric maps this honestly to LO1--LO3. | PASS |
| Safety and recovery | TCP 22 is restricted; stop-only, leftover public IP, and unrestricted SSH are failures. NCP interruption requires cleanup or escalation followed by a fixture route. Hermes remains non-root, local-only, one gateway, `cron_mode: deny`, with messaging/browser separately approved. | PASS |
| Accessibility | Captions, transcript, text/Markdown descriptions, keyboard/screen-reader route, high-contrast text, image descriptions, and downloadable fixtures are required for the same activity. | PASS |

### B. No NCP; lab PC/Docker initially available (including Hermes without systemd)

| Checkpoint | Observed route | Verdict |
|---|---|---|
| Fallback and lost competency | The NCP fallback is `ncp-lab-fixture.json` plus Linux VM/WSL2; it preserves network/ACG/cost/teardown judgment but explicitly loses real provisioning, public connection, alert, and release. Docker is limited to collector/Wiki/UA work. | PASS |
| Hermes boundary | Both the platform table and Hermes fallback row state that Docker gateway persistence is `fixture-only`; the visible Glow table preserves this wording. The fallback may assess safe configuration/state/last-good judgment, but not live systemd persistence, scheduler/cron, or recovery execution. | PASS |
| Assessment route | Week 8 accepts approved instructor fixtures with individual command transcript/manifest/hash/redacted-log/safety evidence; week 15 accepts approved Wiki/UA/analysis fixtures with individual lint/validation/metric/source evidence. Neither permits a fixture to be represented as live NCP or live Hermes evidence. | PASS |
| Safety/accessibility | Docker does not grant a scheduler or bypass the allowlist, redaction, public-data-only, captions/transcripts, or accessible-fixture requirements. | PASS |

### C. CTI API 429/network failure, LLM unavailable, partial/stale UA, or graph ambiguity

| Checkpoint | Observed route | Verdict |
|---|---|---|
| CTI failure | The NVD rule records `resultsPerPage`/`startIndex`, uses page/date batches with at least six seconds between batches, prefers `Retry-After`, retries at most three times, then records `deferred_rate_limited`, does not publish, and preserves last-good IDs/hashes. The CTI fallback explicitly loses current API availability/freshness/live-limit interaction. | PASS |
| LLM/UA failure | The LLM fallback is a redacted prompt/response plus approved/rejected sheet. The UA fallback is a pinned graph plus a fresh validation report; it states `fresh_enrichment_claim: false`. Partial, stale, duplicate, or dangling UA is rejected nonzero and is not reused after interruption. | PASS |
| Graph ambiguity | The final route requires projection/metric/source-check evidence and records unsupported relations as rejected inferences. It does not convert an LLM/graph suggestion or a CVE-to-ATT&CK guess into a fact. | PASS |
| Assessment and recovery | Week 8 can use the CTI fixture route and still requires individual failure judgment; week 15 requires individual Wiki/UA/metric/source evidence and rejected-unsourced-relation handling. The documented recovery order is bounded error record, last-good preservation, verified-hash fixture, then approved retry: no retry storm or bypass scraping. | PASS |
| Safety/accessibility | External responses are data-only and never executed; public data only, PII/credential collection/offensive operations/automatic response are prohibited. Downloadable fixtures and the required accessible materials keep the outage path available. | PASS |

## Adversarial cases

| Scenario ID | Criterion reference | Adversarial class | Expected behavior | Verdict | Artifact refs |
|---|---|---|---|---|---|
| A-1 | LO1/M2/NCP recovery | misleading live success | Stop-only, unrestricted SSH, or residual public-IP/cost state fails; fixture transfer cannot be called live provisioning. | PASS | E1, E2 |
| B-1 | LO2/M3/Hermes fallback | no systemd / overclaimed Docker | Docker remains `fixture-only` for gateway persistence and cannot demonstrate live systemd, scheduler, cron, or recovery. | PASS | E1, E2 |
| C-1 | LO3/CTI | 429 or network outage | Bounded retry then deferred/non-publish/last-good preservation; fixture loses currentness honestly. | PASS | E1, E2 |
| C-2 | LO4/UA | partial or stale artifact | Reject nonzero, require a new complete validation, and do not claim fresh enrichment from pinned fallback. Temporary inversion was checker-rejected. | PASS | E1, E2 |
| C-3 | LO5/graph interpretation | ambiguous relation | Reject unsupported relation rather than present it as a checked conclusion. | PASS | E1 |
| R-1 | F3 rendered surface | clipping/malformed table | Pandoc and PTY Glow render; headings/tables/evidence IDs remain visible. Long W08/W15 identifiers wrap at a hyphen rather than disappear. | PASS | E2 |
| S-1 | safety/privacy | active content or secret-like content | Temporary script-bearing Markdown was checker-rejected; high-signal source/render scan found no match. | PASS | E1, E2 |

## manualQa

```yaml
surfaceEvidence:
  - scenarioId: A
    criterionReference: F3 scenario A — school NCP available
    surface: Markdown, Pandoc HTML, PTY-backed Glow terminal table
    exactInvocation: ruby syllabus_check.rb target; pandoc -f gfm -t html target; script -q /dev/null glow -w 400 target
    verdict: PASS
    artifactRefs: [E1, E2]
  - scenarioId: B
    criterionReference: F3 scenario B — no NCP/Docker initially
    surface: Glow platform/fallback table and schedule/rubric sections
    exactInvocation: script -q /dev/null glow -w 400 target; manual table walk-through
    verdict: PASS
    artifactRefs: [E1, E2]
  - scenarioId: C
    criterionReference: F3 scenario C — CTI or LLM/UA unavailable
    surface: recovery policy, fallback matrix, milestone and final-rubric text
    exactInvocation: ruby syllabus_check.rb target; manual source/rendered-text walk-through
    verdict: PASS
    artifactRefs: [E1, E2]
adversarialCases:
  - scenarioId: A-1
    criterionReference: LO1/M2
    adversarialClass: misleading live success
    expectedBehavior: fail or fixture transfer, never overclaimed live capability
    verdict: PASS
    artifactRefs: [E1]
  - scenarioId: B-1
    criterionReference: LO2/M3
    adversarialClass: no-systemd Docker fallback
    expectedBehavior: fixture-only persistence and bounded assessment claim
    verdict: PASS
    artifactRefs: [E1, E2]
  - scenarioId: C-1
    criterionReference: LO3-LO5
    adversarialClass: outage, stale artifact, or ambiguous inference
    expectedBehavior: bounded/deferred or explicit rejection with last-good/verified fixture route
    verdict: PASS
    artifactRefs: [E1, E2]
artifactRefs:
  - id: E1
    kind: current target and checker
    description: Current syllabus and executable structural/policy checker, bound to the hashes above.
    path: output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
  - id: E2
    kind: audit receipt
    description: This fresh F3 terminal/manual-QA report, including invocations, scenario results, negative controls, and cleanup statement.
    path: .omo/evidence/hoseo-data-analysis-cloud-platform-course/F3-scenario-audit-v2.md
```

## Cleanup

The temporary corrupted, active-content, and stale-UA copies were created only inside Ruby's `Dir.mktmpdir` block and were removed automatically at block exit. No persistent path other than this F3 receipt was written by this audit.
