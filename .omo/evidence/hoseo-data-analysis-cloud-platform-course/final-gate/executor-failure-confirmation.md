# Executor failure confirmation

This is a blocked-gate reproduction, not a completion report.

Target checked: `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`.
Checker checked: `syllabus_check.rb` before any repair.

Invocation: a Ruby `Dir.mktmpdir('t8-failure-confirm')` harness copied the target, made one mutation per copy, invoked `ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb <copy>`, and removed every copy at block exit.

Observed output:

```text
extra-weight exit=0 first=PASS headings=10 weeks=15 topic_ids=15 milestones=7 evidence_ids=49 fallbacks=6 weights=20/40/40 rubrics=40/40 carry=PASS
data-only-inversion exit=0 first=PASS headings=10 weeks=15 topic_ids=15 milestones=7 evidence_ids=49 fallbacks=6 weights=20/40/40 rubrics=40/40 carry=PASS
```

The extra-weight mutant appended a fourth `과제 | 10%` grading row. The data-only mutant retained the positive token while changing the policy to `절대 실행하지 않는 것은 아니다`. Both must be rejected before the final gate can pass.

Cleanup receipt: the temporary directory was created by `Dir.mktmpdir` and removed at block exit. No target, checker, plan, ledger, protected path, process, port, browser context, cloud resource, or external state was changed.
