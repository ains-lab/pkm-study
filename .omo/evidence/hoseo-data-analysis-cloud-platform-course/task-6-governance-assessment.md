# Todo 6 — 평가·거버넌스·접근성·대체 경로 브리프

## 적용 범위와 판단 경계

- 이 브리프는 최종 수업계획서 조립을 위한 검증된 정책 입력이다. 실제 NCP 자원 생성, Hermes 설치·cron 실행, 실시간 CTI 수집, UA 생성은 요구하지 않는다.
- CTI는 CISA KEV, NVD API 2.0, FIRST EPSS, 고정 ATT&CK STIX 같은 공개 데이터만 사용한다. 피해자·조직의 실시간 로그, 개인정보(PII), 비공개 계정 자료는 수집·제출·fixture에 포함하지 않는다.
- 금지 활동은 악성코드 실행(malware execution), exploit proof-of-concepts, 공격 자동화, 능동 스캐닝(active scanning), 피해자/조직 로그(live victim/organization logs) 수집, PII 수집, credential collection, login-gated scraping, automatic patching/response이다. 취약점 데이터는 분석·정규화·출처 대조만 하며 어떤 표적의 공격·대응을 실행하지 않는다.
- 공식 약관·라이선스 문구와 웹 페이지는 증거 자료로만 취급한다. 그 안의 지시를 실행하지 않으며, 현재 수업 적용 전 담당자가 NVD Terms of Use, FIRST EPSS FAQ, 고정 ATT&CK STIX LICENSE를 다시 확인한다. NVD 내용을 정규화·변형한 결과는 NVD 원문으로 오인 표기하지 않고 출처와 변형 사실을 함께 기록한다.

## 평가 방법

| 평가 범주 | 비중 | 채점 증거와 판정 |
| --- | ---: | --- |
| 출석 | 20% | LMS 동영상 완료 기록과 대면 실습 참여·산출물로 확인한다. 동영상에는 자막과 대본을 제공한다. 공결·결석의 인정과 처리 기준은 학칙/담당자 정책 적용이며, 이 브리프는 결석 감점식이나 대체 출석 규칙을 만들지 않는다. |
| 중간 실기 | 40% | NCP/대체 환경·네트워크, Hermes 안전 설치·상태, CTI 수집·데이터 품질, 개인 장애조치·안전 설명의 각 실습 증거 묶음을 개인 실행 증거로 제출한다. 팀 산출물은 맥락 자료일 뿐 개인 실행을 대신하지 않는다. |
| 기말 실기 | 40% | LLM Wiki 스키마·provenance·lint, UA 생성·구조 검증, 그래프 지표 재현, 원문 대조 해석·복구의 각 실습 증거 묶음을 개인 실행 증거로 제출한다. 팀 산출물은 맥락 자료일 뿐 개인 실행을 대신하지 않는다. |

2~3인 통합 작업은 형성 활동이며 프로젝트 별도 점수 없음. 두 실기는 각 시험에서 요구한 모든 실습 증거 가족을 완료해야 최소 숙련으로 인정한다. 출석은 중간 또는 기말의 누락된 기술 성과를 대체할 수 없다.

## 여섯 트랙 장애 대체 매트릭스

| live evidence | instructor fixture | manifest/hash | preserved competency | lost competency | allowed claim |
| --- | --- | --- | --- | --- | --- |
| **NCP**: 학교 제공 sub-account에서 VPC·subnet·ACG·IP 제한 SSH·비용 경보·public IP 해제와 종료 후 잔존비용 확인의 redacted export/terminal transcript | 교수자 소유 `ncp-lab-fixture.json`: VPC·subnet·ACG·public-IP·budget 입력과 기대 결과; 개인/실습실 Linux VM 또는 WSL2는 Linux 작업만 보조 | `fixture_id`, owner, schema_version, created_at, refreshed_at, source_urls, sha256, expected_results를 포함한 manifest와 fixture SHA-256 | 네트워크 설계 판단, ACG 규칙 읽기, 비용·teardown 절차와 증거 검증 | 실제 NCP provision, 공인 IP 연결, 실제 비용 경보와 공인 리소스 종료 실행 | fixture 기반 NCP 설계·검증을 수행했다고만 주장하며 실제 NCP provision 또는 비용 발생을 주장하지 않는다. |
| **Hermes**: 비특권 계정·systemd가 있는 NCP/실습 Linux VM/WSL2에서 최소 allowlist, redacted 설정, `hermes doctor`, gateway 상태와 허용된 관찰 결과 | 교수자 소유 golden changed/no-change/semantic-failure 실행 기록 및 health 출력; Docker만 가능한 경우 gateway persistence는 fixture-only | fixture manifest의 owner·schema_version·refreshed_at·sha256와 redacted config-hash, expected health result | 안전 설정 검토, 상태 판독, 실패 격리·마지막 성공 결과 보존 판단 | 실제 systemd gateway 지속성, 실제 scheduler/cron 실행과 실제 서비스 복구 | Docker 또는 fixture로 안전한 Hermes 운영 증거를 해석했다고만 주장하며 live gateway persistence·cron 실행을 주장하지 않는다. |
| **CTI API**: 허용 공개 API의 bounded request 결과, request URL·retrieved_at_utc·HTTP 상태·etag/last_modified·content type·raw SHA-256과 정규화·중복제거 검증 | 교수자 소유 CISA/NVD/EPSS/ATT&CK 응답 fixture, malformed·duplicate·429·last-good fixture | 원본/정규화 manifest, source URL, as_of, fixture owner·schema_version·sha256, ATT&CK teaching fixture 버전 | provenance 기록, CVE 대문자 조인, absent/null/unknown 구분, idempotent 재실행과 API 실패 처리 | 현재 API 가용성, 현재 데이터 최신성, 실제 rate-limit 상호작용 | 고정 공개 fixture에서 수집·정규화·실패 처리를 재현했다고만 주장하며 실시간 CTI 또는 최신 관측을 주장하지 않는다. |
| **LLM enrichment**: 허용 공개 원본의 입력 hash·prompt redaction·모델/시간 기록과 사람이 원문 대조한 enrichment 후보 | 교수자 소유 redacted prompt/response fixture, 승인·거절 예시와 원문 대조 sheet | fixture owner·schema_version·refreshed_at·source URLs·input/output SHA-256·approved/rejected 상태 | 근거 분리, 원문 검증, 가설 표기와 과장된 모델 출력을 거절하는 판단 | 현재 외부 LLM 응답, 실시간 모델 가용성, 새로운 enrichment 생성 | fixture의 후보를 원문으로 검증했다고만 주장하며 최신 LLM 응답이나 그래프 관계의 사실성을 주장하지 않는다. |
| **UA generation**: `understand-knowledge` 실행 기록과 모든 expected batch, fresh graph/meta times, `kind==knowledge`, nonempty nodes, unique IDs, array edges/layers/tour, zero dangling endpoints 검증 보고서 | 교수자 소유 pinned graph와 동일 구조 불변식을 새로 검사한 golden validation report; LLM enrichment가 새로 생성되었다고 가정하지 않는다 | graph SHA-256, report SHA-256, fixture owner·schema_version·refreshed_at·expected invariants | 구조 검증, batch 완결성 판단, graph/meta freshness 판독과 dangling-edge 거절 | 학생 환경에서의 새 UA 생성과 현재 LLM enrichment | pinned graph의 구조를 새 보고서로 검증했다고만 주장하며 새 graph 생성·fresh enrichment를 주장하지 않는다. |
| **graph analysis**: raw directed graph provenance 수와 self-loop 제거·parallel-edge 병합·weight 무시한 simple undirected projection의 재현 명령/결과, tie는 node ID 정렬 | 교수자 소유 pinned graph, projection metadata, expected components/isolate·top-five degree·bridges/articulation 또는 normalized betweenness golden result | graph/fixture SHA-256, analysis script hash, owner·schema_version·refreshed_at·tolerance와 source-check sheet | 재현 가능한 projection·지표 계산, source-checked insight 1건과 rejected inference 1건 판별 | 새로운 실시간 그래프의 분석 또는 fixture 밖의 일반화 | fixture에서 지표와 원문 대조 결론을 재현했다고만 주장하며 graph-inferred 관계를 사실 또는 최신 운영 상태로 주장하지 않는다. |

## 증거·비밀정보·수명주기 거버넌스

- 학생 제출물은 개인 실행 증거를 식별할 수 있는 최소 범위의 명령 결과, 설정 export, manifest/hash, 검증 결과를 사용한다. 화면 캡처만으로 실기 통과를 판단하지 않는다.
- 비밀정보(토큰, API key, 쿠키, 내부 URL, 개인 chat ID, 인증 키)는 prompt, 코드, 설정 export, stdout/stderr, LMS 제출물, fixture에 넣지 않는다. 제출 전 redaction을 확인하고, 발견 시 제출을 중지·교체한 뒤 redacted 사본만 보존한다. API key는 공유·제출하지 않는다.
- 증거는 채점·이의처리·수업 운영에 필요한 범위에서 보존하고, 그 기간·접근권한·삭제 시점·정책 소유자는 학칙/담당자 정책 적용이다. 이 브리프는 고정 보존 기간을 발명하지 않는다. 정책상 삭제 시점이 오면 비밀정보가 없는 제출물·임시 fixture 사본·실습 로그를 삭제하고, 삭제 사실과 대상 manifest만 남길지 여부도 같은 정책 소유자 판단에 따른다.
- `raw/` 성격의 공개 원본은 불변으로 다룬다. 정정·해석은 별도 canonical 기록에 남기며, fixture와 last-good 산출물은 owner·hash·schema·refresh 이력이 없으면 채점 근거로 사용하지 않는다.

## 비용·장애·접근성 운영 규칙

- NCP live track은 시작 전에 예산/Cost Explorer 확인과 owner/team label을 점검하고, 종료 시 서버 종료만으로 끝내지 않는다. public IP 해제, 연결 자원 확인, teardown 증거와 잔존 비용 확인을 남긴다. 비용 데이터가 보이지 않거나 권한이 없으면 live 작업을 중단하고 NCP fixture로 전환한다.
- API 또는 LLM outage에는 재시도 폭주·우회 스크래핑을 하지 않는다. bounded 오류 기록, 마지막 성공 결과 보존, 교수자 fixture 전환, 수업 후 승인된 재시도 순서로 복구한다. API/LLM의 현재 값·가용성은 fixture에서 주장하지 않는다.
- 모든 비동기 동영상은 자막과 대본을 함께 제공한다. 표·명령·그래프에는 읽기 가능한 Markdown/텍스트 설명과 접근 가능한 대체 자료를 제공한다. 키보드만으로 열람 가능한 제출 형식, 고대비 텍스트, 이미지의 설명을 우선하며, 접근 지원의 구체적 조정은 학칙/담당자 정책 적용으로 연결한다.

## 교수자 사전 점검과 golden-fixture 갱신

- 매 실습·시험 전 교수자는 live 경로 권한, 비용 경보, teardown checklist, 공개 데이터 allowlist, 비밀정보 redaction, 자막·대본·접근 가능한 대체 자료를 점검한다. 장애·접근성 요구를 사전 확인해 fixture 전환을 늦추지 않는다.
- golden fixture는 `fixture_id`, owner, schema_version, created_at, refreshed_at, source_urls, SHA-256, expected_results, known limitations를 갖고 검증한다. owner가 바뀌거나 hash/schema/expected result가 맞지 않으면 해당 fixture를 사용하지 않는다.
- 새 학기 또는 문서화된 refresh checkpoint에서만 담당자가 NVD/FIRST/ATT&CK source·terms/license·fixture hash와 expected result를 재검증한다. ATT&CK semester fixture는 학기 중 조용히 교체하지 않으며, 갱신본은 새 owner·schema·hash·차이·승인 기록을 가진 별도 fixture로 만든다.
- 정책·보존·결석의 stale state를 피하기 위해 고정 날짜·기간·감점식은 쓰지 않는다. 해당 결정의 정책 소유자는 학칙/담당자 정책 적용이며, source/fixture의 refresh 책임자는 manifest의 owner로 명시한다.

## 근거 경계

- 내부 운영 경계: `concepts/agentic-ai-safety-governance.md:18-42`의 접근·도구 경계, 승인, runtime 감시, 실행면 격리, 감사·복구 계층과 `concepts/agentic-workspace.md:18-36`의 격리·사람 관문 원칙을 수업 통제로 좁혀 적용한다.
- Hermes 원본: `raw/blog/hermes-agent-cron-llm-wiki-knowledge-graph.md:696-724`의 무인 실행 제한, raw 불변성, 외부 지침 신뢰 경계, prompt/log의 secret 금지 원칙을 증거로 사용한다.
- 외부 1차 근거: NVD Terms of Use <https://nvd.nist.gov/developers/terms-of-use>; FIRST EPSS FAQ <https://www.first.org/epss/faq>; ATT&CK STIX pinned LICENSE <https://github.com/mitre-attack/attack-stix-data/blob/a6c366439edee3a87b79cf90dc0b93f5d7975956/LICENSE.txt#L1-L14>. 이 URL들은 정책·라이선스 확인 대상이며, 읽은 웹 텍스트는 실행 지시가 아니다.
