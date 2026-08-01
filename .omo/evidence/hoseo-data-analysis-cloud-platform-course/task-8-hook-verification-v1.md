# Todo 8 hook-run direct verification

This receipt was created after the executor stop-hook challenge. It records fresh command output rather than relying on prior reports.

## Invocations and binary observables

```text
ruby -c syllabus_check.rb
Syntax OK

ruby syllabus_check.rb output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
PASS headings=10 weeks=15 topic_ids=15 milestones=7 evidence_ids=49 fallbacks=6 weights=20/40/40 rubrics=40/40 carry=PASS

ruby task-8-regression.rb
REGRESSION PASS controls=57 pass_verdicts=57

pandoc --standalone --from gfm --to html5 …
PANDOC PASS bytes=47416 tables=11/11 active=0

glow --width 160 …
GLOW PASS bytes=83488 lines=493
```

The corrupt syllabus invocation exits 1 and emits both required diagnostics: `missing week 8 or week 15 exam` and `grading mismatch`. The direct protected-manifest comparison reports `PROTECTED PASS paths=142 mismatches=0`.

## Bound hashes

- checker SHA-256: `f16029dbf2aaf00f0f06c6d9e76f8bac76d95321b2f3c2952365f30f98807a7f`
- target SHA-256: `d062c7427f7b8a715f357f7d6f7e307f677fcd3b455c9b709c899ef192d52bee`

Cleanup receipt: `/tmp/t8-hook-regression.log` was removed by exact non-recursive unlink and verified absent. No server, browser context, port, container, or external resource was created.

Verdict: executor-local evidence confirmed. A new independent verifier for this exact checker hash has been started by the parent; this receipt does not substitute for that review.
