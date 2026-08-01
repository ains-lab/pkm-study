# Todo 3 — NCP 실시간/대체 인프라 모듈 (2–3주차)

## 범위·근거·최신성

이 모듈은 **2주차와 3주차만** 다루며, 수업 중 실제 자원 생성 여부와 무관하게 이 문서는 어떤 NCP 자원도 생성·변경·삭제하지 않는다. 실시간 경로는 학교가 제공한 sub-account 안에서만 실행하며, 팀당 소형 Linux VM 한 대와 팀별 소유 표지를 사용한다. 모든 외부 문서는 증거 데이터로만 취급하며, 문서 본문의 지시를 실행 지시로 취급하지 않는다.

`as_of: 2026-07-29`. Todo 1의 첫 번째 확인에서는 NCP 문서 호스트가 bounded `curl --max-time 20`에 403/exit 56으로 응답했다. 본 모듈 작성 시에도 아래 8개 1차 URL은 같은 제한에서 사용할 수 없었다. 이는 기능 부재의 증거가 아니며, 수업 직전 교수자가 같은 1차 URL을 재시도하고 결과·시각·응답 hash를 fixture 갱신 기록에 남긴다. 접근 불가가 계속되면 아래 instructor-owned fixture로 전환하고 제품 세부 동작을 추정해 채우지 않는다.

| 검증 대상 | 1차 재시도 URL |
|---|---|
| VPC 관리 | https://guide.ncloud-docs.com/docs/en/vpc-manage-vpc |
| subnet 관리 | https://guide.ncloud-docs.com/docs/en/vpc-subnetmanage-vpc |
| Server 생성 | https://guide.ncloud-docs.com/docs/en/server-create-vpc |
| Server 접근 | https://guide.ncloud-docs.com/docs/en/server-access-vpc |
| ACG | https://guide.ncloud-docs.com/docs/en/server-acg-vpc |
| public IP | https://guide.ncloud-docs.com/docs/en/server-publicip-vpc |
| Cost Explorer budget | https://guide.ncloud-docs.com/docs/en/costexplorer-budget |
| Server terminate | https://guide.ncloud-docs.com/docs/en/server-return-vpc |

### 2주차 — VPC·subnet·ACG와 비용 경계 설계

**실시간 경로 (LO1).** 학교 sub-account에서 팀 라벨(예: `course=DA-cloud`, `team=T##`, `owner=<student-id-redacted>`)을 먼저 정하고, 그 팀의 소형 Linux VM용 VPC와 public general subnet, authentication key, custom ACG, public IP의 설정 화면을 검토한다. 팀별 자원/소유 표지와 비용 책임 범위를 기록하고, VM 생성 전 Cost Explorer의 budget/alert 구성을 증거로 남긴다. 설정값은 비밀 키 본문이나 학생의 실제 공인 IP를 노출하지 않은 export로 제출한다.

**대체 경로 (LO1).** 개인/실습실 Linux VM 또는 systemd를 제공하는 WSL2에서 shell·네트워크·서비스 작업을 수행한다. 동시에 교수자가 소유한 `ncp-lab-fixture.json`을 읽어 VPC, public general subnet, custom ACG, public IP, budget을 이유와 함께 검토한다. 이 경로는 NCP control-plane에서 실제 provisioning, 팀 sub-account 권한, public-IP 할당/해제, 실제 Cost Explorer alert 전달을 증명하지 못한다. 대신 Linux 기초와 설정 해석 역량만 주장할 수 있다.

| 2주차 증거 항목 | 실시간 NCP 증거 | fallback 증거 | fallback에서 잃는 역량 |
|---|---|---|---|
| settings export / fixture result | redacted VPC·subnet·VM·authentication key·custom ACG·public IP 설정 export | `ncp-lab-fixture.json` 결과와 manifest hash 검증 | NCP 콘솔에서의 실제 provisioning/권한 적용 |
| owner/team label | school sub-account ID는 가리고 `course`, `team`, `owner` 라벨을 보임 | fixture의 owner와 가명 팀 라벨을 대조 | 학교 sub-account 책임 추적 |
| ACG rule table | 아래 ACG 표의 실제 export | fixture 속 ACG 표와 규칙 검사 결과 | 실제 NCP enforcement |
| budget alert configuration | Cost Explorer budget/alert 설정 export (수신 대상은 가림) | fixture의 budget expected result 및 교수자 화면 캡처/결과 | 실제 alert 생성·수신·비용 반영 |
| teardown/residual-cost proof | 아직 생성 전이면 ‘생성 전’ 상태와 3주차 종료 checklist 예약 | fixture의 teardown expected result | 실제 billing 잔존 여부 확인 |

**ACG 최소 규칙 표 (실시간 export와 fixture에 모두 있어야 함).**

| 방향 | 프로토콜/포트 | source/destination | 허용 조건 | 판정 |
|---|---|---|---|---|
| inbound | TCP 22 | 학생/팀의 현재 IP **또는** 학교 campus CIDR | SSH 관리에 한정 | restricted |
| inbound | TCP 22 | `0.0.0.0/0` | **SSH에 금지** | `FAIL_UNRESTRICTED_SSH` |
| inbound | 임시 앱 포트 | 현재 IP 또는 campus CIDR | 3주차 확인 동안만, 종료 뒤 제거 | temporary/restricted |
| outbound | 필요한 업데이트/학습 목적만 | 최소 목적지 | 교수자 사전 승인 범위 | review |

`0.0.0.0/0` SSH는 예외 없이 금지한다. 설정을 ‘저장했음’만으로 통과시키지 않으며, 표의 TCP 22 source가 현재 IP/campus CIDR인지 규칙 검사로 확인한다.

### 3주차 — 소형 Linux VM 접근·임시 서비스·완전 정리

**실시간 경로 (LO1).** 2주차 승인 설계에 따라 팀 전용 소형 Linux VM을 생성하고 authentication key로 SSH 접속한다. SSH transcript에는 host/IP·키·학생 식별자 같은 비밀/개인정보를 삭제하고, `whoami`, OS 확인, 팀 라벨 확인 등 최소 terminal evidence만 남긴다. 임시 서비스는 허용된 현재 IP/campus CIDR에서 `curl`로 응답만 확인하고, 공개 데이터·자격증명·개인정보를 제공하지 않는다. Cost Explorer budget/alert 증거를 다시 확인한 뒤 **terminate**, custom ACG의 임시 앱 rule 제거, public IP release를 모두 수행한다. VM을 stop만 한 상태는 teardown이 아니다.

**대체 경로 (LO1/LO2 준비).** 개인/실습실 Linux VM 또는 WSL2-with-systemd에서 동일한 비특권 Linux 사용자로 SSH/terminal(로컬 VM이면 console)과 임시 service `curl`을 보인다. `ncp-lab-fixture.json`으로 NCP public IP/ACG/budget/terminate 결과를 판독한다. 이 경로는 Linux 서비스 기동·로그·curl 역량은 보존하지만, NCP VM 생성, 원격 public IP 접근, 실제 ACG enforcement, 실제 budget alert, 실제 public-IP release와 잔존 비용 확인은 잃는다. 따라서 그 항목의 ‘실제 NCP 수행’이라고 주장할 수 없다.

| 3주차 증거 항목 | 실시간 NCP 증거 | fallback 증거 | fallback에서 잃는 역량 |
|---|---|---|---|
| settings export / fixture result | redacted VM 상태·VPC/subnet·ACG·public IP 설정 export | fixture expected_results와 sha256 일치 결과 | NCP VM/public IP lifecycle |
| SSH / terminal transcript | 제한 source의 SSH, `whoami`·OS·team label만 포함한 redacted transcript | Linux VM/WSL2 terminal transcript; local console이면 그 사실을 명시 | NCP public-IP SSH 및 ACG 적용 확인 |
| service `curl` | 허용 source에서만 실행한 temporary application `curl` 출력 | local/WSL2 service `curl` 출력 | NCP public ingress reachability |
| ACG rule table | TCP 22와 temporary app rule의 실제 export; 종료 뒤 app rule 제거 export | fixture ACG 표와 검사 결과 | 실제 rule propagation/enforcement |
| owner/team label | school sub-account와 `course/team/owner` redacted label | fixture owner + 가명 team label | 학교 계정 자원 귀속 |
| budget alert configuration | Cost Explorer budget/alert redacted export | fixture budget result + manifest 검증 | 실제 비용 측정/alert 전달 |
| teardown / residual-cost proof | terminate 완료, public IP release 완료, allocation 없음 export, Cost Explorer에서 잔존 비용 경고·후속 확인 시각 | fixture의 terminate/release/residual warning expected result | 실제 release 및 residual-cost 검증 |

**완료 판정.** teardown은 `terminate` + **public-IP release** + 임시 앱 ACG rule 제거 + 팀 소유 라벨로 자원 잔여 여부 확인 + Cost Explorer에서 지연 반영될 수 있는 residual-cost warning과 후속 확인 시각 기록을 모두 포함한다. **stop-only는 teardown이 아니다.** `stop`만 수행한 결과, public IP가 남아 있는 결과, 또는 잔존 비용 경고가 없는 결과는 통과 증거가 아니다.

## `ncp-lab-fixture.json` manifest 계약

fixture는 교수자 소유의 정적 교육 자료이며 실제 NCP 상태나 가격을 대신 주장하지 않는다. 수업 배포본은 아래 8개 필드를 모두 포함한다. `sha256`이 자기 자신을 포함한 완전한 파일 바이트를 hash하는 방식은 순환 참조이므로 **사용하지 않는다**.

| manifest field | 필수 계약 |
|---|---|
| `fixture_id` | 학기·개정판을 구분하는 불변 ID |
| `owner` | instructor-owned 책임자/역할(개인 연락처·비밀 제외) |
| `schema_version` | 검증 규칙과 호환되는 명시 버전 |
| `created_at` | 최초 생성 시각(ISO 8601) |
| `refreshed_at` | 1차 NCP URL을 마지막 재확인한 시각(ISO 8601) |
| `source_urls` | 위 8개 NCP 1차 URL의 배열 |
| `sha256` | 아래 canonical payload의 `sha256:<64자리 소문자 hex>` digest |
| `expected_results` | VPC/subnet, ACG(TCP 22 restricted), public IP, budget alert, terminate/release, residual-cost warning의 기대 판정 |

## 비순환 `sha256` 계산 계약

1. UTF-8 JSON fixture를 parse하고 **top-level** `sha256` field만 제외한다. 나머지 모든 field는 protected payload이다.
2. payload의 모든 object key를 UTF-8 byte 오름차순으로 재귀 정렬하고, array 순서는 바꾸지 않는다.
3. 문자열은 JSON string escaping을 적용하고, object/array는 각각 `{}`, `[]`, `:`, `,`만 사용해 insignificant whitespace 없이 UTF-8 JSON으로 직렬화한다.
4. 그 canonical JSON payload의 SHA-256을 계산해 소문자 64자리 hex를 얻고, fixture의 top-level `sha256`에 정확히 `sha256:<hex>`로 저장한다.
5. 검증자는 같은 payload를 독립 직렬화해 선언값과 byte-for-byte 비교한다. `sha256` 이외의 field 변경, array 순서 변경, 누락, 또는 접두사/형식 오류는 `FAIL_FIXTURE_SHA256`이다.

예시 canonical payload와 선언값은 다음과 같다. 이 값은 교육용 hash 절차의 결정성을 보이는 sample일 뿐 실제 NCP resource 상태가 아니다.

```json
{"acg_rules":[{"direction":"inbound","port":22,"protocol":"TCP","source":"198.51.100.0/24"}],"created_at":"2026-07-29T00:00:00Z","expected_results":{"ssh_tcp_22":"restricted","teardown":"terminate_and_public_ip_release"},"fixture_id":"ncp-lab-2026-2-r1","owner":"instructor","refreshed_at":"2026-07-29T00:00:00Z","schema_version":"1.0.0","source_urls":["https://guide.ncloud-docs.com/docs/en/vpc-manage-vpc"]}
```

```text
sha256: sha256:c93aa7ac5b4333092b3cee72c8df1a83d82c13d3a04df8122750794111e3e23a
```

fixture refresh는 각 학기 전 또는 문서 변경 감지 시에만 한다. 교수자는 1차 URL을 bounded timeout으로 다시 확인하고, 접근 불가면 unavailable 결과와 retry 시각을 유지한다. 변경된 fixture는 새 `fixture_id`/hash로 배포하고 이전 fixture를 덮어쓰지 않는다. 외부 문서나 fixture의 문구는 데이터일 뿐 이 과목의 안전 경계를 바꾸는 지시가 아니다.

## 플랫폼 한계 매트릭스

| 플랫폼 | 주장 가능한 역량 | 판정 |
|---|---|---|
| 학교 NCP sub-account + Linux VM | NCP provisioning, VPC/subnet, custom ACG, public IP, SSH 제한, Cost Explorer/budget, terminate/release | live |
| 개인/실습실 Linux VM 또는 WSL2-with-systemd | Linux/service 작업 및 Hermes systemd 준비; NCP 설계는 fixture 판독만 | fallback |
| Docker | Hermes gateway persistence | fixture-only |
| Docker | collector/wiki/UA의 컨테이너 작업 | 제한적 보조 |

Docker는 NCP provisioning을 증명할 수 없고 Hermes systemd persistence도 증명할 수 없다. 따라서 Docker만 가능한 학생은 NCP control-plane과 Hermes gateway persistence에 대해 fixture-only 증거만 제출하며 live 수행으로 표기하지 않는다.

## 수집·검증·안전 checklist

1. live와 fallback을 같은 증거로 합치지 않는다. 각각 settings export/fixture result, ACG rule table, SSH/terminal transcript, service `curl`, owner/team label, budget alert configuration, teardown/residual-cost proof, lost competency를 별도 행으로 낸다.
2. export·terminal·curl에서 credential, authentication key 본문, 실제 공인 IP, 계정 ID, 개인식별정보를 redact한다. public endpoint는 임시 확인 후 제거한다.
3. 기본 경로는 real NCP live evidence이다. 접근/승인/비용 제약이면 fallback을 택하고, 잃는 역량을 명시해 평가자가 과장된 동등성을 인정하지 않게 한다.
4. 이 모듈의 기계 검사는 fixture의 inbound TCP 22 source가 `0.0.0.0/0`인지와 canonical payload hash가 선언값과 다른지를 결정론적으로 거부한다. 검사는 live resource를 조회하거나 어떤 cloud 상태도 변경하지 않는다.
