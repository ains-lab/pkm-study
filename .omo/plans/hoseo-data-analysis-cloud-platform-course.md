# hoseo-data-analysis-cloud-platform-course - Work Plan

## TL;DR (For humans)
**What you'll get:** 호서대학교 컴퓨터공학과 4학년을 위한 한국어 15주 수업계획서입니다. 주차별 동영상·실습·산출물, NCP 대체 경로, 두 차례의 실기시험, 안전·비용·접근성 기준까지 한 문서에 정리됩니다.

**Why this approach:** 다섯 기술을 따로 나열하지 않고 CTI 원본이 자동 수집되어 위키와 지식그래프로 승격되고 분석 결론으로 이어지는 하나의 누적 데이터 계보로 가르칩니다. 학교 NCP를 우선하되 환경 장애가 학습 전체를 막지 않도록 검증 가능한 대체 자료를 함께 설계합니다.

**What it will NOT do:** 실제 클라우드 자원을 만들거나 에이전트를 설치하지 않습니다. 공격·스캐닝·악성코드·개인정보 수집을 과제로 포함하지 않으며, 기존 위키나 생성 그래프를 수정하지 않습니다.

**Effort:** Large
**Risk:** Medium - 외부 클라우드·API·LLM 가용성과 실습 환경 차이를 대체 자료가 정확히 보존해야 합니다.
**Decisions to sanity-check:** 2~3인 팀 활동은 별도 점수 없는 형성 활동이고 성적은 출석 20%, 중간 실기 40%, 기말 실기 40%입니다. Docker만 가능한 경우 Hermes 서비스 지속성은 실제 수행이 아니라 교수자 자료로 평가합니다.

Your next move: 이 계획을 실행할지, 실행 전에 고정밀 이중 검토를 받을지 선택합니다. Full execution detail follows below.

---

> TL;DR (machine): Large effort, medium risk; one Korean 15-week syllabus with aligned outcomes, practical exams, live/fallback lab tracks, safety policy, and automated document verification.

## Scope
### Must have

- Create exactly one deliverable: `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`, in Korean, as an external deliverable rather than a canonical wiki page.
- Give the syllabus these unique top-level sections: 교과목 개요, 운영 전제 및 선수지식, 학습성과 및 평가 정렬, 평가 방법, 15주 수업 일정, 실습 마일스톤 및 제출 증거, 운영 환경 및 대체 실습 매트릭스, 안전·윤리·비용·개인정보·접근성 정책, 교수자 사전 준비 및 장애 복구, 최신성·출처 기준.
- Define five observable learning outcomes and use the IDs everywhere: `LO1` NCP/Linux cloud infrastructure, `LO2` safe Hermes Agent automation, `LO3` reproducible CTI collection and normalization, `LO4` evidence-preserving LLM Wiki to UA graph generation, `LO5` reproducible graph analysis and source-checked interpretation.
- Cover exactly 15 numbered weeks. Weeks 1-7 and 9-14 are the 13 instructional weeks, each with `60분 비동기 동영상 + 120분 대면 실습`; weeks 8 and 15 are three-hour individual practical exams with no new lecture.
- Use the fixed weekly sequence: 1 orientation/diagnostic/provenance; 2 cloud and NCP networking; 3 NCP VM or approved fallback; 4 Hermes installation and safe operation; 5 CTI sources and manual provenance; 6 normalized/idempotent CTI collector; 7 Hermes scheduling, observation, failure recovery and midterm rehearsal; 8 midterm; 9 LLM Wiki architecture; 10 CTI-to-canonical wiki and lint; 11 UA graph generation and structural validation; 12 graph data model and metrics; 13 reproducible analysis plus source verification; 14 end-to-end recovery, final rehearsal and teardown; 15 final.
- Fix grading to attendance 20%, midterm 40%, final 40%. The 2-3 student integration project is formative and has no separate percentage; both exams require individual execution evidence.
- Make the midterm rubric total 40 points: NCP/fallback environment and network evidence 10, Hermes safe installation/health 10, CTI collection and data-quality evidence 12, individual troubleshooting/safety explanation 8.
- Make the final rubric total 40 points: LLM Wiki schema/provenance/lint 10, UA graph generation/validation 10, graph-metric reproducibility 10, source-checked interpretation and recovery 10.
- Define a live-versus-fallback path for NCP, Hermes, CTI APIs, LLM enrichment, UA generation, and graph analysis. Docker may support collector/wiki/UA work, but Hermes gateway persistence is `fixture-only` unless the host provides systemd; NCP/lab Linux VM/WSL2-with-systemd are the live Hermes tracks.
- Treat ATT&CK v19.1 as a dated semester fixture with `as_of`, check the official latest release at execution time, and document a refresh procedure without silently replacing the teaching fixture mid-semester.
- Include captions and transcripts for every asynchronous video, accessible alternative materials, public-data-only CTI rules, credential handling, retention/deletion rules, NCP cost alerts and full teardown, plus fixture ownership/hash/schema/refresh metadata.
- Use tests-after. Verification of this plan's execution is local and read-only: it checks the syllabus and evidence files only; it must not provision NCP, install Hermes, run cron, collect live data, mutate the wiki, or regenerate UA.

### Must NOT have (guardrails, anti-slop, scope boundaries)

- Do not create, start, stop, or delete a real NCP resource; do not install or configure Hermes; do not create or run a real cron job; do not invoke UA generation during syllabus creation.
- Do not modify `raw/`, canonical Markdown under `entities/`, `concepts/`, `comparisons/`, or `queries/`, `SCHEMA.md`, `index.md`, `log.md`, `.ua/`, existing `output/` artifacts, `.obsidian/`, or external `~/.hermes/` state.
- Do not require malware execution, exploit proof-of-concepts, active scanning, live victim/organization logs, PII, credential collection, login-gated scraping, or automatic patching/response.
- Do not claim that graph-inferred relations are facts, combine CVSS/EPSS/KEV into a single unexplained risk score, or invent a CVE-to-ATT&CK fact edge.
- Do not present volatile NCP price, CISA catalog counts, EPSS values, ATT&CK release, Hermes version, or current graph node/edge counts as permanent thresholds. The current 229-node/321-edge vault snapshot is context only.
- Do not expand the required curriculum into HA, multi-AZ, load balancing, VPN/bastion, production SOC deployment, offensive operations, model fine-tuning, or a separate graded project.
- Do not commit, stage, revert, or normalize unrelated dirty-worktree files. Never overwrite user changes; if a protected hash changes during execution, report it and stop without reverting it.

## Verification strategy
> Zero human intervention - all verification is agent-executed.
- Test decision: **tests-after** using a read-only Ruby structure/content checker, `git diff --no-index --check`, Pandoc GFM parsing, and Glow terminal rendering. No project-local test suite is invented.
- Evidence root: `<attemptDir>` is `currentAttemptDir` from `omo ulw-loop status --json`; outside ulw-loop use `.omo/evidence/hoseo-data-analysis-cloud-platform-course/`.
- Protected-state evidence: Task 1 records `git status --short` plus SHA-256 for `SCHEMA.md`, `index.md`, `log.md`, canonical directories, `raw/`, `.ua/`, and every pre-existing `output/` file. Task 8 compares that manifest and allows only the new syllabus and designated evidence paths.
- Static assertions: no template placeholders; required headings present once; week numbers 1-15 unique; weeks 8/15 are exams; exactly 13 rows use the 60+120 format; `LO1`-`LO5` occur in outcomes, weeks, and assessments; attendance/midterm/final are exactly 20/40/40; midterm and final sub-rubrics each sum to 40; six fallback rows are complete; Docker/Hermes is fixture-only; team size is 2-3 and the project is unweighted; every video has caption/transcript language; safety and source-ledger fields are present.
- Semantic assertions: every practical milestone contains a happy path, a failure path, student artifact, machine-readable evidence, fallback, safety/cost note, and assessment link; every outcome is assessed; no fallback claims a capability it cannot demonstrate.
- Render assertions: `pandoc -f gfm -t html` exits 0 and `glow -s dark` renders a nonempty terminal view with intact tables and no visibly truncated or malformed sections.
- Failure control: validate a temporary corrupted copy with one missing exam week and a 20/40/30 grading split; the checker must exit nonzero while the real syllabus remains unchanged.

## Execution strategy
### Parallel execution waves
> Target 5-8 todos per wave. Fewer than 3 (except the final) means you under-split.

- **Wave 1 - lock evidence and contracts:** Todo 1 records dirty-worktree/source baselines. It is a singleton because every later lane binds to this exact baseline.
- **Wave 2 - prepare five non-conflicting briefs in parallel:** Todos 2-6 write only their own evidence brief under `<attemptDir>`; none may edit the final syllabus.
- **Wave 3 - single-writer assembly:** Todo 7 is the only todo allowed to create or edit `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`; it assembles the five approved briefs.
- **Wave 4 - read-only verification:** Todo 8 validates and renders the assembled file. If it fails, return findings to Todo 7, correct there, and rerun Todo 8; Todo 8 itself does not edit the syllabus.
- **Final wave:** F1-F4 run in parallel only after Todo 8 passes, write separate evidence receipts, and all must approve.

### Dependency matrix
| Todo | Depends on | Blocks | Can parallelize with |
| --- | --- | --- | --- |
| 1 | none | 2, 3, 4, 5, 6 | none |
| 2 | 1 | 7 | 3, 4, 5, 6 |
| 3 | 1 | 7 | 2, 4, 5, 6 |
| 4 | 1 | 7 | 2, 3, 5, 6 |
| 5 | 1 | 7 | 2, 3, 4, 6 |
| 6 | 1 | 7 | 2, 3, 4, 5 |
| 7 | 2, 3, 4, 5, 6 | 8 | none |
| 8 | 7 | F1, F2, F3, F4 | none |
| F1 | 8 | completion | F2, F3, F4 |
| F2 | 8 | completion | F1, F3, F4 |
| F3 | 8 | completion | F1, F2, F4 |
| F4 | 8 | completion | F1, F2, F3 |

## Todos
> Implementation + Test = ONE todo. Never separate.
<!-- APPEND TASK BATCHES BELOW THIS LINE WITH edit/apply_patch - never rewrite the headers above. -->
- [x] 1. Lock the dirty-worktree boundary and dated source baseline
  What to do / Must NOT do: Resolve the vault with `pwd -P`; record `git status --short`; create a SHA-256 manifest for `SCHEMA.md`, `index.md`, `log.md`, `entities/`, `concepts/`, `comparisons/`, `queries/`, `raw/`, `.ua/`, and all pre-existing `output/` files. Record an execution-date source ledger containing the NCP Server/VPC/ACG/Public IP/Cost Explorer URLs, Hermes commit `0f64557c06f3e878fd9ec5170b9bca7f20e2778e`, CISA KEV catalog version/date, NVD API `2.0` and access limits, FIRST EPSS response date, ATT&CK teaching fixture `v19.1`, official latest ATT&CK release, and an explicit `as_of`. If the current release differs, record the difference and refresh procedure but do not silently replace the semester fixture. Write only `<attemptDir>/task-1-baseline-status.txt`, `task-1-protected-sha256.txt`, and `task-1-source-ledger.md`; do not touch the syllabus or protected files.
  Parallelization: Wave 1 | Blocked by: none | Blocks: 2, 3, 4, 5, 6
  References (executor has NO interview context - be exhaustive): `.omo/drafts/hoseo-data-analysis-cloud-platform-course.md`; `SCHEMA.md:5-18,35-44,70-75`; `log.md:310-325`; [NCP Server creation](https://guide.ncloud-docs.com/docs/en/server-create-vpc); [NCP ACG](https://guide.ncloud-docs.com/docs/en/server-acg-vpc); [NCP Public IP](https://guide.ncloud-docs.com/docs/en/server-publicip-vpc); [NCP pricing](https://www.ncloud.com/charge/price/ko); [Hermes pinned source](https://github.com/NousResearch/hermes-agent/tree/0f64557c06f3e878fd9ec5170b9bca7f20e2778e); [CISA KEV](https://www.cisa.gov/known-exploited-vulnerabilities-catalog); [NVD Start Here](https://nvd.nist.gov/developers/start-here); [FIRST EPSS API](https://www.first.org/epss/api); [ATT&CK STIX releases](https://github.com/mitre-attack/attack-stix-data/releases).
  Acceptance criteria (agent-executable): `test -s` passes for all three evidence files; the ledger contains `as_of`, `teaching_fixture: v19.1`, `official_latest`, `hermes_commit`, `nvd_api: 2.0`, and source URLs; the status file predates all implementation writes; `git status --short` shows no new non-evidence path after this todo.
  QA scenarios (name the exact tool + invocation): Happy - use `curl -fsSL --max-time 20`/`jq` for machine-readable endpoints and `rg --files ... | sort | xargs shasum -a 256`, then save redacted results to `<attemptDir>/task-1-source-ledger.md`; Failure - query one intentionally invalid official URL with `curl --fail --max-time 5`, confirm the procedure records `unavailable` plus a first-party fallback and never invents a version. Evidence: `<attemptDir>/task-1-source-ledger.md` and `<attemptDir>/task-1-failure.txt`.
  Commit: N | Baseline evidence only; never stage unrelated state.

- [x] 2. Prepare the course contract, outcomes, prerequisites, and weekly schema brief
  What to do / Must NOT do: Write `<attemptDir>/task-2-course-contract.md` defining the ten required syllabus headings; `LO1`-`LO5` with observable verbs and minimum mastery; a mapping from each LO to required technology, weeks, and exam rubric; prerequisites for Linux shell, Git, Python, HTTP/API, JSON/YAML, networking/IAM, and graph basics; an opening diagnostic artifact and fixture-based remediation route for every prerequisite; the exact weekly table columns `주차 | 60분 동영상 학습성과·자료 | 120분 실습 | 선행조건 | 학습성과 | 학생 산출물 | happy evidence | failure evidence | 대체 경로 | 안전·비용 | 평가 연결`; and the exam-row schema. Define attendance evidence as LMS video completion plus lab participation/artifact, with excused-absence decisions deferred to university policy and no invented penalty formula. Require captions/transcripts and accessible alternatives. Do not edit the final syllabus.
  Parallelization: Wave 2 | Blocked by: 1 | Blocks: 7 | Can run with: 3, 4, 5, 6
  References (executor has NO interview context - be exhaustive): `.omo/drafts/hoseo-data-analysis-cloud-platform-course.md` Components C1-C6 and Decisions; `SCHEMA.md:9-18,20-35`; `concepts/ai-knowledge-workflow.md:22-49`; `concepts/llm-wiki.md:18-43`.
  Acceptance criteria (agent-executable): `rg -c '^### LO[1-5] ' <attemptDir>/task-2-course-contract.md` returns 5; all seven prerequisite names have both `진단` and `보충` entries; the brief contains the exact 11 instructional columns, an exam-row schema, `출석 20%`, `중간고사 40%`, `기말고사 40%`, `2~3인`, `별도 점수 없음`, `자막`, and `대본`; every LO maps to at least one week and one exam component.
  QA scenarios (name the exact tool + invocation): Happy - `rg -n 'LO[1-5]|진단|보충|자막|대본|별도 점수 없음' <attemptDir>/task-2-course-contract.md` plus a Ruby set comparison proves LO coverage; Failure - copy the brief to `<attemptDir>/task-2-missing-lo.md`, remove the LO5 mapping with `apply_patch`, and confirm the same Ruby check exits nonzero. Evidence: `<attemptDir>/task-2-contract-check.txt`.
  Commit: N | Evidence brief only.

- [x] 3. Prepare the NCP live/fallback module and infrastructure evidence brief
  What to do / Must NOT do: Write `<attemptDir>/task-3-ncp-module.md` for weeks 2-3. The live track uses a school-provided sub-account, team-specific small Linux VM, VPC/public general subnet, authentication key, custom ACG, public IP, SSH restricted to the student's/team's current IP or campus CIDR, temporary application reachability, Cost Explorer/budget evidence, and complete teardown including public IP. The fallback track uses a personal/lab Linux VM or WSL2-with-systemd for Linux/service work plus an instructor-owned `ncp-lab-fixture.json` for VPC/subnet/ACG/public-IP/budget reasoning. Define fixture manifest fields `fixture_id`, `owner`, `schema_version`, `created_at`, `refreshed_at`, `source_urls`, `sha256`, `expected_results`. Explicitly mark Docker as unable to demonstrate NCP provisioning and Hermes systemd persistence. Define provider/fallback evidence separately: settings export or fixture result, ACG rule table, SSH/terminal transcript, service `curl`, owner/team label, budget alert configuration, teardown/residual-cost proof, and the competency each fallback loses. Do not provision anything.
  Parallelization: Wave 2 | Blocked by: 1 | Blocks: 7 | Can run with: 2, 4, 5, 6
  References (executor has NO interview context - be exhaustive): [VPC management](https://guide.ncloud-docs.com/docs/en/vpc-manage-vpc); [Subnet management](https://guide.ncloud-docs.com/docs/en/vpc-subnetmanage-vpc); [Server creation](https://guide.ncloud-docs.com/docs/en/server-create-vpc); [Server access](https://guide.ncloud-docs.com/docs/en/server-access-vpc); [ACG](https://guide.ncloud-docs.com/docs/en/server-acg-vpc); [Public IP](https://guide.ncloud-docs.com/docs/en/server-publicip-vpc); [Cost Explorer budget](https://guide.ncloud-docs.com/docs/en/costexplorer-budget); [Server termination](https://guide.ncloud-docs.com/docs/en/server-return-vpc).
  Acceptance criteria (agent-executable): the brief has exactly two week sections and a live/fallback evidence table; all eight fixture manifest fields occur; `TCP 22` is restricted and `0.0.0.0/0` is explicitly forbidden for SSH; stop-only is rejected as teardown; public-IP release and residual-cost warning are present; the platform matrix contains `Docker | Hermes gateway persistence | fixture-only`.
  QA scenarios (name the exact tool + invocation): Happy - `rg -n 'VPC|subnet|ACG|TCP 22|public IP|Cost Explorer|terminate|fixture-only|sha256' <attemptDir>/task-3-ncp-module.md` returns every required concept; Failure - validate an instructor sample with inbound SSH `0.0.0.0/0` using the described rule checker and confirm it yields `FAIL_UNRESTRICTED_SSH`. Evidence: `<attemptDir>/task-3-ncp-check.txt`.
  Commit: N | Evidence brief only; no cloud mutation.

- [x] 4. Prepare the Hermes/CTI progression and 40-point midterm brief
  What to do / Must NOT do: Write `<attemptDir>/task-4-hermes-cti-module.md` for weeks 4-7 and week 8. Hermes must use a non-root account, headless install path, pinned/recorded version, `hermes doctor`, minimal tool allowlist, local-only delivery, Asia/Seoul timezone, one gateway scheduler, `approvals.mode` smart/manual, `cron_mode: deny`, no messaging/browser unless separately approved, no shared secret in config/log/history, and changed/no-change/semantic-failure fixtures. CTI must use only CISA KEV, NVD 2.0, FIRST EPSS, and pinned ATT&CK STIX; define raw manifest fields `source`, `request_url`, `retrieved_at_utc`, `sha256`, `etag`, `last_modified`, `http_status`, `content_type`; normalized vulnerability/signal/ATT&CK fields; CVE uppercase join; dedupe key `(source,native_id,source_version_or_raw_sha256)`; absent/null/unknown separation; idempotent rerun; malformed and duplicate fixtures; NVD batching/rate limits/429 handling; and last-good preservation. Never define automatic exploitation, scanning, patching, or response. Define the midterm's individual 10+10+12+8 rubric and a formative 2-3-person team workflow with no extra percentage.
  Parallelization: Wave 2 | Blocked by: 1 | Blocks: 7 | Can run with: 2, 3, 5, 6
  References (executor has NO interview context - be exhaustive): `raw/blog/hermes-agent-cron-llm-wiki-knowledge-graph.md:413-442,444-503,530-621,623-724,781-816`; `concepts/cyber-threat-intelligence-knowledge-graphs.md:18-41`; [Hermes install](https://github.com/NousResearch/hermes-agent/blob/0f64557c06f3e878fd9ec5170b9bca7f20e2778e/website/docs/getting-started/installation.md#L113-L144); [Hermes cron](https://github.com/NousResearch/hermes-agent/blob/0f64557c06f3e878fd9ec5170b9bca7f20e2778e/website/docs/user-guide/features/cron.md); [Hermes security](https://github.com/NousResearch/hermes-agent/blob/0f64557c06f3e878fd9ec5170b9bca7f20e2778e/website/docs/user-guide/security.md#L30-L58); [CISA KEV JSON](https://www.cisa.gov/sites/default/files/feeds/known_exploited_vulnerabilities.json); [NVD API](https://nvd.nist.gov/developers/vulnerabilities); [NVD limits](https://nvd.nist.gov/developers/start-here); [EPSS API](https://www.first.org/epss/api); [ATT&CK v19.1 fixture](https://github.com/mitre-attack/attack-stix-data/releases/tag/v19.1).
  Acceptance criteria (agent-executable): the brief has week sections 4, 5, 6, 7 and an exam-only week 8; the midterm rubric values are exactly `10,10,12,8` and sum to 40; all raw/normalized/dedupe fields occur; rerun expectation is zero new duplicates; Hermes expected results include one triggered run, one skipped run, one semantic failure that preserves last-good output, and redacted logs; NVD `5/30s`, keyed `50/30s`, six-second pacing, bounded retry, and 429 fixture are present.
  QA scenarios (name the exact tool + invocation): Happy - use `rg` and a Ruby sum/set checker on `<attemptDir>/task-4-hermes-cti-module.md`; Failure - validate malformed/duplicate/429 fixture expectations and confirm each maps to quarantine, zero duplicate growth, or bounded retry rather than success. Evidence: `<attemptDir>/task-4-hermes-cti-check.txt`.
  Commit: N | Evidence brief only; no agent, cron, or live API execution required.

- [x] 5. Prepare the LLM Wiki, UA, graph-analysis progression and 40-point final brief
  What to do / Must NOT do: Write `<attemptDir>/task-5-wiki-ua-graph-module.md` for weeks 9-14 and week 15. LLM Wiki work must preserve immutable raw evidence, use leading frontmatter, exact source paths, registered tags, at least two resolvable wikilinks, index/log synchronization, confidence/contradiction rules, and lint before UA. UA live evidence requires `understand-knowledge`, all expected analysis batches, fresh graph/meta times, `kind==knowledge`, nonempty nodes, unique IDs, array edges/layers/tour, and zero dangling endpoints; fallback evidence uses an instructor-owned pinned graph hash and a freshly generated validation report, and must not claim fresh LLM enrichment. Graph analysis uses the raw directed graph for provenance counts and an unweighted simple undirected projection for structure: remove self-loops, collapse parallel edges, ignore weights, sort tied results by node ID, report projection metadata, connected components/isolate count, top-five degree, and bridges/articulation or normalized betweenness top-five against instructor fixture expectations/tolerances. Require one source-verified insight and one rejected graph inference. Define the final individual 10+10+10+10 rubric and integration lineage `CTI response → raw hash → normalized CVE/source ID → canonical source link → UA node/edge ID → metric result → checked conclusion`.
  Parallelization: Wave 2 | Blocked by: 1 | Blocks: 7 | Can run with: 2, 3, 4, 6
  References (executor has NO interview context - be exhaustive): `SCHEMA.md:9-18,20-52,70-75`; `concepts/llm-wiki.md:18-43`; `queries/ua-knowledge-graph-workflow.md:19-31,47-86,88-148`; `concepts/knowledge-graph-analysis.md:17-35`; `concepts/cyber-threat-intelligence-knowledge-graphs.md:37-47`; `raw/blog/hermes-agent-cron-llm-wiki-knowledge-graph.md:576-621,660-724`; project Validation contract in `AGENTS.md`.
  Acceptance criteria (agent-executable): the brief has week sections 9-14 and exam-only week 15; final rubric is four 10-point rows and sums to 40; live and fallback UA tracks both test all structural invariants and distinguish freshness/enrichment claims; projection policy contains directed/raw, undirected/simple, self-loop, multiedge, weight, tie, and tolerance rules; the three metric families plus verified/rejected interpretations and every lineage handoff identifier are explicit.
  QA scenarios (name the exact tool + invocation): Happy - run `jq` against the pinned teaching graph and compare the described expected report schema; Failure - run the same validation against a temporary fixture containing one dangling endpoint and confirm nonzero/`DANGLING_EDGE`, then confirm an inferred relation without source proof is routed to `rejected inference`. Evidence: `<attemptDir>/task-5-wiki-ua-graph-check.txt`.
  Commit: N | Evidence brief only; no canonical or `.ua/` mutation.

- [x] 6. Prepare assessment, governance, accessibility, and six-track fallback brief
  What to do / Must NOT do: Write `<attemptDir>/task-6-governance-assessment.md` with exactly three weighted categories (attendance 20, midterm 40, final 40); LMS/video and lab attendance evidence; university-policy handling for excused absence; formative team work with no weight; individual authorship evidence; minimum mastery stated as completing every required practical evidence family within its exam rather than allowing attendance to substitute for a missing technical outcome. Add a six-row fallback matrix for NCP, Hermes, CTI API, LLM enrichment, UA generation, and graph analysis with columns `live evidence | instructor fixture | manifest/hash | preserved competency | lost competency | allowed claim`. Add public-data-only, no PII/victim logs/malware/scanning, secret redaction, evidence retention/deletion, NCP cost/teardown, captions/transcripts, accessible alternative, API/LLM outage recovery, and instructor preflight/golden-fixture refresh rules. Do not invent HoSeo absence penalties or an institutional retention period; mark them `학칙/담당자 정책 적용`.
  Parallelization: Wave 2 | Blocked by: 1 | Blocks: 7 | Can run with: 2, 3, 4, 5
  References (executor has NO interview context - be exhaustive): user-approved decisions in `.omo/drafts/hoseo-data-analysis-cloud-platform-course.md`; `concepts/agentic-ai-safety-governance.md:18-42`; `concepts/agentic-workspace.md:18-36`; `raw/blog/hermes-agent-cron-llm-wiki-knowledge-graph.md:696-724`; [NVD Terms](https://nvd.nist.gov/developers/terms-of-use); [FIRST EPSS FAQ](https://www.first.org/epss/faq); [ATT&CK STIX license](https://github.com/mitre-attack/attack-stix-data/blob/a6c366439edee3a87b79cf90dc0b93f5d7975956/LICENSE.txt#L1-L14).
  Acceptance criteria (agent-executable): a Ruby table parser finds exactly three weighted rows totaling 100 and exactly six complete fallback rows; `프로젝트 별도 점수 없음`, `개인 실행 증거`, `학칙/담당자 정책 적용`, `자막`, `대본`, `접근 가능한 대체 자료`, `보존`, `삭제`, `비밀정보`, and all prohibited security activities occur; every fallback row contains nonempty preserved/lost/allowed-claim cells.
  QA scenarios (name the exact tool + invocation): Happy - parse both tables and check required policy phrases; Failure - blank the Hermes `lost competency` cell in a copied brief using `apply_patch` and confirm the table checker exits nonzero. Evidence: `<attemptDir>/task-6-governance-check.txt`.
  Commit: N | Evidence brief only.

- [x] 7. Assemble the single Korean 15-week syllabus
  What to do / Must NOT do: This is the sole write owner for `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`. Create it with `apply_patch` and assemble only validated content from Todos 2-6 plus the dated ledger from Todo 1. Use the exact ten headings and `LO1`-`LO5`; include the 15-row schedule in the fixed order; mark weeks 1-7/9-14 as `60분 비동기 + 120분 실습`; make weeks 8/15 three-hour individual exams with no new lecture; include the 20/40/40 table and exact sub-rubrics; include milestone, lineage, platform, six-track fallback, safety/accessibility, instructor preflight, teardown, and dated-source sections. Keep explanations appropriate for fourth-year CS students and distinguish documented fact, course default, semester fixture, and hypothesis. Do not edit any other repo file or hide a missing brief with invented content.
  Parallelization: Wave 3 | Blocked by: 2, 3, 4, 5, 6 | Blocks: 8
  References (executor has NO interview context - be exhaustive): `<attemptDir>/task-1-source-ledger.md`; `<attemptDir>/task-2-course-contract.md`; `<attemptDir>/task-3-ncp-module.md`; `<attemptDir>/task-4-hermes-cti-module.md`; `<attemptDir>/task-5-wiki-ua-graph-module.md`; `<attemptDir>/task-6-governance-assessment.md`; every authoritative path/URL cited by those briefs.
  Acceptance criteria (agent-executable): the output file exists, is nonempty UTF-8 with LF and a final newline; `rg -n '^## ' output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` shows each required heading exactly once; a table parser finds weeks 1-15 once, 13 instructional rows, only weeks 8/15 as exams, LO1-LO5 mappings, 20/40/40, both 40-point sub-rubrics, and six fallback rows; the checker confirms that no scaffold or unfinished-marker token remains.
  QA scenarios (name the exact tool + invocation): Happy - run `rg`, `file`, and a Ruby Markdown-table parser and save output; Failure - if any source brief is missing/empty, `test -s` must block assembly before the output is created or changed. Evidence: `<attemptDir>/task-7-assembly-check.txt`.
  Commit: N | `docs(course): add 15-week data analysis and cloud platform syllabus` is reserved only if the user later requests a commit.

- [x] 8. Validate structure, failure detection, rendering, and protected-state integrity
  What to do / Must NOT do: Create a read-only checker at `<attemptDir>/syllabus_check.rb` and run it against the assembled syllabus. Assert every item in Verification strategy, source/fallback completeness, rubric arithmetic, and forbidden scope. Run `git diff --no-index --check /dev/null` on the new file, accepting the normal no-index difference code only when no whitespace diagnostics exist; parse with Pandoc; render with Glow. Copy the syllabus to `<attemptDir>/corrupt-syllabus.md`, use `apply_patch` to remove week 8 and change one 40 to 30, and prove the checker rejects it. Recompute protected SHA-256 and compare with Todo 1; if a protected file changed, report it and do not revert. This todo writes only checker/log/render evidence, never the real syllabus.
  Parallelization: Wave 4 | Blocked by: 7 | Blocks: F1, F2, F3, F4
  References (executor has NO interview context - be exhaustive): Verification strategy, Scope, and Success criteria in this plan; `<attemptDir>/task-1-protected-sha256.txt`; `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`; `AGENTS.md` generated/local-state boundaries and validation contract.
  Acceptance criteria (agent-executable): `ruby <attemptDir>/syllabus_check.rb output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md` exits 0; the same command on `corrupt-syllabus.md` exits nonzero and identifies both missing week 8 and grading mismatch; Pandoc and Glow exit 0 with nonempty outputs; whitespace check has no diagnostics; protected manifests compare equal or name an externally changed path without any revert; final `git status --short` adds only the syllabus and designated `.omo/evidence/...` files relative to the Todo 1 baseline.
  QA scenarios (name the exact tool + invocation): Happy - run `ruby`, `git diff --no-index --check`, `pandoc -f gfm -t html -o <attemptDir>/task-8-syllabus.html`, and `glow -s dark ... > <attemptDir>/task-8-render.txt`; Failure - run the checker on the corrupted copy and require nonzero before deleting no evidence. Evidence: `<attemptDir>/task-8-validation.log`, `task-8-syllabus.html`, `task-8-render.txt`, and `task-8-protected-sha256.txt`.
  Commit: N | Verification evidence only.

## Final verification wave
> Runs in parallel after ALL todos. ALL must APPROVE. Surface results and wait for the user's explicit okay before declaring complete.
- [x] F1. Plan compliance and assessment-alignment audit
  What to verify / Must NOT do: Read this plan, the syllabus, and all Todo evidence. Check every Must have, every Todo acceptance criterion, `LO1`-`LO5` coverage, 15-week structure, 13×60+120 format, exam weeks, 20/40/40 arithmetic, exact exam rubrics, fallback parity, and all Success criteria. Do not edit files or accept worker self-report without opening artifacts.
  References: this plan in full; `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`; `<attemptDir>/task-1-*` through `task-8-*`.
  Acceptance criteria: write `<attemptDir>/F1-plan-compliance.md` containing one row per Must have/Todo/Success criterion with evidence path and `PASS`; verdict is `APPROVE` only when every row passes and no placeholder or unsupported weighted category exists.
  QA scenario: invoke the Todo 8 checker, independently recount week and rubric tables with Ruby, and compare results to the F1 checklist. Evidence: `<attemptDir>/F1-plan-compliance.md`.
  Commit: N | Read-only final audit.

- [x] F2. Document and primary-source quality audit
  What to verify / Must NOT do: Review Korean clarity, terminology consistency, source proximity, dated claims, official-source attribution, fixture/current distinctions, and hypothesis language. Confirm volatile NCP/Hermes/CISA/NVD/EPSS/ATT&CK claims have `as_of` or refresh guidance and that graph counts are not grading thresholds. Reject promotional assertions, invented licenses/policies, broken links, or citation drift. Do not rewrite the document in this lane.
  References: Todo 1 source ledger; syllabus `최신성·출처 기준`; every official URL in Todos 1, 3, 4, 6; `SCHEMA.md:70-75`; `concepts/knowledge-graph-analysis.md:17-35`.
  Acceptance criteria: write `<attemptDir>/F2-document-source-quality.md` with link checks, fact/default/fixture/hypothesis samples, volatile-claim checks, Korean consistency findings, and binary verdict; only `APPROVE` with zero unsupported or materially stale claims.
  QA scenario: use `curl -I --max-time 20` for official HTTP sources, `rg` for all version/price/count terms, Pandoc for parse integrity, and manual semantic review of every table. Evidence: `<attemptDir>/F2-document-source-quality.md`.
  Commit: N | Read-only final audit.

- [x] F3. Agent-executed syllabus scenario and rendered-surface audit
  What to verify / Must NOT do: Use the rendered syllabus as a student/instructor would. Walk three fixed scenarios: A) school NCP available; B) no NCP and only a lab PC/Docker initially available; C) CTI API or LLM/UA enrichment unavailable. For each, trace prerequisites, week activities, artifacts, fallback, lost competency, exam eligibility, recovery, and safety; verify Docker routes Hermes persistence to a fixture rather than claiming live systemd. Inspect Glow and Pandoc renderings for readable headings/tables and no clipped or malformed content. Do not provision or install anything.
  References: syllabus weekly schedule, milestone rubrics, fallback matrix, instructor preparation, safety/accessibility sections; `<attemptDir>/task-8-syllabus.html`; `<attemptDir>/task-8-render.txt`.
  Acceptance criteria: write `<attemptDir>/F3-scenario-audit.md` with all three scenarios, each checklist item marked `PASS`, and screenshots/text excerpts or rendered locations; verdict is `APPROVE` only if every scenario reaches an honest assessment route without an overclaimed competency.
  QA scenario: open the Pandoc HTML locally or inspect it with a text/browser surface, inspect the Glow rendering, and execute the fixed scenario checklist. Evidence: `<attemptDir>/F3-scenario-audit.md`.
  Commit: N | Read-only final audit.

- [x] F4. Scope, safety, and dirty-worktree fidelity audit
  What to verify / Must NOT do: Compare Todo 1 and Todo 8 status/hash manifests, inspect the full diff, and verify the only product artifact is the new syllabus plus designated evidence. Confirm no NCP/Hermes/cron/UA operation occurred, no canonical/raw/generated wiki file changed, no secret or PII appears, no offensive activity is assigned, and no existing output was overwritten. Do not revert concurrent user changes.
  References: plan Scope Must NOT have; `<attemptDir>/task-1-baseline-status.txt`; `<attemptDir>/task-1-protected-sha256.txt`; `<attemptDir>/task-8-protected-sha256.txt`; final `git status --short` and diff.
  Acceptance criteria: write `<attemptDir>/F4-scope-fidelity.md` naming the allowed write set, actual write set, manifest comparison, secret-pattern scan result, and binary verdict; `APPROVE` only when actual writes are a subset of allowed writes and all guardrails hold.
  QA scenario: run `git status --short`, `git diff --name-only`, protected-manifest comparison, and a redacted secret-pattern scan over only the new syllabus/evidence. Evidence: `<attemptDir>/F4-scope-fidelity.md`.
  Commit: N | Read-only final audit.

## Commit strategy

- Every todo and final verifier uses `Commit: N`. The user requested a plan and later syllabus generation, not a Git commit.
- Do not stage files. Leave the single new syllabus and evidence artifacts unstaged for user review.
- If the user later requests a commit, create one separate atomic commit only after all final verifiers approve; that future authorization is outside this plan.

## Success criteria

- Exactly one new deliverable exists at `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`; it parses as GFM and is readable in the terminal.
- The syllabus has 15 unique weeks, exactly 13 instructional 60+120 rows, exam-only weeks 8 and 15, and the fixed topic sequence.
- `LO1`-`LO5` are observable, appear in the schedule, and are assessed at least once; the 20/40/40 grading and both 40-point exam sub-rubrics are arithmetically consistent.
- All five requested technologies are covered with concrete student artifacts, happy/failure evidence, and safety constraints.
- The six-row fallback matrix makes live, fixture, preserved competency, and lost competency explicit; Docker never claims to demonstrate Hermes systemd persistence.
- CTI provenance, normalization, idempotency, API hygiene, and ATT&CK fixture currency are specified without offensive collection or unstable claims.
- UA validation requires `kind==knowledge`, nonempty nodes, unique IDs, array edges/layers/tour, zero dangling endpoints, and fresh live artifacts or a fresh report over a pinned fallback graph.
- Graph analysis declares projection, multiedge/self-loop/weight/tie policy and returns three metric families plus one verified insight and one rejected inference.
- Baseline/final protected-path manifests match, aside from concurrent user changes that are reported without being reverted; no forbidden repository or external state was mutated.
- Todo 8 and all four final verifiers approve with evidence receipts, after which execution waits for explicit user acceptance.
