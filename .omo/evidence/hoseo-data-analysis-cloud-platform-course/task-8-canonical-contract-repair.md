# Todo 8 canonical-contract checker repair

## Scope and binding

- Target: `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`
- Target SHA-256: `d062c7427f7d6f7e307f677fcd3b455c9b709c899ef192d52bee`
- Checker SHA-256: `de2cd490ff6f38289e25162ba68be640646682c80676c57854f6c5623e8f8241`

The checker is a read-only evidence checker for this one approved deliverable, not a general Korean-syllabus semantic parser. It retains the existing heading, schedule, topic-ID, arithmetic, schema, active-content, and source-ledger checks. Its high-risk meaning checks now compare readable canonical data rather than open-ended keyword regexes:

- seven explicit cells for each M1–M7 milestone, with a separate mismatch diagnostic per cell;
- six explicit cells for each of the six fallback tracks, with a separate mismatch diagnostic per cell;
- exact Hermes base, NVD, UA, accessibility, offensive, combined data/graph, and credential lines; and
- exact week 4 and week 7 operation rows.

The checker does not compare a whole-file SHA. The expected arrays/maps are visible in `syllabus_check.rb`; a changed field reports its named canonical cell or line.

## Failing-first controls

Before the canonical-contract change, the persistent harness was expanded with the independent v3 mutations and exited 1 because all seven expected rejections instead exited 0:

1. M1 cells with valid IDs and surface tokens but `바나나` payloads;
2. M6 text allowing result code zero;
3. graph hypothesis text promoting the result to a confirmed conclusion;
4. data-only wording that proceeds to command execution;
5. caption/transcript wording that denies learner access;
6. offensive-activity wording that permits a class activity; and
7. credential wording that inserts an API key into a prompt.

The exact v3 replacements are persisted in `task-8-regression.rb` as `v3-*` controls.

## Green execution

```sh
ruby -c .omo/evidence/hoseo-data-analysis-cloud-platform-course/syllabus_check.rb && \
  ruby .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-8-regression.rb
```

Observable: both commands exit 0. The refreshed `task-8-regression.log` contains 153 result lines with PASS verdicts:

- valid target plus all historical structural, schema, malformed-input, active-content, and policy mutations;
- every v3 false-success mutation; 
- all 49 individual M1–M7 canonical-cell mutations;
- all 36 fallback contract-cell mutations; and
- nine individual canonical Hermes/NVD/UA/policy/week-row mutations.

Positive paraphrase controls were intentionally removed: the plan accepts one canonical approved output and does not require arbitrary prose paraphrases to pass.

## Surface, boundaries, integrity, and cleanup

- Pandoc: exit 0; `task-8-syllabus.html` is 47,416 bytes, has 11 opening/11 closing tables, and active-content count 0.
- Glow width 160: exit 0; `task-8-render.txt` is 83,488 bytes and 493 lines.
- Boundary: valid exits 0; corrupt exits 1 and reports both missing week 8 and grading mismatch; missing path and invalid UTF-8 each exit 1. All temporary boundary fixtures use `Dir.mktmpdir` and are auto-removed.
- Protected manifest: 142 expected paths, 0 mismatches. Receipt: `task-8-protected-sha256.txt`.
- Hygiene: whitespace raw exit 1 with zero diagnostics (normal added-file status), staged paths 0, and seven high-signal secret/PII scans all 0.

## Verdict

`executor-local-pass; fresh-independent-verification-required` for checker SHA `de2cd490ff6f38289e25162ba68be640646682c80676c57854f6c5623e8f8241`.
