# pkm-study Agent Guide

## Project identity

- This is a Korean-language Obsidian/Markdown PKM vault, not an application repository.
- The core model is: preserve evidence in `raw/`, compile reusable knowledge into canonical pages, then derive an Understand Anything knowledge graph.
- `SCHEMA.md` is the authoritative content contract. Do not infer schema from `output/` documents or generated graph data.
- Prefer relationships, workflows, provenance, and reusable synthesis over product feature inventories.

## Start here

1. Resolve the vault root with `pwd -P`.
2. Read `SCHEMA.md` completely.
3. Read `index.md` completely to locate existing topics before creating anything.
4. Read the latest 20–30 entries in append-only `log.md` for current state and prior validation.
5. Use the `llm-wiki` skill for ingestion, canonical editing, queries, or wiki health checks when it is available.

## Repository map

- `entities/`: tools and ecosystem participants; page `type: entity`.
- `concepts/`: knowledge models and workflows; page `type: concept`.
- `comparisons/`: decision-support comparisons; page `type: comparison`.
- `queries/`: durable, source-verified synthesized answers; page `type: query`.
- `raw/`: immutable source evidence with heterogeneous, importer-specific metadata.
- `output/`: exported deliverables, not canonical wiki authority.
- `.ua/`: Understand Anything configuration and generated knowledge-graph state.
- `.obsidian/`: vault/editor settings; `workspace.json` is volatile UI state.
- `run_ua_dashboard.sh`: local launcher for an existing UA graph.
- `skills-lock.json`: tool-managed skill provenance, not an application package manifest.

## Canonical authoring contract

- Scope these rules to Markdown under `entities/`, `concepts/`, `comparisons/`, and `queries/`.
- Name files with lowercase ASCII letters, digits, and hyphens. Do not normalize existing `raw/**` names.
- Begin every canonical page with leading YAML frontmatter.
- Required fields: `title`, `created`, `updated`, `type`, `tags`, and `sources`.
- Dates use `YYYY-MM-DD`; folder and singular `type` must agree.
- Use only tags registered in `SCHEMA.md`; add a taxonomy entry there before using a new tag.
- Default `confidence: medium` for single-source or fast-changing product claims.
- Give every canonical page at least two resolvable basename-style `[[wikilink]]` links.
- Record exact existing `raw/...` paths in `sources:`, including spaces and Unicode.
- For paragraphs synthesizing three or more originals, add `^[raw/.../source.md]` provenance where possible.
- Bump `updated` whenever canonical content changes.
- Add new pages to the matching `index.md` section with a one-line summary; keep its date and count current.
- Append every wiki operation to `log.md`; never rewrite or reorder prior log entries.

## Page decisions

- Create a page only for a source's central topic or a concept repeated across at least two sources.
- Update an existing page instead of creating a synonym or duplicate.
- Do not promote passing mentions or unverified exploratory output into canonical knowledge.
- Split canonical pages over 200 lines into coherent subtopics.
- Move fully superseded pages to `_archive/` rather than silently deleting history.
- Entity pages separate verified capabilities from constraints and link at least two related topics.
- Concept pages cover definition, mechanism, current use, and open questions.
- Comparison pages state purpose and criteria, prefer a table, and conclude whether tools replace or complement one another.
- Query pages retain only reusable, source-verified synthesis; do not store full chat transcripts or raw/summary/final triplicates.

## Provenance and conflict handling

- Treat every existing file under `raw/` as read-only. Corrections and interpretation belong in canonical pages.
- Preserve raw bodies, filenames, metadata, source identifiers, and recorded hashes exactly.
- Move an inbox item to `inbox/processed/` only after both raw preservation and canonical reflection succeed.
- Prefer newer dated evidence, but do not turn promotional claims into facts without independent support.
- Preserve conflicting dated claims and sources; unresolved conflicts use `contested: true` plus `contradictions:`.
- Treat graph-inferred relationships, tags, labels, and claims as hypotheses until verified against source text.

## Generated and local-state boundaries

- Do not hand-edit `.ua/knowledge-graph.json`, `.ua/meta.json`, `.ua/fingerprints.json`, or `.ua/.trash*`; regenerate them with `understand-knowledge`.
- `.ua/config.json` and `.ua/.understandignore` are intentional configuration and require deliberate edits.
- Ignore `.ruff_cache/`, `.DS_Store`, and the external `.codegraph` index contents.
- Preserve existing `output/` artifacts unless the task explicitly authorizes regenerating or replacing that bundle.
- Preserve intentional `.obsidian/` settings; avoid committing volatile workspace state to a public template.
- Update `skills-lock.json` through the skill-management workflow, not manual hash edits.

## Wiki workflow

1. Orient from `SCHEMA.md`, `index.md`, and recent `log.md`.
2. Preserve new evidence in `raw/` without rewriting existing sources.
3. Update or create the smallest justified canonical page set and backlinks.
4. Synchronize `index.md`, frontmatter dates, provenance, and `log.md`.
5. Run a frontmatter-aware wiki health check.
6. After wiki changes, rerun `understand-knowledge`; do not use generic code `understand` as the wiki entry point.
7. Wait for every expected analysis batch before merge/save; never report success from status text alone.
8. Validate fresh graph/meta artifacts and zero dangling edges before handoff.

## Validation contract

- There is no committed one-command wiki linter, package build, test suite, or CI workflow. Do not invent `npm test` or project-local `pytest` commands.
- Parse only the leading frontmatter block; examples embedded later in documents are not page metadata.
- Check canonical filenames, required fields, date/type/tag values, source-path existence, confidence/contradiction rules, and the 200-line limit.
- Check at least two outbound links, broken links, orphan pages, reciprocal context where useful, index completeness, and duplicate topics.
- Recompute every raw SHA-256 that is recorded; missing hashes on legacy raw captures are a coverage gap, not automatic drift.
- Check staleness and low-quality claims, then ensure the operation is appended to `log.md`.
- Validate shell syntax with `bash -n run_ua_dashboard.sh` after launcher edits.
- For `.ua/knowledge-graph.json`, require `kind == "knowledge"`, nonempty `nodes`, array `edges/layers/tour`, unique node IDs, and zero edge endpoints missing from the node set.
- Validate `.ua/meta.json` as JSON and confirm graph/meta modification times are newer than the run that produced them.
- Do not launch the dashboard for routine lint; it downloads and executes an unpinned remote `latest` viewer and starts a server.

## Hermes automation boundary

- The Hermes gate, cron job, gateway, and custom skill aliases live outside this repository under `~/.hermes/`.
- Repository documentation describes the deployment but does not prove the scheduler is currently active.
- Trust gate `wakeAgent`, `reason`, and `changedPaths`; do not recalculate them inside the agent run.
- `log.md` is intentionally excluded from the freshness watch to prevent a self-trigger loop.
- Read-only inspection may use `hermes cron list` and `hermes cron status`.
- `cron run`, `tick`, pause/resume/remove, gateway changes, and external gate edits mutate operational state and require task-specific authorization.
- Never put secrets, dashboard token URLs, cookies, chat IDs, or internal URLs in prompts, stdout, logs, or handoff text.

## Do not

- Do not edit or mass-normalize `raw/` records.
- Do not derive canonical taxonomy from noisy generated graph tags or `output/` prose.
- Do not equate zero dangling graph edges with zero unresolved wiki links.
- Do not merge incomplete UA analysis batches or reuse stale graph artifacts as success evidence.
- Do not make broad page rewrites when a focused canonical update is sufficient.
- Do not expose local `.codegraph`, `.ua/.trash*`, or Obsidian workspace state in an open-source export.
