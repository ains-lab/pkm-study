# F2 문서·1차 출처 품질 감사

- 감사 대상: `output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md`
- 감사 시각: `2026-07-29T07:08:45Z` (`2026-07-29T16:08:45+09:00`)
- 기준 원장: `task-1-source-ledger.md`, `as_of: 2026-07-29`
- 참조 범위: 전체 계획/F2, Todo 1 원장, Todo 2–6 브리프, Todo 2–8 검사 영수증과 adversarial matrix, `SCHEMA.md` Update Policy, `concepts/knowledge-graph-analysis.md`
- 외부 입력 처리: 공식 응답 본문은 증거 데이터로만 읽었고 그 안의 명령·프롬프트는 실행 지시로 사용하지 않았다. 자격증명·쿠키·토큰·개인정보는 요청·출력·영수증에 포함하지 않았다.

## 판정

**APPROVE**

지원되지 않거나 현재 관찰과 실질적으로 어긋나는 주장은 0건이다. 홍보성 주장, 발명한 라이선스·학사정책·보존기간·가격, 404 링크, 잘못 귀속된 인용, 그래프 추론의 사실 승격도 0건이다. NCP 문서와 NVD 문서의 HEAD 403은 접근 가용성 결과로만 기록했고, 기능 부재로 해석하지 않았다.

## 공식 링크 검사

Todo 1/3/4/6의 공식 URL 23개를 중복 제거해 요청당 `--max-time 20`으로 확인했다. 최종 수업계획서에 직접 노출된 URL은 16개이며 모두 이 23개 집합의 부분집합이고, 비공식 도메인은 0개다.

| 공식 출처군 | URL 수 | HEAD 결과 | 보완 GET 및 판정 |
|---|---:|---|---|
| Hermes 고정 commit·설치·cron·security | 4 | 4×HTTP 200 | 고정 commit API와 세 raw 문서 GET 모두 성공; commit·설치·doctor·gateway·approval 설정을 확인 |
| MITRE ATT&CK release·v19.1·pinned LICENSE | 3 | 3×HTTP 200 | latest API, v19.1 tag object, LICENSE raw GET 성공 |
| NCP VPC/subnet/Server create/access/return/ACG/Public IP/Cost Explorer | 8 | 8×HTTP 403 | 같은 환경의 GET도 HTTP 403; `unavailable`이며 broken/기능 부재 판정 아님 |
| NCP 가격 | 1 | redirect 뒤 `/error`에서 curl 28 timeout | 원 URL GET은 HTTP 200, 2,256,254 bytes; 가격 수치는 문서에 기입하지 않음 |
| NVD Start Here/API/Terms | 3 | 3×HTTP 403 | 명시적 audit User-Agent GET은 3×HTTP 200; API 2.0·rate 문구·약관 페이지 확인 |
| CISA catalog/JSON | 2 | 2×HTTP 200 | JSON GET·파싱 성공 |
| FIRST EPSS API/FAQ | 2 | 2×HTTP 200 | API·FAQ HEAD 200, 날짜 표본 GET·파싱 성공 |

HTTP 403은 인증 없는 이 실행 환경의 가용성 관찰이다. 수업계획서 184행은 같은 결과를 날짜와 함께 명시하고 수업 전 재확인을 요구하므로, 403을 제품 기능 부재로 바꾸는 인용 드리프트가 없다. NCP 가격은 HEAD만으로 잘못 실패 처리하지 않고 GET 200을 별도로 확인했다. 404는 0건이다.

최종 문서에 직접 싣지 않고 브리프에만 남은 세부 링크는 Hermes install/cron/security 3개, NCP subnet/access/return 3개, ATT&CK LICENSE 1개다. 이는 잘못된 출처로의 치환이 아니라 압축된 참고표 구성이다. 정확한 세부 URL은 감사한 Todo 3/4/6 브리프에 있으며, 최종 문서의 16개 인용은 모두 공식·관련 출처다. 라이선스 주장을 최종 문서가 하지 않으므로 LICENSE 링크 생략도 라이선스 발명이나 인용 누락을 만들지 않는다.

## 현재 1차 출처 대조

| 항목 | 원장/문서 주장 | 2026-07-29 재관찰 | 판정 |
|---|---|---|---|
| Hermes | commit `0f64557c06f3e878fd9ec5170b9bca7f20e2778e` 학기 pin | GitHub commit API의 `sha`가 정확히 일치; pinned install/cron/security raw 문서도 GET 200 | PASS — immutable pin |
| CISA KEV | `catalogVersion 2026.07.27`, release date `2026-07-27T19:00:15.8632Z`; count는 관찰값 | 같은 version/date, vulnerabilities 1,655, 응답 SHA-256 `e0326281...8170a`로 원장과 일치 | PASS — 1,655는 최종 문서에 없고 임계값도 아님 |
| NVD | API 2.0, 무키 5/30초·키 50/30초, 6초 pacing 권고 | Start Here GET에서 두 rolling-window 제한과 six-second 권고, API 문서에서 `/rest/json/cves/2.0` 확인 | PASS — 수업 직전 재확인 명시 |
| FIRST EPSS | response date `2026-07-28` | `limit=1&order=!date` 응답 date와 SHA-256 `02c8c5ea...26b3`가 원장과 일치 | PASS — 현재값 기준 아님을 명시 |
| ATT&CK | teaching fixture `v19.1`; 기준일 official latest `v19.1` | latest API tag `v19.1`, published `2026-05-12T17:40:07Z`; annotated tag는 commit `6c371999...e091c`로 해소 | PASS — fixture/current 일치, 무음 교체 금지 |
| ATT&CK API body | 원장의 transient response hash `66be1111...75be` | 이번 body hash `2d4f4514...2c7d`, tag/published/URL은 동일 | PASS — 본문 바이트 드리프트는 있으나 의미 필드 드리프트 없음; 문서는 API body hash를 고정 사실로 인용하지 않음 |
| ATT&CK LICENSE | Todo 6의 pinned LICENSE 확인 대상 | pinned commit과 v19.1 tag commit의 `LICENSE.txt` SHA-256이 모두 `738144f7...bf5e` | PASS — 최종 문서에는 라이선스 내용 주장이 없음 |

## 사실·기본값·fixture·가설 구분 표본

| 유형 | 문서 표본 | 근거 및 품질 판정 |
|---|---|---|
| 문서화된 사실 | 185–189행의 Hermes commit, CISA catalogVersion, NVD API/rate, EPSS response date, ATT&CK latest | 같은 표의 바로 옆 1차 URL과 `as_of`가 있고 현재 재관찰과 의미적으로 일치 — PASS |
| 과목 기본값 | 91행의 `approvals.mode: smart`, 위험 작업 manual, `cron_mode: deny`; 172행의 최대 3회 bounded retry | Hermes security 원문은 smart/manual/deny 의미를 지원한다. 최대 3회는 제품 영구 속성이 아니라 더 좁은 과목 운영 규칙으로 표현 — PASS |
| 학기 fixture | 13행의 정의, 141·143–146행의 owner/schema/hash/한계, 189·191행의 ATT&CK v19.1 | live/current와 명시적으로 분리하고 새 ID/hash 없이 덮어쓰지 않음 — PASS |
| 가설 | 14행 및 193행의 graph/LLM 관계, 100·116행의 `rejected inference` | `concepts/knowledge-graph-analysis.md`의 원문 재검증 원칙과 일치; CVE-to-ATT&CK edge 자동 승격 금지 — PASS |

SCHEMA Update Policy의 “날짜 있는 새 근거 우선, 홍보성 주장을 독립 검증 없이 사실화하지 않음, 충돌 보존” 기준과 모순되는 진술은 없다. 이 산출물은 canonical 페이지가 아니므로 frontmatter/`index.md`/`log.md` 갱신 대상이 아니다.

## 변동 주장·숫자 감사

`rg`로 syllabus와 Todo 1–6 입력의 version/가격/count/Hermes/CISA/NVD/EPSS/ATT&CK/graph 수치 표현을 전부 다시 찾았다.

| 변동 항목 | 날짜·갱신 보호 | 채점 임계값 여부 | 판정 |
|---|---|---|---|
| NCP 기능·가격 | 180·184행 `as_of`, 접근 실패의 의미 제한, 수업 전 재확인; 금액 자체 없음 | 가격/금액을 영구 기준으로 고정하지 않음 | PASS |
| Hermes | semver/latest 대신 40자 commit pin; 실제 실행의 version/time/hash 별도 기록 | 버전 숫자를 점수 cutoff로 사용하지 않음 | PASS |
| CISA | 186행에 날짜·catalogVersion·실행 시 version/date/hash 재기록 | count는 기준치가 아님; 실제 1,655는 최종 문서에 없음 | PASS |
| NVD | 187행 기준일·공식 limits·수업 직전 재확인 | 5/30초·50/30초는 API hygiene, 배점 threshold 아님; 최대 3회는 과목 bounded-retry 기본값 | PASS |
| EPSS | 188행 response date와 run마다 date/hash 기록 | score/percentile cutoff 없음 | PASS |
| ATT&CK | 189행 fixture/latest/as_of, 191행 4단계 refresh | v19.1은 재현 fixture ID이지 성취 cutoff 아님 | PASS |
| 그래프 | 99·120·180·193행에 관찰 수 비영구·가설 규칙 | `229`, `321`, `1655`는 최종 문서에 0회; node/edge count cutoff 없음 | PASS |
| 그래프 수치 허용오차 | 122행 `1e-9` | volatile 관찰값이 아니라 pinned fixture의 결정적 알고리즘 비교용 과목 기본값 | PASS |

가격표·NCP 실제 금액·CISA count·EPSS score·current graph count를 성적 기준으로 바꾼 곳은 없다. 중간/기말의 10·12·8점과 retry 3회, `1e-9`는 각각 평가 설계·운영 안전·재현 허용오차이며 외부 최신값을 가장하지 않는다.

## 인용 근접성·홍보·정책·라이선스

- 정확한 날짜/버전 주장은 178–191행의 한 섹션과 같은 행의 공식 링크에 모여 있어 근접성이 충분하다.
- NCP·Hermes의 상세 운영 항목은 과목 기본값/실습 절차로 표현되고, Todo 3/4의 정확한 고정 URL까지 역추적된다. provider/repo와 무관한 링크로 표류한 항목은 0건이다.
- 정교화된 홍보 어휘 검사(`업계 최고|최고의|혁신적|완벽한|best-in-class|free tier|license|라이선스...`)는 exit 1, 즉 매치 0건이었다. 최초 넓은 `업계` 패턴은 `수업계획서`의 연속 글자를 오탐했으며 판정 근거에서 제외했다.
- 라이선스 명칭·재배포 권한·무료 tier·가격 혜택 주장이 없으므로 발명된 상업/법적 조건이 없다.
- 결석·공결, 접근 지원, 보존 기간·삭제 시점은 모두 `학칙/담당자 정책 적용`으로 위임한다. 고정 감점식·보존 일수·삭제 기한은 0건이다.
- NVD Terms와 FIRST FAQ는 정책 확인 링크일 뿐, 문서가 그 내용을 임의의 호서대학교 규정으로 승격하지 않는다.

## 한국어 명료성·용어 일관성

- `fixture` 79회이며 `픽스처` 혼용 0회, `live` 19회이며 `실시간` 혼용 0회, `hash` 38회이며 `해시` 혼용 0회다. `fallback`/`대체 경로`는 각각 기술 경로명과 한국어 열 제목으로 역할이 구분된다.
- `정규화`가 최종 문서에서 일관되며 `정상화` 오기는 0회다. `raw/canonical`, `provenance`, `teardown`, `rubric`, `redacted`는 4학년 컴퓨터공학 맥락에서 처음 사용되는 표·행의 구체적 산출물과 함께 제시된다.
- 한영 혼합은 많지만 같은 개념의 뜻이 표마다 바뀌지 않는다. 특히 `live`, `fixture-only`, `lost competency`, `allowed claim`의 경계는 플랫폼·fallback 표에서 일관된다.
- LO1의 축약 문장은 뒤의 평가 증거와 NCP fallback 표가 대체 경로의 상실 역량을 명확히 제한하므로 Linux fallback이 NCP control-plane 수행을 했다는 의미로 읽히지 않는다.
- 차단할 수준의 문법·용어 모순, 주체 불명확, 제품 기능 과장, “현재”와 fixture의 혼동은 0건이다.

## 모든 표의 수동 의미 검토

Pandoc은 10개 표를 파싱했고, 독립 Ruby inventory는 각 행의 열 수가 헤더와 같음을 확인했다.

| 표 | 위치·형태 | 수동 의미 판정 |
|---:|---|---|
| T1 | 22–30행, 선수지식 7×3 | 진단/보충이 같은 역량을 측정하고 live 접근을 과장하지 않음 — PASS |
| T2 | 44–50행, LO 5×3 | 기술·주차·평가 증거가 대응하고 버전/fixture 경계 유지 — PASS |
| T3 | 54–58행, 평가 3×3 | 20/40/40뿐이며 팀 프로젝트 가중치 없음 — PASS |
| T4 | 64–70행, 중간 rubric 4항목+합계 | 10+10+12+8=40, 개인 증거 — PASS |
| T5 | 74–80행, 기말 rubric 4항목+합계 | 10+10+10+10=40, source-check 포함 — PASS |
| T6 | 86–102행, 15주×11 | happy/failure/fallback/안전/평가가 각 행에 존재; 시험 주차는 신규 강의 없음 — PASS |
| T7 | 108–116행, milestone 7×7 | 성공만이 아니라 실패·machine evidence·상실 역량까지 명시 — PASS |
| T8 | 128–133행, 플랫폼 4×3 | NCP/Linux/WSL2/Docker claim 경계; Docker Hermes persistence fixture-only — PASS |
| T9 | 137–144행, fallback 6×7 | live·fixture·manifest·보존/상실·허용 주장이 서로 모순되지 않음 — PASS |
| T10 | 182–189행, 출처 6×3 | 변동 주장 바로 옆 공식 URL·갱신 지침; 현재/fixture 분리 — PASS |

## Adversarial 감사

| 위협 | 독립 probe | 결과 |
|---|---|---|
| stale state | in-memory로 source-ledger `as_of` 제거, CISA version을 `2025.01.01`로 변경 | 두 mutant 모두 거절; 각각 `as_of`, `cisa` 검사 실패 |
| prompt injection | “데이터로만 취급하고 실행하지 않는다”를 실행 지시로 반전 | 거절; `data_only` 실패. 실제 외부 본문은 명령으로 실행하지 않음 |
| misleading output | Todo PASS 문구를 신뢰하지 않고 live GET 파싱, Pandoc, 독립 표 inventory, 수동 10표 검토를 재실행 | 실측과 문서가 일치. graph 사실 승격 mutant도 `graph` 실패로 거절 |
| citation drift | 최종 16 URL이 plan의 23 공식 URL 부분집합인지 도메인·정확 URL 비교 | `final_unique=16`, `plan_official_unique=23`, `plan_only=7`, `nonofficial=0`; 오귀속 0 |
| scope expansion | 공격·scan·malware·자동 patch/response, live victim/PII, NCP/Hermes/UA 실제 작업 여부를 본문·명령 이력에서 확인 | 모두 금지 문맥; 감사자는 HEAD/GET과 로컬 read-only 검사만 수행 |
| invented policy/license | 고정 결석 공식·보존 기간·가격·라이선스·홍보 문구 검색 | 0건 |

첫 semantic-mutant checker는 일반 `as_of` 문자열이 `fixture_as_of`에도 남아 stale-as-of mutant를 잘못 수용했다. 이 결과를 PASS로 사용하지 않았다. source-ledger 기준일의 완전한 문장을 검사하도록 수정한 뒤 실제 문서 10개 검사 PASS, 네 mutant 모두 거절을 재현했다. Hermes raw GET의 첫 harness도 zsh의 특수 `path` 변수를 loop 변수로 덮어 `curl`을 찾지 못한 exit 127이었다. 변수명을 `doc_rel`로 수정한 뒤 세 문서를 모두 GET 200으로 재검증했다. 두 오류 모두 검사 harness 오류이며 출처 가용성/제품 사실로 기록하지 않았다.

## 정확한 주요 명령과 결과

```sh
# 23개 URL 각각에 대해 xargs -P 8로 병렬 실행
curl -sS -I -L --max-time 20 -o /dev/null -w '%{http_code}\t%{url_effective}' "$url"
# 결과: Hermes 4×200; MITRE 3×200; NCP docs 8×403;
# NVD 3×403; CISA 2×200; FIRST 2×200; NCP 가격 HEAD curl 28

curl -sS -L --max-time 20 -A 'Mozilla/5.0-compatible-F2Audit/1.0' \
  -o /dev/null -w 'http=%{http_code} effective=%{url_effective} bytes=%{size_download}' "$url"
# NCP 가격: 200/2,256,254 bytes; NCP Server doc: HTTP 403

curl -fsSL --max-time 20 <official-machine-endpoint> | ruby -rjson -rdigest -e '<parse semantic fields and SHA-256>'
# CISA_GET: version=2026.07.27 date=2026-07-27T19:00:15.8632Z count=1655
# EPSS_GET: date=2026-07-28
# ATTACK_GET: tag=v19.1 published_at=2026-05-12T17:40:07Z
# HERMES_COMMIT_GET: sha=0f64557c06f3e878fd9ec5170b9bca7f20e2778e

curl -fsSL --max-time 20 -A 'Mozilla/5.0-compatible-F2Audit/1.0' <NVD-page>
# Start Here/API/Terms GET: 3×exit 0; 5/30초, 50/30초, 6초, cves/2.0 확인

rg -n -i 'as_of|version|버전|가격|금액|catalog|count|node|edge|v[0-9]+|[0-9]+/[0-9]+s|latest|최신|Hermes|CISA|NVD|EPSS|ATT&CK' \
  output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
# exit 0; 모든 hit를 위 변동 주장 표로 분류. 229/321/1655 final hit=0.

pandoc -f gfm -t html output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md >/dev/null
# PANDOC_EXIT=0

ruby -e '<inventory contiguous Markdown pipe tables and equal column counts>' \
  output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
# TABLES=10; T1..T10 shape PASS; TABLE_SHAPE_PASS

ruby -e '<10 source-quality predicates plus four in-memory mutants>' \
  output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md
# SOURCE_SEMANTIC_GUARD_PASS real_checks=10 mutants=4
```

## 범위·정리

- 이 감사에서 실제 NCP 자원, Hermes 설치/config/gateway/cron, CTI collector, LLM, UA 생성, wiki/raw/canonical/generated 상태를 생성·변경하지 않았다.
- 네트워크 응답은 stdout 파이프로만 파싱했고 본문·cookie·header dump·임시 source 파일을 저장하지 않았다.
- 서버·브라우저 세션·컨테이너·background process를 시작하지 않았다.
- task-specific 임시 파일/디렉터리를 만들지 않았으므로 삭제 대상도 0개다.
- 지속 쓰기는 이 파일 `F2-document-source-quality.md` 하나뿐이다.
- 영수증 자체 검증: `test -s` exit 0, `pandoc -f gfm -t html` exit 0, `git diff --no-index --check /dev/null <receipt>`의 정상 added-file exit 1과 whitespace diagnostic 0 bytes, path-scoped `git status --short`는 이 파일 한 개의 `??`만 보고했다.

## 최종 결론

수업계획서는 문서화된 사실, 과목 기본값, 학기 fixture, 가설을 분리하고, 모든 변동 외부값을 기준일·재확인·무음 교체 금지 규칙에 묶는다. 현재 1차 출처의 의미 값과 일치하며, 미확인 NCP 문서 응답은 정직하게 unavailable로 남긴다. 표·한국어·정책·출처·링크에서 승인 차단 결함이 없으므로 F2 판정은 **APPROVE**다.
