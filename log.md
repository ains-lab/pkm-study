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
