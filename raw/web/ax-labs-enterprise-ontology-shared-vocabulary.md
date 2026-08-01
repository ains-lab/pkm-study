---
source_url: "https://theaxlabs.com/blog/%EC%9A%B0%EB%A6%AC-%ED%9A%8C%EC%82%AC%EB%8A%94-%EA%B0%99%EC%9D%80-%EB%8B%A8%EC%96%B4%EB%A5%BC-%EA%B0%99%EC%9D%80-%EB%9C%BB%EC%9C%BC%EB%A1%9C-%EC%93%B0%EA%B3%A0-%EC%9E%88%EB%8A%94%EA%B0%80"
ingested: 2026-07-25
sha256: b9c12c2d3c870ad8e4d4b07fb830194ed1a710d7d854852b397055ccc07a7033
---
---
title: "우리 회사는 같은 단어를 같은 뜻으로 쓰고 있는가 — AX LABS 블로그"
source: "https://theaxlabs.com/blog/%EC%9A%B0%EB%A6%AC-%ED%9A%8C%EC%82%AC%EB%8A%94-%EA%B0%99%EC%9D%80-%EB%8B%A8%EC%96%B4%EB%A5%BC-%EA%B0%99%EC%9D%80-%EB%9C%BB%EC%9C%BC%EB%A1%9C-%EC%93%B0%EA%B3%A0-%EC%9E%88%EB%8A%94%EA%B0%80"
author:
published: 2026-07-20
created: 2026-07-23
description: "영업은 계약, 재무는 수주, 현장은 건이라 부른다. 사람은 알아듣지만 에이전트는 못 알아듣는다. 마이크로소프트가 이 문제를 다루는 학습 도구를 무료로 공개했다. 브라우저에서 5분 만에 확인하는 법과, 우리 회사에 지금 적용할 수 있는 것과 없는 것을 정리했다."
tags:
  - "clippings"
---
![우리 회사는 같은 단어를 같은 뜻으로 쓰고 있는가](https://rqquzjgqvgeyjzfgoieq.supabase.co/storage/v1/object/public/blog-images/1784501267573-0f6dcd689be3a984.png)

우리 회사는 같은 단어를 같은 뜻으로 쓰고 있는가

영업팀은 '계약'이라 부른다. 재무팀은 같은 것을 '수주'라 부른다. 현장에서는 그냥 '건'이라고 한다. 회의에서는 아무도 헷갈리지 않는다. 맥락으로 알아듣기 때문이다.

문제는 에이전트에게 일을 시킬 때 시작된다. 여기서 에이전트란 사람이 시킨 일을 스스로 여러 단계에 걸쳐 처리하는 AI 프로그램을 말한다. 대화만 주고받는 챗봇과 달리 파일을 열어보고 표를 뒤지고 결과를 만들어낸다.

"이번 분기 계약 정리해줘"라고 하면 이 에이전트는 어느 표의 어느 열을 봐야 할지 모른다. 사람이 30년간 눈치로 메워온 빈칸이 에이전트 앞에서 그대로 드러난다.

현장에서 반복적으로 보는 패턴이 있다. AI 도입이 막히는 지점은 대개 모델 성능이 아니다. 우리가 쓰는 말이 정리돼 있지 않다는 사실이다.

이 문제를 정면으로 다루는 개념이 온톨로지이고, 마이크로소프트가 2026년 2월 그것을 배우는 도구를 무료로 공개했다.

## 온톨로지는 컴퓨터가 읽는 회사 용어사전이다

어렵게 설명된 글이 많지만 실체는 단순하다. 두 가지로 이루어진다.

1. **우리 회사에서 쓰는 중요한 명사들** — 고객, 주문, 상품, 매장 같은 것
2. **그 명사들이 서로 어떻게 이어지는지** — 고객이 주문을 한다, 주문에 상품이 담긴다

이게 전부다. 명사와 화살표를 그린 그림이고, 그것을 사람이 아니라 컴퓨터도 읽을 수 있는 파일로 저장한 것이다.

마이크로소프트가 예제로 넣어둔 커피 체인 온톨로지를 보면 감이 온다.

<svg viewBox="0 0 400 478" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Fourth Coffee 온톨로지: 명사 6개와 화살표 7개" style="width:100%;max-width:430px;display:block;margin:0 auto;"><defs><marker id="arr" viewBox="0 0 8 8" refX="7" refY="4" markerWidth="7" markerHeight="7" orient="auto-start-reverse"><path d="M0.5 0.5L7.5 4L0.5 7.5z" fill="#a1a1a6"></path></marker></defs><path d="M148 50L249 50" fill="none" stroke="#a1a1a6" stroke-width="1.4" marker-end="url(#arr)"></path><text x="200" y="41" text-anchor="middle" font-family="-apple-system,system-ui,sans-serif" font-size="11" font-weight="500" fill="#333333" stroke="#ffffff" stroke-width="4" paint-order="stroke" stroke-linejoin="round">주문한다</text> <path d="M313 74L313 193" fill="none" stroke="#a1a1a6" stroke-width="1.4" marker-end="url(#arr)"></path><text x="343" y="139" text-anchor="middle" font-family="-apple-system,system-ui,sans-serif" font-size="11" font-weight="500" fill="#333333" stroke="#ffffff" stroke-width="4" paint-order="stroke" stroke-linejoin="round">담긴다</text> <path d="M260 74L140 193" fill="none" stroke="#a1a1a6" stroke-width="1.4" marker-end="url(#arr)"></path><text x="200" y="138" text-anchor="middle" font-family="-apple-system,system-ui,sans-serif" font-size="11" font-weight="500" fill="#333333" stroke="#ffffff" stroke-width="4" paint-order="stroke" stroke-linejoin="round">처리된다</text> <path d="M313 244L313 363" fill="none" stroke="#a1a1a6" stroke-width="1.4" marker-end="url(#arr)"></path><text x="353" y="309" text-anchor="middle" font-family="-apple-system,system-ui,sans-serif" font-size="11" font-weight="500" fill="#333333" stroke="#ffffff" stroke-width="4" paint-order="stroke" stroke-linejoin="round">공급받는다</text> <path d="M252 390L151 390" fill="none" stroke="#a1a1a6" stroke-width="1.4" marker-end="url(#arr)"></path><text x="200" y="412" text-anchor="middle" font-family="-apple-system,system-ui,sans-serif" font-size="11" font-weight="500" fill="#333333" stroke="#ffffff" stroke-width="4" paint-order="stroke" stroke-linejoin="round">보낸다</text> <path d="M87 366L87 247" fill="none" stroke="#a1a1a6" stroke-width="1.4" marker-end="url(#arr)"></path><text x="54" y="309" text-anchor="middle" font-family="-apple-system,system-ui,sans-serif" font-size="11" font-weight="500" fill="#333333" stroke="#ffffff" stroke-width="4" paint-order="stroke" stroke-linejoin="round">도착한다</text> <path d="M142 372 Q196 340 262 248" fill="none" stroke="#a1a1a6" stroke-width="1.4" marker-end="url(#arr)"></path><text x="216" y="316" text-anchor="middle" font-family="-apple-system,system-ui,sans-serif" font-size="11" font-weight="500" fill="#333333" stroke="#ffffff" stroke-width="4" paint-order="stroke" stroke-linejoin="round">실려 있다</text> <rect x="26" y="26" width="122" height="48" rx="10" fill="#ffffff" stroke="#e0e0e0" stroke-width="1.2"></rect><text x="42" y="56" font-family="-apple-system,system-ui,sans-serif" font-size="14.5" font-weight="600" fill="#1d1d1f">고객</text> <text x="134" y="56" text-anchor="end" font-family="-apple-system,system-ui,sans-serif" font-size="9.5" fill="#7a7a7a">Customer</text> <rect x="252" y="26" width="122" height="48" rx="10" fill="#ffffff" stroke="#e0e0e0" stroke-width="1.2"></rect><text x="268" y="56" font-family="-apple-system,system-ui,sans-serif" font-size="14.5" font-weight="600" fill="#1d1d1f">주문</text> <text x="360" y="56" text-anchor="end" font-family="-apple-system,system-ui,sans-serif" font-size="9.5" fill="#7a7a7a">Order</text> <rect x="26" y="196" width="122" height="48" rx="10" fill="#ffffff" stroke="#e0e0e0" stroke-width="1.2"></rect><text x="42" y="226" font-family="-apple-system,system-ui,sans-serif" font-size="14.5" font-weight="600" fill="#1d1d1f">매장</text> <text x="134" y="226" text-anchor="end" font-family="-apple-system,system-ui,sans-serif" font-size="9.5" fill="#7a7a7a">Store</text> <rect x="252" y="196" width="122" height="48" rx="10" fill="#ffffff" stroke="#e0e0e0" stroke-width="1.2"></rect><text x="268" y="226" font-family="-apple-system,system-ui,sans-serif" font-size="14.5" font-weight="600" fill="#1d1d1f">상품</text> <text x="360" y="226" text-anchor="end" font-family="-apple-system,system-ui,sans-serif" font-size="9.5" fill="#7a7a7a">Product</text> <rect x="26" y="366" width="122" height="48" rx="10" fill="#ffffff" stroke="#e0e0e0" stroke-width="1.2"></rect><text x="42" y="396" font-family="-apple-system,system-ui,sans-serif" font-size="14.5" font-weight="600" fill="#1d1d1f">배송</text> <text x="134" y="396" text-anchor="end" font-family="-apple-system,system-ui,sans-serif" font-size="9.5" fill="#7a7a7a">Shipment</text> <rect x="252" y="366" width="122" height="48" rx="10" fill="#ffffff" stroke="#e0e0e0" stroke-width="1.2"></rect><text x="268" y="396" font-family="-apple-system,system-ui,sans-serif" font-size="14.5" font-weight="600" fill="#1d1d1f">공급사</text> <text x="360" y="396" text-anchor="end" font-family="-apple-system,system-ui,sans-serif" font-size="9.5" fill="#7a7a7a">Supplier</text> <text x="200" y="468" text-anchor="middle" font-family="-apple-system,system-ui,sans-serif" font-size="11" letter-spacing="0.4" fill="#7a7a7a">Fourth Coffee 온톨로지 — 명사 6개 · 화살표 7개</text></svg>

커피 체인 하나를 설명하는 데 명사 6개와 화살표 7개면 충분하다. 대기업이라고 수백 개가 되는 것도 아니다. 핵심 개념은 대개 스무 개 안쪽이다.

여기서 중요한 것은 그림 자체가 아니다. **이 그림을 그리려면 "고객이 뭐냐"를 팀이 합의해야 한다** 는 점이다. 가입만 한 사람도 고객인가, 결제해야 고객인가. 그 대화가 온톨로지의 진짜 값어치다.

## 5분만 써보기 (설치 필요 없음)

[Ontology Playground](https://microsoft.github.io/Ontology-Playground/) 는 브라우저에서 그냥 열린다. 설치도, 로그인도, 결제도 없다.

마이크로소프트가 MIT 라이선스로 공개한 오픈소스다. 오픈소스란 프로그램의 설계도(소스 코드)를 전부 공개했다는 뜻이고, MIT 라이선스는 그중에서도 가장 느슨한 조건이다. 회사에서 상업적으로 써도 되고, 고쳐서 우리 것으로 만들어도 되고, 허락을 따로 받을 필요도 없다.

순서대로 해보면 된다.

1. 위 링크를 연다
2. 상단에서 **Catalogue** 로 간다
3. **Fourth Coffee** (커피 체인 예제)를 클릭한다
4. 화면에 명사와 화살표가 그려진 그래프가 뜬다. 마우스로 끌어보고, 확대해보고, 동그라미 하나를 클릭한다
5. 오른쪽에 그 명사가 가진 정보들(이름, 이메일 같은 것)이 나온다

여기까지가 3분이다. 이 화면을 본 순간 "아, 이게 온톨로지구나"가 끝난다. 글로 열 번 읽는 것보다 빠르다.

다음으로 직접 그려보려면 **Designer** 로 간다. 리테일·헬스케어·금융·IoT·교육 다섯 개 템플릿이 있어서 빈 화면부터 시작하지 않아도 된다. 명사를 추가하고 화살표를 잇는 것이 전부이고, 실행취소가 50단계까지 된다.

도구에는 학습 코스도 9개 들어 있다. 기초 6강부터 15개 명사짜리 온톨로지를 처음부터 쌓아보는 7단계 실습까지 있다. 한국어는 아니지만 그림 위주라 따라갈 만하다.

## 알아야 할 단어는 다섯 개뿐이다

기술 문서를 열면 낯선 용어가 쏟아진다. 실제로 알아야 할 것은 이 정도다. 엑셀에 비유하면 대부분 이해된다.

| 용어     | 쉬운 말로                     | 커피 체인 예시             |
| ------ | ------------------------- | -------------------- |
| 엔티티 타입 | 중요한 명사. 엑셀로 치면 **시트 이름**  | 고객, 주문, 상품           |
| 속성     | 그 명사가 가진 정보. 엑셀의 **열 제목** | 고객의 이름, 이메일          |
| 관계     | 명사들을 잇는 화살표               | 고객이 주문을 한다           |
| 카디널리티  | 개수 규칙. "몇 대 몇으로 이어지나"     | 고객 한 명이 주문은 여러 건     |
| RDF    | 이 그림을 저장하는 파일 형식          | 문서가.docx이듯 온톨로지는.rdf |

이 다섯 개면 도구를 쓰는 데 부족하지 않다. OWL이니 트리플이니 SPARQL이니 하는 말은 전문가들이 쓰는 용어이고, 나중에 필요해지면 그때 배워도 늦지 않다.

### 뒷부분에 나오는 IT 용어들

이 글 후반부에 몇 개 더 나오는데, 미리 풀어두면 이렇다.

| 용어      | 쉬운 말로                                                            |
| ------- | ---------------------------------------------------------------- |
| 플랫폼     | 여러 프로그램이 올라가 돌아가는 바탕. 건물로 치면 부지와 기반 시설                           |
| 저장소(레포) | 회사의 파일과 코드를 버전별로 보관하는 창고. 구글 드라이브의 개발자판                          |
| 빌드      | 사람이 쓴 코드를 실제로 돌아가는 프로그램으로 조립하는 과정. "빌드가 깨진다"는 조립이 실패해 배포가 멈춘다는 뜻 |
| 슬러그     | 주소창에 들어가는 짧은 식별자. `theaxlabs.com/blog/ax-ops` 에서 뒤쪽 `ax-ops` 부분  |
| 테넌트     | 클라우드 서비스에서 우리 회사 몫으로 떼어둔 공간. 설정을 바꾸려면 회사 관리자 권한이 필요              |

용어가 낯설다고 도구를 못 쓰는 것은 아니다. 앞의 다섯 개만 알면 화면에서 하는 일은 다 이해된다.

## 오해 하나: 이 도구는 우리 데이터에 연결되지 않는다

가장 중요한 부분이라 굵게 적는다. **Ontology Playground는 어떤 데이터에도 연결되지 않는다.** 그림을 그리고 파일로 저장하는 것까지가 전부다. 우리 회사 매출이 여기 뜨는 일은 없다.

"온톨로지에 실제 데이터를 물린다"는 이야기는 이 도구가 아니라 **Microsoft Fabric IQ** 의 기능이다. Fabric은 마이크로소프트가 파는 데이터 플랫폼으로, 회사 데이터를 한곳에 모아두고 분석하는 유료 서비스다. 공식 문서 기준으로 필요한 것이 이렇다.

| 필요한 것                    | 쉬운 말로                                                |
| ------------------------ | ---------------------------------------------------- |
| 데이터가 **OneLake** 에 있을 것  | OneLake는 Fabric의 데이터 창고. 우리 데이터를 거기로 옮겨놓아야 함         |
| **테넌트** 설정에서 Graph 기능 켜기 | 우리 회사 몫의 클라우드 공간에서 관계도 기능을 켜는 것. 회사 관리자만 가능          |
| **Preview** 단계라는 점       | 정식 출시 전 시험 버전. 사양이 바뀌거나 중단될 수 있음                     |
| 데이터 바뀌면 **수동 새로고침**      | 원본 데이터가 바뀌어도 자동 반영이 아님. 사람이 갱신 버튼을 눌러야 함(문서가 두 번 경고) |

정리하면 이렇다.

> 온톨로지를 그리는 데는 15분이 들고, 데이터에 연결하는 데는 별도의 프로젝트가 든다. 이 둘을 같은 일처럼 소개하는 글은 걸러 듣는 편이 낫다.

그러면 Fabric이 없는 회사에는 쓸모가 없나. 그렇지 않다. 값이 나오는 자리가 다를 뿐이다.

## 우리 회사에 쓴다면: 난이도 순서로 세 단계

<svg viewBox="0 0 400 342" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="적용 3단계와 별도 프로젝트 구분" style="width:100%;max-width:430px;display:block;margin:0 auto;"><line x1="40" y1="31" x2="40" y2="183" stroke="#e0e0e0" stroke-width="1.5"></line><rect x="14" y="0" width="372" height="62" rx="10" fill="#ffffff" stroke="#e0e0e0"></rect><circle cx="40" cy="31" r="13" fill="#1d1d1f"></circle><text x="40" y="34.5" text-anchor="middle" font-family="-apple-system,system-ui,sans-serif" font-size="10.5" font-weight="700" fill="#ffffff">1</text> <text x="66" y="27" font-family="-apple-system,system-ui,sans-serif" font-size="13.5" font-weight="600" fill="#1d1d1f">용어 합의하기</text> <text x="66" y="46" font-family="-apple-system,system-ui,sans-serif" font-size="10.5" fill="#7a7a7a">누구나 · 준비물 없음</text> <rect x="14" y="76" width="372" height="62" rx="10" fill="#ffffff" stroke="#e0e0e0"></rect><circle cx="40" cy="107" r="13" fill="#1d1d1f"></circle><text x="40" y="110.5" text-anchor="middle" font-family="-apple-system,system-ui,sans-serif" font-size="10.5" font-weight="700" fill="#ffffff">2</text> <text x="66" y="103" font-family="-apple-system,system-ui,sans-serif" font-size="13.5" font-weight="600" fill="#1d1d1f">파일로 점검하기</text> <text x="66" y="122" font-family="-apple-system,system-ui,sans-serif" font-size="10.5" fill="#7a7a7a">약간의 기술 · 준비물 없음</text> <rect x="14" y="152" width="372" height="62" rx="10" fill="#ffffff" stroke="#e0e0e0"></rect><circle cx="40" cy="183" r="13" fill="#1d1d1f"></circle><text x="40" y="186.5" text-anchor="middle" font-family="-apple-system,system-ui,sans-serif" font-size="10.5" font-weight="700" fill="#ffffff">3</text> <text x="66" y="179" font-family="-apple-system,system-ui,sans-serif" font-size="13.5" font-weight="600" fill="#1d1d1f">코드가 온톨로지를 따라오게</text> <text x="66" y="198" font-family="-apple-system,system-ui,sans-serif" font-size="10.5" fill="#7a7a7a">개발자용 · 준비물 없음</text> <line x1="14" y1="234" x2="386" y2="234" stroke="#a1a1a6" stroke-width="1" stroke-dasharray="5 5"></line><text x="200" y="250" text-anchor="middle" font-family="-apple-system,system-ui,sans-serif" font-size="10.5" fill="#7a7a7a">— 여기부터는 성격이 다른 일 —</text> <rect x="14" y="262" width="372" height="62" rx="10" fill="#f5f5f7" stroke="#a1a1a6" stroke-dasharray="5 4"></rect><text x="34" y="289" font-family="-apple-system,system-ui,sans-serif" font-size="13.5" font-weight="600" fill="#333333">Fabric IQ에 실제 데이터 연결</text> <text x="34" y="308" font-family="-apple-system,system-ui,sans-serif" font-size="10.5" fill="#7a7a7a">별도 프로젝트 · 유료 플랫폼 · OneLake 전제</text></svg>

### 1단계. 용어 합의하기 \[누구나 · 준비물 없음\]

가장 값어치가 큰데 가장 기술이 덜 든다. 회의실에서 화면 띄워놓고 우리 회사 명사를 그려보는 것이다.

AX LABS를 예로 들면 이미 재료가 있다. 고객 사례에는 고객사, 산업, 참여 유형이 붙어 있고 산업은 여섯 가지(제조·금융·에너지·건설·공공·기타), 참여 유형은 다섯 가지(임원 교육·팀 리터러시·해커톤·에이전트 구축·컨설팅)로 정해져 있다. 블로그에는 다섯 개 카테고리가 있다.

이걸 그려놓고 보면 질문이 생긴다. 임원 교육과 팀 리터러시의 경계는 어디인가. 해커톤은 참여 유형인가 진행 형식인가. 컨설팅과 워크숍을 왜 한 칸에 묶었나.

**이 질문들이 나오는 것이 목적이다.** 파일은 부산물이다.

### 2단계. 파일로 점검하기 \[약간의 기술 · 준비물 없음\]

1단계에서 나온 RDF 파일을 에이전트에게 주고, 우리 데이터가 그 합의를 지키고 있는지 검사시키는 단계다. 정해두지 않은 산업 값이 슬쩍 들어가 있거나, 필수로 적기로 한 항목이 비어 있는 곳을 찾아준다. 엑셀로 치면 사람이 눈으로 훑던 오탈자·누락 점검을 자동으로 돌리는 셈이다.

Fabric도 데이터 창고도 필요 없다. RDF는 마이크로소프트 전용 형식이 아니라 누구나 쓰는 공개 표준이라, 그냥 파일 하나로 충분하다.

### 3단계. 코드가 온톨로지를 따라오게 하기 \[개발자용 · 준비물 없음\]

방향을 뒤집는 단계다. 지금은 사람이 합의한 내용과 프로그램 안에 적힌 분류 목록이 따로 논다. 한쪽을 고치고 다른 쪽을 깜빡하면 그때부터 어긋난다.

그래서 RDF 파일을 원본으로 삼고, 프로그램 안의 분류 목록은 거기서 자동으로 만들어내게 한다. 이러면 둘이 어긋날 수가 없다. 어긋나는 순간 조립(빌드)이 실패해서 배포가 멈추기 때문이다. 사람의 기억력 대신 기계가 감시하게 만드는 것이다.

Fabric이 하는 '데이터 연결'을 우리 규모에 필요한 만큼만 흉내 내는 셈이다. 데이터 한 줄 한 줄이 아니라 분류 목록 수준의 연결이고, 사례가 열두 개인 조직에 필요한 건 정확히 이 정도다.

### 그래서 지금 우리는

솔직히 말하면 3단계까지 갈 필요도 없는 조직이 많다. 1단계만 해도 대부분의 값이 나온다.

Fabric 같은 본격적인 연결을 검토할 시점은 세 조건이 겹칠 때다. 데이터가 여러 시스템에 흩어져 있고, 에이전트 여럿이 같은 데이터를 건드리며, **이미 데이터 플랫폼을 쓰고 있을 때** 다. 셋째가 없는데 온톨로지 때문에 플랫폼을 도입한다면 순서가 뒤집힌 것이다.

## 그대로 복사해 쓰는 프롬프트

프롬프트란 AI에게 시키는 말을 적어둔 것이다. 아래를 그대로 복사해 붙여넣으면 된다. Claude Code 기준으로 썼지만 다른 도구도 같다.

프롬프트 안에 `content/cases/*.json` 같은 것이 나오는데, 이는 파일이 놓인 위치를 가리키는 주소다. `*` 는 "그 폴더 안의 해당 파일 전부"라는 뜻이다. 우리 회사 파일 구조에 맞게 이 주소만 바꿔 쓰면 된다.

### 프롬프트 1 — 우리 데이터에서 초안 뽑기 \[1단계용\]

백지에서 시작하지 않는 것이 요령이다. 우리는 이미 암묵적으로 온톨로지를 갖고 있고, 그게 데이터 구조에 남아 있다.

```
우리 저장소의 실제 데이터에서 온톨로지 초안을 역설계해줘.

대상: content/cases/*.json, api/_lib/industries.js, api/_lib/categories.js

작업:
1. 위 파일을 읽고 실제로 존재하는 명사(엔티티)를 뽑아라.
2. 각 명사의 속성은 실제 필드에서만 가져와라. 없는 필드를 지어내지 마라.
3. 명사 사이의 관계와 개수 규칙을 정리해라.
   (예: 고객사 1개에 프로젝트 여러 개)
4. 지금 용어가 흔들리는 지점을 목록으로 알려줘.
   같은 것을 다르게 부르는 곳, 분류가 겹치거나 비어 있는 곳.
5. 결과를 표로 출력해라. 그대로 Designer에 옮겨 그릴 수 있게.

근거 없는 명사는 넣지 마라. 파일에 없으면 "근거 없음"이라고 표시해라.
```

**4번만 먼저 읽어도 된다.** 이 프롬프트의 진짜 목적이 거기 있다.

### 프롬프트 2 — 우리 데이터가 합의를 지키는지 검사 \[2단계용\]

```
온톨로지 RDF 파일(경로: <파일>)을 읽고, 우리 데이터가 이 정의를
지키고 있는지 점검해줘.

1. RDF 파일을 열어 명사·속성·관계 목록을 뽑아라.
2. api/_lib/industries.js, categories.js의 값과 대조해
   양쪽에 서로 없는 항목을 찾아라.
3. content/cases/*.json 전체를 검사해 위반을 찾아라.
   (정의에 없는 산업 값, 필수 항목 누락 등)
4. 결과를 파일명과 줄 번호로 알려주고, 고치는 것은 제안만 해라.
   내가 승인하기 전에 파일을 수정하지 마라.
```

### 프롬프트 3 — 코드를 온톨로지에서 생성 \[3단계용, 개발자\]

```
온톨로지 RDF(경로: <파일>)를 원본으로 삼아 분류 상수를 생성하는
스크립트를 만들어줘.

1. scripts/generate-taxonomy.mjs 작성:
   RDF 파일을 읽어 industries.js, categories.js를 생성.
   파일 상단에 "자동 생성됨. 직접 수정 금지"와 원본 경로를 남길 것.
2. npm run gen:taxonomy 스크립트를 추가하고 build 앞에 걸어라.
3. 생성 결과가 기존 파일과 다르면 차이를 보여주고 멈춰라.
   확인 전에 덮어쓰지 마라.
4. 이 상수를 가져다 쓰는 곳을 모두 찾아 깨지는 데가 없는지 보고해라.

주의: 기존 슬러그(영문 식별자)는 절대 바꾸지 마라.
이미 공개 URL과 저장된 데이터에 쓰이고 있어서 링크가 깨진다.
```

마지막 주의 문구가 중요하다. 정리한다고 식별자를 바꾸면 기존 링크가 전부 죽는다. 한글 라벨은 바꿔도 되고 영문 식별자는 못 바꾼다.

## 개발자용: 직접 띄우고 배포하기

여기부터는 사내에 우리 회사 전용 버전을 올리거나 소스를 뜯어볼 때만 필요하다. 그냥 써보려면 앞의 링크로 충분하니 건너뛰어도 된다.

먼저 Node.js 18 이상, npm 9 이상이 깔려 있어야 한다. Node.js는 자바스크립트 프로그램을 컴퓨터에서 돌리는 실행기이고, npm은 거기 딸린 부품 설치 도구다.

```bash
git clone https://github.com/microsoft/Ontology-Playground
cd Ontology-Playground
npm install
npm run dev
# http://localhost:5173
```

네 줄이 하는 일은 이렇다. 첫 줄은 마이크로소프트 저장소에서 파일 전체를 내 컴퓨터로 복사해오고(클론), 둘째 줄은 그 폴더로 들어가고, 셋째 줄은 필요한 부품들을 내려받고, 넷째 줄은 프로그램을 켠다. 마지막 주소를 브라우저에 치면 내 컴퓨터에서 도는 화면이 뜬다.

사내 배포는 포크(원본을 건드리지 않고 내 계정으로 복사본을 뜨는 것)한 뒤 **Settings → Pages → Source** 를 **GitHub Actions** 로 바꾸고 `main` 에 푸시(변경 사항을 올리는 것)하면, 동봉된 자동화 설정이 알아서 웹사이트로 띄워준다. Azure 배포용 설정도 함께 들어 있다.

참고로 이 저장소에는 `.github/skills/` 와 `.github/prompts/` 폴더에 에이전트용 스킬과 프롬프트가 이미 들어 있다. 여기서 스킬이란 AI에게 특정 업무의 절차를 적어준 문서를 말한다. 고객사 RDF를 우리 형식으로 가져오는 절차 같은 것들이다. 남의 스킬을 설치하는 대신 우리 절차를 스킬로 만드는 이야기는 [지난 글](https://theaxlabs.com/blog/claude-code%EB%A5%BC-%ED%9A%8C%EC%82%AC%EB%A1%9C-%EB%A7%8C%EB%93%9C%EB%8A%94-%EC%8A%A4%ED%82%AC-42%EC%A2%85) 에서 다뤘는데, 마이크로소프트가 그 사례를 직접 보여주는 셈이다.

## 카파시의 LLM Wiki와는 뭐가 다른가

요즘 함께 언급되는 것이 [LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) 다. 안드레이 카파시가 2026년 4월에 공개한 방식으로, 그는 테슬라 AI 총괄과 OpenAI 창립 멤버를 거친 인물이라 그가 내놓는 방법론은 업계에서 빠르게 퍼진다.

둘 다 "지식을 정리한다"고 하니 비슷해 보이지만 방향이 정반대다. 비유하면 이렇다.

- **온톨로지는 사전이다.** 단어의 뜻과 관계를 미리 정해둔다. 사람이 만들고 기계가 읽는다.
- **LLM Wiki는 노트다.** 읽은 자료를 정리해 쌓는다. 기계가 쓰고 사람이 읽는다.
<svg viewBox="0 0 420 250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="온톨로지는 사람이 만들고 기계가 읽는다. LLM Wiki는 AI가 쓰고 사람이 읽는다." style="width:100%;max-width:430px;display:block;margin:0 auto;"><defs><marker id="arr2" viewBox="0 0 8 8" refX="7" refY="4" markerWidth="7" markerHeight="7" orient="auto"><path d="M0.5 0.5L7.5 4L0.5 7.5z" fill="#a1a1a6"></path></marker></defs><rect x="10" y="8" width="192" height="210" rx="12" fill="#ffffff" stroke="#e0e0e0"></rect><rect x="20" y="8" width="172" height="3.5" rx="1.75" fill="#0066cc"></rect><text x="106" y="38" text-anchor="middle" font-family="-apple-system,system-ui,sans-serif" font-size="14" font-weight="700" fill="#1d1d1f">온톨로지</text> <text x="106" y="55" text-anchor="middle" font-family="-apple-system,system-ui,sans-serif" font-size="10" fill="#7a7a7a">= 사전</text> <text x="106" y="86" text-anchor="middle" font-family="-apple-system,system-ui,sans-serif" font-size="12.5" font-weight="600" fill="#333333">사람이 합의해 만든다</text> <line x1="106" y1="96" x2="106" y2="116" stroke="#a1a1a6" stroke-width="1.4" marker-end="url(#arr2)"></line><rect x="46" y="122" width="120" height="34" rx="8" fill="#f5f5f7" stroke="#e0e0e0"></rect><text x="106" y="144" text-anchor="middle" font-family="-apple-system,system-ui,sans-serif" font-size="12.5" font-weight="600" fill="#1d1d1f">정의 파일</text> <line x1="106" y1="160" x2="106" y2="180" stroke="#a1a1a6" stroke-width="1.4" marker-end="url(#arr2)"></line><text x="106" y="200" text-anchor="middle" font-family="-apple-system,system-ui,sans-serif" font-size="12.5" font-weight="600" fill="#333333">기계가 읽고 지킨다</text> <rect x="218" y="8" width="192" height="210" rx="12" fill="#ffffff" stroke="#e0e0e0"></rect><rect x="228" y="8" width="172" height="3.5" rx="1.75" fill="#a1a1a6"></rect><text x="314" y="38" text-anchor="middle" font-family="-apple-system,system-ui,sans-serif" font-size="14" font-weight="700" fill="#1d1d1f">LLM Wiki</text> <text x="314" y="55" text-anchor="middle" font-family="-apple-system,system-ui,sans-serif" font-size="10" fill="#7a7a7a">= 노트</text> <text x="314" y="86" text-anchor="middle" font-family="-apple-system,system-ui,sans-serif" font-size="12.5" font-weight="600" fill="#333333">AI가 읽고 쓴다</text> <line x1="314" y1="96" x2="314" y2="116" stroke="#a1a1a6" stroke-width="1.4" marker-end="url(#arr2)"></line><rect x="254" y="122" width="120" height="34" rx="8" fill="#f5f5f7" stroke="#e0e0e0"></rect><text x="314" y="144" text-anchor="middle" font-family="-apple-system,system-ui,sans-serif" font-size="12.5" font-weight="600" fill="#1d1d1f">위키 페이지</text> <line x1="314" y1="160" x2="314" y2="180" stroke="#a1a1a6" stroke-width="1.4" marker-end="url(#arr2)"></line><text x="314" y="200" text-anchor="middle" font-family="-apple-system,system-ui,sans-serif" font-size="12.5" font-weight="600" fill="#333333">사람이 읽고 이해한다</text> <text x="210" y="242" text-anchor="middle" font-family="-apple-system,system-ui,sans-serif" font-size="11" fill="#7a7a7a">방향이 정반대다 — 정합성의 도구와 이해의 도구</text></svg>

카파시의 문제의식은 이랬다. 문서를 잔뜩 올려두고 질문하면 AI가 매번 처음부터 조각을 찾아 답한다. 쌓이는 게 없다. 그래서 그가 제안한 것은 AI가 자료를 읽을 때마다 **위키 페이지를 직접 쓰고 갱신하게 하는 방식** 이다. 자료 하나가 들어오면 요약을 쓰고, 관련된 다른 페이지들을 고치고, 기존 내용과 모순되면 그 지점을 표시한다. 자료 하나가 페이지 열몇 개를 건드린다.

핵심 차이를 정리하면 이렇다.

|         | 온톨로지 (Playground)         | LLM Wiki               |
| ------- | ------------------------- | ---------------------- |
| 다루는 것   | 칸이 정해진 데이터 (엑셀 표, 데이터베이스) | 형식이 제각각인 글 (기사·회의록·논문) |
| 만드는 결과물 | 명사와 관계의 정의 파일             | 서로 연결된 문서 페이지          |
| 누가 만드나  | 사람이 합의해서 정함               | AI가 쓰고 유지함             |
| 시점      | 데이터가 쌓이기 전에 미리            | 자료가 쌓이면서 나중에           |
| 답하는 질문  | "지난달 주문한 고객은?"            | "이 자료 다섯 개를 종합하면?"     |
| 잘못되면    | 정의가 현실과 달라 아무도 안 지킴       | 낡은 내용과 모순이 쌓임          |
| 유지 부담   | 사람이 진다                    | AI가 진다 (거의 0)          |

한 줄로 줄이면, **온톨로지는 정합성을 위한 것이고 위키는 이해를 위한 것이다.**

그래서 둘은 경쟁하지 않는다. 우리 회사에 대입하면 경계가 분명해진다.

- **온톨로지가 맡을 것**: 고객사 정보, 산업·참여 유형 분류, 문의 태깅. 여러 에이전트가 공유해야 하고 값이 흔들리면 안 되는 것들.
- **LLM Wiki가 맡을 것**: 강의 후기, 미팅 노트, 리서치 자료, 고객과 나눈 대화. 형식이 제각각이고 종합이 필요한 것들.

순서를 정하자면 위키가 먼저다. 온톨로지는 우리가 뭘 아는지 이미 알 때 그리는 것이고, 위키는 그걸 알아가는 과정이기 때문이다. 다만 에이전트를 여럿 굴리기 시작하면 온톨로지 없이는 그들이 서로 다른 말을 하기 시작한다.

## 이번 주에 해볼 만한 것

플랫폼 도입 검토는 여기 없다. 돈 안 드는 것만 남겼다.

1. [링크](https://microsoft.github.io/Ontology-Playground/) 를 열고 Catalogue에서 Fourth Coffee를 클릭해 그래프를 본다. **3분.**
2. Designer에서 우리 업종과 비슷한 템플릿을 열고 명사 두어 개를 바꿔본다. **10분.**
3. 프롬프트 1을 우리 저장소에 돌리고 **4번(용어가 흔들리는 지점)만 읽는다.**
4. 그 목록이 아프면 팀과 합의할 때가 된 것이고, 별것 없으면 아직 안 해도 되는 규모다.

도구를 들여놓는 것과 일하는 방식을 다시 설계하는 것은 다르다. 온톨로지는 도구가 아니라 합의이고, 합의는 회의에서 나오지 설치에서 나오지 않는다. 우리 조직의 용어를 에이전트가 지킬 수 있는 형태로 정리하는 일을 함께 하려면 [문의하기 →](https://theaxlabs.com/contact)

## 참고

- microsoft/Ontology-Playground (MIT, 2026): [https://github.com/microsoft/Ontology-Playground](https://github.com/microsoft/Ontology-Playground)
- 바로 써보기: [https://microsoft.github.io/Ontology-Playground/](https://microsoft.github.io/Ontology-Playground/)
- Microsoft Learn, "What Is Ontology (Preview)?": [https://learn.microsoft.com/en-us/fabric/iq/ontology/overview](https://learn.microsoft.com/en-us/fabric/iq/ontology/overview)
- Andrej Karpathy, "LLM Wiki" (2026-04): [https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)