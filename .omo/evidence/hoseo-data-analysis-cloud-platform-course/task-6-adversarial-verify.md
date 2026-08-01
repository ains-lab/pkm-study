# Todo 6 AdversarialVerify

```yaml
AdversarialVerify:
  task: "6. Prepare assessment, governance, accessibility, and six-track fallback brief"
  reviewed_at_utc: 2026-07-29T06:02:24Z
  verdict: confirmed
  confidence: 0.99
  scope: "Todo 6 evidence only; no syllabus, implementation, Todo 8, or final-gate input"
  independent_reviewer: true
  implementation_or_rewrite_by_reviewer: false
```

## Verdict basis

Todo 6 is confirmed. An independent strict Markdown-table parser found exactly three weighted categories in the required order (`출석 20%`, `중간 실기 40%`, `기말 실기 40%`), total `100`, and exactly six fallback rows with the exact six columns. Every fallback row has six nonempty cells, including nonempty `preserved competency`, `lost competency`, and `allowed claim`. All nine required policy phrases, all eight prohibited-security literals, and eleven operational contract literals are present.

The Korean rendered surface preserves the intended policy: attendance cannot replace a missing technical outcome; 2–3-person integration work is formative and unweighted; both exams require individual evidence; every fallback states what remains assessable, what is lost, and the narrow claim allowed. Absence and evidence-retention decisions are explicitly deferred to `학칙/담당자 정책 적용`; there is no HoSeo-specific absence penalty, numeric absence formula, or fixed retention period. This verdict ignores worker success prose as authority and uses no unrelated final-gate inputs.

## Evidence inspected

- `AGENTS.md`, the complete plan, `SCHEMA.md`, `index.md`, and the latest repository log entries
- `task-6-governance-assessment.md` and `task-6-governance-check.txt` in full
- Todo 1 baseline, protected SHA-256 manifest, and first-party source ledger
- `.omo/drafts/hoseo-data-analysis-cloud-platform-course.md` in full
- `concepts/agentic-ai-safety-governance.md:18-42`
- `concepts/agentic-workspace.md:18-36`
- `raw/blog/hermes-agent-cron-llm-wiki-knowledge-graph.md:696-724`

The cited local ranges support the brief's access/tool boundaries, approval, runtime monitoring, isolation, audit/recovery, human gate, unattended-cron restriction, raw immutability, external-instruction trust boundary, and prompt/log secret prohibition.

## Independent acceptance reproduction

The strict checker was invoked as follows (the full body shown here is the body used for both the real and malformed targets):

```sh
ruby - .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-6-governance-assessment.md <<'RUBY'
path = ARGV.fetch(0)
text = File.read(path, encoding: "UTF-8")

def section(text, heading)
  match = text.match(/^## #{Regexp.escape(heading)}\n(.*?)(?=^## |\z)/m)
  abort("FAIL missing section=#{heading}") unless match
  match[1]
end

def table_rows(body)
  body.lines.select { |line| line.start_with?("|") }.map do |line|
    line.chomp.sub(/\A\|/, "").sub(/\|\z/, "").split("|", -1).map(&:strip)
  end
end

def separator_row?(row)
  row.all? { |cell| cell.match?(/\A:?-{3,}:?\z/) }
end

weighted = table_rows(section(text, "평가 방법"))
abort("FAIL weighted row count=#{weighted.length - 2}") unless weighted.length == 5
abort("FAIL weighted header") unless weighted[0] == ["평가 범주", "비중", "채점 증거와 판정"]
abort("FAIL weighted separator") unless weighted[1].length == 3 && separator_row?(weighted[1])
weighted_data = weighted.drop(2)
abort("FAIL incomplete weighted row") unless weighted_data.all? { |row| row.length == 3 && row.all? { |cell| !cell.empty? } }
expected_weights = [["출석", "20%"], ["중간 실기", "40%"], ["기말 실기", "40%"]]
abort("FAIL weighted categories") unless weighted_data.map { |row| row.first(2) } == expected_weights
weight_values = weighted_data.map do |row|
  match = row[1].match(/\A(\d+)%\z/)
  abort("FAIL malformed weight") unless match
  match[1].to_i
end
abort("FAIL weighted total=#{weight_values.sum}") unless weight_values.sum == 100

fallback = table_rows(section(text, "여섯 트랙 장애 대체 매트릭스"))
expected_header = ["live evidence", "instructor fixture", "manifest/hash", "preserved competency", "lost competency", "allowed claim"]
abort("FAIL fallback row count=#{fallback.length - 2}") unless fallback.length == 8
abort("FAIL fallback header") unless fallback[0] == expected_header
abort("FAIL fallback separator") unless fallback[1].length == 6 && separator_row?(fallback[1])
fallback_data = fallback.drop(2)
abort("FAIL incomplete fallback row") unless fallback_data.all? { |row| row.length == 6 && row.all? { |cell| !cell.empty? } }
tracks = fallback_data.map do |row|
  match = row[0].match(/\A\*\*(NCP|Hermes|CTI API|LLM enrichment|UA generation|graph analysis)\*\*:/)
  abort("FAIL malformed track label") unless match
  match[1]
end
expected_tracks = ["NCP", "Hermes", "CTI API", "LLM enrichment", "UA generation", "graph analysis"]
abort("FAIL fallback tracks") unless tracks == expected_tracks
abort("FAIL preserved/lost/allowed empty") unless fallback_data.all? { |row| row.values_at(3, 4, 5).all? { |cell| !cell.empty? } }

required_phrases = ["프로젝트 별도 점수 없음", "개인 실행 증거", "학칙/담당자 정책 적용", "자막", "대본", "접근 가능한 대체 자료", "보존", "삭제", "비밀정보"]
prohibited_security = ["malware execution", "exploit proof-of-concepts", "active scanning", "live victim/organization logs", "PII", "credential collection", "login-gated scraping", "automatic patching/response"]
operational_contract = ["LMS 동영상 완료 기록", "2~3인", "모든 실습 증거 가족", "공개 데이터", "redaction", "Cost Explorer", "public IP 해제", "teardown", "API 또는 LLM outage", "golden fixture", "known limitations"]
missing = (required_phrases + prohibited_security + operational_contract).reject { |literal| text.include?(literal) }
abort("FAIL missing literals=#{missing.inspect}") unless missing.empty?

absence_formula = text.lines.any? { |line| line.match?(/(?:공결|결석).{0,120}(?:\d+\s*%|\d+\s*점|회당)/) }
fixed_retention = text.lines.any? { |line| line.match?(/보존.{0,120}\d+\s*(?:일|주|개월|년)/) }
abort("FAIL invented absence formula") if absence_formula
abort("FAIL invented fixed retention") if fixed_retention
abort("FAIL absence deferral missing") unless text.include?("이 브리프는 결석 감점식이나 대체 출석 규칙을 만들지 않는다.")
abort("FAIL retention deferral missing") unless text.include?("이 브리프는 고정 보존 기간을 발명하지 않는다.")

puts "PASS weighted_rows=#{weighted_data.length} total=#{weight_values.sum} fallback_rows=#{fallback_data.length} columns=#{fallback[0].length} complete_rows=#{fallback_data.count { |row| row.all? { |cell| !cell.empty? } }} required_phrases=#{required_phrases.length} prohibited_security=#{prohibited_security.length} operational_contract=#{operational_contract.length} absence_formula=#{absence_formula} fixed_retention=#{fixed_retention}"
RUBY
```

Result: exit `0`.

```text
PASS weighted_rows=3 total=100 fallback_rows=6 columns=6 complete_rows=6 required_phrases=9 prohibited_security=8 operational_contract=11 absence_formula=false fixed_retention=false
```

An earlier reviewer-only guard used a cross-line regular expression and exited `1` with `FAIL invented absence formula` because it reached the next table row's `40%`. That was a checker false positive, not an artifact failure. The reproduced checker above scopes the two negative-pattern checks to individual lines and passed. The failed attempt was not represented as success.

## Malformed-input proof and cleanup

Exact setup and mutation:

```sh
qa_tmp=$(mktemp -d /tmp/hoseo-t6-adversarial.XXXXXX)
cp .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-6-governance-assessment.md "$qa_tmp/task-6-hermes-lost-blank.md"
```

`qa_tmp` was `/tmp/hoseo-t6-adversarial.NhJLxD`. `apply_patch` changed only the copied Hermes row from its nonempty `lost competency` text to `|  |`. The patch wrapper reported the expected path-outside-cwd LSP diagnostic, but direct `rg -n -F '**Hermes**'` and `sed -n '22,26p'` proved the mutation had applied. This diagnostic was not counted as a pass.

The exact Ruby body above was then invoked with `/tmp/hoseo-t6-adversarial.NhJLxD/task-6-hermes-lost-blank.md` as `ARGV[0]`, with its exit explicitly required to be nonzero:

```text
FAIL incomplete fallback row
negative_exit=1 expected_nonzero=true
wrapper_exit=0
```

The copied file was deleted with `apply_patch`, followed by:

```sh
rmdir /tmp/hoseo-t6-adversarial.NhJLxD
test ! -e /tmp/hoseo-t6-adversarial.NhJLxD
```

Result: `cleanup_exit=0 temp_absent=true`.

## Rendered Korean manual QA

Exact rendering command:

```sh
set -o pipefail
pandoc -f gfm -t plain --columns=100 .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-6-governance-assessment.md | sed -n '1,240p'
```

Result: exit `0`; both tables and every policy section rendered nonempty with intact Korean content. Direct semantic inspection found:

| Track | Preserved / lost / allowed-claim judgment |
| --- | --- |
| NCP | Preserves design/rule/cost-teardown reasoning; loses actual provisioning, public connection, alerts, and teardown; forbids claiming live NCP/cost. |
| Hermes | Preserves safe-config and failure/last-good interpretation; loses systemd persistence, scheduler/cron, and live recovery; Docker remains fixture-only. |
| CTI API | Preserves provenance, normalization, dedupe, and failure handling; loses current availability/freshness/rate-limit interaction; forbids live/current claims. |
| LLM enrichment | Preserves source checking and rejection of model overclaim; loses current response/availability/new enrichment; forbids latest/factual-relation claims. |
| UA generation | Preserves structural/batch/freshness-report judgment over a pinned graph; loses new generation/enrichment; forbids claiming a fresh graph. |
| graph analysis | Preserves reproducible projection/metrics and checked/rejected interpretation; loses live/current generalization; forbids factualizing inferred edges. |

Attendance evidence, individual authorship, minimum mastery, public-data-only scope, all offensive prohibitions, redaction, policy-owned retention/deletion, NCP cost/full teardown, captions/transcripts/access alternatives, bounded outage recovery, and owner/schema/hash/refresh preflight are coherent and visible after rendering.

## Secrets, PII, stale state, and write scope

The two Todo 6 worker artifacts were scanned with a Ruby regex map for private-key blocks, AWS/GitHub/Slack token shapes, bearer secrets, credential assignments, embedded basic auth, email, Korean RRN, and Korean mobile-number patterns. Exact result:

```text
exit=0
files_scanned=2 private_key=0 aws_access_key=0 github_token=0 slack_token=0 bearer_secret=0 credential_assignment=0 embedded_basic_auth=0 email=0 korean_rrn=0 phone=0
```

Prompt-injection-shape `rg -ni` over the Todo 6 artifacts, Todo 1 ledger, draft, and all three cited local sources returned exit `1` (no match); the brief also explicitly treats official pages as evidence rather than instructions. No external text was executed.

The Todo 1 manifest was independently reparsed and all protected hashes recomputed:

```text
declared=142 rows=142 unique=142 sorted=true exact_current_scope=true hash_mismatches=0
manifest_exit=0 status_diff_exit=0 staged_exit=0 task6_scope_exit=0 task6_files=2 whitespace_exit=1 whitespace_diagnostic_bytes=0
```

`status_diff_exit=0` is the byte-for-byte comparison of fresh `git status --short` with Todo 1's captured baseline. `task6_scope_exit=0` proves the only pre-review `task-6-*` files were the assigned assessment and check artifacts. `git diff --no-index --check /dev/null task-6-governance-assessment.md` returned the normal untracked-file difference exit `1` with zero whitespace diagnostic bytes. Artifact hashes at review time were:

```text
d5bf05f354ae48106fb4866b5708675fe9e2f3326d076f69de6d95f1eb4d8c0b  task-6-governance-assessment.md
037f8ec40aa6de90da404eda756337222ed670d95751552f0a80dc8452502e02  task-6-governance-check.txt
```

Fresh inspection, the `as_of`/`refreshed_at`/refresh-checkpoint contract, zero protected hash drift, and the explicit rejection of fixed absence/retention rules address stale state. No cloud, Hermes, cron, live CTI, UA generation, server, browser, or external state was touched by this review.

## Adversarial matrix

| Class | Verdict | Probe / reason |
| --- | --- | --- |
| `malformed_input` | PASS | The copied brief with the Hermes `lost competency` cell blank made the same parser exit `1` with `FAIL incomplete fallback row`. |
| `prompt_injection` | PASS | Injection-shape scan found no match; local/external source text was treated only as evidence; the brief explicitly rejects executing web-page instructions. |
| `stale_state` | PASS | Current files were reread, hashes recomputed, source/fixture refresh ownership checked, and absence/retention numeric-policy scans were negative. |
| `dirty_worktree` | PASS | Protected 142-file manifest has zero mismatches; baseline/current short status is identical; no staged path; exactly two pre-review Todo 6 worker files. |
| `misleading_success_output` | PASS | Worker `PASS` prose was ignored. The real brief and malformed copy were independently parsed with opposite exit statuses; the reviewer's initial false-positive regex was disclosed and corrected. |
| `cancel_resume` | N/A | This bounded two-document evidence task has no resumable workflow or checkpointed state transition. |
| `repeated_interruptions` | N/A | No interruption-sensitive service, merge, batch, or external operation is part of Todo 6. |
| `hung_long_commands` | N/A | All probes are finite local reads/parses/renders; no polling, network request, service, or long-running command was used. |
| `flaky_tests` | N/A | The parser, SHA-256, literal, status, and regex checks are deterministic and have no timing or external dependency. |

## Cleanup

```yaml
cleanup:
  temporary_copy_absent: true
  persistent_qa_assets_remaining: 0
  external_state_mutations: 0
  protected_files_modified_by_reviewer: 0
  only_reviewer_write: .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-6-adversarial-verify.md
```

Post-write self-integrity: the receipt is nonempty; the assessment and worker check still match the two hashes above; the exact `task-6-*` set is now the assessment, worker check, and this receipt; whitespace diagnostics are empty; and the three-file secret/PII scan has zero hits in all ten categories. Expanded porcelain comparison against the pre-write snapshot found this receipt plus three concurrent sibling verifier receipts (`task-3-adversarial-verify.md`, `task-4-adversarial-verify.md`, `task-5-adversarial-verify.md`), with no removed entry. Those three paths are outside this review's ownership and were neither modified nor removed.
