# Todo 7 independent adversarial verification v3

```yaml
AdversarialVerify:
  task: "7. Assemble the single Korean 15-week syllabus"
  reviewed_at: "2026-07-29"
  head: "8857bdd924bc0e155b7dd64a8a471692b7b7ab85"
  target: "output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md"
  target_sha256: "75df0f2733c5bf898b78ee531cbc13700aafcc359b4f7ea15d3a0c296d2c1e51"
  checker: ".omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb"
  checker_sha256: "de2cd490ff6f38289e25162ba68be640646682c80676c57854f6c5623e8f8241"
  verdict: confirmed
  independent_reviewer: true
  reviewer_writes: [this_report_only]
```

## Verdict

**confirmed.** The target’s final SHA-256 exactly matched the assigned build:
`75df0f2733c5bf898b78ee531cbc13700aafcc359b4f7ea15d3a0c296d2c1e51`.
No Todo 7 regression was found. This review opened the plan’s Scope, Todo 7, Success
criteria, Todo 1 source ledger, Todos 2–6 briefs, the current assembly receipt, and
the full syllabus. It did not rely on prior reviewer PASS prose.

## Independent results

| Criterion | Result | Direct evidence |
|---|---|---|
| Build identity | PASS | `shasum -a 256` returned the assigned target hash; HEAD was `8857bdd924bc0e155b7dd64a8a471692b7b7ab85`. |
| File integrity | PASS | `file` reported UTF-8 text; an independent Ruby read confirmed valid UTF-8, LF-only line endings, and final LF. |
| Required structure | PASS | Independent Ruby parser found the exact ordered 10 H2 headings, 15 ordered W01–W15 topic IDs, 13 `60분 비동기 동영상 + 120분 대면 실습` rows, and only week 8/15 three-hour no-new-lecture exams. |
| Outcomes and assessment | PASS | LO1–LO5 are defined and reoccur in weekly/assessment routes; weights are exactly 20/40/40; midterm is 10+10+12+8 and final is 10+10+10+10. The 2–3-person activity remains formative/unweighted with individual evidence. |
| Milestones and fallbacks | PASS | All 49 exact `M#-ROLE` IDs occur once in their seven M1–M7 rows; the six complete fallback tracks are NCP, Hermes, CTI API, LLM enrichment, UA generation, and graph analysis. |
| Added machine contract | PASS | The subsection is under an existing H2 and `Psych.safe_load(..., aliases:false)` parsed valid YAML. It contains typed safe values for UA rejection/nonzero exit, non-factual graph inference, accessibility provision, offensive controls false, untrusted execution false, credential controls false, Hermes approvals/workspace/one local gateway/gate outputs, NVD pagination/6-second/max-3/defer/last-good, milestone roles, and exact fallback columns/tracks. |
| Hermes/CTI/UA/graph retention | PASS | The human-readable sections retain non-root allowlist/local-only/single scheduler/separate messaging-browser approval and trusted gate fields; NVD pagination/date batching, six-second pacing, bounded retry/defer/last-good; complete raw plus vulnerability/signal/attack schemas; absent/null/unknown distinction; live/fallback LO1 honesty; UA complete-batch/freshness/invariants; directed-to-simple-undirected projection rules; verified insight/rejected inference boundary. |
| Safety retention | PASS | Public-data-only policy, offensive/PII/credential prohibitions, retention/deletion ownership, NCP teardown/cost boundary, captions/transcripts/accessibility provision, and inert Markdown/data-only non-execution rule are all explicit. Static scan found no active HTML/executable URI or secret/PII-shaped value. |
| Parser/render surface | PASS | Current checker exited 0. `pandoc -f gfm -t html5` produced 53,501 bytes, 10 H2s, and 11 tables. Glow at widths 160 and 400 produced nonempty 105,263- and 146,824-byte views without ellipsis. |
| Whitespace and protected state | PASS | `git diff --no-index --check /dev/null target` had the expected new-file exit 1 with 0 diagnostic bytes. Recomputed Todo 1 manifest: 142/142 paths, 0 mismatches. Index/staging was empty. |

## Exact independent invocations

```sh
ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb \
  output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
# PASS headings=10 weeks=15 topic_ids=15 milestones=7 evidence_ids=49
#      fallbacks=6 weights=20/40/40 rubrics=40/40 carry=PASS

ruby -rpsych -e '<safe-load YAML and exact typed-contract assertions>' target
# YAML_CONTRACT_PASS

ruby -e '<exact headings/weeks/topic IDs/cadence assertions>' target
# STRUCTURE_PASS h2=10 weeks=15 instructional=13 exams=8,15 topics=15

ruby -e '<LO/rubric/49-ID/six-track assertions>' target
# ALIGNMENT_PASS lo=5 evidence_ids=49 grades=20/40/40 rubrics=40/40 fallbacks=6

pandoc -f gfm -t html5 target -o /tmp/.../syllabus.html
glow -w 160 -s dark target
glow -w 400 -s dark target
```

The isolated render directory was deleted after inspection. No cloud, Hermes, cron,
live CTI, LLM, UA, wiki, or external-state action was performed.

## Manual QA matrix

```yaml
surfaceEvidence:
  - scenarioId: T7-S1
    criterionReference: Todo 7 structure and assembly acceptance
    surface: Ruby CLI parser plus current read-only checker
    exactInvocation: ruby syllabus_check.rb target; independent Ruby exact-set assertions
    verdict: PASS
    artifactRefs: [this_report]
  - scenarioId: T7-S2
    criterionReference: machine-readable safety/operation contract
    surface: Psych YAML parser
    exactInvocation: Psych.safe_load(yaml_block, aliases:false) plus typed value assertions
    verdict: PASS
    artifactRefs: [this_report]
  - scenarioId: T7-S3
    criterionReference: rendered student/instructor reading surface
    surface: Pandoc HTML and Glow terminal rendering
    exactInvocation: pandoc -f gfm -t html5; glow -w 160; glow -w 400
    verdict: PASS
    artifactRefs: [this_report]
adversarialCases:
  - scenarioId: T7-A1
    criterionReference: forbidden active/sensitive content boundary
    adversarialClass: static content injection indicators
    expectedBehavior: no script/event-handler/executable URI or secret/PII-shaped value exists
    verdict: PASS
    artifactRefs: [this_report]
  - scenarioId: T7-A2
    criterionReference: protected dirty-worktree boundary
    adversarialClass: integrity drift
    expectedBehavior: all 142 pre-existing protected hashes remain exact
    verdict: PASS
    artifactRefs: [this_report]
artifactRefs:
  - id: this_report
    kind: independent Todo 7 verification receipt
    path: .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-7-adversarial-verify-v3.md
```

## Scope and cleanup

Only this report was written by this verifier. The syllabus, checker, plan, ledger,
Boulder state, protected files, and external systems were not modified. No staged
files exist. The report is valid only for the target SHA stated above.
