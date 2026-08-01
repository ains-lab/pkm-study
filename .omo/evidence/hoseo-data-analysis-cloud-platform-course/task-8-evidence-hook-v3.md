# Todo 8 repeated evidence-hook verification

Fresh direct invocation after the second evidence-hook challenge:

```text
Syntax OK
PASS headings=10 weeks=15 topic_ids=15 milestones=7 evidence_ids=49 fallbacks=6 weights=20/40/40 rubrics=40/40 carry=PASS
REGRESSION PASS controls=153 pass_verdicts=153
SHA PASS checker=de2cd490ff6f38289e25162ba68be640646682c80676c57854f6c5623e8f8241 target=d062c7427f7d6f7e307f677fcd3b455c9b709c899ef192d52bee
```

The persistent regression runs the real checker on temporary file copies; all 153 verdicts are PASS. Cleanup receipt: exact temporary transcript `/tmp/t8-evidence-hook-v3.log` was unlinked and verified absent. No persistent runtime resource was created.

Verdict: executor-local evidence remains current. This receipt is not a final-gate or independent-verifier verdict.
