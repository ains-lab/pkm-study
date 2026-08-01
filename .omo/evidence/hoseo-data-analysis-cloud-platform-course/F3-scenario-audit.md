# F3 — Agent-executed syllabus scenario and rendered-surface audit

**Verdict: APPROVE.** All three constrained scenarios reach an individual, evidence-bearing assessment route.  Each fallback expressly identifies the competency it cannot demonstrate; no route turns a fixture, Docker, stale artifact, or failure receipt into a live-success claim.

## Scope and faithful surfaces

- Target: `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`, SHA-256 `b87d72f0227c1e59d33e13e6db011d132156644eb8536f4dcb6c2036e3d41210` (read only).
- HTML surface/invocation: retained local Pandoc artifact `task-8-syllabus.html`, inspected as HTML/text with `rg -c '<h2'`, `rg -c '<table'`, and local HTML content inspection. An in-app browser connection was attempted for `file:///…/task-8-syllabus.html`, but the environment reported **“No browser is available”**. The plan permits an HTML **text/browser** surface; this audit therefore did not substitute a network service or create a browser artifact.
- Terminal surface/invocation: retained Glow transcript `task-8-render.txt`, inspected with `perl -pe 's/\\e\\[[0-9;]*[[:alpha:]]//g' … | nl -ba` and `rg -n` against its rendered text. This is a real Glow artifact, not Markdown source.
- Structural invocation: `ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` → exit `0`, `PASS headings=10 weeks=15 instructional=13 exams=8,15 weights=20/40/40 mid=10+10+12+8 final=10+10+10+10 milestones=7 fallbacks=6 lo=LO1-LO5`.
- Negative-control invocation: same checker on `corrupt-syllabus.md` → exit `1`, explicitly naming both missing week 8/15 exam and the 20/40/40 mismatch. No cloud, Hermes, cron, live CTI, LLM, or UA command was provisioned or run.

## Rendered-surface audit

| Surface evidence | Exact rendered location / excerpt | Verdict |
|---|---|---|
| Pandoc HTML | 10 `<h2>` and 10 `<table>` tags; nonempty `37,901` bytes. Task-8 validation records `PANDOC_EXIT=0`, `h2=10`, `tables=10`, `malformed_pipe_rows=false`. | PASS |
| Glow heading/assessment table | lines 53–59: `## 평가 방법`, then visible `출석 │ 20%`, `중간고사 │ 40%`, `기말고사 │ 40%`; lines 63–80 show both rubrics, including `NCP/fallback… │ LO1 │ 10`, `LLM Wiki… │ LO4 │ 10`, `UA graph… │ LO4 │ 10`. | PASS |
| Glow schedule table | lines 83–119 visibly contain all rows 1–15; line 103 says `8 │ 3시간 개인 실기시험, 신규 강의 없음`, line 119 says the same for week 15. Long cells wrap onto subsequent physical lines while retaining their table columns; no cut-off marker, replacement glyph, or malformed table edge was found. | PASS |
| Glow fallback/Docker table | lines 144–166 show `운영 환경 및 대체 실습 매트릭스`; line 153 renders `Docker │ collector·Wiki·UA… │ Hermes gateway persistence는 fixture-only`; lines 161–162 visibly wrap the Hermes fixture cell as `Docker` / `persistence fixture-only`, without truncating it. | PASS |
| Glow safety/recovery tables/text | lines 172–200 visibly contain the safety heading, public-data/PII restrictions, recovery chain, `deferred_rate_limited`, no-change/semantic failure, stale/partial UA rejection, and NCP teardown/fallback. | PASS |
| Truncation/malformed scan | Existing Glow artifact: `236` lines, `109,584` bytes. Fresh read-only search over both rendered artifacts found no `…` or U+FFFD. Prior retained renderer check says `ellipsis=false`, 10 closed tables, nonempty render. | PASS |

## Fixed student/instructor scenarios

Every row below is a checklist item executed by tracing the actual weekly schedule, milestone table, six-track contract, safety/accessibility policy, and recovery section. “Assessment route” means an individually submitted, machine-readable evidence route; attendance or team activity is not treated as a substitute.

### A. School NCP available

Surface and invocation: rendered schedule Glow lines 89–119; milestone rows M2–M7 in source lines 110–116; platform/fallback contract lines 128–144; recovery lines 160–176.

| Checklist item | Observable syllabus route | Verdict |
|---|---|---|
| Prerequisites | Networking/IAM diagnostic → week 2 approved design → week 3; instructor preflight confirms sub-account scope, systemd, budget/alert and constrained ACG (lines 16–32, 89–90, 162–163). | PASS |
| Week activities | Weeks 2–3 live NCP VPC/subnet, constrained SSH, public IP, service curl and terminate/release; weeks 4–7 non-root Hermes/CTI; weeks 9–14 Wiki→fresh UA→metrics→recovery. | PASS |
| Individual artifacts | Redacted NCP export/ACG, terminal/curl, owner/budget/teardown receipt; version/doctor/config hash and triggered/skipped/semantic-failure receipts; manifests, lint/validation JSON, metrics/source-check and lineage receipt. | PASS |
| Fallback route | If permission/cost/service changes, NCP route switches before provisioning to Linux/WSL2 plus `ncp-lab-fixture.json`; Hermes/CTI/LLM/UA/analysis rows retain their listed fixtures. | PASS |
| Lost competency stated | NCP fixture cannot claim actual provisioning/public connection/alert/release; non-live tracks similarly declare their limits in the six-track table (line 139). | PASS |
| Exam eligibility | Week 8 accepts NCP/fallback + Hermes + CTI with individual run ID/hash after 1–7 evidence; week 15 accepts individual Wiki/UA/analysis evidence after 9–14. Both use approved instructor fixtures where needed, and both rubrics total 40. | PASS |
| Recovery | Live NCP interruption: terminate/ACG removal/public-IP release/remaining-cost check, receipt, instructor escalation if unverifiable, then fixture assessment (line 176). Semantic/partial/stale states remain failures rather than successful runs. | PASS |
| Safety | Minimal SSH and redacted IP/key, cost alert/owner label, public-data-only, no scanning/exploit/automatic response, secret redaction, full teardown. | PASS |
| Accessibility | Captions, transcripts, accessible alternative materials, keyboard/screen-reader route, high-contrast text, image descriptions and downloadable fixtures are required (lines 155, 166). | PASS |
| Honest assessment route | Live evidence establishes only LO1–LO5 evidence actually observed; alternate fixture claims remain bounded. No capability is inferred from a passing status phrase. | PASS |

### B. No NCP; initially only a lab PC/Docker

Surface and invocation: Glow lines 17–19, 89–103, 128–166; source Docker/platform lines 130–144; midterm rubric lines 62–70.

| Checklist item | Observable syllabus route | Verdict |
|---|---|---|
| Prerequisites | Student begins with diagnostic and the `ncp-lab-fixture.json`/approved fixture route; Docker is limited to collector/Wiki/UA and does not satisfy an unprovided systemd prerequisite. | PASS |
| Week activities | Week 2 uses Linux VM/WSL2 + NCP fixture for network/ACG/budget judgement; week 3 uses approved Linux/WSL2/fixture; weeks 5–6 can use Docker for CTI; 9–14 can use Docker for Wiki/UA only. | PASS |
| Individual artifacts | Fixture ID/owner/schema/hash/expected-results, redacted ACG table, terminal or fixture records, CTI manifests/dedupe/429 report, Wiki lint, pinned-graph fresh validation report, metric/source-check receipt. | PASS |
| Fallback route | The NCP table explicitly supplies `ncp-lab-fixture.json` plus Linux VM/WSL2; Hermes provides health/changed/no-change/semantic-failure fixture. Docker has no NCP-provisioning route. | PASS |
| Lost competency stated | NCP fixture loses live provisioning/public connection/alert/release. Docker/fixture loses real Hermes systemd persistence, scheduler/cron and recovery; it preserves only safety-state/last-good judgement. | PASS |
| Docker persistence assertion | **Explicitly verified:** source line 18; Glow line 19; source line 133; Glow line 153; source/Glow Hermes fallback row 140/161–162 all say Docker Hermes gateway persistence is `fixture-only`. No rendered cell claims live systemd, cron, or gateway persistence from Docker. | PASS |
| Exam eligibility | Week 8 permits approved instructor fixtures and grades personal command transcript/manifest/hash/redacted log/safety explanation; week 15 permits approved Wiki/UA/analysis fixtures. The requirement remains all required evidence families, not attendance/team work. | PASS |
| Recovery | Docker-only user does not “repair” absent systemd by claiming it. They record the unavailable track, preserve last-good, use the verified fixture, and can move to a systemd Linux/WSL2 live route only if later supplied. | PASS |
| Safety | Docker does not authorize a live gateway/cron; one-gateway/local-only/non-root/allowlist/redaction rules and no secret/PII/offensive task rules still apply. | PASS |
| Accessibility | Same captions/transcripts and accessible materials/fixtures apply to the fallback examination route, including an individual fixture copy. | PASS |
| Honest assessment route | The student may demonstrate interpretation, provenance, validation and recovery judgement, but cannot receive credit for live NCP provisioning or Hermes systemd persistence that the matrix marks lost. | PASS |

### C. CTI API or LLM/UA enrichment unavailable

Surface and invocation: Glow schedule lines 97–119; source CTI/LLM/UA fallback rows 141–144; recovery lines 169–175; M4–M7 lines 113–116.

| Checklist item | Observable syllabus route | Verdict |
|---|---|---|
| Prerequisites | Student has the previous raw manifest/Wiki lineage and validated fixture metadata. Instructor preflight supplies malformed, duplicate, 429, partial-batch, stale and dangling-edge fixtures with last-good results (lines 164–165). | PASS |
| Week activities | Weeks 5–7 use stored CISA/NVD/EPSS/ATT&CK responses for provenance/normalization/idempotency; 9–10 use pinned raw/canonical fixtures; 11 validates pinned graph with a **fresh** report; 12–13 calculate projection/metrics and source-check against fixture; 14 rehearses recovery. | PASS |
| Individual artifacts | 8-field raw manifest, normalized sample, dedupe/429 receipt, redacted LLM candidate/approved-rejected sheet, graph/report hashes, fresh validation JSON, projection metadata/metrics and source-check sheet. | PASS |
| Fallback route | CTI API row supplies CISA/NVD/EPSS/ATT&CK malformed/duplicate/429 fixtures; LLM row supplies redacted prompt/response + approved/rejected sheet; UA supplies instructor-pinned graph + this-run fresh validation report; analysis supplies pinned graph/golden metrics. | PASS |
| Lost competency stated | CTI loses current availability/freshness/live limit interaction; LLM loses current model response/new enrichment; UA loses student-environment fresh UA/current enrichment; analysis loses new live graph/fixture-external generalization. | PASS |
| Exam eligibility | Week 8 accepts the approved CTI fixture path with individual manifest/hash and failure judgement. Week 15 accepts approved Wiki/UA/analysis fixtures but requires individual lint/validation/metric/source evidence and a rejected unsourced relation. | PASS |
| Recovery | Outage chain is bounded error record → preserve last-good → verified-hash fixture → approved retry; 429 has at most three bounded retries then `deferred_rate_limited`; no-change skips calls; semantic failure has publish 0; partial/stale/dangling UA is nonzero and never reused. | PASS |
| Safety | No retry storm, bypass scraping, live data expansion, prompt execution, or fact promotion from LLM/graph output; all external text remains data. | PASS |
| Accessibility | Pinned/downloadable fixtures and text/Markdown alternatives make outage recovery accessible; captions/transcripts and keyboard/screen-reader materials remain required. | PASS |
| Honest assessment route | `fresh_enrichment_claim: false` is mandatory for pinned-UA fallback. Only fixture reproduction/validation and source-checked conclusions are assessed; stale/partial/unsourced work is explicitly rejected. | PASS |

## Adversarial cases

| Scenario ID | Criterion reference | Adversarial class | Expected behavior | Verdict | Artifact refs |
|---|---|---|---|---|---|
| A-1 | NCP/LO1, recovery | misleading success / teardown | Stop-only, leftover IP or unrestricted SSH must fail; live interruption must be cleaned up or escalated then use a fixture, not be called a successful NCP run. | PASS | E1, E2, E3 |
| B-1 | Docker/Hermes fallback | misleading fallback claim | A Docker-only learner must be fixture-only for Hermes persistence and may not claim systemd, scheduler, cron or recovery execution. | PASS | E1, E2 |
| C-1 | CTI/LLM/UA fallback | stale state | 429 becomes bounded retry/deferred; semantic failure blocks publish; partial/stale/dangling UA is nonzero; pinned graph only gets a fresh validation report, never a fresh-enrichment claim. | PASS | E1, E2, E3 |
| C-2 | graph interpretation | misleading-success output | An unsourced LLM/graph relation is a rejected inference, not a fact or checked conclusion. | PASS | E1, E4 |
| V-1 | rendered integrity | clipping/malformed render | Both rendered surfaces retain 10 headings/10 tables; Glow has no ellipsis/replacement glyph and its wrapped Docker/Hermes cells preserve content. | PASS | E2, E3 |
| S-1 | safety/privacy | secret/PII | High-signal local scan of syllabus, HTML, Glow transcript, and this receipt must return no private key/token/bearer/AWS-key/RRN pattern. It returned no matches. | PASS | E1, E2, E3 |

## Cleanup

No temporary file, cloud resource, package, API request, Hermes installation, cron, UA generation, or external state was created. The only persistent write of this F3 run is this receipt.

## manualQa

```yaml
surfaceEvidence:
  - scenarioId: A
    criterionReference: "F3 scenario A: NCP available"
    surface: "Pandoc HTML text surface + Glow terminal rendering + current Markdown"
    exactInvocation: "ruby …/syllabus_check.rb output/…syllabus.md; perl ANSI-strip task-8-render.txt | nl -ba; rg rendered headings/tables"
    verdict: PASS
    artifactRefs: [E1, E2, E3, E4]
  - scenarioId: B
    criterionReference: "F3 scenario B: no NCP, Docker initially"
    surface: "Glow platform/fallback table and Markdown contract"
    exactInvocation: "rg -n -C 1 'Docker|fixture-only|systemd persistence' output/…syllabus.md task-8-render.txt"
    verdict: PASS
    artifactRefs: [E1, E2]
  - scenarioId: C
    criterionReference: "F3 scenario C: CTI API or LLM/UA unavailable"
    surface: "Glow schedule/recovery surface and Markdown fallback matrix"
    exactInvocation: "rg -n -C 1 'bounded 오류 기록|last-good|partial|stale|deferred_rate_limited' output/…syllabus.md"
    verdict: PASS
    artifactRefs: [E1, E2, E3]
adversarialCases:
  - scenarioId: A-1
    criterionReference: "LO1/M2/NCP recovery"
    adversarialClass: "misleading-success / teardown"
    expectedBehavior: "Failure or fixture transfer; never live-success claim"
    verdict: PASS
    artifactRefs: [E1, E3]
  - scenarioId: B-1
    criterionReference: "LO2/M3/Hermes fallback"
    adversarialClass: "misleading fallback claim"
    expectedBehavior: "Docker persistence remains fixture-only"
    verdict: PASS
    artifactRefs: [E1, E2]
  - scenarioId: C-1
    criterionReference: "LO3-LO5/CTI-LLM-UA"
    adversarialClass: "stale/failure state"
    expectedBehavior: "Bounded/deferred or rejected, last-good/verified fixture only"
    verdict: PASS
    artifactRefs: [E1, E3, E4]
  - scenarioId: C-2
    criterionReference: "LO5/source-checked interpretation"
    adversarialClass: "misleading graph success"
    expectedBehavior: "Unsourced relation is rejected inference"
    verdict: PASS
    artifactRefs: [E1, E4]
artifactRefs:
  - id: E1
    kind: "current syllabus"
    description: "Primary scenario contract, weekly schedule, rubrics, fallback matrix, safety and recovery."
    path: "output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md"
  - id: E2
    kind: "Glow terminal rendering"
    description: "236-line, 109,584-byte rendered terminal surface; contains heading/table locations quoted above."
    path: ".omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-render.txt"
  - id: E3
    kind: "Pandoc HTML rendering and validator transcript"
    description: "37,901-byte HTML plus verified heading/table and no-malformation observations."
    path: ".omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-syllabus.html"
  - id: E4
    kind: "negative-control and render receipt"
    description: "Real checker pass, corrupt-copy failure, renderer integrity and secret/PII scan baseline."
    path: ".omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-validation.log"
```
