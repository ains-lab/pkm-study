---
title: Orca
created: 2026-07-16
updated: 2026-07-16
type: entity
tags: [tool, open-source, agent, orchestration]
sources:
  - "raw/web/stablyaiorca Orca is the ADE for working with a fleet of parallel agents. Run any coding agent with your own subscription. Available on desktop and mobile..md"
  - "raw/youtube/📺 Orca Is the Free Cursor Killer Nobody's Talking About!.md"
confidence: medium
---

# Orca

Orca는 여러 코딩 에이전트를 각자의 Git worktree에서 병렬로 실행하고 결과를 비교·검토하는 오픈소스 에이전트 개발 환경(ADE)이다.

## 주요 기능

- Codex, Claude Code 등 CLI 에이전트를 독립 worktree에서 실행한다.
- 데스크톱과 모바일에서 작업 상태를 확인하고 후속 지시를 보낸다.
- 내장 터미널, 브라우저 디자인 모드, GitHub·Linear 연동을 제공한다.
- 차이 주석과 worktree 단위 격리로 에이전트 결과 검토를 돕는다.

## 지식 시스템에서의 위치

Orca는 [[llm-wiki]]의 지식 저장 계층이 아니라, 그 지식을 사용하는 여러 에이전트의 실행·조정 계층이다. [[agentic-workspace]]에서는 자료 조사, 문서 갱신, 검증 같은 작업을 분리해 병렬 처리할 수 있지만, 최종 병합과 출처 검토 책임은 남는다.

## 한계와 검증 필요

현재 문서의 기능·지원 플랫폼 주장은 프로젝트 README와 소개 영상에 크게 의존한다. 빠르게 변하는 제품이므로 실제 도입 전 최신 릴리스, 운영체제 지원, 보안·원격 실행 모델을 별도로 확인해야 한다.

## 관련 문서

- [[slides-grab]]
- [[ai-knowledge-workflow]]
