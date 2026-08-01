# Todo 5 AdversarialVerify

```yaml
AdversarialVerify:
  task: "5. Prepare the LLM Wiki, UA, graph-analysis progression and 40-point final brief"
  reviewed_at_utc: 2026-07-29T06:01:53Z
  verdict: confirmed
  confidence: 0.97
  scope: "Todo 5 module/check evidence only; no unrelated final-gate inputs"
  independent_reviewer: true
  implementation_or_rewrite_by_reviewer: false
  persistent_write: ".omo/evidence/hoseo-data-analysis-cloud-platform-course/task-5-adversarial-verify.md"
```

## Verdict basis

Todo 5 is **confirmed**. Independent parsing found exactly weeks 9–14 once each with the required `60분 비동기 동영상 + 120분 대면 실습`, and week 15 once as a three-hour individual exam with no new lecture. The final rubric has exactly four 10-point rows totaling 40. The LLM Wiki contract, live/fallback UA invariants, freshness-versus-enrichment boundary, raw directed versus simple undirected projection, self-loop/multiedge/weight/tie/tolerance rules, three metric families, verified/rejected interpretations, and all seven lineage stages are explicit. The supplied happy and failure claims were not accepted on prose alone: each was independently reproduced.

One non-blocking evidence correction is required when reusing the original worker receipt: `task-5-wiki-ua-graph-check.txt` labels the graph mtime `2026-07-29T12:10:15Z`, while an independent epoch-based UTC read gives `2026-07-29T03:10:15Z`; `12:10:15` is the Asia/Seoul local time. The receipt explicitly says no run receipt exists and makes no fresh-generation or fresh-enrichment claim, and the hash matches the Todo 1 pinned baseline, so this labeling error does not falsify any Todo 5 acceptance criterion. The incorrect `12:10:15Z` value must not be reused as UTC freshness evidence.

## Evidence inspected

- `AGENTS.md`, `SCHEMA.md`, `index.md`, and the latest repository log entries
- `.omo/plans/hoseo-data-analysis-cloud-platform-course.md` in full, especially Todo 5 at lines 117–123
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-5-wiki-ua-graph-module.md`
- `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-5-wiki-ua-graph-check.txt`
- `concepts/llm-wiki.md`, `queries/ua-knowledge-graph-workflow.md`, `concepts/knowledge-graph-analysis.md`, and `concepts/cyber-threat-intelligence-knowledge-graphs.md`
- `raw/blog/hermes-agent-cron-llm-wiki-knowledge-graph.md` lines 576–621 and 660–724, read only
- `.ua/knowledge-graph.json` and `.ua/meta.json`, parsed read only with `jq`; no UA generation or dashboard launch
- Todo 1 status and protected-hash receipts, used only to establish this task's dirty-worktree boundary

## Acceptance reproduction

| Todo 5 criterion | Independent result |
| --- | --- |
| Weeks 9–14 plus exam-only week 15 | PASS: headings 9, 10, 11, 12, 13, 14, 15 each occur once; no other week heading; six instructional-time markers; week 15 has `3시간 개인 실기시험, 신규 강의 없음` and no instructional-time marker. |
| Final rubric | PASS: parsed points `[10, 10, 10, 10]`, sum `40`, and the rendered total is 40. |
| LLM Wiki contract | PASS: immutable `raw/`, leading frontmatter and all six required fields, exact raw source paths, registered tags, two resolvable links, index/log synchronization, confidence/contradiction/provenance rules, and lint-before-UA are explicit. |
| Live UA path | PASS: `understand-knowledge`, expected/completed batch equality and artifact presence, `PARTIAL_BATCH`, graph/meta newer than `run_started_at`, `kind == knowledge`, nonempty node array, edge/layer/tour arrays, unique IDs, zero dangling endpoints, and valid meta JSON are explicit. |
| Fallback UA path | PASS: instructor-owned pinned hash, fresh validation report, the same structural validation contract, and `fresh_enrichment_claim == false`; allowed claim is structure read/validation/analysis, not fresh UA generation, current-wiki coverage, or LLM enrichment. |
| Directed/raw versus undirected/simple | PASS: provenance counts retain direction, type, and raw multiplicity; structure uses the same-input-hash, unweighted simple undirected projection over all raw nodes including isolates. |
| Projection edge policies | PASS: self-loops removed; parallel and mutual edges collapsed by unordered pair; weights and edge types ignored for structural metrics; ties use ascending node ID. |
| Metadata and tolerance | PASS: all required projection metadata keys occur; bridge/articulation comparison is exact-set/exact-order zero tolerance; normalized betweenness alternative specifies top five and `1e-9`. |
| Three metric families | PASS: components plus isolates; top-five degree with deterministic fifth-place tie; bridges plus articulation, or the explicitly constrained normalized-betweenness fixture alternative. |
| Interpretation boundary | PASS: one raw/canonical/UA source-verified insight is required; an unsupported shared-hub/path/cluster/centrality/LLM relation is a `rejected inference`. |
| Complete lineage | PASS: exact chain `CTI response → raw hash → normalized CVE/source ID → canonical source link → UA node/edge ID → metric result → checked conclusion`; every arrow requires actual identifiers, creation time, and check result. |
| Cancellation/repeated interruption | PASS: incomplete sets cannot merge or save, old partial output cannot be reused, and all expected batches must be completed anew before full validation. |

The independent module checker exited `0` with `MODULE_CONTRACT_PASS`. Its stable inputs were:

```text
module_sha256=f6ca65baa478e6d284c56f1e45567dadf1328d70565435982669f9cacce58a48
worker_check_sha256=cd4375639acb394a2897c9e809e8a5bb7576183c287ce4be52c58cdaad205bfd
week_counts={9=>1, 10=>1, 11=>1, 12=>1, 13=>1, 14=>1}
rubric_points=[10, 10, 10, 10];sum=40
```

## Commands and observables

### Module contract

The main acceptance probe was an inline, read-only Ruby parser:

```sh
ruby - .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-5-wiki-ua-graph-module.md <<'RUBY'
# Parse exact week headings and per-section time markers; isolate and sum the
# final-rubric rows; assert Wiki, UA, projection, metrics, interpretations,
# lineage, and interruption-barrier literals as independent boolean checks.
RUBY
```

Observable: 15 named checks printed `PASS`, followed by `MODULE_CONTRACT_PASS`; exit `0`. A first attempt used `Array#filter_map`, unavailable in local Ruby 2.6.10, and exited nonzero. It was not reported as success; the compatible `map...compact` rerun above is the result used for this verdict.

### Read-only graph structure

```sh
jq -e '
  type == "object"
  and (.kind == "knowledge")
  and (.nodes | type == "array" and length > 0)
  and (.edges | type == "array")
  and (.layers | type == "array")
  and (.tour | type == "array")
  and ([.nodes[].id] as $ids
       | ($ids | length) == ($ids | unique | length)
       and ([.edges[] | . as $e
             | select(($ids | index($e.source) | not)
                      or ($ids | index($e.target) | not))]
            | length == 0))
' .ua/knowledge-graph.json >/dev/null
jq -e 'type == "object"' .ua/meta.json >/dev/null
```

Both exits were `0`. The observational report was:

```json
{"kind":"knowledge","node_count":229,"edge_count":321,"layer_count":5,"tour_count":4,"unique_node_ids":true,"dangling_edge_count":0}
```

The graph and meta hashes exactly match the Todo 1 pinned baseline (`a52c26bf...250bf` and `fac6dad96...11b4`). Their actual mtimes are `2026-07-29T03:10:15Z`. This proves only that the pinned snapshot is structurally readable and unchanged; with no `run_started_at` or batch receipt, fresh generation and fresh enrichment are **not evaluable and are not claimed**.

### Malformed dangling-edge fixture

A temporary JSON fixture with node `fixture:present` and edge `fixture:present → fixture:missing` was added with `apply_patch`. The validator command counted endpoints not present in the node-ID set and deliberately emitted a machine-readable failure:

```text
exit=42
DANGLING_EDGE count=1
```

The nonzero result was required. The fixture was then deleted with `apply_patch`; `test ! -e .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-5-adversarial-dangling-fixture.json` exits `0`.

### State and inference matrix

An inline Ruby state checker applied the module's barrier ordering—structure, exact complete batch set plus artifacts, then fresh graph/meta—and its fallback hash/report/claim rules. It produced:

```text
happy_live=PASS;status_text=ok
stale_state=STALE_GRAPH_META;status_text=ok
misleading_success_output=STRUCTURE_FAIL;status_text=ok
cancel_resume=PARTIAL_BATCH;status_text=ok
repeated_interruptions=PARTIAL_BATCH;status_text=ok
fallback_happy=PASS_STRUCTURE_ONLY
fallback_hash_mismatch=PINNED_HASH_MISMATCH
fallback_stale_report=STALE_VALIDATION_REPORT
fallback_fresh_enrichment_claim=OVERCLAIMED_ENRICHMENT
prompt_injection_unsourced_route=rejected inference
ADVERSARIAL_STATE_MATRIX_PASS
```

The prompt-injection-shaped relation text was held as a string value only. With `source_proof=nil`, it routed to `rejected inference`; it was neither executed nor promoted to a CTI fact.

## Manual QA and rendering

```sh
pandoc -f gfm -t html task-5-wiki-ua-graph-module.md
pandoc -f gfm -t plain task-5-wiki-ua-graph-module.md
glow -s dark -w 180 task-5-wiki-ua-graph-module.md
```

Using the full evidence path, Pandoc produced 18,366 nonempty HTML bytes and Glow produced 34,345 rendered bytes; all commands exited `0`. Direct Korean semantic inspection confirmed the intended progression from immutable evidence and canonical lint (weeks 9–10), through UA validation (11), projection policy (12), reproducible source-checked metrics (13), and end-to-end recovery (14), followed by exam-only week 15. The four-row rubric renders with intact labels, evidence descriptions, four `10` values, and total `40`. Live and fallback claims, exact lineage, `source-verified insight`, and `rejected inference` remain visible and distinct.

No clipped or malformed table semantics were observed in Pandoc plain output or the 180-column Glow rendering. UTF-8 Korean text parsed cleanly.

## Adversarial matrix

| Class | Verdict | Probe and observable |
| --- | --- | --- |
| `malformed_input` | PASS | A newly recreated dangling endpoint fixture exited `42` and printed `DANGLING_EDGE count=1`; it could not pass as an empty-error report. |
| `prompt_injection` | PASS | The module treats graph/raw strings as data. An injection-shaped, unsourced graph relation deterministically routed to `rejected inference`. |
| `stale_state` | PASS | A live case with `status_text=ok` but graph/meta older than run start returned `STALE_GRAPH_META`. The inspected real graph is described only as a baseline-pinned structural snapshot, never fresh output. |
| `dirty_worktree` | PASS | Before this receipt, all 142 Todo 1 protected paths and hashes matched exactly, current status matched the captured dirty baseline, staged paths were zero, and the temporary fixture was absent. No dirty path was reverted or normalized. |
| `misleading_success_output` | PASS | `status_text=ok` with failed structure returned `STRUCTURE_FAIL`; worker prose and graph existence were not accepted without parsing. Both failed reviewer helper attempts were treated as failures and corrected before evidence use. |
| `cancel_resume` | PASS | Completed batch set `{b1}` against `{b1,b2,b3}` plus missing artifacts returned `PARTIAL_BATCH`; no merge/save success was possible. |
| `repeated_interruptions` | PASS | Completed batch set `{b1,b2}` after repeated interruption still returned `PARTIAL_BATCH`; the module also forbids reusing old partial results. |
| `hung_long_commands` | N/A | This scoped review ran only bounded local parsing, hashing, and rendering; no network call, server, cron, cloud action, or asynchronous UA job was started. |
| `flaky_tests` | N/A | Week/rubric parsing, SHA-256, JSON invariants, and fixed in-memory state cases are deterministic over immutable inputs; no volatile value is a pass threshold. |

## Secret, PII, and scope review

The module and worker check were scanned for private-key material, common service-token forms, bearer credentials, credential assignments, email addresses, Korean resident-registration patterns, and Korean mobile-number patterns. Result: two files scanned and zero matches in every category. Public CTI identifiers and graph hashes are not secrets.

Before writing this receipt:

```text
protected_manifest_rows=142
protected_current_paths=142
protected_exact_path_set=PASS
protected_hash_mismatches=0
dirty_status_matches_task1_baseline=PASS
staged_paths=0
temporary_fixture_absent=PASS
target_receipt_absent_before_write=PASS
evidence_non_target_file_count=16
evidence_non_target_composite_sha256=feec933bea6e091e4b4077bb0e60e86a8223b36111ac4994c05e9d79f53aa28b
```

The exact attributable write sequence was: create temporary dangling fixture, run read-only validation, delete that fixture, then create this designated receipt. The module, worker check, live wiki, `raw/`, `.ua/`, `output/`, external Hermes state, and all unrelated evidence were not edited. The optional Biome LSP was unavailable when the temporary JSON was patched; no package was installed and no external LSP-decision file was written because both actions were outside scope. `jq` validated the fixture syntax directly.

## Cleanup

```yaml
cleanup:
  temporary_fixture_created: 1
  temporary_fixture_remaining: 0
  persistent_qa_assets_remaining: 0
  external_state_mutations: 0
  ua_generation_runs: 0
  dashboard_or_server_runs: 0
  protected_files_modified_by_reviewer: 0
  receipt_written: ".omo/evidence/hoseo-data-analysis-cloud-platform-course/task-5-adversarial-verify.md"
```

## Post-write integrity

The first directory-wide post-write comparison observed one concurrent file, `task-3-adversarial-verify.md`, created by another scoped reviewer. It was not attributed to Todo 5. Excluding that concurrent file and this receipt, the original 16 evidence files retained the exact pre-write composite SHA-256 `feec933bea6e091e4b4077bb0e60e86a8223b36111ac4994c05e9d79f53aa28b`. All 142 protected hashes still match, the temporary fixture is absent, the module and worker-check hashes are unchanged, this receipt is valid UTF-8 with LF and a final newline, and the three-file sensitive-data scan reports zero hits. Final result: `post_write_integrity=PASS`.
