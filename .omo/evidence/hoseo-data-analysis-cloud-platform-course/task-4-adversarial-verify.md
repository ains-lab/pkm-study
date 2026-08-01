# Todo 4 AdversarialVerify

```yaml
AdversarialVerify:
  task: "4. Prepare the Hermes/CTI progression and 40-point midterm brief"
  reviewed_at_utc: 2026-07-29T06:02:21Z
  verdict: confirmed
  confidence: 0.99
  scope: "Todo 4 evidence only; no unrelated final-gate requirement was applied"
  independent_reviewer: true
  implementation_or_rewrite_by_reviewer: false
```

## Verdict basis

Todo 4 is **confirmed**. Independent parsing found exactly instructional weeks 4, 5, 6, and 7 plus exam-only week 8; the individual rubric is exactly `10 + 10 + 12 + 8 = 40`; all eight raw-manifest fields and every normalized `vulnerability`, `signal`, and `attack` field are present; the CVE join, exact dedupe key, `absent`/`null`/`unknown`, idempotent rerun, redaction, last-good, and six negative/observation fixtures are internally consistent.

The Hermes contract includes non-root/headless/pinned installation evidence, `hermes doctor`, a minimal allowlist, local-only delivery, `Asia/Seoul`, one gateway scheduler, `approvals.mode: smart` with manual escalation, `cron_mode: deny`, messaging/browser denial unless separately approved, and no secret in config/prompt/stdout/log/cron output/history. The CTI allowlist is public CISA KEV, NVD 2.0, FIRST EPSS, and pinned ATT&CK STIX v19.1 only. Automatic exploitation, scanning, patching, isolation, and response are excluded.

The current first-party NVD page still states 5 requests per rolling 30 seconds without a key and 50 with a key, and recommends six seconds between requests. The brief correctly adds bounded retry, `Retry-After`, maximum three attempts, and deferred/quarantine handling for 429; those are course-side safety rules, not claimed NVD guarantees.

## Evidence inspected

- `AGENTS.md`, `SCHEMA.md`, `index.md`, and the latest 30 `log.md` operations
- `.omo/plans/hoseo-data-analysis-cloud-platform-course.md` in full, especially Todo 4
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-source-ledger.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-baseline-status.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-protected-sha256.txt`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-4-hermes-cti-module.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-4-hermes-cti-check.txt`
- `raw/blog/hermes-agent-cron-llm-wiki-knowledge-graph.md:413-442,444-503,530-621,623-724,781-816`
- `concepts/cyber-threat-intelligence-knowledge-graphs.md:18-41`
- Pinned Hermes install/cron/security documents at commit `0f64557c06f3e878fd9ec5170b9bca7f20e2778e`
- Current official NVD `Start Here` page

## Acceptance reproduction

| Criterion | Independent result |
| --- | --- |
| Week progression | PASS: headings are exactly `[4,5,6,7,8]`; weeks 4-7 each say `60분 비동기 동영상 + 120분 대면 실습`; week 8 says `개인 3시간 실기만 운영` and `신규 강의와 팀 제출은 없다` |
| Midterm arithmetic | PASS: named rows are `[10,10,12,8]`, sum `40`, with no team submission or extra team percentage |
| Hermes safety | PASS: every required account, install, health, allowlist, delivery, timezone, scheduler, approval, browser/messaging, and secret boundary is explicit |
| Public CTI allowlist | PASS: exactly CISA KEV, NVD CVE API 2.0, FIRST EPSS, and ATT&CK STIX v19.1 are authorized; external bodies are evidence, never instructions |
| Raw manifest | PASS: exact fields `source`, `request_url`, `retrieved_at_utc`, `sha256`, `etag`, `last_modified`, `http_status`, `content_type`; deliberately corrupting the ETag mapping was rejected |
| Normalized records | PASS: exact ordered field sets for `vulnerability`, `signal`, and `attack`; deliberately replacing `fixture_sha256` in the attack record was rejected |
| Join/dedupe/state | PASS: uppercase/trimmed CVE with anchored validation, exact key `(source,native_id,source_version_or_raw_sha256)`, zero duplicate growth, and distinct `absent`/`null`/`unknown` plus reason fields |
| Trigger/skip/failure | PASS: one triggered run, one skipped run with no collector/LLM call, and one semantic failure with zero publish and unchanged last-good ID/hash |
| Malformed/duplicate/429 | PASS: each maps respectively to quarantine/parse failure, dedupe with zero growth, and bounded retry then deferred/quarantine; success corruptions were rejected |
| Cancel/resume model | PASS: 429 resumes only on a later approved run while existing output is preserved; semantic failure retains `last_good_run_id` and `last_good_sha256` and records a resume condition rather than relabeling stale output |
| No misleading success | PASS: `last_status: ok` or file existence is explicitly insufficient; manifest, validation, published run ID, and redacted log must agree |
| Offensive/PII boundary | PASS: public-source-only and no exploit/scan/patch/response; no live target, victim log, credentials, or PII is requested |

## Exact commands and exits

### Structure, mappings, and in-memory corruptions

The independent Ruby invocation was:

```sh
ruby - .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-4-hermes-cti-module.md <<'RUBY'
# Read the UTF-8 document and return 0 only when all of these predicates hold:
# - headings == [4,5,6,7,8], weeks 4-7 have 60+120, and week 8 is exam-only;
# - named rubric rows == [10,10,12,8] and sum == 40;
# - the eight raw fields have their exact meanings;
# - vulnerability/signal/attack field arrays equal the Todo 4 contract;
# - uppercase CVE, exact dedupe key, idempotency, and absent/null/unknown hold;
# - every Hermes, public-source, NVD, last-good, redaction, and no-offense term holds;
# - changed/no-change/semantic-failure/malformed/duplicate/nvd-429 rows have exact safe mappings.
# Then replace, in memory only, each of the following and require the same checker to return 1:
#   malformed quarantine -> published success
#   duplicate growth 0 -> duplicate growth 1
#   bounded 429 defer/quarantine -> published success
#   ETag meaning -> Last-Modified
#   attack fixture_sha256 -> raw_sha256
RUBY
```

Observed outer exit: `0`. Binary observations:

```text
case=base checker_exit=0 failures=none
case=malformed_as_success checker_exit=1 rejected=true failures=malformed_mapping
case=duplicate_growth checker_exit=1 rejected=true failures=duplicate_mapping
case=rate_limit_as_success checker_exit=1 rejected=true failures=rate_mapping
case=corrupt_raw_mapping checker_exit=1 rejected=true failures=raw_mapping_etag
case=corrupt_attack_field checker_exit=1 rejected=true failures=normalized_attack
```

No copied or persistent fixture was used; all mutations existed only in Ruby memory.

### Current NVD wording

```sh
set -o pipefail
curl -fsSL --max-time 20 -A 'Mozilla/5.0-compatible-Todo4AdversarialVerify/1.0' https://nvd.nist.gov/developers/start-here | rg -n -i -C 2 '5 requests|50 requests|six seconds|6 seconds|rolling 30|30 second|rate limit'
```

Exit `0`. The first-party text showed public/no-key `5` and keyed `50` requests in a rolling 30-second window, plus the six-second recommendation. No CVE endpoint or CTI response feed was called by this verifier.

### Pinned Hermes source spot-check

```sh
curl -fsSL --max-time 20 https://raw.githubusercontent.com/NousResearch/hermes-agent/0f64557c06f3e878fd9ec5170b9bca7f20e2778e/website/docs/getting-started/installation.md | sed -n '113,144p'
curl -fsSL --max-time 20 https://raw.githubusercontent.com/NousResearch/hermes-agent/0f64557c06f3e878fd9ec5170b9bca7f20e2778e/website/docs/user-guide/features/cron.md | rg -n -i -C 1 'timezone|deliver local|gateway|cron_mode|approval|scheduler'
curl -fsSL --max-time 20 https://raw.githubusercontent.com/NousResearch/hermes-agent/0f64557c06f3e878fd9ec5170b9bca7f20e2778e/website/docs/user-guide/security.md | sed -n '30,80p'
```

All three fetch/scan pipelines exited `0`. The pinned documents corroborate unprivileged/headless installation and `hermes doctor`, gateway scheduler behavior, `approvals.mode` values, and default `cron_mode: deny`.

### Protected state and dirty worktree

```sh
LC_ALL=C find SCHEMA.md index.md log.md entities concepts comparisons queries raw .ua output -type f ! -path 'output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md' -print0 | ruby -rdigest -e '
manifest = ARGV.fetch(0)
rows = File.readlines(manifest, chomp: true).each_with_object([]) do |line, acc|
  match = line.match(/\A([0-9a-f]{64})  (.+)\z/)
  acc << [match[1], match[2]] if match
end
paths = rows.map(&:last)
current = STDIN.read.split("\0").reject(&:empty?).sort
mismatches = rows.count { |expected, path| !File.file?(path) || Digest::SHA256.file(path).hexdigest != expected }
missing = paths.count { |path| !File.file?(path) }
puts "manifest_rows=#{rows.length} current_rows=#{current.length} exact_path_set=#{paths == current} hash_mismatches=#{mismatches} missing=#{missing}"
exit(paths == current && mismatches.zero? ? 0 : 1)
' .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-protected-sha256.txt
```

Exit `0`: `manifest_rows=142 current_rows=142 exact_path_set=true hash_mismatches=0 missing=0`.

An initial version used Ruby `filter_map` and exited `1` with `NoMethodError` because the installed Ruby is older. That harness result was not reported as success; the compatible `each_with_object` invocation above was rerun and passed.

```sh
baseline=.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-baseline-status.txt
diff -u <(awk 'seen {print} /^exact_git_status_short_before_task_owned_writes:$/ {seen=1}' "$baseline") <(git status --short)
test -z "$(git diff --cached --name-only)"
```

Both commands exited `0`: the dirty-worktree status line set remains identical to Todo 1 and there are no staged paths.

### No observed Hermes/cron operation

```sh
module=.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-4-hermes-cti-module.md
receipt=.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-4-hermes-cti-check.txt
find /Users/sysmoon/.hermes -type f -newer "$module" ! -newer "$receipt" -print | wc -l
find /Users/sysmoon/.hermes/cron -type f -newer "$module" ! -newer "$receipt" -print | wc -l
```

Both counts were `0`; the combined assertion exited `0`. Together with exact protected hashes, no raw/canonical/UA/output drift, the implementation receipt, and the absence of any Hermes command in the Todo 4 validation, this confirms no observed Hermes install/configuration, gateway, cron, or live CTI collection operation during the Todo 4 implementation window. This is an artifact/state audit, not a claim that filesystem timestamps can prove an unobservable event.

### Secret and PII scan

```sh
ruby - .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-4-hermes-cti-module.md .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-4-hermes-cti-check.txt <<'RUBY'
# Count high-signal patterns for private keys, AWS/GitHub/Slack tokens, bearer values,
# JWTs, URL credentials, non-redacted credential assignments, email addresses,
# Korean resident-registration numbers, and Korean mobile numbers; exit 1 on any hit.
RUBY
```

Exit `0`:

```text
files_scanned=2 private_key=0 aws_access_key=0 github_token=0 slack_token=0 bearer_secret=0 jwt=0 url_credentials=0 credential_assignment=0 email=0 korean_rrn=0 phone=0
```

The injection-shape command below exited `1`, the expected no-match result:

```sh
rg -ni 'ignore (all|any|the|previous)|system prompt|developer message|assistant:|tool_call|BEGIN (SYSTEM|PROMPT)|you are (chatgpt|an ai)|follow these instructions|execute this command' .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-4-hermes-cti-module.md .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-4-hermes-cti-check.txt
```

### Render and Markdown integrity

```sh
NO_COLOR=1 glow -s notty -w 180 .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-4-hermes-cti-module.md
pandoc -f gfm -t html .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-4-hermes-cti-module.md | ruby -e 'html = STDIN.read; puts "html_bytes=#{html.bytesize} h2=#{html.scan(/<h2/).length} tables=#{html.scan(/<table/).length}"; exit(html.bytesize > 0 && html.scan(/<table/).length >= 6 ? 0 : 1)'
git diff --no-index --check /dev/null .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-4-hermes-cti-module.md
```

Glow exited `0`. Pandoc exited `0` with `html_bytes=22507 h2=8 tables=7`. The no-index whitespace command returned the normal new-file diff code `1` with zero diagnostics; the wrapper normalized that expected condition to exit `0`.

## Manual rendered QA

**PASS.** The 180-column Glow rendering preserved readable Korean headings and all seven tables. The teaching flow is clear: safe Hermes install/health → dated public CTI provenance → idempotent normalization and negative fixtures → scheduler observation/recovery → individual exam. Week 8 is visibly exam-only. The rubric rows and 40-point total are legible. Wide field lists wrap across terminal lines but remain inside their table rows and do not change meaning.

Manual semantic review also confirmed that a fixture is never presented as live success, a semantic failure remains a failure while last-good is preserved, a skipped run makes zero collector/LLM calls, redacted evidence contains no secret example, and 2–3-person collaboration earns no additional percentage.

## Adversarial matrix

| Class | Verdict | Probe and observable |
| --- | --- | --- |
| `malformed_input` | PASS | The valid row maps damaged JSON/truncated STIX to quarantine/parse failure and zero publish. Replacing it with `published success` produced checker exit `1`. |
| `prompt_injection` | PASS | External/raw bodies are explicitly data, never instructions; embedded prompt/URL/commands must not execute. Injection-shape scan had zero matches and the four-source allowlist is closed. |
| `stale_state` | PASS | CTI observations are dated, ATT&CK/Hermes are pinned, moving latest is rejected as a mastery threshold, and last-good ID/hash must remain unchanged on failure. Current NVD semantics were freshly rechecked. |
| `dirty_worktree` | PASS | All 142 protected paths and hashes match Todo 1, current status equals the recorded baseline, and staging is empty. No unrelated path was reverted or normalized. |
| `misleading_success_output` | PASS | `last_status: ok` and file existence are expressly insufficient. Corrupted success mappings failed. The review records the first incompatible Ruby command as exit `1` and relies only on the successful compatible rerun. |
| `cancel_resume` | PASS | The last-good model is explicit: semantic failure publishes zero and preserves ID/hash; exhausted 429 is deferred/quarantined and resumes only at a later approved execution without overwriting the prior result. |
| `repeated_interruptions` | N/A | Todo 4 creates a static course brief, not an interruptible runtime. Its relevant recovery semantics are fully covered by the tested last-good cancel/resume model. |
| `hung_long_commands` | N/A | Acceptance uses finite local reads/parsers. The two documentation checks were explicitly bounded by `--max-time 20`; no service or long-running process was started. |
| `flaky_tests` | N/A | Week, field, rubric, mapping, mutation, hash, and render checks are deterministic. The volatile NVD fetch corroborates dated wording but is not silently converted into a permanent fixture threshold. |

## Cleanup

No temporary file, copied fixture, cache, process, server, browser session, Hermes installation, gateway, cron job, CTI response capture, cloud resource, or wiki/UA operation was created. Network documentation was streamed to stdout only. The only reviewer-owned write is this receipt.

```yaml
cleanup:
  persistent_qa_assets_created: 0
  persistent_qa_assets_remaining: 0
  external_state_mutations: 0
  protected_files_modified_by_reviewer: 0
  receipt_written: .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-4-adversarial-verify.md
```
