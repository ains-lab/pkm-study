# Todo 8 final independent adversarial verification v4

```yaml
task: "8. Validate structure, failure detection, rendering, and protected-state integrity"
verdict: confirmed
independent_reviewer: true
target: output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
target_sha256: d062c7427f7b8a715f357f7d6f7e307f677fcd3b455c9b709c899ef192d52bee
checker: .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb
checker_sha256: de2cd490ff6f38289e25162ba68be640646682c80676c57854f6c5623e8f8241
only_persistent_write: .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-adversarial-verify-v4.md
```

## Verdict

`confirmed`. The target and checker match the required SHA-256 values. The valid target exits 0; the persisted 153-control harness and an independent 30-control mutation set had zero false successes. Every adverse case exited 1 with the named contract diagnostic.

## Surface evidence

| Scenario | Exact invocation / surface | Verdict | Observable |
| --- | --- | --- | --- |
| Ruby syntax and valid target | `ruby -c .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb`; `ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` | PASS | `Syntax OK`; target exit 0 with `PASS headings=10 weeks=15 ... carry=PASS`. |
| Persisted closed-world controls | `ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb` | PASS | exit 0; 153 result lines; 0 `FAIL` verdict lines; 94 `canonical-*` controls. |
| Required corrupt copy | `ruby .../syllabus_check.rb .omo/evidence/hoseo-data-analysis-cloud-platform-course/corrupt-syllabus.md` | PASS | exit 1, including both `missing week 8 or week 15 exam` and grading mismatch. |
| Invalid input boundary | Checker on a missing temporary pathname and a temporary `ff fe` file | PASS | both exit 1 with stable unreadable-path and invalid-UTF-8 diagnostics. |
| Markdown surface | `pandoc --standalone --from gfm --to html5`; `NO_COLOR=1 COLUMNS=420 glow -w 400 -s dark` | PASS | Pandoc/Glow exit 0; HTML 47,416 bytes, 10 H2s, 11/11 tables, active content 0; Glow 128,323 bytes, 276 lines, valid UTF-8, ellipsis 0. |
| Whitespace and protected state | `git diff --no-index --check /dev/null <target>`; independent Ruby SHA-256 recomputation of Todo 1 manifest | PASS | normal new-file diff exit 1 with 0 diagnostic bytes; 142 protected rows, 0 missing, 0 mismatches; staged paths 0. |

## Independent adversarial cases

All mutations used a distinct `Dir.mktmpdir` copy and the real Ruby CLI. The temporary directories were automatically removed.

| Contract group | Cases | Result |
| --- | --- | --- |
| Milestone evidence | One individual `HAPPY` cell for each M1–M7 | 7/7 exited 1 with the matching `M# ... HAPPY canonical cell mismatch`. The persisted harness separately mutates all 49 M1–M7 cells. |
| Six fallback tracks | One individual live-evidence cell for NCP, Hermes, CTI API, LLM enrichment, UA generation, and graph analysis | 6/6 exited 1 with the matching fallback/cell diagnostic. The persisted harness separately mutates all 36 fallback cells. |
| Hermes contracts | Base contract, week 4 operation row, week 7 gate fields | 3/3 exited 1 with `Hermes base`, `week 4`, or `week 7` canonical mismatch. |
| NVD and UA | `resultsPerPage` carry-through; partial/stale UA policy | 2/2 exited 1 with named NVD or UA policy mismatch. |
| Safety / graph policy | Accessibility, offensive work, data-only execution, credentials | 4/4 exited 1 with named policy mismatch. The combined data/graph line covers graph-hypothesis promotion as well. |
| Schema / structural security | Individual omission of `description`, `kev_date_added`, `kev_due_date`; duplicate grade; appended `<script>` | 5/5 exited 1 with schema, grading, or active-content mismatch. |
| Boundary | Required corrupt file, missing path, invalid UTF-8 | 3/3 exited 1 with the expected stable diagnostics. |

Independent mutation summary: `controls=30 failures=0 cleanup=Dir.mktmpdir-auto`.

## Closed-world contract inspection

The checker contains readable `canonical_milestones`, `canonical_fallbacks`, `canonical_lines`, and `canonical_weeks` maps: respectively 7×7 milestone cells, 6×6 fallback cells, seven policy/default lines, and two ten-cell operational rows. It compares each named cell/line and emits a named mismatch; it has no `Digest`, `SHA256.hexdigest`, or target-file hash literal. Therefore the checker is not a whole-file-SHA tautology. The plan accepts this one approved deliverable, so arbitrary paraphrases are deliberately outside the acceptance contract.

## Artifact references

- `task-8-regression.rb` and `task-8-regression.log`: persisted 153-control harness.
- `corrupt-syllabus.md`: required persistent negative fixture.
- `task-8-syllabus.html`, `task-8-render.txt`, and `task-8-protected-sha256.txt`: Todo 8 generated surface and integrity receipts.

## Cleanup and scope

All v4 custom mutant, missing-path, invalid-UTF-8, Pandoc, Glow, and whitespace fixtures were created in `Dir.mktmpdir` scopes and removed automatically; the one transient regression capture was explicitly removed. No target, checker, plan, ledger, Boulder state, protected file, canonical wiki page, raw record, UA artifact, cloud resource, Hermes/cron state, or server/browser session was modified. This report is the sole persistent write by this verifier.
