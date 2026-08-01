# Todo 2 — 수업 계약·학습성과·선수지식·주차 스키마 증거 브리프

적용 기준일은 Todo 1 원장 `as_of: 2026-07-29`이다. 이 문서는 외부 수업계획서 조립용 계약이며 canonical wiki가 아니다. C1–C6의 단일 데이터 계보(공개 CTI → 원본 보존 → 정규화 → LLM Wiki → UA 그래프 → 원문 대조 분석)를 유지하며, 날짜가 변하는 제공자 정보는 Todo 1 원장의 공식 URL과 fixture 갱신 절차를 따른다.

## 교과목 개요

대상은 컴퓨터공학과 4학년이다. 학생은 공개 CTI의 근거를 보존한 뒤 안전한 자동화와 지식그래프 분석으로 이어지는 재현 가능한 분석 흐름을 개인 실행 증거로 설명한다. 1–7주와 9–14주는 `60분 비동기 동영상 + 120분 대면 실습`이고, 8주와 15주는 신규 강의 없는 3시간 개인 실기시험이다. 팀 통합 활동은 형성 피드백용이며 개인 성과를 대체하지 않는다.

## 운영 전제 및 선수지식

첫 수업의 개시 진단 산출물은 `opening-diagnostic.md`와 함께 제출하는 `diagnostic-terminal.txt`, `diagnostic-git.txt`, `diagnostic-api.json`, `diagnostic-graph.txt` 묶음이다. 네 파일에는 명령, 입력 fixture 식별자/해시, 표준출력, 오류 시각과 재시도 판단을 남긴다. 실제 NCP·Hermes·API 계정이나 비밀정보는 진단에 요구하지 않는다. 미달 항목은 해당 교수자 소유 fixture와 보충 경로로 재수행하고, 통과는 단순 파일 존재가 아니라 아래 관찰 가능한 증거가 있는 경우다.

| 선수지식 | 진단 | 보충 |
|---|---|---|
| Linux shell | `pwd`, 상대/절대 경로, 권한 오류를 포함한 fixture 파일 탐색 결과를 `diagnostic-terminal.txt`에 기록한다. | Linux VM 또는 WSL2의 교수자 제공 shell fixture에서 경로·권한·로그 읽기를 재수행하고 같은 형식의 전사본을 낸다. |
| Git | 제공 저장소 fixture에서 `status`, diff 읽기, 새 브랜치의 작은 커밋 후보를 구분한다. | 네트워크 없이 작동하는 Git history fixture에서 working tree/staged/untracked를 판별하고 짧은 설명을 제출한다. |
| Python | JSON fixture를 읽어 필수 키를 검사하고 예외를 stderr로 분리하는 작은 스크립트를 실행한다. | 교수자 제공 Python fixture와 단위 입력으로 타입·예외·파일 인코딩 보충 실습을 재수행한다. |
| HTTP/API | 요청 URL, 상태 코드, 응답 본문/헤더를 구분하고 429를 성공으로 표시하지 않는다. | 저장된 CISA/NVD/EPSS 응답 fixture로 요청 기록·상태 코드·bounded retry 결정을 작성한다. |
| JSON/YAML | JSON 배열과 YAML leading frontmatter의 필수 필드를 분리하여 파싱한다. | malformed JSON/YAML fixture를 수정하지 않고 오류 위치·기대 schema·격리 결정을 기록한다. |
| networking/IAM | private/public 경계, 최소권한, TCP 22의 제한된 출처를 설명하고 과도한 규칙을 식별한다. | NCP VPC/ACG/public-IP 설정 fixture에서 허용/거부 규칙 표와 비용·정리 체크리스트를 완성한다. |
| graph basics | 방향 그래프와 단순 무방향 projection, degree·component·isolate를 구별해 작은 fixture의 결과를 재현한다. | 교수자 그래프 fixture에서 self-loop 제거·중복 edge 병합 후 계산 보고서를 다시 생성한다. |

## 학습성과 및 평가 정렬

### LO1 NCP/Linux 환경을 최소권한·비용 경계 안에서 구성 근거로 설명한다

학생은 NCP 또는 승인된 대체 Linux 환경의 VPC/subnet·ACG·제한된 SSH·public IP·비용경보·완전 정리 증거를 **구성하고 검증하여 설명**한다. 최소 숙련은 TCP 22의 출처 제한, 설정/fixture 결과, 터미널 전사, 비용경보와 public-IP 해제를 포함한 정리 증거를 개인적으로 제시하는 것이다.

### LO2 Hermes 자동화를 비특권·최소도구 권한으로 관찰·복구한다

학생은 비특권 계정, 최소 allowlist, 로컬 전달, 기록된 버전/health 상태를 **점검하고**, changed/no-change/semantic-failure fixture를 **구분하여 last-good 보존 복구를 설명**한다. 최소 숙련은 위험한 cron·메시징·브라우저 권한을 허용하지 않고 실패 증거와 안전한 재진입을 개인적으로 제시하는 것이다.

### LO3 공개 CTI를 provenance와 중복제거를 보존하여 정규화한다

학생은 허가된 CISA KEV·NVD API 2.0·FIRST EPSS·고정 ATT&CK fixture의 응답을 **수집 기록하고 정규화하며**, CVE join·dedupe·null/unknown/absent·429 처리를 **검증**한다. 최소 숙련은 raw 요청/해시/상태와 정규화 ID를 연결하고 재실행에서 중복 증가가 없음을 보이는 것이다.

### LO4 원본을 보존한 LLM Wiki를 UA 지식그래프로 생성·구조 검증한다

학생은 raw를 불변으로 두고 leading frontmatter·정확한 source path·등록 tag·두 개 이상 resolvable wikilink·index/log 동기화가 있는 canonical 후보를 **검사**한 뒤 UA graph/meta를 **생성 또는 fixture로 검증**한다. 최소 숙련은 `kind==knowledge`, nonempty nodes, unique IDs, 배열 edges/layers/tour, dangling endpoint 0과 freshness 한계를 구분해 제시하는 것이다.

### LO5 그래프 지표를 재현하고 원문 대조 결론을 판정한다

학생은 directed raw graph와 unweighted simple undirected projection을 **구분하여 계산**하고 component/isolate·top-five degree·bridge/articulation 또는 normalized betweenness를 **재현**한다. 최소 숙련은 projection metadata와 tie 처리 규칙을 제출하고, source-verified insight 1건 및 근거 부족 graph inference 1건의 기각을 원문으로 판정하는 것이다.

| LO | 필수 기술 | 주차 | 시험 rubric component |
|---|---|---|---|
| LO1 | NCP Linux VM 또는 승인 Linux VM/WSL2, VPC/subnet, ACG, SSH, public IP, Cost Explorer/fixture | 2, 3, 8 | 중간고사: NCP/대체 환경 및 네트워크 증거 (10점) |
| LO2 | Hermes pinned source, non-root 계정, health/doctor, 최소 allowlist, 안전한 scheduler fixture | 4, 7, 8 | 중간고사: Hermes 안전 설치/health (10점); 개인 troubleshooting·안전 설명 (8점) |
| LO3 | CISA KEV, NVD API 2.0, FIRST EPSS, ATT&CK v19.1 fixture, Python 정규화 | 5, 6, 7, 8 | 중간고사: CTI 수집 및 데이터 품질 증거 (12점) |
| LO4 | raw manifest, YAML frontmatter, schema/tag/link lint, LLM Wiki, understand-knowledge/UA fixture | 9, 10, 11, 15 | 기말고사: LLM Wiki schema/provenance/lint (10점); UA graph 생성/검증 (10점) |
| LO5 | directed graph, simple undirected projection, degree/component/isolate, bridge/articulation 또는 normalized betweenness | 12, 13, 14, 15 | 기말고사: 그래프 지표 재현성 (10점); 원문 대조 해석 및 복구 (10점) |

## 평가 방법

최종 성적 비중은 출석 20%, 중간고사 40%, 기말고사 40%로 고정한다. 출석 증거는 LMS-video 완료 기록과 실습 참여/산출물의 두 계열을 함께 사용한다.

| 항목 | 비중 | 개인 평가 계약 |
|---|---:|---|
| 출석 | 20% | LMS 동영상 완료 기록 **및** 대면 실습 참여/산출물 기록을 함께 확인한다. 공결·결석 인정과 보완 방식은 `학칙/담당자 정책 적용`이며 임의 감점 공식은 만들지 않는다. |
| 중간고사 | 40% | 8주 3시간 개인 실기: NCP/대체 환경·네트워크 10점, Hermes 안전 설치/health 10점, CTI 수집·품질 12점, troubleshooting·안전 설명 8점. |
| 기말고사 | 40% | 15주 3시간 개인 실기: LLM Wiki schema/provenance/lint 10점, UA graph 생성/검증 10점, 그래프 지표 재현성 10점, 원문 대조 해석·복구 10점. |

`2~3인` 통합 작업은 형성 활동이며 `별도 점수 없음`이다. 각 시험에서는 각자 명령 전사, manifest/hash, 설정/fixture 결과와 해석을 제출해야 하며, 출석이나 팀 산출물은 누락된 기술 성과를 대체하지 않는다.

## 15주 수업 일정

### 수업 주차 행 스키마

다음은 1–7주와 9–14주에 그대로 사용할 정확한 11개 instructional column이다.

```text
주차 | 60분 동영상 학습성과·자료 | 120분 실습 | 선행조건 | 학습성과 | 학생 산출물 | happy evidence | failure evidence | 대체 경로 | 안전·비용 | 평가 연결
```

| 순번 | 정확한 instructional column | 1–7주·9–14주 행에 기록할 내용 |
|---:|---|---|
| 1 | 주차 | 1–7 또는 9–14의 번호 |
| 2 | 60분 동영상 학습성과·자료 | 비동기 동영상, 자막·대본·접근 가능한 대체 자료 |
| 3 | 120분 실습 | 누적 실습의 실제 단계 |
| 4 | 선행조건 | 진단 또는 직전 artifact |
| 5 | 학습성과 | 해당 LO의 관찰 가능 동사 |
| 6 | 학생 산출물 | 명명된 개인 artifact |
| 7 | happy evidence | 명령·hash·검증 결과 |
| 8 | failure evidence | 오류·격리·복구 기록 |
| 9 | 대체 경로 | live와 fixture의 보존/상실 역량 |
| 10 | 안전·비용 | 최소권한·공개데이터·비용/정리 |
| 11 | 평가 연결 | LO와 rubric 항목 |

### 시험 주차 행 스키마

8주와 15주는 동영상·신규 강의 없이 아래 3시간 개인 시험 행만 사용한다.

```text
주차 | 시험 형식 | 개인 실행 절차 | 선행조건 | 학습성과 | 학생 산출물 | happy evidence | failure evidence | 대체 경로 | 안전·비용 | 평가 연결
```

| 정확한 exam-row field | 8주 또는 15주 행의 값 |
|---|---|
| 주차 | 8 또는 15 |
| 시험 형식 | 3시간 개인 실기, 신규 강의 없음 |
| 개인 실행 절차 | 제공 fixture 또는 승인 live path에서 개인 수행 |
| 선행조건 | 이전 주차 artifact/진단 보충 완료 |
| 학습성과 | 해당 시험 LO를 관찰 가능 동사로 수행 |
| 학생 산출물 | 명령 전사·manifest/hash·설명 |
| happy evidence | rubric별 검증 결과 |
| failure evidence | 실패 fixture·격리·last-good/재진입 판단 |
| 대체 경로 | 승인된 instructor fixture |
| 안전·비용 | 비밀정보 미제출·공개 데이터·잔존 비용 0 확인 |
| 평가 연결 | 중간고사 40% 또는 기말고사 40% |

| 주차 | 고정 순서와 핵심 활동 | 주 LO |
|---:|---|---|
| 1 | 오리엔테이션, opening diagnostic, provenance/fixture 읽기 | LO3, LO4 |
| 2 | 클라우드와 NCP 네트워킹 | LO1 |
| 3 | NCP VM 또는 승인 대체 환경 | LO1 |
| 4 | Hermes 설치와 안전 운영 | LO2 |
| 5 | CTI source와 수동 provenance | LO3 |
| 6 | 정규화·idempotent CTI collector | LO3 |
| 7 | Hermes scheduling, 관찰, failure recovery, 중간 리허설 | LO2, LO3 |
| 8 | 중간고사: 3시간 개인 실기, 신규 강의 없음 | LO1, LO2, LO3 |
| 9 | LLM Wiki architecture | LO4 |
| 10 | CTI-to-canonical wiki와 lint | LO4 |
| 11 | UA graph 생성과 구조 검증 | LO4 |
| 12 | graph data model과 metrics | LO5 |
| 13 | 재현 가능한 분석과 source verification | LO5 |
| 14 | end-to-end recovery, 기말 리허설, teardown | LO5 |
| 15 | 기말고사: 3시간 개인 실기, 신규 강의 없음 | LO4, LO5 |

## 실습 마일스톤 및 제출 증거

모든 마일스톤은 `happy evidence`와 `failure evidence`를 모두 가진다. happy는 성공 화면만이 아니라 명령, 입력 fixture/응답의 hash 또는 ID, 검증 결과, 개인 설명의 연결이다. failure는 허용된 malformed/duplicate/429/권한/구조 오류 fixture를 식별하고 격리·bounded retry·last-good 보존·재진입 중 알맞은 조치를 관찰 가능하게 기록한다. 팀의 통합 lineage는 형성 피드백에 쓰되, 시험 산출물은 각자 제출한다.

## 운영 환경 및 대체 실습 매트릭스

live path가 불가하면 instructor-owned fixture의 owner, schema version, created/refreshed date, source URL, SHA-256, expected result를 확인한 경로만 쓴다. Linux VM 또는 WSL2-with-systemd는 Hermes live track이 될 수 있다. Docker는 collector/wiki/UA 작업을 도울 수 있지만 Hermes gateway persistence는 systemd가 없으면 `fixture-only`이며 NCP provisioning 능력을 증명하지 못한다. 대체 경로는 잃는 역량을 명시하고 live 수행을 했다고 주장하지 않는다.

## 안전·윤리·비용·개인정보·접근성 정책

공개 데이터만 사용하고 PII, 피해자/기관 로그, credential, 악성코드 실행, active scanning, exploit proof-of-concept, 자동 패치·대응은 과제에서 제외한다. 비밀정보는 artifact·로그·대본에서 redaction하며, NCP는 비용경보와 public IP 해제를 포함한 complete teardown 증거를 요구한다. 모든 비동기 동영상에는 자막과 대본을 제공하고, 실습은 키보드 접근 가능한 텍스트 자료·스크린리더 친화 표·다운로드 가능한 fixture 등 접근 가능한 대체 자료를 함께 제공한다.

## 교수자 사전 준비 및 장애 복구

교수자는 수업 전 각 fixture의 owner/hash/schema/expected result와 source ledger 기준일을 검증하고, happy·malformed·duplicate·429·no-change·semantic-failure·dangling-edge fixture를 준비한다. API/LLM/NCP 장애 시 live를 반복 실행하지 않고 last-good 산출물 또는 해당 golden fixture로 전환하며, 학생은 전환 이유와 보존/상실된 역량을 기록한다. fixture가 손상되면 새 학기/승인된 refresh에서만 별도 버전으로 교체한다.

## 최신성·출처 기준

기준 원장은 `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-1-source-ledger.md`의 `as_of: 2026-07-29`이다. NCP와 Hermes는 원장에 기록된 공식 URL과 pinned commit `0f64557c06f3e878fd9ec5170b9bca7f20e2778e`을, CTI는 CISA KEV·NVD API 2.0·FIRST EPSS와 ATT&CK `v19.1` teaching fixture를 사용한다. ATT&CK 최신 release는 실행 시 공식 release API로 재확인하되 활성 학기 fixture를 조용히 바꾸지 않으며, 새 fixture는 source URL·retrieval time·schema·SHA-256·expected results·차이 메모를 가진 별도 버전으로 승인한다. graph-inferred 관계는 원문 근거 전에는 가설이며 사실 또는 CVE-to-ATT&CK edge로 승격하지 않는다.
