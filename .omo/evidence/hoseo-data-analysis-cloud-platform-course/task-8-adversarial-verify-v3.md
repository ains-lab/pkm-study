# Todo 8 independent adversarial verification v3

```yaml
task: "8. Validate structure, failure detection, rendering, and protected-state integrity"
verdict: needs-fix
confidence: 0.99
independent_reviewer: true
target: output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
target_sha256: d062c7427f7b8a715f357f7d6f7e307f677fcd3b455c9b709c899ef192d52bee
checker: .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb
checker_sha256: f16029dbf2aaf00f0f06c6d9e76f8bac76d95321b2f3c2952365f30f98807a7f
only_persistent_write: .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-adversarial-verify-v3.md
```

## Verdict

`needs-fix`. The real target is structurally valid and the persisted 57-control harness passes, but the checker has reproducible false successes for semantic-token stuffing and safety-policy inversions, plus a meaning-preserving Korean NVD false failure. It must not be used as the final Todo 8 certification at checker SHA `f16029dbf2aaf00f0f06c6d9e76f8bac76d95321b2f3c2952365f30f98807a7f`.

## Exact real invocations

```sh
ruby -c .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb
ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb \
  output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb
```

Results:

```text
Syntax OK                                  exit=0
PASS headings=10 weeks=15 topic_ids=15 milestones=7 evidence_ids=49 fallbacks=6 weights=20/40/40 rubrics=40/40 carry=PASS
target checker                             exit=0
persisted regression controls=57 failures=0 exit=0
```

The regression script uses the real Ruby CLI and temporary copies. Its green result does not cover the independently invented controls below.

## Independent black-box mutation matrix

Every mutation was a full UTF-8 copy of the target in a distinct `Dir.mktmpdir` path and was passed to the real checker as `ruby syllabus_check.rb <copy>`. The expected result is based on the approved plan's safety and evidence contract.

| Case | Expected | Actual | First observable |
|---|---:|---:|---|
| M1 keeps every correct stable ID but each cell is only required-token soup plus `바나나` | 1 | **0** | normal `PASS ... carry=PASS` |
| M6 retains `partial`, `stale`, `nonzero`, `거절`, then says the validator may return result code `0` | 1 | **0** | normal `PASS ... carry=PASS` |
| Graph `relation` retains source/hypothesis wording, then makes it an actual concluded fact | 1 | **0** | normal `PASS ... carry=PASS` |
| Untrusted input retains `data-only`/execution-prohibited wording, then says to operate the command | 1 | **0** | normal `PASS ... carry=PASS` |
| Captions/transcript are said to be provided, then learners cannot read them | 1 | **0** | normal `PASS ... carry=PASS` |
| Offensive work is marked forbidden, then is operated as a class activity | 1 | **0** | normal `PASS ... carry=PASS` |
| Credentials are said not to be included, then API key is inserted into a prompt | 1 | **0** | normal `PASS ... carry=PASS` |
| Omit vulnerability `description` | 1 | 1 | `FAIL: vulnerability normalized schema carry-through missing` |
| Add duplicate `출석 20%` grade identity | 1 | 1 | `FAIL: grading mismatch: rows must have exact unique identities and weights` |
| Append `<script>void 0</script>` | 1 | 1 | `FAIL: active script or executable URI is forbidden` |
| Delete week 8 and change final to 30% | 1 | 1 | `FAIL: weeks must be the exact ordered multiplicity set 1..15` |
| Missing pathname | 1 | 1 | `FAIL: syllabus path is missing or unreadable` |
| Invalid UTF-8 (`ff fe`) | 1 | 1 | `FAIL: syllabus is not valid UTF-8` |
| NVD Korean paraphrase preserving page/date batching, 6-second pacing, retries, defer/no-publish, and last-good IDs | 0 | **1** | `FAIL: NVD batching/retry/defer carry-through missing` |
| Accessibility Korean paraphrase (`제공한다` → `함께 배포한다`) | 0 | 0 | normal PASS |

The NVD positive control replaced the complete sentence with:

```text
페이지와 날짜 단위 묶음 사이에는 6초 이상 간격을 확보한다. timeout, network error, HTTP 429은 Retry-After를 먼저 적용하고 없으면 증가 backoff로 세 번까지만 다시 시도한다. 한도를 넘긴 자료는 deferred_rate_limited로 분리해 publish하지 않고 last_good_run_id 및 last_good_sha256을 보존한다.
```

It preserves the technical meaning and required boundary but is rejected solely by surface-form matching. The seven bold exit-0 unsafe variants prove the converse: the same checker accepts unsafe wording when its narrow negative phrase list is avoided.

## Why this blocks certification

The checker can currently issue `carry=PASS` for a document that supplies no actual M1 evidence and reverses the key protections for UA validation, graph inference, untrusted content, accessibility, offensive work, and credentials. The positive NVD case also makes acceptable Korean authoring unnecessarily brittle. These are behavior defects, not a preference for a particular prose style.

Repair should replace the keyword/blacklist checks for free prose with a bounded structural contract or controlled machine-readable assertion, and separately test positive paraphrases and semantic inversions that do not reuse implementation blacklist phrases. Re-run an independent verifier after any checker change; this receipt cannot be reused for a new checker hash.

## Surface and integrity checks

```sh
pandoc --standalone --from gfm --to html5 \
  output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md -o <temp>/syllabus.html
NO_COLOR=1 COLUMNS=420 glow -w 400 -s dark \
  output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md > <temp>/glow-400.txt
```

```text
pandoc_exit=0 glow_exit=0
HTML: bytes=47416 h2=10 tables_open=11 tables_close=11 active=0
Glow: UTF-8=true bytes=128323 lines=276 ellipsis=0 replacement=0
```

Fresh SHA-256 recomputation of the Task 1 protected manifest produced `protected_rows=142 protected_mismatches=0`. The final target/checker hashes remain the values recorded above. A high-signal secret/PII scan over those two files had no matches. `git diff --no-index --check /dev/null <target>` had the expected new-file exit `1` and `diagnostic_bytes=0`.

## Cleanup

All custom mutant, missing-input, invalid-UTF8, HTML, and Glow files were created under unique `/tmp/hoseo-t8-v3-*` directories. Each directory was emptied and removed in the command that created it; `cleanup_dir_absent=true` was observed for render directories. No target, checker, plan, ledger, Boulder state, protected path, cloud resource, Hermes/cron state, wiki, UA artifact, server, browser, or container was changed. This report is the verifier's sole persistent write.
