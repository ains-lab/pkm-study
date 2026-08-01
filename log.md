# Wiki Log

> 위키 작업의 시간순 기록. 새 기록만 아래에 추가한다.
> 형식: `## [YYYY-MM-DD] action | subject`
> Actions: ingest, update, query, lint, create, archive, delete

## [2026-07-16] create | Wiki initialized

- Domain: AI 기반 개인 지식관리와 에이전트 작업환경
- 프로젝트의 기존 원본 5개를 바탕으로 구조와 스키마를 생성함
- Created: `SCHEMA.md`, `index.md`, `log.md`
- Created: `entities/obsidian.md`, `entities/zotero.md`, `entities/notebooklm.md`, `entities/orca.md`, `entities/slides-grab.md`
- Created: `concepts/llm-wiki.md`, `concepts/ai-knowledge-workflow.md`, `concepts/agentic-workspace.md`
- Created: `comparisons/knowledge-tool-roles.md`

## [2026-07-16] lint | 0 issues found

- Checked 9 wiki pages and 53 valid internal link references
- Broken links: 0
- Orphan pages: 0
- Missing index entries: 0
- Frontmatter or tag errors: 0
- Oversized pages: 0
- Source drift checks available: 0 raw files use the wiki `sha256` frontmatter convention yet

## [2026-07-16] ingest | NotebookLM notebook `2nd-brain`

- Notebook ID: `7396687f-fcaf-4fe4-9447-1f513f6aaef9`
- Imported all 8 ready sources as immutable records under `raw/notebooklm/`
- Raw source IDs: `f01a39c7-2866-4db6-86e2-e71702566f01`, `bbc27763-6ae1-4ca1-a2fd-9a6760c06d4c`, `99758e65-9090-4d37-925c-93ac3bffa239`, `35b4a308-757a-4991-83ce-55579c39cc33`, `a06e18ab-142e-45dd-8bda-f178a44fea1c`, `e09775ea-2fcb-4367-98fb-aa0754939c28`, `22d5adf4-0123-46ef-afd2-4ad62e5ba2d3`, `fa45ed8a-8f4c-4eb7-a315-b1558153ac5d`
- Created: `entities/understand-anything.md`, `entities/graphify.md`, `entities/codegraph.md`, `entities/zotero-mcp.md`, `entities/notebooklm-py.md`
- Created: `concepts/knowledge-graph-analysis.md`, `concepts/research-feedback-loop.md`, `concepts/second-brain-research-workflow.md`
- Created: `comparisons/knowledge-graph-tools.md`
- Updated: `SCHEMA.md`, `entities/notebooklm.md`, `entities/zotero.md`, `concepts/llm-wiki.md`, `concepts/ai-knowledge-workflow.md`, `concepts/agentic-workspace.md`, `comparisons/knowledge-tool-roles.md`, `index.md`

## [2026-07-16] lint | 0 issues found

- NotebookLM ready sources: 8
- Local immutable raw records: 8
- Missing or duplicate NotebookLM source IDs: 0
- Raw SHA-256 mismatches: 0
- Wiki pages: 18
- Valid internal link references: 114
- Broken links, orphan pages, missing index entries: 0
- Frontmatter, source path, tag, page-size errors: 0

## [2026-07-16] query | UA 위키 지식그래프 전체 워크플로우

- Filed the synthesized answer as `queries/ua-knowledge-graph-workflow.md`
- Documented the distinction between `understand` and `understand-knowledge`
- Added the recommended graph generation, validation, dashboard, query, domain analysis, and wiki feedback sequence
- Updated backlinks in `entities/understand-anything.md`, `concepts/knowledge-graph-analysis.md`, and `concepts/research-feedback-loop.md`
- Updated: `index.md`, `log.md`

## [2026-07-16] query | NotebookLM 질의 지식 증분 워크플로우

- Created: `queries/notebooklm-query-compounding.md`
- Documented value-based filing, `ask --json` citation mapping, canonical query updates, and duplicate prevention
- Confirmed that full NotebookLM Q&A transcripts and `raw/notebooklm-queries/` are not stored
- Updated backlinks: `entities/notebooklm.md`, `concepts/llm-wiki.md`, `concepts/research-feedback-loop.md`
- Updated: `index.md`, `log.md`

## [2026-07-16] lint | 0 issues found

- Wiki pages: 20
- Valid internal wikilinks: 136
- Broken links, orphan pages, and missing index entries: 0
- Frontmatter, taxonomy tag, and source path errors: 0
- Raw SHA-256 records checked: 8
- Raw source drift: 0
- Oversized pages and quality warnings: 0

## [2026-07-20] create | AI 개인 지식관리

- 기존 원본 4개를 종합해 원본 보존, 지식 컴파일, 집중 탐색, 그래프 검토와 환류를 하나의 운영 체계로 정리함
- Created: `concepts/ai-personal-knowledge-management.md`
- Updated backlinks: `concepts/ai-knowledge-workflow.md`, `concepts/second-brain-research-workflow.md`
- Updated: `index.md`, `log.md`

## [2026-07-20] lint | 0 issues found

- Wiki pages: 21
- Index entries: 21
- Valid internal wikilinks: 148
- Raw SHA-256 records checked: 8
- Broken links, orphan pages, missing index entries, frontmatter, tag, source path, page-size, and source-drift errors: 0

## [2026-07-20] lint | 0 issues found

- Trigger: `wiki_changed` (`raw/lectures/(Open UP) 오픈소스 AI 활용 인재 양성 과정 멘토 오리엔테이션(풀스택).pdf`)
- Wiki pages: 21
- Index entries: 21
- Valid internal wikilinks: 148
- Raw SHA-256 records checked: 8
- Broken links, orphan pages, missing index entries, frontmatter, tag, source path, stale-content, contested-page, quality, page-size, and source-drift issues: 0

## [2026-07-20] lint | 0 issues found

- Trigger: `wiki_changed` (`raw/lectures/open-up/오픈소스 AI 운영 가이드_양식_풀스택과정.pptx.pdf`)
- Wiki pages: 21
- Index entries: 21
- Valid internal wikilinks: 148
- Raw SHA-256 records checked: 8
- Broken links, orphan pages, missing index entries, frontmatter, tag, source path, stale-content, contested-page, quality, page-size, and source-drift issues: 0

## [2026-07-20] create | Hermes Agent cron 자동화 기술 블로그

- Created: `raw/blog/hermes-agent-cron-llm-wiki-knowledge-graph.md`
- Documented custom skill aliases, external skill trust, pre-run change gating, cron deployment, launchd gateway operation, asynchronous batch barriers, graph validation, security boundaries, troubleshooting, and rollback
- Body SHA-256: `77e6000e549e64a8e9ab26dcd1f0a5984ca43394caeb2b108181849565a44cd2`

## [2026-07-21] lint | 0 issues found

- Trigger: `wiki_changed` (`raw/blog/hermes-agent-cron-llm-wiki-knowledge-graph.md`)
- Wiki pages: 21
- Index entries: 21
- Valid internal wikilinks: 148
- Raw SHA-256 records checked: 9
- Broken links, orphan pages, missing index entries, frontmatter, tag, source path, stale-content, contested-page, quality, page-size, and source-drift issues: 0

## [2026-07-21] update | UA knowledge graph regenerated

- Trigger: `wiki_changed` (`raw/blog/hermes-agent-cron-llm-wiki-knowledge-graph.md`)
- Deterministic scan: 38 articles, 18 sources, 4 topics, 166 wikilinks (18 unresolved)
- LLM analysis: 3/3 batches completed; added 14 entities, 27 claims, and 55 inferred edges before merge deduplication
- Saved: `.ua/knowledge-graph.json`, `.ua/meta.json`
- Final graph: 101 nodes, 215 edges, 5 layers, 4 tour steps; dangling edges: 0

## [2026-07-21] create | GitHub repository initialized

- Initialized the local Git repository on `main` and connected `origin` to `git@github.com:ains-lab/pkm-study.git`.
- Added `.gitignore` rules for local editor state, caches, CodeGraph data, and UA trash artifacts.

## [2026-07-21] create | Codex Excalidraw·Archify 아키텍처 다이어그램 기술 블로그

- Created: `raw/blog/codex-excalidraw-archify-architecture-diagrams.md`
- Documented reproducible Skill and MCP installation, macOS LaunchAgent startup, Excalidraw CLI/MCP workflows, Archify JSON IR rendering and validation, tool-selection criteria, troubleshooting, security, and update/removal procedures
- Body SHA-256: `90f660d2a7f89099e07000a3b526007b7424ccefc77daea6e084bf328d622a09`

## [2026-07-21] create | Project-local Codex skills

- Added repository-scoped skills under `.agents/skills/`: `llm-wiki`, `understand`, `understand-chat`, `understand-dashboard`, `understand-diff`, `understand-domain`, `understand-explain`, `understand-figma`, `understand-knowledge`, and `understand-onboard`
- Preserved bundled scripts, references, language and framework guidance, and the UA analyzer prompts needed by the copied workflows
- Added `agents/openai.yaml` discovery metadata to all 10 skill packages
- Validation: 10/10 packages passed `quick_validate.py`; the local `understand-knowledge` deterministic smoke test produced a valid graph with 62 nodes, 161 edges, 5 layers, 4 tour steps, unique node IDs, and zero dangling edges
- Left `skills-lock.json` unchanged because it is managed by the external skill-management workflow

## [2026-07-21] query | 증거 기반 2nd-Brain 아키텍처 다이어그램

- Queried `.ua/knowledge-graph.json` with `understand-chat`: 101 nodes, 215 edges, 5 layers; traced the PKM, LLM Wiki, Zotero, NotebookLM, Obsidian, Understand Anything, and research feedback-loop subgraph.
- Synthesized the architecture from existing canonical pages including `ai-personal-knowledge-management`, `second-brain-research-workflow`, `research-feedback-loop`, `knowledge-tool-roles`, `notebooklm-query-compounding`, and `ua-knowledge-graph-workflow`.
- Created: `output/second-brain-pkm-architecture.excalidraw`, `output/second-brain-pkm-architecture.png`, `output/second-brain-pkm-architecture.svg`.
- Visual validation: 48 Excalidraw elements; PNG 2324×1018; SVG parsed successfully; no text truncation, box overlap, or unrelated arrow crossing observed.
- Canonical filing: no new query page created because the design is already covered by the existing concept and query pages; this operation produced a visual deliverable only.

## [2026-07-21] query | 2nd-Brain 아키텍처 기술문서

- Queried `.ua/knowledge-graph.json` with `understand-chat`; examined project metadata, 14 relevant article nodes, their internal one-hop edges, and the matching entity, concept, comparison, and query layers.
- Synthesized the evidence-first architecture, role-based technology stack, governance boundaries, operational workflows, validation gates, and phased adoption model.
- Created external deliverable: `../2nd-brain-template/docs/second-brain-pkm-architecture.md`.
- Validation: UTF-8/LF and final newline confirmed; 18 fenced-code delimiters balanced; all three relative diagram assets resolved; Pandoc GFM parsing and Glow terminal rendering succeeded.
- Canonical filing: no canonical page created or updated because the reusable knowledge is already covered by the source graph nodes and this operation produced deployment documentation for a separate template repository.

## [2026-07-21] query | 2nd-Brain 구축 원본 이관 범위

- Queried `.ua/knowledge-graph.json` with `understand-chat`; followed the 2nd-Brain PKM core article nodes, one-hop canonical neighbors, source citations, and entity, concept, comparison, and query layers.
- Selected 13 unique raw files referenced by the relevant canonical subgraph; excluded unrelated lecture, local automation blog, architecture-diagram blog, and skills-marketplace records.
- Copied the selected files with their exact `raw/notebooklm/`, `raw/web/`, and `raw/youtube/` relative paths to `../2nd-brain-template/raw/`.
- Integrity: all 13 source/target files are byte-identical; 8/8 recorded post-frontmatter body hashes match; 5 legacy captures remain documented hash-coverage gaps.
- Source vault state: no raw or canonical source file was changed; this append-only query record is the only local mutation.

## [2026-07-22] lint | 0 issues found

- Trigger: `wiki_changed` (`raw/blog/codex-excalidraw-archify-architecture-diagrams.md`, `raw/platform/AINS Servers.md`)
- Wiki pages: 21
- Index entries: 21
- Valid internal wikilinks: 148
- Raw SHA-256 records checked: 10; legacy raw captures without recorded hashes: 6
- Broken links, orphan pages, missing index entries, frontmatter, tag, source path, contested-page, quality, page-size, source-drift, and log-rotation issues: 0

## [2026-07-22] update | Codex 환경의 Zotero MCP 설치 방법

- Preserved official evidence in `raw/web/zotero-mcp-server-installation.md` and `raw/web/codex-mcp-configuration.md`; both recorded post-frontmatter SHA-256 hashes match.
- Updated `entities/zotero-mcp.md` to distinguish the Zotero plugin and standalone MCP server implementations and document prerequisites, `uv` installation, Codex STDIO registration, `config.toml`, verification, hybrid write mode, and semantic indexing.
- Updated the `[[zotero-mcp]]` summary and date in `index.md`; the canonical page count remains 21.
- Wiki validation: 21 canonical pages, 21 index entries, 148 valid internal wikilinks, 12 recorded raw hashes checked, 8 legacy raw captures without hashes, and zero frontmatter, tag, source, link, orphan, duplicate, page-size, or source-drift issues.
- Example validation: all Bash blocks passed `bash -n`; both TOML blocks parsed with Python `tomllib`; Zotero MCP v0.6.2, library listing, and semantic database status probes succeeded.
- Runtime note: the live session's Zotero MCP tools remained callable, but a later standalone `codex mcp get zotero --json` did not find a durable registration in the active `CODEX_HOME`; this is an environment-level registration check, not a canonical-document failure.
- Regenerated the knowledge graph with four complete analysis batches: 143 nodes, 241 edges, 5 layers, 4 tour steps, unique node IDs, and zero dangling edges; fresh graph/meta timestamps and the updated Zotero installation section were verified.
- Dashboard launch was intentionally skipped because routine validation must not download and execute the unpinned remote `latest` viewer.

## [2026-07-22] update | Zotero MCP 문서 그래프 최신성 재검증

- Detected that `entities/zotero-mcp.md` was mechanically normalized from inline YAML lists to block lists 45 seconds after the first graph save, making the earlier 143-node graph older than its canonical input.
- Regenerated the scan manifest and waited for all four analysis batches again; all batch files were newer than the second run start and had zero cross-batch node-ID duplicates, duplicate edges, or dangling endpoints.
- Replaced the stale graph with the fresh result: 145 nodes, 241 edges, 5 layers, 4 tour steps, unique node IDs, and zero dangling edges.
- Verified that the regenerated Zotero article node contains both the normalized current frontmatter and the `Codex 환경에 설치` section, and that graph/meta modification times are newer than all canonical inputs from this operation.
- Removed only the generated `.ua/intermediate/` analysis artifacts after validation; the dashboard remained intentionally unlaunched under the repository validation policy.

## [2026-07-22] ingest | Agentic AI and LLM-Driven Framework for Contextual Anomaly Detection

- Selected Zotero item `HJDEIS2T` as the most recently added bibliographic parent and rejected child attachment `IJJBX4JN` as the parent record.
- Preserved the complete journal-article metadata, BibTeX citation key, PDF attachment metadata, abstract, and extracted text in `raw/articles/2026-06-agentic-ai-and-llm-driven-framework-for-contextual-anomaly-detection.md`.
- Body SHA-256: `134f9979410eca586ecd3937cc5e285243c7706df7a6b714b2d8963fc4a3ed19`; the saved extracted-text section matched the Zotero response character-for-character and ends with exactly one newline.
- Created `concepts/agentic-ai-contextual-anomaly-detection.md`, added reciprocal context to `concepts/agentic-workspace.md`, and synchronized `index.md` to 22 canonical pages.
- Wiki validation: 22 canonical pages, 22 index entries, 152 valid internal wikilinks, 13 recorded raw hashes checked, 8 legacy raw captures without hashes, and zero frontmatter, tag, source, link, orphan, duplicate, page-size, or source-drift issues.
- Regenerated the knowledge graph after four complete analysis batches: 153 nodes, 246 edges, 5 layers, 4 tour steps, unique node IDs, and zero dangling edges; fresh graph/meta timestamps and both new article nodes were verified.
- Removed only the generated `.ua/intermediate/` analysis artifacts after validation; the dashboard remained intentionally unlaunched under the repository validation policy.

## [2026-07-22] ingest | Zotero 미수집 논문 일괄 보존

- Inventoried all 9 bibliographic parent items in the active Zotero library after excluding attachments and notes; 1 parent item (`HJDEIS2T`) was already preserved and 8 were missing from `raw/`.
- Fetched parent JSON metadata, BibTeX, and children for all 9 items before requesting any full text; every new record has authors, publication date, and a stable DOI or URL, so all 8 are marked `metadata_status: complete`.
- Created 8 immutable source records under `raw/papers/`: `ZXT9CKFK`, `C7KKTGFR`, `UYPKKMVF`, `SE3DXVKS`, `YL2E58Q7`, `MTS59CC2`, `6HFDNY5N`, and `XW2NQT6S`.
- For `SE3DXVKS`, the parent full-text call selected an HTML landing-page attachment, so extracted text was taken from verified PDF child `UUXTMDL5` while retaining `SE3DXVKS` as the bibliographic parent.
- Validation: 9/9 Zotero parents are represented exactly once in `raw/`; 8/8 new extracted-text SHA-256 values match the normalized MCP responses; body hashes, readable metadata agreement, final-newline rules, parent/attachment separation, and duplicate-key checks all passed with zero errors.
- Per user scope, no canonical wiki page, `index.md`, or `.ua/` knowledge-graph artifact was created or updated.

## [2026-07-22] update | Zotero 논문 경로 이관과 canonical 지식 컴파일

- Moved `raw/articles/2026-06-agentic-ai-and-llm-driven-framework-for-contextual-anomaly-detection.md` to the matching `raw/papers/` path without changing its bytes; full-file SHA-256 remained `71d05d3971e3008bd5ea0aa82db8d6e003118c922820acbb5fe9aa46801a8117`.
- Updated the moved source path and provenance markers in `concepts/agentic-ai-contextual-anomaly-detection.md` and `concepts/agentic-workspace.md`; historical log references were preserved.
- Compiled the 9 Zotero papers into three reusable concepts: `cyber-threat-intelligence-knowledge-graphs`, `autonomous-cyber-defense-agents`, and `agentic-ai-safety-governance`.
- Expanded the existing anomaly-detection and agentic-workspace concepts with cross-domain evidence, explicit evidence limits, and reciprocal links.
- Updated `index.md` to 25 canonical pages.
- Knowledge-graph regeneration was intentionally skipped to preserve the user's prior instruction not to generate it.

## [2026-07-22] lint | 0 issues found

- Wiki pages: 25
- Index entries: 25
- Valid internal wikilinks: 166
- Raw SHA-256 records checked: 21; legacy raw captures without recorded hashes: 8
- Zotero records checked: 9; metadata, readable-block agreement, parent/attachment separation, duplicate keys, and body hashes: 0 errors
- Broken links, orphan pages, missing index entries, frontmatter, tag, source path, duplicate-topic, page-size, source-drift, and moved-path issues: 0

## [2026-07-22] analyze | CTI 기반 AI Agent 보안 도메인 흐름 생성

- Derived the domain model from the existing `.ua/knowledge-graph.json` without regenerating the general knowledge graph.
- Created `.ua/domain-graph.json` with 4 domains, 8 flows, 40 ordered steps, 53 edges, and 5 cross-domain handoffs covering CTI evidence collection, threat-knowledge graph construction, contextual Agent threat detection, governed response, and verified feedback.
- Validation: official Understand Anything `validateGraph` passed with zero issues; duplicate node IDs, dangling/self/duplicate edges, invalid weights, missing domain/flow ownership, missing step parents, and non-monotonic step order were all zero.
- Live dashboard QA: the local dashboard returned HTTP 200 and served the complete domain graph through its protected domain-data endpoint; the temporary server was stopped after verification.
- Evidence boundary: the reused knowledge graph predates the three newest CTI canonical pages, so the domain graph records a target operating model grounded in the available graph and explicitly does not claim full coverage of those newer pages.

## [2026-07-25] ingest | Palantir Architecture Center, Logseq, 엔터프라이즈 온톨로지

- Trigger: `source_inbox`; processed 9 paths supplied by the pre-run gate without recalculating freshness.
- Preserved 7 Palantir clippings and the Logseq clipping under `raw/web/`; verified each stored body is byte-identical to its inbox input and matches its recorded SHA-256.
- Created: `raw/web/ax-labs-enterprise-ontology-shared-vocabulary.md`; preserved the inbox body byte-for-byte under raw frontmatter, SHA-256 `b9c12c2d3c870ad8e4d4b07fb830194ed1a710d7d854852b397055ccc07a7033`.
- Created: `entities/palantir.md`, `entities/logseq.md`, `concepts/enterprise-ontology.md`, `concepts/enterprise-ai-operating-system.md`, `comparisons/ontology-and-llm-wiki.md`.
- Updated backlinks and scope: `entities/obsidian.md`, `concepts/llm-wiki.md`, `concepts/ai-personal-knowledge-management.md`.
- Updated: `index.md`; canonical page count is 30.
- Moved all 9 successfully preserved and reflected inputs to `inbox/processed/`.

## [2026-07-25] lint | 0 issues found

- Wiki pages: 30; index entries: 30; valid internal wikilinks: 188.
- Raw SHA-256 records checked: 30; legacy raw captures without recorded hashes: 11; source drift: 0.
- Broken links, orphan pages, missing index entries, frontmatter, taxonomy tag, source path, duplicate-topic, page-size, confidence, contested-page, and log-rotation issues: 0.

## [2026-07-25] update | UA knowledge graph regenerated

- Trigger: `source_inbox`; expected and completed 6/6 article-analysis batches (15, 15, 15, 15, 15, 4 articles).
- Deterministic scan: 79 articles, 41 sources, 4 topics, 205 wikilinks (17 unresolved).
- LLM analysis added 48 entities, 56 claims, and 100 inferred edges after entity deduplication.
- Saved: `.ua/knowledge-graph.json`, `.ua/meta.json`.
- Final graph: 228 nodes (79 articles, 48 entities, 4 topics, 56 claims, 41 sources), 310 edges, 5 layers, 4 tour steps; unique node IDs and dangling edges: 0 errors.
- Graph and metadata modification times are newer than the run start; all new canonical article nodes are present. Dashboard launch was intentionally skipped for cron safety.

## [2026-07-25] ingest | NotebookLM notebook `CAG`

- Inventoried the Zotero collection `CAG (CTI-based Agentic GraphRAG)`: 21 direct items and 15 scholarly records representing 11 distinct papers after consolidating duplicate bibliographic records for CTI-Thinker, autonomous cyber defence, and CTI knowledge-graph completion.
- Reused the 3 paper PDFs already present in NotebookLM and added the 8 missing Zotero PDFs for item keys `XW2NQT6S`, `HJDEIS2T`, `UYPKKMVF`, `6HFDNY5N`, `DR7N5IEC`, `MTS59CC2`, `SE3DXVKS`, and `YL2E58Q7`; no duplicate paper file was uploaded.
- Followed direct `cites` edges in the current UA knowledge graph and added `concepts/agentic-ai-contextual-anomaly-detection.md`, `concepts/agentic-ai-safety-governance.md`, `concepts/autonomous-cyber-defense-agents.md`, and `concepts/cyber-threat-intelligence-knowledge-graphs.md`.
- Validation: all 12 new sources were added without upload failures; the notebook contains 31 sources and all report `ready`; indexed full text is nonempty for all 11 distinct Zotero papers and all 4 added UA canonical pages.
- No raw, canonical, index, or generated graph content was changed; only this append-only operation record was added locally.

## [2026-07-25] query | CTI-Thinker 논문 요약과 CAG 설계 시사점

- Queried only the CTI-Thinker PDF in NotebookLM notebook `CAG (CTI-Based Agentic GraphRAG)` and retained conversation `9621c33c-d377-4916-805b-75a04f4b6dea`, turn 1, and source `31f3d105-8a70-436d-b0a0-53de2246fd64`.
- Created: `queries/cti-thinker-paper-summary.md`; stored distilled, source-verified synthesis rather than the full NotebookLM answer.
- Updated backlink: `concepts/cyber-threat-intelligence-knowledge-graphs.md`.
- Updated: `index.md`; canonical page count is 31.
- Verification corrected the dataset split to 2,762/345/345, distinguished the k=7 joint choice from the k=9 entity-only maximum, and excluded unsupported zero-day and computation-cost claims.
- NotebookLM reference status is `partial` because the immutable local raw paper has no `notebooklm_source_id` field; title, DOI, and body were independently matched to the preserved Zotero source.

## [2026-07-25] lint | 0 issues found

- Wiki pages: 31; index entries: 31; valid canonical wikilinks: 193.
- Raw SHA-256 records checked: 30; legacy raw captures without recorded hashes: 9; source drift: 0.
- Broken links, orphan pages, missing index entries, frontmatter, taxonomy tag, source path, duplicate-title, page-size, confidence, contested-page, and log-operation issues: 0.

## [2026-07-25] ingest | NotebookLM notebook `CTI-Thinker`

- Inventoried all 34 sources in NotebookLM notebook `CAG (CTI-Based Agentic GraphRAG)` and selected the 5 sources whose central topic is CTI-Thinker; broader CTI and knowledge-graph sources that only mention CTI-Thinker were excluded.
- Created NotebookLM notebook `CTI-Thinker` (`dc47215b-cbef-4e6c-901d-2102ba71fa57`).
- Added the CTI-Thinker paper PDF, its preserved Markdown record, the CTI-Thinker knowledge-graph wiki note, the target-schema/JSON analysis, and the 2026-07-25 CTI-Thinker/STIX/ATT&CK note bundle.
- Validation: the notebook contains exactly 5 sources; all report `ready`, and their indexed full-text character counts are 118224, 10501, 824, 1578, and 126349.
- NotebookLM re-indexed the copied Markdown, pasted-text, and PDF sources, so the indexed representation is not byte-identical to the source notebook's internal full text.
- No raw, canonical, index, or generated graph content was changed; only this append-only operation record was added locally.

## [2026-07-27] lint | 0 issues found

- Wiki pages: 31; index entries: 31; valid canonical wikilinks: 193.
- Raw SHA-256 records checked: 30; legacy raw captures without recorded hashes: 8; source drift: 0; Zotero records checked: 9.
- Broken links, orphan pages, missing index entries, frontmatter, taxonomy tag, source path, duplicate-title, page-size, confidence, contested-page, and log-rotation issues: 0.
- Regenerated `.ua/knowledge-graph.json` and `.ua/meta.json` from 31 canonical articles, 42 raw sources, and 4 index topics; validation found zero dangling edges.
- Implicit LLM enrichment was omitted after delegated analysis did not return and the configured provider reported HTTP 429 usage limits; the saved graph contains deterministic wiki links and category edges only.

## [2026-07-29] lint | 0 issues found

- Trigger: `wiki_changed` (`raw/platform/AINS Servers.md`).
- Wiki pages: 31; index entries: 31; valid canonical wikilinks: 193.
- Raw SHA-256 records checked: 30; legacy raw captures without recorded hashes: 12; source drift: 0; Zotero records checked: 9.
- Broken links, orphan pages, missing index entries, frontmatter, taxonomy tag, source path, duplicate-title, page-size, confidence, contested-page, and log-rotation issues: 0.

## [2026-07-29] update | UA knowledge graph regenerated

- Trigger: `wiki_changed` (`raw/platform/AINS Servers.md`); no source ingest or canonical-page edit was performed.
- Expected and completed 6/6 article-analysis batches (15, 15, 15, 15, 15, 5 articles).
- Deterministic scan: 80 articles, 42 sources, 4 topics, 210 wikilinks (17 unresolved).
- LLM analysis added 49 entities, 54 claims, and 105 inferred edges after entity deduplication.
- Saved: `.ua/knowledge-graph.json`, `.ua/meta.json`.
- Final graph: 229 nodes (80 articles, 49 entities, 4 topics, 54 claims, 42 sources), 321 edges, 5 layers, 4 tour steps; unique node IDs and dangling edges: 0 errors.
- Graph and metadata modification times are newer than the run start; the changed raw path is represented by both article and source nodes. Dashboard launch was intentionally skipped for cron safety.

## [2026-07-30] lint | 0 issues found

- Trigger: `wiki_changed` (`raw/web/ains-lab2nd-brain-template llm-wiki 이용하여 나의 개인 지식관리 생성을 위한 2nd-brain 프로젝트 입니다..md`); no source ingest or canonical-page edit was performed.
- Wiki pages: 31; index entries: 31; valid canonical wikilinks: 193.
- Raw SHA-256 records checked: 30; legacy raw captures without recorded hashes: 10; source drift: 0; Zotero records checked: 9.
- Broken links, orphan pages, missing index entries, frontmatter, taxonomy tag, source path, duplicate-title, page-size, confidence, contested-page, and log-rotation issues: 0.

## [2026-07-30] update | UA knowledge graph regenerated

- Trigger: `wiki_changed` (`raw/web/ains-lab2nd-brain-template llm-wiki 이용하여 나의 개인 지식관리 생성을 위한 2nd-brain 프로젝트 입니다..md`); no source ingest or canonical-page edit was performed.
- Expected and completed 6/6 article-analysis batches (15, 15, 15, 15, 15, 7 articles).
- Deterministic scan: 82 articles, 43 sources, 4 topics, 212 wikilinks (19 unresolved).
- LLM analysis added 47 entities, 52 claims, and 110 inferred edges after entity deduplication.
- Saved: `.ua/knowledge-graph.json`, `.ua/meta.json`.
- Final graph: 228 nodes (82 articles, 47 entities, 4 topics, 52 claims, 43 sources), 326 edges, 5 layers, 4 tour steps; unique node IDs and dangling edges: 0 errors.
- Graph and metadata modification times are newer than the run start; the changed raw path is represented by both article and source nodes. Dashboard launch was intentionally skipped for cron safety.
