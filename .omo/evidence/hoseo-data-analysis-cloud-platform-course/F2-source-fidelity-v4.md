# F2 v4 — 문서·1차 출처 충실도 감사

## 판정

**APPROVE**

- `codeQualityStatus`: `CLEAR`
- `recommendation`: `APPROVE`
- `reportPath`: `.omo/evidence/hoseo-data-analysis-cloud-platform-course/F2-source-fidelity-v4.md`
- `blockers`: `[]`

지원되지 않거나 실질적으로 오래된 물질적 주장, 비공식·오귀속 URL, fixture/current 혼동, 그래프 가설의 사실 승격은 발견되지 않았다. 2026-07-29의 변동 관찰은 현재 공식 응답과 의미적으로 일치하며, 문서는 모두 실행 시 재확인 또는 별도 fixture 갱신 절차에 묶는다.

## 빌드 식별

감사 시각은 `2026-07-29T11:39:21Z` (`2026-07-29T20:39:21+09:00`)이다.

| 항목 | 기대값 | 직접 재계산 | 판정 |
|---|---|---|---|
| HEAD | `8857bdd924bc0e155b7dd64a8a471692b7b7ab85` | 동일 | PASS |
| syllabus | `65ed06d96716202509679a3a3ef57c4a0d446c2bb77998a454ed2885d2123d66` | 동일 | PASS |
| checker | `487470cea93eeb62ca199216f4db0385a3816a40428d725f5a9f419a9520f5ba` | 동일 | PASS |
| regression harness | `ba031c00f4382d0e78408a0e1a9e17c410b561fae18e9b6afcbebabde5258dab` | 동일 | PASS |

대상·checker·harness는 이 HEAD에서 의도적으로 untracked이므로 파일별 Git history는 없다. 세 파일을 각각 전체 읽고 `/dev/null` 대비 new-file diff도 소비했다. diff SHA-256은 syllabus `cd62e83670cef32f3b5d66155fb1d64b7d8cdf82bb0059cd04ea40314bcc6cef`, checker `50a6968838d845f2783cc509a457cd66415548acdd3bd2a737b5bd181e2e86b9`, harness `285ade3bb664254d510b817ff1b3304432af204b06c596d920d9fd4291c9237e`다.

## 감사 권위와 방법

다음을 직접 읽고 현재 target과 대조했다.

- 전체 계획과 Must-have/Must-not-have/F2 계약
- Todo 1 source ledger와 protected manifest
- Todos 2–6 전체 브리프
- `AGENTS.md`, `SCHEMA.md`, `index.md`, 최근 `log.md`
- `concepts/llm-wiki.md`, `queries/ua-knowledge-graph-workflow.md`, `concepts/knowledge-graph-analysis.md`, `concepts/cyber-threat-intelligence-knowledge-graphs.md`, 안전·workspace 개념 문서
- Hermes raw 근거의 gate, cron, complete-batch, 권한·secret 경계
- 현재 target, checker, harness 전체와 이전 F2/context 보고서(후자는 불신 교차검사용)

`SCHEMA.md`가 canonical 권위이고 `output/`은 외부 deliverable이라는 저장소 경계를 유지했다. 현재 `.ua/knowledge-graph.json`은 `kind: knowledge`, 229 nodes, 321 edges이지만 target/checker/harness 노드가 없고 이 산출물보다 앞선 생성물이다. 따라서 그 수치나 추론을 문서 권위로 사용하지 않았다.

## source-to-target 매핑

| 계약군 | 승인된 근거 | 현재 target 근거 | 판정 |
|---|---|---|---|
| NCP live/fallback | Todo 1·3·6 | 18, 38, 91–92, 113, 142–145, 151, 166, 250행: 실제 provisioning과 fixture 판독을 분리하고, 제한 SSH·완전 teardown·public-IP release·lost competency를 보존 | PASS |
| Hermes 안전 운영 | Todo 4, `AGENTS.md`, Hermes raw 근거 | 20, 39, 93, 96, 114, 152, 198–210, 228–241행: non-root/headless/doctor, workspace allowlist, one gateway, local-only, smart/manual, `cron_mode: deny`, messaging/browser 별도 승인, gate outputs, 세 관찰 상태, last-good | PASS |
| CTI source·schema | Todo 1·4 | 94–95, 115, 120–130, 153, 162–168행: raw 8필드, vulnerability/signal/attack 전체 필드, uppercase CVE join, dedupe, absent/null/unknown, 429·last-good | PASS |
| NVD 실행 계약 | Todo 1·4 | 95, 115, 130, 211–216, 238, 253행: `resultsPerPage`, `startIndex`, page/date batching, 최소 6초, `Retry-After`, 최대 3회, `deferred_rate_limited` | PASS |
| Wiki authority | `AGENTS.md`, `SCHEMA.md`, Todo 5 | 98–100, 116, 132, 158, 165, 168행: immutable raw, leading frontmatter, exact raw path, registered tags, two links, index/log, lint-before-UA | PASS |
| UA freshness·완결성 | `AGENTS.md`, Todo 5 | 100, 117, 132, 155, 168, 240행: `understand-knowledge`, complete batches, fresh live graph/meta 또는 pinned fallback+fresh report, 구조 invariant, nonzero failure | PASS |
| Graph analysis | Todo 5와 graph concepts | 101–104, 118, 134, 156, 259행: raw directed와 simple undirected projection 분리, loop/multiedge/weight/tie 정책, 세 지표군, source verification | PASS |
| Source/as_of/fixture | Todo 1 ledger | 244–257행: `as_of: 2026-07-29`, 고정 Hermes commit, CISA/NVD/EPSS 관찰, ATT&CK `v19.1` fixture/current 구분, 비무음 refresh | PASS |
| Graph 가설 경계 | `AGENTS.md`, `SCHEMA.md`, Todo 5 | 14, 42, 102, 118, 163, 168, 259행: CVE-to-ATT&CK 자동 사실 edge 금지, source proof 전 hypothesis/rejected inference | PASS |

독립 Ruby 비교 결과는 다음과 같다.

```text
YAML_TYPED_PASS root=11 hermes=11 nvd=5
FALLBACK_BINDINGS_PASS rows=6 ids=36
SOURCE_SCHEMA_PASS raw=8 vulnerability=13 signal=12 attack=14
SOURCE_SET_PASS target_urls=18 approved_urls=27 unapproved=0
```

schema 수는 Todo 4의 원래 source 필드에 승인된 `value_state`와 `state_reason` 두 필드를 추가한 결과다. 여섯 track × 여섯 role의 36개 `F-TRACK-ROLE` ID는 각 의미 열에 정확히 한 번씩 배치되어 있다. YAML의 11개 Hermes key와 본문 의미도 일치한다.

## 1차 출처·변동성 재확인

| 항목 | 현재 관찰 | 문서 표현 | 판정 |
|---|---|---|---|
| Hermes | GitHub commit API가 정확히 `0f64557c06f3e878fd9ec5170b9bca7f20e2778e` 반환 | 움직이는 latest가 아닌 학기 pin; 실제 run의 version/time/hash 별도 기록 | PASS |
| CISA KEV | `catalogVersion=2026.07.27`, `dateReleased=2026-07-27T19:00:15.8632Z`, 1,655건, body SHA `e0326281...8170a` | version은 dated observation, count는 threshold 아님 | PASS |
| NVD | 공식 Start Here에서 무키 `5/30s`, 키 `50/30s`, 6초 권고와 pagination 확인; API 문서에서 `/rest/json/cves/2.0` 확인 | 실행 전 재확인; 3회 retry는 더 좁은 과목 기본값 | PASS |
| FIRST EPSS | 최신 표본 date `2026-07-28`, body SHA `02c8c5ea...26b3` | 당시 관찰값이며 run마다 date/hash 재기록 | PASS |
| ATT&CK | latest `v19.1`, published `2026-05-12T17:40:07Z`; 현재 API body SHA `12f76e04...213f` | `v19.1` semester fixture와 당시 official latest를 분리하고 무음 교체 금지 | PASS |
| NCP | target의 5개 doc URL은 bounded HEAD에서 HTTP 403; 공식 검색 surface에서는 Server/VPC 문서가 확인됨; 가격 HEAD는 redirect 후 timeout | 접근 실패를 환경 가용성 관찰로만 기록하고 기능 부재로 해석하지 않음; 수업 전 재확인 | PASS |

ATT&CK latest API body hash는 Todo 1의 transient hash와 달라졌지만 tag, published date, release URL은 동일하다. 문서는 API body hash를 영구 사실로 인용하지 않으므로 의미 drift가 아니다.

target의 18개 URL을 bounded HEAD로 검사한 결과는 9×HTTP 200, NCP docs 5×HTTP 403, NVD docs 3×HTTP 403, NCP 가격 1×redirect 후 timeout이다. NVD는 명시적 User-Agent GET과 공식 검색 결과로 의미를 확인했다. 404 또는 비공식·오귀속 URL은 0개다.

## 사실·기본값·fixture·가설 구분

| 유형 | target 표본 | 판정 |
|---|---|---|
| 문서화된 사실 | 244–255행의 dated Hermes/CISA/NVD/EPSS/ATT&CK 관찰과 같은 행의 공식 URL | PASS |
| 과목 기본값 | 20행의 one-gateway/local-only/approval 경계와 130행의 최대 3회 retry | PASS — 제품 영구 속성으로 서술하지 않음 |
| 학기 fixture | 13, 149–158, 230–241, 255–257행의 owner/schema/hash/expected result/refresh | PASS — live/current와 분리 |
| 가설 | 14, 42, 102, 118, 163, 168, 259행의 graph/LLM relation | PASS — 원문 proof 전 사실 승격 없음 |

고정 가격, 결석 감점식, 보존 일수, 라이선스 권리, 홍보성 최고/혁신 주장도 없다. 학사·보존 결정은 `학칙/담당자 정책 적용`에 남겨 두었다.

## manual QA와 정확한 결과

| 명령/검사 | 결과 |
|---|---|
| `git rev-parse HEAD`; `shasum -a 256 <target> <checker> <harness>` | 지정된 HEAD와 세 SHA-256 정확히 일치 |
| `ruby -c <checker>`; `ruby -c <harness>` | 둘 다 `Syntax OK` |
| `ruby <checker> <target>` | exit 0; `PASS ... machine_contract=PASS prose_semantics=REVIEWED_EXTERNALLY` |
| `ruby <harness>` | exit 0; `38` distinct controls, accepts `10/10`, rejects `28/28` |
| 독립 `YAML.safe_load` + source/schema/fallback comparator | typed YAML PASS; raw/schema PASS; 36 bindings PASS; target URLs `18/18` approved |
| `pandoc -f gfm -t plain --wrap=none <target>` | exit 0; 44,841 bytes, 257 lines, 8/8 semantic anchors |
| `pandoc -f gfm -t html <target>` | exit 0; 56,193 bytes, 1,072 lines, 11 tables |
| `git diff --no-index --check /dev/null <target>` | expected new-file exit 1; diagnostics 0 bytes |
| Todo 1 protected-manifest 독립 재계산 | 142 rows, missing 0, mismatch 0; Task 8 receipt hashes도 현재 값과 일치 |

첫 HTML probe는 이전 build의 10-table 수를 잘못 기대해 실패했고, 첫 manifest probe는 현재 Ruby에 없는 `filter_map`과 Task 8 요약 receipt를 row manifest로 오인했다. 두 결과는 증거로 사용하지 않았다. 현재 target의 명시적 CTI schema table까지 포함한 11 tables로 다시 검사하고, Todo 1의 실제 142 hash rows를 호환 가능한 parser로 독립 재계산해 위 결과를 얻었다.

## ULTRAQA

| 분류 | 결과 | 근거 |
|---|---|---|
| stale sources | PASS | 날짜·fixture/current·refresh 경계가 있고 현재 공식 의미 값과 일치 |
| prompt-like source data | PASS | 90, 98, 116, 168, 246행이 외부/raw/LLM/graph 문구를 data-only로 두며 checker에는 실행·network·eval 경로가 없음 |
| dirty worktree | PASS with disclosed context | baseline 51 → current 53 status lines; added는 pre-existing hook state `.omo/lazycodex-executor-verify/`와 syllabus뿐, removed 0, staged 0, protected 142/142 |
| misleading status | PASS | 이전 PASS 문구 대신 현재 hash, checker/harness, YAML/source set, renderer, protected hash를 재실행 |
| interruption | PASS | harness child를 TERM(15)로 중단한 뒤 clean rerun exit 0·38-control count를 재현; temp root 자동 제거 |
| malformed input | PASS (triggered) | 28개 reject control이 active content, duplicate YAML/header/identity, wrong typed values, missing schema fields를 bounded `FAIL:`로 거절 |
| hung | N/A | 실제 hang 없음; 모든 bounded command 완료, 잔류 checker/harness/Pandoc/Glow process 0 |
| flaky | N/A | flake 신호 없음; hash-pinned local checks와 rerun이 동일 결과 |

## `remove-ai-slops`·`programming` 관점

두 스킬을 직접 전부 읽고 test relevance와 maintainability 판단 전에 적용했다.

- checker는 192 pure LOC, harness는 90 pure LOC로 250-line defect threshold 아래이고 각각 문서 boundary validation과 CLI regression이라는 한 책임을 가진다.
- harness에는 9개 의미 보존/benign positive가 있어 자연어 전체 snapshot이 아니다. 28개 negative는 typed contract, identity/multiplicity, arithmetic, schema, active-content boundary를 실제 CLI로 바꿔 검증하며 deletion-only 또는 요청된 삭제만 확인하는 테스트가 아니다.
- YAML/table parsing은 현재 요청이 명시한 extended Hermes YAML, normalized schemas, 36 fallback bindings를 검사하는 boundary다. goal과 무관한 production extraction/normalization이 아니다.
- whole-file hash oracle, full Korean prose snapshot, tautological output-to-itself comparison, untyped escape hatch, speculative abstraction, broad exception swallow는 없다.

따라서 현재 target/checker/harness는 두 skill 관점을 위반하지 않는다.

## Findings by severity

### CRITICAL

없음.

### HIGH

없음.

### MEDIUM

없음.

### LOW

없음. NCP/NVD의 HEAD 403 및 NCP 가격 HEAD timeout은 공개된 환경 가용성 제약이며, 문서가 기능 부재나 영구 사실로 오인하지 않는다.

## 최종 결론

현재 hash-pinned syllabus는 NCP, Hermes, CTI, Wiki, UA, graph, source/as_of/fixture 계약을 승인된 근거에서 정직하게 보존한다. 1차 출처의 현재 의미 값과 일치하고 graph hypothesis를 authority로 승격하지 않으므로 F2 v4는 **APPROVE**다.
