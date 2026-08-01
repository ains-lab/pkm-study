# pkm-study-open-source-readme - Work Plan

## TL;DR (For humans)
<!-- Fill this LAST, after the detailed plan below is written, so it summarizes the REAL plan. -->
<!-- Plain English for a non-engineer: NO file paths, NO todo numbers, NO wave/agent/tool names. -->

**What you'll get:** <fill last - deliverables in human terms, 1-2 sentences>

**Why this approach:** <fill last - the one or two load-bearing decisions and why>

**What it will NOT do:** <fill last - 1-3 plain lines mirroring Must NOT have>

**Effort:** <Quick | Short | Medium | Large | XL>
**Risk:** <Low | Medium | High> - <one-line driver>
**Decisions to sanity-check:** <fill last - the few choices worth a human glance>

Your next move: <fill - e.g. approve, or run a high-accuracy review>. Full execution detail follows below.

---

> TL;DR (machine): <1 line - effort, risk, deliverables>

## Scope
### Must have
- Create exactly one product file: root `README.md` in `/Users/sysmoon/.codex/projects/pkm-study`.
- Treat `README.md` as GitHub project documentation, not as a canonical wiki page: no YAML frontmatter, no `[[wikilink]]`, no `index.md` entry, no `log.md` append, no wiki lint, no UA regeneration, and no dashboard launch.
- Use Korean-first prose with English tool names and relative GitHub Markdown links.
- Start with `# PKM Study`, a one-sentence promise, and a visible callout that public release remains blocked until licensing, redistribution, privacy, and tracked-artifact review are complete.
- Use this exact H2 order, each exactly once: `이 저장소는 무엇인가`, `핵심 가치`, `주요 기능`, `아키텍처`, `지식 수명주기`, `저장소 구조`, `빠른 시작`, `사용 방법`, `Canonical 문서 작성 규칙`, `지식 그래프 사용`, `선택적 도구와 자동화`, `공개 전 필수 점검`, `기여와 지원`, `라이선스`.
- Include exactly two Mermaid diagrams: (1) immutable `raw/` evidence → canonical Markdown → validation → derived UA graph → source verification → canonical feedback; (2) orient → preserve raw → smallest canonical update → links/index/log → health check → `understand-knowledge` → graph validation.
- Separate the Markdown vault core from optional Obsidian, Zotero, NotebookLM, Understand Anything, Hermes, Graphify, CodeGraph, Orca, and slides-grab roles.
- State that core reading has no build/install step; Obsidian is optional. Describe graph generation as an agent-skill invocation and the dashboard as an optional local launcher with explicit prerequisites and risk caveats.
- Provide an exact pre-publication checklist: choose/add a license; review every tracked `raw/` body/binary and `output/` artifact for redistribution/privacy; decide whether generated `.ua` graph/meta/fingerprint files belong in the public allowlist; keep local trash/workspace/cache/CodeGraph state excluded; scan tracked files for identifiers, contacts, absolute local paths, signed/tokenized URLs, and credentials; review `git ls-files` rather than trusting `.gitignore`; do not push before all gates pass.
- Use repository-native support wording: ordinary questions/defects via GitHub Issues; sensitive reports must not be posted publicly; no private security channel is currently supplied.
- Preserve the dirty-worktree baseline and leave `README.md` unstaged. Plan-owned evidence may be written only beneath `.omo/evidence/`.

### Must NOT have (guardrails, anti-slop, scope boundaries)
- Do not edit canonical wiki pages, `SCHEMA.md`, `index.md`, `log.md`, `raw/`, `output/`, `.ua/`, `.obsidian/`, `run_ua_dashboard.sh`, Hermes files, skills, Git configuration, branch, remote, or pre-existing `.omo` paths.
- Do not initialize/reinitialize Git, clean/reset the worktree, stage, commit, push, launch the dashboard, run a scheduler, regenerate the graph, or install project dependencies.
- Do not link from README into `raw/`, `.ua/`, `.obsidian/`, `.codegraph`, or `output/`.
- Do not include badges, frozen page/node/edge counts, feature-inventory marketing, a named maintainer, an email, fake URLs, `TODO`/`TBD`, `<repository-url>`, `example.com`, or other placeholders.
- Do not copy notebook/source IDs, UUIDs, signed URLs, token query strings, contact data, absolute home paths, raw bodies, generated graph bodies, or environment-specific Hermes paths/job IDs.
- Do not claim the repository is already open source/publication-ready, a license exists, optional tools are bundled, a live cron is deployed, lint is CI-backed, unresolved graph links are zero, or graph-inferred relationships are facts.
- Do not use generic code `understand` as the wiki graph entry point or present `$understand-anything:understand-knowledge <vault-root>` as a shell command.

## Verification strategy
> Zero human intervention - all verification is agent-executed.
- Test decision: **none** for pure prose. README wording has no honest RED seam and this repository has no committed test runner. Verification uses deterministic structure/link/public-safety validators, isolated negative fixtures, Pandoc render, pinned transient Mermaid/Markdown validation, full read, and scope comparison.
- Evidence root: set `attemptDir="${ATTEMPT_DIR:-.omo/evidence/pkm-study-open-source-readme}"`; create it only after saving the task-start Git status to an OS temp file, then copy that baseline into `$attemptDir/task-1-baseline-status.z` and delete the OS temp file.
- Evidence privacy: validators print only PASS/FAIL and path/status summaries; they never echo matched text, captured identifiers, or source bodies.
- Failure fixtures: create only under `qa_tmp=$(mktemp -d)` with `trap 'rm -rf "$qa_tmp"' EXIT`; inject synthetic dummy values, require the relevant validator to exit nonzero, and record only the expected-failure status.
- Render channel: use Pandoc for GFM-to-HTML, pinned transient `markdownlint-cli2@0.23.1`, and pinned transient `@mermaid-js/mermaid-cli@11.16.0` with `npm_config_cache` inside `qa_tmp`. Copy only sanitized HTML/diagram/status evidence into `attemptDir`; remove the isolated npm cache with `qa_tmp`.
- Scope channel: capture NUL-delimited `git status --porcelain=v1 -z`; final comparison permits only the new product path `README.md`, the resolved `attemptDir`, and paths already present in the baseline. Require `git diff --cached --quiet` and `git diff --check -- README.md`.
- Runtime rule: never execute `./run_ua_dashboard.sh`. Only run `bash -n run_ua_dashboard.sh`.

## Execution strategy
### Parallel execution waves
> Target 5-8 todos per wave. Fewer than 3 (except the final) means you under-split.
- **Wave 1 — serialized single-file ownership:** Todos 1 → 2 → 3. Exactly one worker owns `README.md`; tasks are intentionally serialized to prevent conflicting edits.
- **Final verification wave — parallel read-only review:** F1, F2, F3, and F4 start only after Todo 3 passes. They may run in parallel because they do not edit product files.
- Stop immediately on an unexpected product-path change, staged change, unsupported factual claim, secret/local-path match, invalid link, malformed Mermaid block, or publication-ready claim.

### Dependency matrix
| Todo | Depends on | Blocks | Can parallelize with |
| --- | --- | --- | --- |
| 1 | none | 2 | none; sole README writer |
| 2 | 1 | 3 | none; sole README writer |
| 3 | 2 | F1, F2, F3, F4 | none; integrated gate |
| F1 | 3 | completion | F2, F3, F4 |
| F2 | 3 | completion | F1, F3, F4 |
| F3 | 3 | completion | F1, F2, F4 |
| F4 | 3 | completion | F1, F2, F3 |

## Todos
> Implementation + Test = ONE todo. Never separate.
<!-- APPEND TASK BATCHES BELOW THIS LINE WITH edit/apply_patch - never rewrite the headers above. -->
- [x] 1. Create the Korean-first README structure, positioning, architecture, and lifecycle
  - What to do: before creating evidence directories, save `git status --porcelain=v1 -z` to an OS temp file; create `attemptDir`; preserve that file as `$attemptDir/task-1-baseline-status.z`. Create only root `README.md`. Implement the fixed title, promise, pre-publication callout, all 14 H2 headings in the exact order, content through `지식 수명주기`, and exactly two closed Mermaid blocks using the approved architecture/lifecycle flows.
  - Must NOT do: no frontmatter, `[[wikilink]]`, badges, dynamic counts, raw/generated content, placeholders, claims of publication readiness, or edits outside `README.md` and plan-owned evidence.
  - Required assertions by section: `이 저장소는 무엇인가` says this is a Korean Markdown/Obsidian PKM reference vault rather than an application; `핵심 가치` covers evidence immutability, provenance, reusable canonical knowledge, and tool-independent Markdown; `주요 기능` covers typed canonical pages, schema/frontmatter, index/log traceability, health gates, and optional derived graph; diagrams make graph findings hypotheses that return only after source verification.
  - Parallelization: Wave 1, serialized | Blocked by: none | Blocks: 2.
  - References: `AGENTS.md:3-8,31-75`; `SCHEMA.md:3-52,70-75`; `concepts/ai-personal-knowledge-management.md:16-49`; `concepts/llm-wiki.md:15-38`; `concepts/ai-knowledge-workflow.md:22-49`; `concepts/research-feedback-loop.md:14-27`; `.omo/drafts/pkm-study-open-source-readme.md` Components/Decisions/Scope.
  - Acceptance criteria: `README.md` exists; first nonblank line is `# PKM Study`; exactly one H1; each of the 14 approved H2 headings appears exactly once in strict order; exactly two complete `mermaid` fences; file does not start with `---`; no `[[` occurs; full read confirms the section assertions above.
  - Exact validator: write this non-committed script to `$qa_tmp/validate_structure.py`, then run it against `README.md`:
    ```python
    from pathlib import Path
    import re, sys
    text = Path(sys.argv[1]).read_text(encoding="utf-8")
    headings = [
        "이 저장소는 무엇인가", "핵심 가치", "주요 기능", "아키텍처",
        "지식 수명주기", "저장소 구조", "빠른 시작", "사용 방법",
        "Canonical 문서 작성 규칙", "지식 그래프 사용", "선택적 도구와 자동화",
        "공개 전 필수 점검", "기여와 지원", "라이선스",
    ]
    nonblank = next((line for line in text.splitlines() if line.strip()), "")
    assert nonblank == "# PKM Study"
    assert sum(line.startswith("# ") for line in text.splitlines()) == 1
    positions = []
    for heading in headings:
        marker = f"## {heading}\n"
        assert text.count(marker) == 1
        positions.append(text.index(marker))
    assert positions == sorted(positions)
    assert len(re.findall(r"```mermaid\n.*?\n```", text, re.S)) == 2
    assert not text.startswith("---\n")
    assert "[[" not in text
    print("PASS structure")
    ```
  - QA scenarios:
    - Happy: `python3 "$qa_tmp/validate_structure.py" README.md` followed by `sed -n '1,999p' README.md`; record only `PASS structure` plus full-read verdict in `$attemptDir/task-1-readme-structure.txt`.
    - Failure: copy README to `$qa_tmp/bad.md`; run `perl -0pi -e 's/^## 지식 수명주기\n//m; s/```\n/\n/' "$qa_tmp/bad.md"`; require `! python3 "$qa_tmp/validate_structure.py" "$qa_tmp/bad.md"`; append `PASS negative structure fixture rejected` to the same evidence file.
  - Commit: **N** — incomplete single-file deliverable; do not stage.

- [x] 2. Add repository map, quick start, usage, authoring contract, graph workflow, and optional tool roles
  - What to do: fill `저장소 구조` through `선택적 도구와 자동화`. Use GitHub relative links only to the approved authored docs. Make core Markdown reading usable without a build. Say to clone with the repository's GitHub **Code** button URL, then `cd pkm-study`; do not invent/hardcode a clone URL. Explain the orientation order `SCHEMA.md` → `index.md` → recent `log.md`, raw immutability, smallest canonical update, exact provenance, links/index/log discipline, health checks, UA regeneration and validation, and optional role boundaries.
  - Must NOT do: no invented installer/package manifest/project linter; no generic `understand`; no dashboard execution; no claim of a live Hermes scheduler; no links into forbidden state/source/output directories; no edits outside README/evidence.
  - Required command semantics: label `$understand-anything:understand-knowledge <vault-root>` as an **agent-skill invocation**, never shell; the only dashboard shell example is `./run_ua_dashboard.sh`; list Bash, Node/npm+npx, network access, and an existing UA graph as prerequisites; warn that the launcher downloads an unpinned `latest` viewer and prints a token-bearing local URL that must not be shared.
  - Tool roles table: Core = Markdown, YAML frontmatter, GitHub/Obsidian-style links, JSON artifacts, Bash launcher. Optional = Obsidian, Zotero/Zotero MCP, NotebookLM/notebooklm-py, Understand Anything, Hermes, Graphify, CodeGraph, Orca, slides-grab; mark all as external/not bundled.
  - Parallelization: Wave 1, serialized | Blocked by: 1 | Blocks: 3.
  - References: `AGENTS.md:18-29,31-45,77-109`; `index.md:1-38`; `run_ua_dashboard.sh:1-30`; `queries/ua-knowledge-graph-workflow.md:19-31,56-86,131-152`; `comparisons/knowledge-tool-roles.md:18-34`; `comparisons/knowledge-graph-tools.md:17-27`; `concepts/second-brain-research-workflow.md:19-35`; GitHub Docs, “About the repository README file”.
  - Acceptance criteria: all relative links are confined to the approved set and resolve; no link destination starts with a denied prefix; `bash -n run_ua_dashboard.sh` exits 0; full read confirms no-build core, optional Obsidian, agent-skill labeling, dashboard prerequisites/risk, and external integration status.
  - Approved relative-link set: `SCHEMA.md`, `index.md`, `log.md`, `AGENTS.md`, `run_ua_dashboard.sh`, `concepts/ai-personal-knowledge-management.md`, `concepts/ai-knowledge-workflow.md`, `concepts/llm-wiki.md`, `comparisons/knowledge-tool-roles.md`, `queries/ua-knowledge-graph-workflow.md`.
  - Exact link validator: write this non-committed script to `$qa_tmp/validate_links.py`:
    ```python
    from pathlib import Path
    from urllib.parse import unquote, urlparse
    import re, sys
    root = Path.cwd().resolve()
    text = Path(sys.argv[1]).read_text(encoding="utf-8")
    allowed = {
        "SCHEMA.md", "index.md", "log.md", "AGENTS.md", "run_ua_dashboard.sh",
        "concepts/ai-personal-knowledge-management.md",
        "concepts/ai-knowledge-workflow.md", "concepts/llm-wiki.md",
        "comparisons/knowledge-tool-roles.md",
        "queries/ua-knowledge-graph-workflow.md",
    }
    denied = ("raw/", ".ua/", ".obsidian/", ".codegraph", "output/")
    for match in re.finditer(r"!?\[[^\]]*\]\(([^)]+)\)", text):
        dest = match.group(1).strip().split()[0]
        if dest.startswith("#"):
            continue
        if urlparse(dest).scheme in {"http", "https", "mailto"}:
            continue
        assert not dest.startswith(("/", "~"))
        decoded = unquote(dest.split("#", 1)[0])
        assert not decoded.startswith(denied)
        assert decoded in allowed
        resolved = (root / decoded).resolve()
        assert resolved.is_relative_to(root) and resolved.exists()
    print("PASS links")
    ```
  - QA scenarios:
    - Happy: `python3 "$qa_tmp/validate_links.py" README.md`; `bash -n run_ua_dashboard.sh`; record status-only output in `$attemptDir/task-2-readme-links-commands.txt`.
    - Failure: copy README to `$qa_tmp/bad-links.md`; append `[broken](missing.md)` and `[denied](raw/example.md)`; require `! python3 "$qa_tmp/validate_links.py" "$qa_tmp/bad-links.md"`; append `PASS negative links fixture rejected` without echoing destinations.
  - Commit: **N** — continue the same unstaged README change.

- [ ] 3. Add publication boundaries, contribution/support/license truth, and run integrated README QA
  - What to do: fill `공개 전 필수 점검`, `기여와 지원`, and `라이선스`; remove every placeholder. State that rights/privacy are **unreviewed**, not proven unsafe. Require the exact pre-publication checklist in Scope. State that no license currently grants reuse/modification/distribution and that a license must be selected before calling the repository open source. Direct ordinary questions/defects to GitHub Issues, prohibit sensitive public reports, and state that no private security channel is currently supplied.
  - Must NOT do: do not select a license, claim open-source/public-ready status, include contact details/local IDs/token URLs/private paths, link forbidden directories, launch/modify external systems, stage/commit/push, or touch any product path except README.
  - Parallelization: Wave 1, serialized | Blocked by: 2 | Blocks: F1–F4.
  - References: `AGENTS.md:59-75,88-118`; `.gitignore:1-5`; `run_ua_dashboard.sh:7,23-30`; `log.md:121-132`; `raw/blog/hermes-agent-cron-llm-wiki-knowledge-graph.md:696-724`; GitHub Docs, “Adding a license to a repository” and “About community profiles for public repositories”; `.omo/drafts/pkm-study-open-source-readme.md` Findings/Decisions/Scope.
  - Acceptance criteria: README is below 512000 bytes; structure and link validators pass; public-safety scanner passes without printing content; markdownlint passes from isolated pinned cache; both Mermaid blocks extract and render; Pandoc produces standalone HTML; `git diff --check -- README.md` passes; cached diff is empty; scope comparator allows only README plus plan evidence beyond baseline; full read confirms accurate unreviewed-status/license/support wording.
  - Exact public-safety scanner: write this non-committed script to `$qa_tmp/validate_public.py`:
    ```python
    from pathlib import Path
    import re, sys
    data = Path(sys.argv[1]).read_bytes()
    byte_patterns = [
        rb"(?:/Users/|/home/|[A-Za-z]:\\Users\\)",
        rb"\b[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}\b",
        rb"\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b",
        rb"[?&]token=", rb"\b(?:gh[pousr]_|sk-|AIza)[A-Za-z0-9_-]+",
    ]
    text = data.decode("utf-8")
    text_pattern = re.compile(
        r"(?i)\b(?:TODO|TBD)\b|<repository-url>|example\.com|your[- ]?(?:name|email)"
    )
    assert all(re.search(pattern, data) is None for pattern in byte_patterns)
    assert text_pattern.search(text) is None
    print("PASS public-scan")
    ```
  - Exact Mermaid/render commands:
    ```bash
    python3 - README.md "$qa_tmp" <<'PY'
    from pathlib import Path
    import re, sys
    text = Path(sys.argv[1]).read_text(encoding="utf-8")
    blocks = re.findall(r"```mermaid\n(.*?)\n```", text, re.S)
    assert len(blocks) == 2
    out = Path(sys.argv[2])
    for index, block in enumerate(blocks, 1):
        (out / f"diagram-{index}.mmd").write_text(block + "\n", encoding="utf-8")
    print("PASS mermaid-extract")
    PY
    printf '%s\n' '{"config":{"MD013":false,"MD033":false}}' > "$qa_tmp/.markdownlint-cli2.jsonc"
    npm_config_cache="$qa_tmp/npm-cache" npx --yes markdownlint-cli2@0.23.1 --config "$qa_tmp/.markdownlint-cli2.jsonc" README.md
    for diagram in "$qa_tmp"/diagram-*.mmd; do
      number="${diagram##*-}"; number="${number%.mmd}"
      npm_config_cache="$qa_tmp/npm-cache" npx --yes @mermaid-js/mermaid-cli@11.16.0 -i "$diagram" -o "$attemptDir/task-3-diagram-$number.png" -b transparent
    done
    pandoc --from=gfm --to=html5 --standalone --metadata title='PKM Study' README.md --output "$attemptDir/task-3-readme.html"
    ```
  - QA scenarios:
    - Happy: run both previous validators, `python3 "$qa_tmp/validate_public.py" README.md`, `test "$(wc -c < README.md)" -lt 512000`, the Mermaid/render commands, `git diff --check -- README.md`, and `git diff --cached --quiet`; write only statuses to `$attemptDir/task-3-readme-integrated.txt` and retain the HTML/two PNG artifacts.
    - Failure: copy README to `$qa_tmp/bad-public.md`; append only synthetic `/Users/example/private`, `123e4567-e89b-12d3-a456-426614174000`, `?token=dummy`, `TODO`, and `[denied](raw/example.md)` strings plus an invalid Mermaid token in one extracted temp diagram. Require the public/link/Mermaid checks to fail and record only `PASS negative public/render fixtures rejected`.
    - Cleanup: the shell trap removes `qa_tmp`, its isolated npm cache, scripts, and negative fixtures; verify `test ! -e "$qa_tmp"` after a subshell-scoped run and append the cleanup receipt to `$attemptDir/task-3-readme-integrated.txt`.
  - Commit: **N** — no staging/commit/push authorization; leave only README unstaged as the product change.

## Final verification wave
> Runs in parallel after ALL todos. ALL must APPROVE. Surface results and wait for the user's explicit okay before declaring complete.
- [ ] F1. Plan compliance audit
  - Read-only, blocked by Todo 3; may run with F2–F4. Map every Scope Must Have/Must NOT Have and every todo acceptance criterion to a README line or passing evidence artifact. Reject any unmapped criterion, missing negative fixture, missing cleanup receipt, or placeholder. Explicitly prove that an audit fixture missing one required heading would be rejected. Evidence: `$attemptDir/final-F1-plan-compliance.txt`. Commit: **N**.
- [ ] F2. Documentation and factual-quality review
  - Read-only, blocked by Todo 3; may run with F1/F3/F4. Trace operational claims to `SCHEMA.md`, `AGENTS.md`, canonical workflow docs, and launcher source; never infer capability from `output/` or generated graph text. Approve only if Korean-first prose is internally consistent, core vs optional is explicit, there are zero TODO/placeholders/frozen counts/badges/unsupported open-source/live-cron/CI claims, and graph statements remain hypotheses. Negative check: a synthetic bundled-Hermes/live-cron claim must be classified REJECT. Evidence: `$attemptDir/final-F2-doc-quality.txt`. Commit: **N**.
- [ ] F3. Real render and usage QA
  - Read-only, blocked by Todo 3; may run with F1/F2/F4. Inspect `$attemptDir/task-3-readme.html` and both PNG diagrams through the available browser/image surface; confirm headings, callout, tables, links, code blocks, Korean text, and diagram labels are readable without clipping or syntax errors. Verify `./run_ua_dashboard.sh` is clearly optional and never execute it; confirm the skill invocation is labeled non-shell. Negative check: the invalid Mermaid/malformed Markdown fixture from Todo 3 must have failed. Evidence: `$attemptDir/final-F3-render-qa.txt` plus sanitized `$attemptDir/final-F3-readme.png`. Close any browser context; no local server is required because the HTML artifact may be opened directly. Commit: **N**.
- [ ] F4. Scope and publication-fidelity audit
  - Read-only, blocked by Todo 3; may run with F1–F3. Capture fresh NUL status and compare it with `$attemptDir/task-1-baseline-status.z` using a Python status-map checker. Permit newly changed product path only `README.md`; permit the resolved `attemptDir`; require every baseline path outside README to retain its baseline status. Require `git diff --cached --quiet`, `git diff --check -- README.md`, unchanged branch/remote/config, no commit/push, no forbidden links/value classes, and explicit publication blocking pending license/rights/privacy review. Negative check: a synthetic status fixture adding another product path must be rejected. Evidence: `$attemptDir/final-F4-scope-fidelity.txt`. Commit: **N**.

## Commit strategy
- Default: **no commit**. The user approved plan creation, not Git staging/commit/push.
- Leave `README.md` unstaged and preserve the pre-existing `.omo` dirty state plus plan-owned evidence.
- If the user later authorizes a commit, recheck scope, stage exactly `README.md`, and propose `docs(readme): document pkm-study architecture and usage` with footer `Plan: .omo/plans/pkm-study-open-source-readme.md`. Do not include `.omo/evidence/` or unrelated paths.

## Success criteria
- Root `README.md` is the only newly changed product file and passes all Todo 1–3 happy and failure scenarios.
- The README has the fixed 14-section shape, exactly two valid Mermaid diagrams, accurate architecture/workflow/technology/install/use guidance, and no canonical-wiki side effects.
- Every relative link resolves and avoids forbidden source/generated/editor/output directories; shell examples parse and the dashboard is never executed.
- Public-safety and placeholder scans pass without exposing match contents; README clearly states publication is blocked until license, rights, privacy, and tracked-artifact review are complete.
- Pandoc HTML, two rendered diagrams, status-only evidence, negative-fixture receipts, and cleanup receipts exist beneath `attemptDir`.
- F1–F4 all return unconditional APPROVE; branch/remote/config and pre-existing changes are preserved; nothing is staged, committed, pushed, regenerated, or launched.
