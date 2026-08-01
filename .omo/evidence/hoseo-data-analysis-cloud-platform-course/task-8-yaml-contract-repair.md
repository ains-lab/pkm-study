# Todo 8 YAML-contract checker repair

## Bound artifacts

- Target SHA-256: `75df0f2733c5bf898b78ee531cbc13700aafcc359b4f7ea15d3a0c296d2c1e51`
- Checker SHA-256: `efab908d52db0049be5d7f1afaf7d78f814bbd9dc9360fe802c1577cfe2041cd`

The checker reads the bounded `### 자동 검증 계약` YAML fence with Ruby stdlib `YAML.safe_load` (Psych), no custom parser or whole-file digest. It recursively requires the exact typed mapping keys and values for UA partial/stale rejection, graph fact status, accessibility, offensive restrictions, untrusted execution, credential locations, Hermes boundaries, NVD retry state, milestone roles, and fallback columns/tracks.

The former byte-for-byte `canonical_milestones`, `canonical_fallbacks`, Korean policy-line snapshots, and week-row snapshots are gone. Structural checks remain for headings, schedule/topic IDs, LO coverage, 20/40/40 arithmetic, rubric totals, stable M-role placement/multiplicity, fallback row shape/order, schema fields, active content, and source ledger. Bounded scoped prose guards remain only for direct contradictions (for example, result-code zero, command execution, unavailable captions, prompt key insertion, or offensive class activity).

## Failing-first then green

Before the change, adding the five meaning-preserving rewrites and 14 YAML mutations made the persistent harness exit 1: every YAML mutation was accepted and every safe rewrite was rejected by prose snapshots.

After the change:

```sh
ruby -c .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb && \
  ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb
```

Both commands exit 0. `task-8-regression.log` records 78 real-checker scenarios: 8 expected accepts and 70 expected rejects, all with PASS verdicts.

Accepted semantic rewrites:

- M1 happy evidence wording;
- M2 fallback ordering;
- caption/transcript/accessibility wording;
- week 4 Hermes wording order; and
- NVD pagination/retry sentence order.

Rejected YAML controls cover missing contract version; UA accept/exit changes; graph fact; accessibility; offensive activity; untrusted execution; credentials; Hermes gate outputs; NVD retry/failure state; milestone role omission; and fallback column/track omission. Existing contradictory policy, M6, active-content, schema, arithmetic, malformed, and fallback-gibberish controls remain rejection cases.

## Oracle migration

Two old prose-only padding cases are now expected accepts: `v3-m1-semantic-padding` and `m1-token-stuffed-nonsense`. They retain the only machine-stable M-role placement and do not contradict a typed contract, so an automated Korean semantic classifier would be an unreliable oracle. They are paired with the typed `contract-milestone-role-omission` rejection. The former snapshot-generated 49 milestone-cell and 36 fallback-cell mutation loops were removed because they only asserted duplicated prose. Fallback row shape, stable track ordering, and the typed fallback columns/tracks remain negative controls; educational prose quality remains F1/F3 independent-review scope.

## Fresh surface and integrity evidence

- Pandoc exit 0: `task-8-syllabus.html`, 60,735 bytes, 11/11 tables, active content 0.
- Glow width 160 exit 0: `task-8-render.txt`, 91,214 bytes, 541 lines.
- Boundary: valid exits 0; corrupt exits 1 with both missing-week and grading diagnostics; missing path and invalid UTF-8 each exit 1. Temp fixtures use `Dir.mktmpdir` and auto-clean.
- Protected manifest: 142 paths, 0 mismatches. Receipt: `task-8-protected-sha256.txt`.
- Hygiene: whitespace raw exit 1 with zero diagnostics, staged paths 0, seven high-signal secret/PII patterns all 0.

Verdict: `executor-local-pass; fresh-independent-verification-required` for the exact target/checker pair above.
