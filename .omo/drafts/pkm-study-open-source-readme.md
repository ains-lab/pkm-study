---
slug: pkm-study-open-source-readme
status: drafting
intent: clear
review_required: false
pending-action: resolve public README target
approach: Use pkm-study as private evidence, write one root README.md for the selected public target, separate core Markdown-vault behavior from optional integrations, and make licensing/privacy/generated-state blockers explicit instead of publishing private raw or generated content.
---

# Draft: pkm-study-open-source-readme

## Components (topology ledger)
<!-- Lock the SHAPE before depth. One row per top-level component that can succeed or fail independently. -->
<!-- id | outcome (one line) | status: active|deferred | evidence path -->
| id | outcome | status | evidence path |
|---|---|---|---|
| C1-positioning | Public title, promise, audience, value, and non-goals accurately describe a Korean Markdown/Obsidian PKM vault | active | `SCHEMA.md:3-18`; `concepts/ai-personal-knowledge-management.md:16-49` |
| C2-technical-guide | Architecture, workflow, tech roles, installation, usage, authoring, graph, and optional automation are executable without overstating bundled behavior | active | `concepts/llm-wiki.md:19-38`; `concepts/ai-knowledge-workflow.md:22-41`; `queries/ua-knowledge-graph-workflow.md:19-152`; `run_ua_dashboard.sh:1-30` |
| C3-public-boundary | README exposes no private/local identifiers and clearly gates raw rights, PII, generated graph bodies, mutable remote execution, and absent license/community files | active | `AGENTS.md:68-118`; `.ua/.understandignore:10-31`; `raw/blog/hermes-agent-cron-llm-wiki-knowledge-graph.md:696-724` |
| C4-readme-qa | Root README renders as GitHub Markdown; relative links, Mermaid, documented commands, prerequisites, and limitations are verified agent-side | active | GitHub Docs About READMEs; GitHub Docs Adding a license; current absence of committed build/test/CI in `AGENTS.md:90-99` |

## Open assumptions (announced defaults)
<!-- Record any default you adopt instead of asking, so the user can veto it at the gate. -->
<!-- assumption | adopted default | rationale | reversible? -->
| assumption | adopted default | rationale | reversible? |
|---|---|---|---|
| Filename | Use root `README.md`, correcting the request's `READMD.md` typo | GitHub recognizes and surfaces a root README; conventional path | yes |
| Language | Korean-first README with English tool/file identifiers; no duplicate full English translation | Current vault and user request are Korean; avoids doubling maintenance | yes |
| Documentation scope | One README only; link to canonical project docs rather than duplicating all technical-blog detail | User requested README; GitHub recommends keeping longer docs elsewhere | yes |
| Test strategy | No TDD/unit test for pure prose; agent-executed QA by full read, Markdown structure, relative-link resolution, Mermaid syntax, command/path existence, and secret/local-path scan | Prose has no honest RED seam; repository has no committed test runner | yes |
| Status claims | No evergreen badges or frozen node/page counts; dated examples only when necessary | Current checks are manual snapshots, not CI guarantees | yes |
| License wording | Do not assert a license or call publication complete until the owner adds a valid license and reviews third-party rights; README includes a release-blocker note | No license exists and raw material has mixed rights | yes |
| Integrations | Obsidian, Zotero, NotebookLM, UA, Hermes, Graphify, CodeGraph, Orca, and slides-grab are optional roles, not bundled dependencies | Repository has no app package manifest/installer for them | yes |

## Findings (cited - path:lines)
- `README.md`, `READMD.md`, `LICENSE*`, `.gitignore`, `.gitattributes`, contributor/security files, and Git metadata are absent at the current root.
- The repository contract is `raw` evidence -> typed canonical Markdown -> generated graph -> source-verified feedback (`SCHEMA.md:3-18`; `concepts/llm-wiki.md:19-38`; `queries/ua-knowledge-graph-workflow.md:19-31`).
- Canonical content is 21 indexed pages under `entities/`, `concepts/`, `comparisons/`, and `queries/`; `index.md:1-38` is the navigation entry point and `log.md:1-5` is append-only history.
- Reading the vault needs no build; dashboard use requires an existing UA graph, Bash, Node/npx, network access, and external UA installation (`run_ua_dashboard.sh:1-30`; `queries/ua-knowledge-graph-workflow.md:56-86`).
- `run_ua_dashboard.sh:7,23-30` downloads an unpinned `latest` package and prints a tokenized URL; this requires an explicit security/reproducibility caveat.
- Hermes gate/cron/gateway/skills live outside the repository and its article is version/platform-specific raw evidence, not bundled automation (`AGENTS.md:103-110`; `raw/blog/hermes-agent-cron-llm-wiki-knowledge-graph.md:36-38,85-99`).
- `raw/` includes captured third-party bodies and binaries with unresolved redistribution/PII scope. `.ua/knowledge-graph.json` embeds article content; `.ua/.trash*` retains local paths. A direct public push is unsafe without a sanitized allowlist.
- Machine-local/public-exclude surfaces include `.codegraph`, `.ua/.trash*`, `.ua/fingerprints.json`, `.obsidian/workspace.json`, `.DS_Store`, and `.ruff_cache/`; output assets are large/noncanonical and need a release policy.
- GitHub Docs says a README should cover purpose, usefulness, getting started, help, and maintainership; relative links should be used; README content beyond 500 KiB is truncated. A detectable license enables use/change/distribution and should be selected before public release.

## Decisions (with rationale)
- Route: CLEAR, Standard classification, `review_required: false`.
- Authority order: `SCHEMA.md` -> canonical concepts/comparisons/queries -> raw evidence -> output narrative inspiration only.
- README story: immutable evidence -> curated interlinked Markdown -> validation -> derived knowledge graph -> source-verified feedback.
- Core quick start: clone/open as Markdown, read `SCHEMA.md` then `index.md` and recent `log.md`; Obsidian is optional.
- Include two Mermaid diagrams: system architecture and canonical page lifecycle. Keep Hermes as an optional advanced subsection, not the core quick start.
- Public-safety rule: never copy notebook/source IDs, signed URLs, absolute local paths, runtime token URLs, third-party raw bodies, or generated graph bodies into README examples.
- QA is tests-none for prose with agent-executed structural, render-adjacent, link, path, command, and secret/local-path checks.

## Scope IN
- One root `README.md` in the owner-selected public target.
- Project introduction, value proposition, core features, architecture, workflow, technology roles, repository map, prerequisites, installation, usage, graph workflow, optional Hermes automation, contribution/authoring rules, security/limitations, support/maintainer placeholders, and license/release blocker wording.
- Relative links to selected target files that actually exist after execution.
- Public-safe Mermaid architecture and page-lifecycle diagrams.
- Agent-executed QA evidence for Markdown structure, links, commands, paths, Mermaid blocks, size, and private/local identifier absence.

## Scope OUT (Must NOT have)
- No README implementation before explicit plan approval and later `$start-work` execution.
- No canonical wiki, `raw/`, `output/`, `.ua/`, `.obsidian/`, dashboard script, Hermes configuration, scheduler, or external skill edits in this README task.
- No license selection, Git initialization, repository creation/push, community-health file creation, or third-party redistribution decision unless the user expands scope.
- No copying of environment-specific absolute paths, job IDs, notebook/source IDs, signed URLs, private contact data, graph bodies, or runtime token URLs.
- No claim that optional integrations are bundled, a live cron is deployed, lint is CI-backed, the graph proves truth, or the repository is publication-ready without license/privacy review.

## Open questions
- Owner decision: should the public README target the sanitized standalone `~/projects/2nd-brain-template/README.md` (recommended) or the current private vault's `/Users/sysmoon/.codex/projects/pkm-study/README.md`?

## Approval gate
status: drafting
<!-- When exploration is exhausted and unknowns are answered, set status: awaiting-approval. -->
<!-- That durable record is the loop guard: on a later turn read it and resume at the gate instead of re-running exploration. -->
