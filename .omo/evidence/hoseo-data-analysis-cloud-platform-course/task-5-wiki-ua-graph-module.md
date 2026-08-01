# Todo 5 — LLM Wiki·UA·그래프 분석 모듈

## 범위와 판정 원칙

- 대상은 4학년 컴퓨터공학과 학생의 CTI 증거 계보 실습이다. 본 모듈은 실제 NCP·Hermes·cron을 실행하지 않으며, 기존 `raw/`, canonical 페이지, `index.md`, `log.md`, `.ua/`를 수정하거나 UA를 재생성하지 않는다.
- 외부 CTI 원문과 그래프의 문자열·라벨·설명은 **데이터**로만 취급한다. 문서 안의 지시문, 프롬프트 주입 문구, 링크는 실행 지시가 될 수 없으며, 허용된 스키마와 출처 대조를 통과한 식별자만 수업 증거가 될 수 있다.
- 상태 텍스트(예: `ok`)는 성공 증거가 아니다. live 경로에서는 모든 예상 분석 배치와 새 산출물을, fallback 경로에서는 고정 해시와 새 검증 보고서를 각각 확인해야 한다. 부분 배치, 중단 뒤 남은 graph, 또는 이전 실행의 mtime은 합격시킬 수 없다.

## 주차 9–15 일정

### 9주 — LLM Wiki 아키텍처와 불변 원본

`60분 비동기 동영상 + 120분 대면 실습`

- **목표/활동:** Raw–Wiki–Schema 세 계층을 CTI 응답에 적용한다. `raw/`의 원문과 원래 메타데이터는 불변으로 두고, 해시와 수집시각을 원본 증거로 보존한다. 원본의 문장이나 그래프 라벨은 지시가 아니라 데이터라는 경계를 확인한다.
- **학생 산출물:** `source`, `request_url`, `retrieved_at_utc`, `sha256`, `etag`, `last_modified`, `http_status`, `content_type`를 포함한 raw manifest와 각 필드의 값·부재·`unknown` 구분표.
- **실패/복구:** 해시가 없거나 원본이 변경되었다면 canonical 내용을 덮어쓰지 않고 수집 실패/드리프트로 격리한다. 로그인 요구·주입성 문구·형식 불량 원문은 실행하지 않고 데이터 품질 기록에 남긴다.
- **평가 연결:** LO3, LO4; 10주 lint 전제와 기말의 스키마·provenance 항목.

### 10주 — CTI에서 canonical Wiki로의 승격과 lint

`60분 비동기 동영상 + 120분 대면 실습`

- **목표/활동:** 정규화된 CVE/source ID를 기준으로 기존 주제를 먼저 찾고, 중심 주제만 canonical 문서로 승격한다. 모든 canonical 문서는 선행 YAML frontmatter(`title`, `created`, `updated`, `type`, `tags`, `sources`)를 갖고, `sources`에는 실제 `raw/...`의 정확한 경로를 기록한다. 태그는 `SCHEMA.md`에 등록된 것만 사용하고, 최소 두 개의 해소 가능한 basename `[[wikilink]]`를 둔다.
- **동기화와 신뢰도:** 새/수정 문서는 `index.md`의 맞는 구역과 날짜·개수, append-only `log.md`를 함께 동기화하고 `updated`를 올린다. 단일 출처 또는 빨리 변하는 주장에는 기본 `confidence: medium`을 사용한다. 날짜 있는 상충 주장 둘 다와 출처를 남기고, 미해결이면 `contested: true` 및 `contradictions:`를 기록한다. 세 원본 이상을 종합한 문단에는 가능한 `^[raw/.../source.md]` 표지를 붙인다.
- **lint 게이트:** UA보다 먼저 leading-frontmatter만 파싱하여 파일명, 필수 필드·날짜·folder/type, 등록 태그, 실제 source 경로, confidence/contradiction, 200행 한도, 두 outbound link, broken/orphan/중복 topic, index 완전성, raw SHA-256, staleness, log append를 검사한다. lint 오류가 있으면 UA 실행·병합을 하지 않는다.
- **학생 산출물:** lint 보고서(각 검사 PASS/FAIL, source path와 link 해소 결과)와 변경 목록. 실제 수업 수행 시에만 canonical 변경을 하며, 이 강의계획 작성 작업은 수행하지 않는다.
- **실패/복구:** 원본을 고치지 않는다. 누락 링크·태그·source는 canonical 초안으로 되돌려 수정한 후 lint를 전부 재실행한다.
- **평가 연결:** LO3, LO4; 기말 ‘LLM Wiki 스키마·provenance·lint’ 10점.

### 11주 — Understand Anything 생성과 구조 검증

`60분 비동기 동영상 + 120분 대면 실습`

- **live 경로:** lint가 성공한 위키 루트에서 일반 `understand`가 아니라 `understand-knowledge <vault-root>`를 실행한다. 실행 시작시각(UTC), 예상 배치 ID 목록, 완료 배치 ID 목록, 병합 시각, graph/meta SHA-256를 한 run receipt에 기록한다. `expected_batch_ids`와 `completed_batch_ids`의 집합이 정확히 같고 각 배치 산출물이 존재하기 전에는 merge/save하지 않는다. 한 배치라도 없으면 `PARTIAL_BATCH`로 종료하며 이전 graph나 `status: ok`를 성공으로 보고하지 않는다.
- **live 통과 증거:** 이번 run 시작시각보다 새로운 `.ua/knowledge-graph.json`과 `.ua/meta.json`, 그리고 다음 구조 검증 보고서가 모두 필요하다: `kind == "knowledge"`; 비어 있지 않은 `nodes` 배열; `edges`, `layers`, `tour` 배열; unique node ID; 모든 edge의 `source`·`target`이 node ID 집합에 존재; meta가 유효 JSON. 노드/edge 수는 관찰값일 뿐 성적 임계값이 아니다.
- **fallback 경로:** instructor-owned teaching graph는 소유자, fixture 버전, 취득일, SHA-256, 스키마 버전, 기대 결과를 manifest에 고정한다. 그 **고정 해시**와 대조한 뒤, 해당 복사본에 대해 새로 생성한 동일 구조 검증 보고서를 제출한다. fallback은 “그래프 구조를 읽고 검증·분석했다”까지만 주장할 수 있고, 새 LLM enrichment·새 UA 생성·현재 위키 반영을 주장할 수 없다.
- **학생 산출물:** live의 run receipt+새 graph/meta validation report 또는 fallback의 fixture manifest+hash-match+새 validation report. 두 경로 모두 `DANGLING_EDGE`가 0개인 JSON 보고서를 포함한다.
- **실패/복구:** dangling endpoint, duplicate node ID, 배열이 아닌 `tour`, stale mtime, incomplete batch는 모두 nonzero로 실패한다. 보정 후에는 모든 예상 배치를 새로 완료하고 전체 구조 검증을 재실행한다.
- **평가 연결:** LO4; 기말 ‘UA graph 생성·검증’ 10점.

### 12주 — 그래프 데이터 모델, 계보 계수, 구조 투영

`60분 비동기 동영상 + 120분 대면 실습`

- **원시 방향 그래프:** provenance 계수(예: raw hash→normalized ID→canonical source link→UA edge의 방향별 건수)는 UA의 원시 **directed** edge 목록에서 계산한다. 이 단계에서는 edge 방향·type·원시 multiplicity를 보존하며, 구조 중심성으로 오해하지 않는다.
- **구조 투영 정책:** 연결성·degree·bridge/articulation은 동일 입력 해시에서 만든 **unweighted simple undirected** projection으로만 계산한다. node 집합은 원시 node 전체(고립 node 포함)로 한다. self-loop는 제거하고, 같은 unordered node pair의 parallel/mutual edge는 하나로 collapse하며, `weight`와 edge type은 구조 지표에서 무시한다. 동점 결과는 항상 node ID 오름차순으로 정렬한다.
- **필수 projection metadata:** `input_graph_sha256`, `input_directed_edge_count`, `input_node_count`, `self_loops_removed`, `parallel_edges_collapsed`, `weights_ignored: true`, `projected_node_count`, `projected_simple_undirected_edge_count`, `tie_break: "node_id_ascending"`, 알고리즘/도구 버전을 보고한다.
- **학생 산출물:** raw provenance count 표와 projection metadata JSON, 그리고 13주의 재현 분석 입력.
- **실패/복구:** directed edge 수를 undirected degree로 직접 사용하거나, self-loop·weight·parallel edge를 섞거나, 동점 순서를 임의로 바꾸면 재현 불가로 실패한다. 입력 해시부터 projection을 다시 만든다.
- **평가 연결:** LO5; 기말 ‘그래프 지표 재현성’ 10점.

### 13주 — 재현 가능한 지표와 출처 대조 해석

`60분 비동기 동영상 + 120분 대면 실습`

- **필수 지표군 1:** projection의 `connected_component_count`와 `isolate_count`를 보고한다. isolate는 degree 0인 원시 node-set 구성원으로 정의한다.
- **필수 지표군 2:** degree 상위 5개를 `(degree DESC, node_id ASC)`로 보고한다. 5위 동점도 node ID 규칙으로 결정한다.
- **필수 지표군 3:** Tarjan 등 결정적 알고리즘으로 bridges와 articulation points를 node/edge ID 순으로 보고한다. instructor fixture의 expected bridge/articulation ID 목록과 **zero tolerance(정확한 집합 및 순서 일치)**로 비교한다. fixture가 정규화 betweenness를 대신 요구하는 경우에는 `normalized=true`, `(score DESC, node_id ASC)` top-five, 허용오차 `1e-9`와 fixture 기대값을 함께 명시한다.
- **검증된 통찰 1건:** 예를 들어 “`normalized CVE/source ID`가 해당 raw hash의 실제 source record와 canonical source link에 모두 연결되어 있다”는 결론은 raw의 정확한 위치, raw hash, normalized ID, canonical link, UA node/edge ID를 대조해 확인할 때만 쓴다. 이는 출처 연결의 검증이며 위험도·공격 관계의 자동 판정은 아니다.
- **반려된 그래프 추론 1건:** “두 CVE가 같은 ATT&CK/주제 허브를 공유하므로 한 CVE가 다른 CVE를 악용하거나 동일 공격에 사용되었다”는 주장은 원문 또는 권위 source가 없으면 `rejected inference`로 기록한다. path, cluster, centrality, LLM-extracted relation은 사실이 아니라 재검토 후보다.
- **학생 산출물:** input hash, projection metadata, 세 지표군, fixture comparison, source-verified insight, `rejected inference`를 한 재현 보고서에 제시한다.
- **평가 연결:** LO5; 기말 ‘source-checked interpretation and recovery’ 10점.

### 14주 — 종단 간 복구, 기말 리허설, 보존 종료

`60분 비동기 동영상 + 120분 대면 실습`

- **목표/활동:** 한 CTI 응답을 raw manifest부터 lint, live/fallback UA 검증, projection, 지표, 출처 대조 결론까지 재실행한다. 장애를 선택해 재현한다: `DANGLING_EDGE`, incomplete batch, stale graph, 미등록 태그, 출처 없는 graph relation 중 하나.
- **복구 기준:** malformed endpoint validator는 nonzero와 `DANGLING_EDGE`를 내야 하며, partial batch는 merge를 차단한다. fallback에서는 pinned hash가 다르면 분석을 멈추고 새 report를 발행하지 않는다. live에서 fresh artifact가 없으면 “fresh enrichment”라 하지 않는다.
- **필수 계보:** `CTI response → raw hash → normalized CVE/source ID → canonical source link → UA node/edge ID → metric result → checked conclusion`. 각 화살표의 실제 식별자·생성 시각·검사 결과를 제출물에 남긴다.
- **학생 산출물:** 개인 리허설 receipt(성공 및 한 실패 복구), teardown/보존 목록, 기말에 재사용할 command manifest. public CTI와 redacted identifier만 사용한다.
- **평가 연결:** LO3, LO4, LO5; 기말 개인 실행 증거.

### 15주 — 기말 개인 실기시험

`3시간 개인 실기시험, 신규 강의 없음`

각 학생은 고정 fixture 또는 허용된 live 자료에서 계보 한 건을 독립 실행·설명한다. 팀의 초안·공유 실행 화면은 개인 점수를 대체하지 않는다. 중단된 batch, stale artifact, 출처 없는 relation을 성공으로 바꾸어 설명하면 해당 기준은 통과하지 못한다.

## UA 검증 보고서 계약

다음은 live와 fallback 모두에 적용하는 검증 의사 코드다. fallback에서는 `fresh_enrichment_claim: false`를 명시한다.

```text
validate(graph, meta, run_or_fixture_receipt):
  require graph.kind == "knowledge"
  require nodes is array and nodes.length > 0
  require edges, layers, tour are arrays
  require every node.id is unique
  for edge in edges: require edge.source and edge.target are in node_ids
  require meta parses as JSON
  if live:
    require graph.mtime > run_started_at and meta.mtime > run_started_at
    require set(expected_batch_ids) == set(completed_batch_ids)
  if fallback:
    require sha256(graph) == instructor_owned_pinned_sha256
    require validation_report.generated_at is fresh for this check
    require fresh_enrichment_claim == false
```

검증 보고서는 적어도 `run_mode`, `graph_sha256`, `meta_sha256`(해당 시), `validated_at_utc`, node/edge/layer/tour 관찰 수, `duplicate_node_ids`, `dangling_edges`, batch 비교, fixture hash 비교, 각 invariant의 PASS/FAIL를 포함한다. 이 관찰 수는 수업 fixture가 바뀌면 달라질 수 있으므로 임계값으로 쓰지 않는다.

## 최종 개인 실기 평가표 — 총 40점

| 평가 항목 | 개인 실행 증거 | 배점 |
|---|---|---:|
| LLM Wiki 스키마·provenance·lint | immutable raw, leading frontmatter, exact source path, registered tag, 두 링크, index/log 동기화, confidence/contradiction 및 lint report | 10 |
| UA graph 생성·검증 | live의 complete batch+fresh graph/meta 또는 fallback의 instructor-owned pinned hash+fresh validation; 모든 구조 invariant | 10 |
| 그래프 지표 재현성 | raw directed provenance count와 명시 projection metadata, components/isolate, top-five degree, bridge/articulation 또는 normalized betweenness fixture 비교 | 10 |
| 출처 대조 해석과 복구 | 완전한 lineage, source-verified insight 1건, `rejected inference` 1건, malformed/stale/partial failure 복구 설명 | 10 |
| **합계** |  | **40** |

## 교수자 점검과 수용 기준

1. live 실행은 모든 expected batch artifact가 존재하고 graph/meta mtimes가 run start보다 새로울 때만 병합한다. 중단·재개 시에도 이전 partial 결과를 재사용하지 않는다.
2. fallback은 graph 파일 존재나 예전 `ok`가 아니라 instructor-owned pinned hash와 **이번 검증의** 새 report로만 수용한다. 이 경로의 allowed claim은 구조 읽기·검증·분석이며 fresh LLM enrichment가 아니다.
3. malformed input fixture의 dangling endpoint에는 validator가 nonzero로 실패하고 `DANGLING_EDGE`라는 기계 판독 메시지를 내야 한다. real graph의 node/edge를 읽어 구조 검증을 보일 수 있으나 관찰된 수를 기준치로 고정하지 않는다.
4. 수동 QA에서는 렌더된 Markdown에서 9–14주와 exam-only 15주, 4개의 10점 행, live/fallback 구분, 정확한 lineage, verified/rejected 판단이 누락·왜곡 없이 보이는지 직접 읽는다.

## 근거

- `SCHEMA.md:9-18,20-52,70-75` — raw 불변성, frontmatter, taxonomy, link/index/log, confidence 및 contradiction 규칙.
- `concepts/llm-wiki.md:18-43` — Raw–Wiki–Schema 분리와 자동 결과의 link/tag/source/contradiction 검사.
- `queries/ua-knowledge-graph-workflow.md:19-31,47-86,131-152` — 위키 전용 `understand-knowledge`, graph/meta, 구조 대조와 환류.
- `raw/blog/hermes-agent-cron-llm-wiki-knowledge-graph.md:576-621,660-724` — graph/meta/dangling 검증, mtime, complete-batch barrier, raw 불변성과 외부 텍스트 데이터 경계.
- `concepts/knowledge-graph-analysis.md:17-37`, `concepts/cyber-threat-intelligence-knowledge-graphs.md:37-48` — 중심성·고립은 검증 후보이며 graph relation은 source proof 없이는 사실이 아님.
