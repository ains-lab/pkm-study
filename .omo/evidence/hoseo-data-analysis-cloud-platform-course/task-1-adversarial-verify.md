# Todo 1 AdversarialVerify

```yaml
AdversarialVerify:
  task: "1. Lock the dirty-worktree boundary and dated source baseline"
  reviewed_at_utc: 2026-07-29T05:46:58Z
  verdict: confirmed
  confidence: 0.99
  scope: "Todo 1 evidence only; this is not the plan Global Review gate"
  independent_reviewer: true
  implementation_or_rewrite_by_reviewer: false
```

## Verdict basis

All Todo 1 acceptance criteria passed independent reproduction. The four receipts are nonempty; the source ledger has every required key, exact first-party URL, dated value, unavailable path, and no-silent-refresh procedure; the protected manifest has exactly 142 sorted unique paths, covers all six pre-existing outputs, exactly matches the current protected path set, and has zero hash mismatches; the baseline predates the other Todo 1 receipts; and current `git status --short` exactly equals the captured baseline. The only files newer than the baseline before this receipt were the other three designated Todo 1 receipts and the separate `.omo` gate-review receipt.

The corroborating specialized review at `.omo/evidence/hoseo-data-analysis-cloud-platform-course-task-1-gate-review.md` also says the Todo 1 artifacts pass. Its `REJECT` recommendation depends only on unrelated final-gate code-review/notepad inputs. Those inputs are inapplicable to this evidence-only scoped verification and did not affect this verdict.

## Evidence inspected

- `.omo/plans/hoseo-data-analysis-cloud-platform-course.md` in full
- `AGENTS.md` in full, plus the repository orientation files required by it
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-baseline-status.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-protected-sha256.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-source-ledger.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-failure.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course-task-1-gate-review.md` as corroboration only

## Acceptance reproduction

| Criterion | Independent result |
| --- | --- |
| Four files nonempty | PASS: byte counts `3047`, `17389`, `11836`, `1285` |
| Required ledger keys and URLs | PASS: 28/28 exact required strings present; zero missing |
| Required dated values | PASS: CISA `2026.07.27` / `2026-07-27T19:00:15.8632Z`; NVD `2.0`, `5/30s`, keyed `50/30s`, six-second pacing; EPSS `2026-07-28`; ATT&CK fixture/latest `v19.1`; exact Hermes commit confirmed |
| Unavailable handling | PASS: bounded NCP documentation failures are labeled availability results, first-party retry/fallback is explicit, and versions must remain unavailable rather than be invented |
| Manifest exactness | PASS: declared/parsed/current counts all `142`; sorted; unique; exact current protected set; zero hash mismatches |
| Pre-existing output coverage | PASS: exactly six output paths, all six current pre-existing outputs, and future syllabus absent |
| Baseline chronology | PASS: baseline mtime `2026-07-29T14:24:17+0900`; all other Todo 1 receipts are later |
| Post-baseline attribution | PASS before this receipt: exactly three later designated Todo 1 files plus the `.omo` gate-review receipt; no product/canonical/raw/generated/output write |
| Dirty-worktree fidelity | PASS: captured baseline and fresh `git status --short` diff are byte-for-byte equal; staged-path list empty |
| Bounded invalid URL | PASS: HTTP `404`, curl exit `56`, `--max-time 5`; nonzero was inspected directly |
| No invented versions | PASS: every version/date is either reproduced from its first-party endpoint, an immutable pin, or explicitly unavailable; transient observations are dated rather than promoted to permanent thresholds |
| Secrets / PII | PASS: zero hits for private keys, common service-token forms, bearer secrets, credential assignments, email, Korean RRN, and phone patterns |

## Exact local repro and results

### Nonempty files and chronology

```sh
for f in .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-baseline-status.txt .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-protected-sha256.txt .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-source-ledger.md .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-failure.txt; do test -s "$f"; printf '%s exit=%s bytes=%s\n' "$f" "$?" "$(wc -c < "$f" | tr -d ' ')"; done
for f in .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-baseline-status.txt .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-protected-sha256.txt .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-source-ledger.md .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-failure.txt; do stat -f '%m %Sm %N' -t '%Y-%m-%dT%H:%M:%S%z' "$f"; done
```

Result: all `test -s` exits were `0`; byte counts were `3047`, `17389`, `11836`, and `1285`. Mtimes were baseline `14:24:17`, manifest `14:25:37`, failure `14:27:16`, ledger `14:33:46` Asia/Seoul.

### Protected manifest

```sh
LC_ALL=C find SCHEMA.md index.md log.md entities concepts comparisons queries raw .ua output -type f ! -path 'output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md' -print0 | ruby -rdigest -e '
manifest = ARGV.fetch(0)
rows = File.readlines(manifest, chomp: true).each_with_object([]) do |line, acc|
  match = line.match(/\A([0-9a-f]{64})  (.+)\z/)
  acc << [match[1], match[2]] if match
end
paths = rows.map(&:last)
current = STDIN.read.split("\0").reject(&:empty?).sort
mismatches = rows.each_with_object([]) do |(expected, path), acc|
  actual = File.file?(path) ? Digest::SHA256.file(path).hexdigest : "MISSING"
  acc << [path, expected, actual] unless actual == expected
end
manifest_count = File.read(manifest)[/^file_count: (\d+)$/, 1].to_i
output_paths = paths.grep(/\Aoutput\//)
checks = {
  declared_count_matches: manifest_count == rows.length,
  rows_142: rows.length == 142,
  paths_sorted: paths == paths.sort,
  paths_unique: paths.uniq.length == paths.length,
  exact_current_scope: paths == current,
  hashes_match: mismatches.empty?,
  output_count_6: output_paths.length == 6,
  future_syllabus_absent: !paths.include?("output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md")
}
puts "rows=#{rows.length} unique=#{paths.uniq.length} sorted=#{paths == paths.sort} current_scope=#{current.length} exact_current_scope=#{paths == current} hash_mismatches=#{mismatches.length} output_rows=#{output_paths.length}"
exit(checks.values.all? ? 0 : 1)
' .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-protected-sha256.txt
```

Result: exit `0`; `rows=142 unique=142 sorted=true current_scope=142 exact_current_scope=true hash_mismatches=0 output_rows=6`. The six rows are the four `ai-second-brain-*` artifacts and two `second-brain-pkm-architecture.*` artifacts. A first reviewer attempt using Ruby `filter_map` exited `1` because the installed Ruby lacks that helper; the compatible checker above was then run and passed. No artifact was changed by either read-only invocation.

### Baseline, dirty worktree, and post-baseline attribution

```sh
baseline=.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-baseline-status.txt
diff -u <(awk 'seen {print} /^exact_git_status_short_before_task_owned_writes:$/ {seen=1}' "$baseline") <(git status --short)
test -z "$(git diff --cached --name-only)"
test ! -e output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
find . -path ./.git -prune -o -type f -newer "$baseline" -print0 | ruby -e '
baseline, root = ARGV
baseline_time = File.mtime(baseline)
designated = %w[task-1-baseline-status.txt task-1-failure.txt task-1-protected-sha256.txt task-1-source-ledger.md].map { |name| File.join(root, name) }
ordered = designated.reject { |path| path == baseline }.all? { |path| baseline_time < File.mtime(path) }
exact_dir = Dir.glob(File.join(root, "*")).select { |path| File.file?(path) }.sort == designated.sort
newer = STDIN.read.split("\0").reject(&:empty?).map { |path| path.sub(%r{\A\./}, "") }.sort
allowed_newer = designated.reject { |path| path == baseline } + [".omo/evidence/hoseo-data-analysis-cloud-platform-course-task-1-gate-review.md"]
unexpected = newer - allowed_newer
puts "baseline_before_other_todo1=#{ordered} exact_todo1_dir=#{exact_dir} newer_file_count=#{newer.length} unexpected_newer=#{unexpected.length}"
exit(ordered && exact_dir && unexpected.empty? ? 0 : 1)
' "$baseline" .omo/evidence/hoseo-data-analysis-cloud-platform-course
```

Result before writing this receipt: exit `0`; status diff empty; staged list empty; future syllabus absent; `baseline_before_other_todo1=true exact_todo1_dir=true newer_file_count=4 unexpected_newer=0`. Newer paths were the three later Todo 1 receipts and the `.omo` gate-review receipt.

### Ledger strings and sensitive-data scan

The exact-string checker required 28 literals: the eight required keys/dated values/rate-limit phrases and all official NCP, Hermes, CISA, NVD, FIRST, and ATT&CK URLs listed in Todo 1. It returned:

```text
required_entries=28 missing=0 unavailable_and_refresh_handling=true
LEDGER_STRUCTURE_EXIT=0
```

The four-file sensitive-data checker returned:

```text
files_scanned=4 private_key=0 aws_access_key=0 github_token=0 slack_token=0 bearer_secret=0 credential_assignment=0 email=0 korean_rrn=0 phone=0
SECRET_PII_SCAN_EXIT=0
```

The prompt-injection-shape scan was:

```sh
rg -ni 'ignore (all|any|the|previous)|system prompt|developer message|assistant:|tool_call|BEGIN (SYSTEM|PROMPT)|you are (chatgpt|an ai)' .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-baseline-status.txt .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-protected-sha256.txt .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-source-ledger.md .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-failure.txt
```

Result: exit `1`, meaning no injection-shaped match. Direct inspection also confirmed the ledger explicitly treats external content as evidence data, never instructions.

## Exact first-party and malformed-input repro

```sh
curl --fail --max-time 5 -sS -o /dev/null -w 'http_code=%{http_code}\n' https://www.cisa.gov/__codex-intentionally-invalid__
```

Result: `http_code=404`, curl exit `56`; this is the required bounded nonzero failure.

```sh
curl -fsSL --max-time 20 https://www.cisa.gov/sites/default/files/feeds/known_exploited_vulnerabilities.json | jq -r '[.catalogVersion,.dateReleased,(.vulnerabilities|length)]|@tsv'
curl -fsSL --max-time 20 'https://api.first.org/data/v1/epss?limit=1&order=!date' | jq -r '[.status,.data[0].date,.data[0].cve]|@tsv'
curl -fsSL --max-time 20 https://api.github.com/repos/mitre-attack/attack-stix-data/releases/latest | jq -r '[.tag_name,.published_at,.html_url]|@tsv'
curl -fsSL --max-time 20 https://api.github.com/repos/NousResearch/hermes-agent/commits/0f64557c06f3e878fd9ec5170b9bca7f20e2778e | jq -r '[.sha,.html_url]|@tsv'
curl -fsSL --max-time 20 -A 'Mozilla/5.0-compatible-Todo1AdversarialVerify/1.0' 'https://services.nvd.nist.gov/rest/json/cves/2.0?resultsPerPage=1' | jq -r '[.format,.version,.resultsPerPage]|@tsv'
```

Results, each exit `0`:

```text
2026.07.27    2026-07-27T19:00:15.8632Z    1655
OK    2026-07-28    CVE-1999-0002
v19.1    2026-05-12T17:40:07Z    https://github.com/mitre-attack/attack-stix-data/releases/tag/v19.1
0f64557c06f3e878fd9ec5170b9bca7f20e2778e    https://github.com/NousResearch/hermes-agent/commit/0f64557c06f3e878fd9ec5170b9bca7f20e2778e
NVD_CVE    2.0    1
```

A bounded fetch and HTML-to-text check of `https://nvd.nist.gov/developers/start-here` returned exit `0` with `unkeyed_5_per_30s=true keyed_50_per_30s=true six_second_pacing=true`.

Recomputed response hashes matched the ledger exactly for CISA (`e032...170a`), EPSS (`02c8...26b3`), and ATT&CK (`66be...75be`). The NVD HTML body currently hashes differently (`9c12...6bb` versus the ledger's dated transient `7b08...1871`), while all three documented rate-limit semantics remain equal. The ledger correctly labels this HTML hash transient, so the body drift is not treated as a version change.

Bounded `curl --fail --max-time 20` checks returned HTTP `403` / exit `56` for the five NCP guide pages, while the pricing page returned HTTP `200` but timed out at the 20-second cap after receiving a large body. The pinned Hermes page currently returns HTTP `200` / exit `0`; the ledger's earlier `403` is explicitly a timestamped retrieval result, not a claim that the immutable commit is unavailable forever. The commit API independently confirmed the exact pin.

## Manual QA

Manual QA for this data-shaped task was direct artifact inspection plus real current-state reproduction. I read the complete source ledger, checked each source/value/unavailable statement against the plan, inspected all four evidence files, enumerated the six output rows in the manifest, recomputed all 142 protected hashes, compared the exact protected path set, and diffed the captured status block against fresh `git status --short`. Observable: all required source facts are dated or pinned, all missing-access cases preserve first-party fallback without invention, all protected files are unchanged, and no new non-evidence/product path is attributable to Todo 1.

## Adversarial matrix

| Class | Verdict | Probe and observable |
| --- | --- | --- |
| `malformed_input` | PASS | Exact invalid CISA URL with `--fail --max-time 5` returned HTTP `404`, curl exit `56`; fallback says `unavailable`, first-party retry, pinned fixture, never invent. |
| `prompt_injection` | PASS | Injection-shape scan found zero matches; external responses are explicitly data, not instructions; no response text was executed or copied as authority. |
| `stale_state` | PASS | Recomputed 142 hashes and exact current set; fresh CISA/EPSS/ATT&CK/Hermes/NVD checks reproduced semantic values. Transient NVD body drift and changed Hermes reachability were recognized as dated availability/content observations, not silently reused current claims. |
| `dirty_worktree` | PASS | Fresh status is byte-for-byte equal to baseline; no staged paths; newer-file audit found only designated Todo 1 receipts and `.omo` review state. |
| `misleading_success_output` | PASS | Verdict derives from exit codes, parsed values, exact set/hash comparison, and direct inspection rather than the worker's success prose. The incompatible first Ruby checker was not misreported as a pass; the compatible rerun passed. |
| `cancel_resume` | PASS | Baseline records all four artifacts absent before the successful run; current directory has exactly the four complete designated receipts, with no partial duplicate or future syllabus. |
| `repeated_interruptions` | PASS | Multiple recorded resume/stop-hook checks converge on the same final hashes/status; independent current reproduction again confirms complete artifacts and no stale temporary state. |
| `hung_long_commands` | N/A | All external calls were explicitly bounded: invalid probe at 5 seconds, every source call at 20 seconds or less. Local hash/status checks are finite local reads. |
| `flaky_tests` | N/A | All acceptance checks are deterministic file existence, literal, ordering, set, SHA-256, and status comparisons; volatile sources are dated observations, not test thresholds. |

## Cleanup

No server, process, browser session, container, cloud resource, cron job, canonical/wiki generator, or persistent QA fixture was created. Checks streamed responses and hashes without writing source bodies. `test ! -e /tmp/hoseo-t1-source.75583` and a `/tmp/hoseo-t1-review-*` search both passed; cleanup result was `CLEANUP_CHECK_EXIT=0 source_tmp_absent=true reviewer_tmp_absent=true`. One prospective temp-file command was rejected before execution, so it created nothing.

```yaml
cleanup:
  persistent_qa_assets_created: 0
  persistent_qa_assets_remaining: 0
  external_state_mutations: 0
  protected_files_modified_by_reviewer: 0
  receipt_written: .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-adversarial-verify.md
```

Post-write self-integrity check: `test -s` passed for this receipt; the baseline/current status diff remained empty; staged paths remained empty; all 142 protected hashes still matched; the newer-file set became exactly the three later Todo 1 receipts plus the gate-review receipt and this receipt (`newer=5 allowed=5 unexpected=0`); and the receipt itself had zero sensitive-pattern hits. Result: `POST_WRITE_VERIFY_EXIT=0`.
