# AdversarialVerify — Todo 3 NCP live/fallback module (post-fix)

```yaml
verdict: confirmed
confidence: high
review_date: 2026-07-29
scope: Todo 3 only; scoped evidence review, not Global Review
implementation_artifacts_modified: false
cloud_or_ncp_operations_by_reviewer: false
```

## Decision

`confirmed`. The original circular-hash blocker is fully resolved and no regression was found.

The corrected brief explicitly forbids hashing a fixture that contains its own digest. It excludes only the top-level `sha256` field, treats every other field as protected payload, recursively sorts object keys by UTF-8 bytes, preserves array order, emits compact UTF-8 JSON, and stores `sha256:<64 lowercase hex>`. Independent Ruby and `jq` implementations reproduced the documented digest. A protected-field mutation and an invalid digest prefix both produced nonzero rejection with exact `FAIL_FIXTURE_SHA256`.

All original Todo 3 acceptance criteria, the unrestricted-SSH failure scenario, rendered manual QA, adversarial checks, protected-state comparison, and sensitive-data scan passed.

## Evidence identity

```text
271ca974ed48396311f58b93f03af2550cb6c06e8f67a4cd4abc41af970ee31b  task-3-ncp-module.md
10f73636c352394edf76d12a48eb10c7a6e54a52c021e1abd7fecf5d56c808b9  task-3-ncp-check.txt
task-3-ncp-module.md: 114 lines, UTF-8
task-3-ncp-check.txt: 113 lines, UTF-8
```

The module and worker receipt were re-read directly. Worker success prose was not treated as proof.

## Original blocker resolution

The corrected contract is explicit at these source locations:

- Line 65: complete-file self-hashing is circular and must not be used.
- Lines 80–84: omit only top-level `sha256`; recursively UTF-8-byte-sort object keys; retain array order; serialize compact UTF-8 JSON; require `sha256:<hex>`; reject protected changes, order changes, omissions, or format errors.
- Lines 87–93: canonical payload and declared digest example.
- Line 114: both unrestricted SSH and canonical-payload digest mismatch are deterministic failures without a live cloud query.

This is a non-circular payload hash: the declared digest is outside the byte sequence it authenticates, while every other top-level or nested fixture value remains protected.

## Canonical-payload reproduction

### Independent Ruby encoder — positive path

The verifier extracted the JSON code block and declared digest from the brief. Its independent encoder recursively serialized hashes with UTF-8-byte-sorted keys, retained array order, used `JSON.generate` for keys/scalars, and excluded only top-level `sha256` before hashing.

Result:

```text
CANONICAL_PAYLOAD={"acg_rules":[{"direction":"inbound","port":22,"protocol":"TCP","source":"198.51.100.0/24"}],"created_at":"2026-07-29T00:00:00Z","expected_results":{"ssh_tcp_22":"restricted","teardown":"terminate_and_public_ip_release"},"fixture_id":"ncp-lab-2026-2-r1","owner":"instructor","refreshed_at":"2026-07-29T00:00:00Z","schema_version":"1.0.0","source_urls":["https://guide.ncloud-docs.com/docs/en/vpc-manage-vpc"]}
DECLARED=sha256:c93aa7ac5b4333092b3cee72c8df1a83d82c13d3a04df8122750794111e3e23a
RECOMPUTED=sha256:c93aa7ac5b4333092b3cee72c8df1a83d82c13d3a04df8122750794111e3e23a
POSITIVE_MATCH=true
PASS_CANONICAL_FIXTURE_SHA256 sha256:c93aa7ac5b4333092b3cee72c8df1a83d82c13d3a04df8122750794111e3e23a
```

A JSON generate/parse round trip recomputed the same digest.

### Independent `jq`/SHA-256 surface

Exact invocation:

```sh
payload=$(sed -n '/^```json$/,/^```$/p' task-3-ncp-module.md | sed '1d;$d')
canonical=$(printf '%s' "$payload" | jq -cS '.')
digest=$(printf '%s' "$canonical" | shasum -a 256 | awk '{print $1}')
declared=$(rg -o '^sha256: sha256:[0-9a-f]{64}$' task-3-ncp-module.md | sed 's/^sha256: sha256://')
test "$digest" = "$declared"
```

Result:

```text
JQ_DIGEST=c93aa7ac5b4333092b3cee72c8df1a83d82c13d3a04df8122750794111e3e23a
DECLARED_HEX=c93aa7ac5b4333092b3cee72c8df1a83d82c13d3a04df8122750794111e3e23a
JQ_POSITIVE_ASSERT_EXIT=0
```

### Protected-field tamper — required negative path

The verifier changed `expected_results.ssh_tcp_22` from `restricted` to `unrestricted` without updating the declared digest, independently canonicalized the protected payload, and compared the values.

```text
TAMPER_OUTPUT=FAIL_FIXTURE_SHA256
TAMPER_EXIT=1
EXPECTED_TAMPER_FAILURE_ASSERT_EXIT=0
```

The tampered recomputation was `sha256:ddef6250ac376852fc21cb5e03ee3d2af4ac0532afd303308a74ec1f98168264`, distinct from the declared `sha256:c93a…e23a`.

### Invalid digest format

Removing the required `sha256:` prefix produced:

```text
BAD_PREFIX_OUTPUT=FAIL_FIXTURE_SHA256
BAD_PREFIX_EXIT=1
EXPECTED_PREFIX_FAILURE_ASSERT_EXIT=0
```

## Acceptance-criterion reproduction

| Todo 3 criterion | Result | Independent observable |
|---|---:|---|
| Exactly two week sections | PASS | `weeks=2,3 h3=2`. |
| Live/fallback evidence table | PASS | Two exact table headers; week 3 has all seven evidence families. |
| Eight fixture fields | PASS | Exact ordered set is `fixture_id`, `owner`, `schema_version`, `created_at`, `refreshed_at`, `source_urls`, `sha256`, `expected_results`. |
| Non-circular hash contract | PASS | Only top-level `sha256` is omitted; positive recomputation and protected tamper failure reproduced independently. |
| Restricted `TCP 22` | PASS | Source is student/team current IP or campus CIDR. |
| Explicit SSH `0.0.0.0/0` prohibition | PASS | Rule and prose forbid it; sentinel is `FAIL_UNRESTRICTED_SSH`. |
| Stop-only rejected | PASS | Exact assertion `stop-only는 teardown이 아니다.` remains. |
| Public-IP release | PASS | Required as part of complete teardown. |
| Residual-cost warning | PASS | Warning plus follow-up timestamp are required. |
| Exact Docker row | PASS | Exactly one `| Docker | Hermes gateway persistence | fixture-only |`. |
| No cloud mutation | PASS within auditable scope | Receipt enumerates bounded documentation reads and local checks; reviewer invoked no NCP/cloud operation; 142 protected hashes match. |
| No capability overclaim | PASS | Fallback losses and Docker limitations remain explicit; live steps are prospective procedures, not claims of completed execution. |

Static parser result:

```text
PASS_ALL_STATIC weeks=2,3 h3=2 live_fallback_tables=2 evidence_rows=7 manifest_fields=8 hash_contract=non_circular docker_exact=1
HAPPY_RG_EXIT=0
```

The seven provider/fallback evidence families remain settings/fixture result, SSH/terminal transcript, service `curl`, ACG rule table, owner/team label, budget alert configuration, and teardown/residual-cost proof.

## Required unrestricted-SSH failure

A syntactically valid in-memory fixture containing inbound `TCP 22` from `0.0.0.0/0` was parsed and checked using the same explicit predicate as the Todo 3 scenario.

```text
RULE_OUTPUT=FAIL_UNRESTRICTED_SSH
RULE_EXIT=1
EXPECTED_SSH_FAILURE_ASSERT_EXIT=0
TEMP_OUTPUT_CLEANUP_EXIT=0
```

No fixture file was persisted. A temporary command-output file was removed immediately and its absence was verified.

## Rendering and manual QA

Exact surfaces:

```sh
pandoc -f gfm -t html task-3-ncp-module.md >/dev/null
glow -s dark task-3-ncp-module.md >/dev/null
git diff --no-index --check /dev/null task-3-ncp-module.md
COLUMNS=220 NO_COLOR=1 glow -w 200 -s dark task-3-ncp-module.md
```

Results:

```text
PANDOC_EXIT=0
GLOW_EXIT=0
DIFF_NO_INDEX_EXIT=1
WHITESPACE_DIAGNOSTICS=none
```

The no-index `1` is the normal added-file result. Wide Glow inspection preserved the full `FAIL_UNRESTRICTED_SSH`, non-circular hash rules, sample digest, `FAIL_FIXTURE_SHA256`, complete teardown, and exact Docker row.

Manual semantics:

- Live track: PASS. Weeks 2–3 retain the sub-account, team VM, VPC/public subnet, custom ACG, restricted SSH, public IP, budget evidence, terminal/service proof, and complete teardown.
- Fallback track: PASS. Linux/service work is preserved, while actual NCP provisioning, public-IP SSH/release, ACG enforcement, alert delivery, and residual-cost verification are explicitly lost.
- Docker: PASS. NCP provisioning and Hermes systemd persistence remain fixture-only, never live.
- Safety/cost: PASS. Secrets and PII are redacted; unrestricted SSH, stop-only teardown, retained public IP, and missing residual-cost proof fail.
- Fixture integrity: PASS. The payload is non-circular, independently reproducible, and protected-field tampering is rejected.

## Adversarial matrix

| Class | Verdict | Probe and observable |
|---|---:|---|
| `malformed_input` | PASS | Unrestricted SSH, protected-field tamper, and missing digest prefix each returned nonzero with the exact applicable failure sentinel. |
| `prompt_injection` | PASS | Common injection-shape scan found zero matches; external documentation and fixture text remain explicitly data-only. |
| `stale_state` | PASS | `as_of: 2026-07-29`, eight first-party URLs, bounded retry, unavailable-not-absence language, new fixture ID/hash on refresh, and no overwrite remain explicit. |
| `dirty_worktree` | PASS | Todo 1/current status sets were `51/51` with zero additions/removals; staged paths were zero; all 142 protected hashes matched. |
| `misleading_success_output` | PASS | Worker claims were independently reproduced with two positive hash implementations and separate nonzero tamper, prefix, and SSH failures. |
| `cancel_resume` | N/A | Static document verification has no resumable external state; all inputs were complete and QA state was cleaned. |
| `repeated_interruptions` | N/A | No checkpointed or long-running execution exists in this scoped review. |
| `hung_long_commands` | N/A | Reviewer checks were finite local reads/renders; recorded external documentation calls were bounded to 20 seconds. |
| `flaky_tests` | N/A | Parsing, canonicalization, hash comparison, rendering, and negative cases are deterministic and independent of live NCP state. |

## Protected state, secrets, and scope

```text
PASS_PROTECTED rows=142 mismatches=0
DIRTY_STATUS baseline=51 current=51 added=0 removed=0
STAGED_PATHS=0
PASS_SECRET_PII_SCAN files=2 hits=0
PROMPT_INJECTION_MATCHES=0 RG_EXIT=1
```

No NCP resource was created, started, stopped, or deleted during this review. No NCP API/CLI operation, SSH session, Docker workload, Hermes operation, cron operation, or UA generator was invoked. The worker receipt lists only bounded official-document HTTP reads and local parsing/rendering/status checks. The module itself states that the checker does not query or change live cloud state.

Historical external-state absence cannot be proven solely from repository files; within the auditable receipt, current protected state, and this review's command scope, there is no evidence of a cloud operation or unsupported capability claim.

## Cleanup

No fixture file, server, process, browser context, container, cloud resource, cron job, or wiki/graph artifact was created. The transient SSH-check output file and whitespace-check output file were deleted and verified absent. This receipt is the reviewer's only persistent write.

Post-write self-check: report whitespace diagnostics were empty; all QA temp paths were absent; the refined secret/PII scan over the module, worker receipt, and this report returned `files=3 hits=0`; protected state remained `rows=142 mismatches=0`; and dirty-worktree status remained identical to baseline (`51/51`, added `0`, removed `0`).
