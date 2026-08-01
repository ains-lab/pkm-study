# Todo 8 독립 적대적 검증 v5

```yaml
task: "8. Validate structure, failure detection, rendering, and protected-state integrity"
verdict: confirmed
review_mode: read-only
independent_reviewer: true
target: output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
target_sha256: 75df0f2733c5bf898b78ee531cbc13700aafcc359b4f7ea15d3a0c296d2c1e51
checker: .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb
checker_sha256: efab908d52db0049be5d7f1afaf7d78f814bbd9dc9360fe802c1577cfe2041cd
only_persistent_write: .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-adversarial-verify-v5.md
```

## Verdict

`confirmed`. 지정된 target/checker SHA-256와 일치한다. checker는 Ruby stdlib `YAML.safe_load`로 사람이 읽을 수 있는 typed contract를 엄격 비교하며, 예전의 전체 한국어 마일스톤·fallback·주차 문구 snapshot은 없다. 고정해야 하는 것은 YAML 타입/키/값, ID 배치·중복도, 행 shape, 산술, schema와 안전 극성이고, 개방형 한국어 교육 서술은 고정 문구가 아니다.

현재 target의 실제 서술도 검토했다. 15주/13개 수업+2개 개인 실기시험, LO1–LO5, 20/40/40, 6개 fallback, NCP/Hermes/CTI/UA 안전 경계, 공개 데이터·비실행·접근성·자격증명 금지 정책, CTI schema와 NVD retry 계약이 서로 모순되지 않는다. 개방형 한국어의 교육적 충분성은 이 자동 checker의 범위 밖이며 F1/F3의 독립 검토 범위다.

## manualQa

### surfaceEvidence

| Scenario | Criterion | Surface and exact invocation | Verdict | Observable evidence |
| --- | --- | --- | --- | --- |
| MQ-1 syntax and valid document | Todo 8 valid path | `ruby -c .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb`; `ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` | PASS | `Syntax OK`; valid target exit 0, `headings=10 weeks=15 topic_ids=15 milestones=7 evidence_ids=49 fallbacks=6 weights=20/40/40 rubrics=40/40 contract=PASS`. |
| MQ-2 persisted regression | Todo 8 regression contract | `ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb` | PASS | 78 real-checker controls: 8 accepts and 70 rejects; all expected exit codes matched. |
| MQ-3 rendering | Todo 8 GFM surface | `pandoc -f gfm -t html output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md -o /tmp/hoseo-t8-v5.html`; `glow -s dark -w 160 output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md > /tmp/hoseo-t8-v5-render.txt` | PASS | both exit 0; nonempty HTML (53,501 bytes) and terminal rendering (105,263 bytes); no `…`/`...` truncation marker found. |
| MQ-4 whitespace and staging | Todo 8 hygiene | `git diff --no-index --check /dev/null output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`; `git diff --cached --name-only` | PASS | normal new-file diff produced no whitespace diagnostics; staged-path output empty. |
| MQ-5 protected boundary | Todo 1 protected manifest | Ruby `Digest::SHA256.file` recomputation over the 142 manifest records in `task-1-protected-sha256.txt` | PASS | 142 parsed paths, 0 missing, 0 hash mismatches. |

### adversarialCases

All cases used a distinct `Dir.mktmpdir` copy and the production Ruby CLI. The temporary directory was automatically removed.

| Scenario | Criterion | Adversarial class | Expected behavior | Verdict | Observable diagnostic/result |
| --- | --- | --- | --- | --- | --- |
| AQ-1 to AQ-5 | open Korean semantic preservation | M1 happy wording, M2 fallback clause order, captions/transcript wording, week-4 operational order, NVD pagination/retry order | exit 0 | PASS (5/5) | each returned the valid-target PASS line. |
| AQ-6 | typed YAML | `accept: false` changed to string `"false"` | exit 1 | PASS | `contract root.ua.partial_stale.accept value/type mismatch`. |
| AQ-7 | typed YAML keys | `gateway_count` renamed | exit 1 | PASS | `contract root.hermes keys mismatch`. |
| AQ-8 | milestone structure | M1 stable ID changed to M2 | exit 1 | PASS | `M1-HAPPY stable ID placement/multiplicity mismatch`. |
| AQ-9 | normalized schema | vulnerability `description` removed | exit 1 | PASS | `vulnerability normalized schema carry-through missing`. |
| AQ-10 | exact assessment arithmetic | middle exam 40% changed to 30% | exit 1 | PASS | `grading mismatch: rows must have exact unique identities and weights`. |
| AQ-11 | inert Markdown | appended `<script>` | exit 1 | PASS | `active script or executable URI is forbidden`. |
| AQ-12 | safety polarity | explicit offensive prohibition changed to permission | exit 1 | PASS | `offensive prose contradicts the contract`. |
| AQ-13 | input boundary | missing pathname | exit 1 | PASS | `syllabus path is missing or unreadable`. |
| AQ-14 | input boundary | invalid UTF-8 bytes `ff fe` | exit 1 | PASS | `syllabus is not valid UTF-8`. |

## Contract and scope inspection

- No whole-file hash, `Digest`, `canonical_milestones`, or `canonical_fallbacks` oracle exists in the checker.
- `contract_spec` is a small visible typed YAML contract; recursive key-set and value/type equality protects policy-critical values without storing Korean prose.
- Stable `M#-ROLE`, topic and fallback IDs are bounded structural contracts. Payload checks reject empty/placeholder text, not legitimate Korean paraphrase.
- The target and checker were not modified. No cloud, Hermes, cron, wiki, or UA operation occurred.

## Artifact references and cleanup

- `task-8-regression.rb`, `task-8-regression.log`: persisted 78-control regression harness and receipt.
- `task-8-syllabus.html`, `task-8-render.txt`, `task-8-protected-sha256.txt`: executor-generated rendering and protected-state receipts; this verification independently reran the relevant surfaces.
- `/tmp/hoseo-t8-v5.html`, `/tmp/hoseo-t8-v5-render.txt`: transient render outputs from this review.
- Custom mutation inputs were in a `Dir.mktmpdir` scope and were automatically removed.

This report is the only persistent write by this verifier. No protected, canonical, raw, plan, ledger, Boulder, target, or checker file was edited.
