---
title: "The system for product development"
source: "https://linear.app/"
author:
published:
created: 2026-08-01
description: "Purpose-built for planning and building products with AI agents."
tags:
  - "clippings"
---
## The product development system for teams and agents

Purpose-built for planning and building products. Designed for the AI era.

[

NewCoding Sessions →

](https://linear.app/coding-sessions)[

NewCoding Sessions →

](https://linear.app/coding-sessions)

![](https://linear.app/cdn-cgi/imagedelivery/fO02fVwohEs9s9UHFwon6A/6600ca96-e49b-4fd9-c03a-7979faddad00/f=auto,dpr=2,fit=scale-down,metadata=none) ![](https://linear.app/cdn-cgi/imagedelivery/fO02fVwohEs9s9UHFwon6A/c7fa8f5f-d439-4329-6a65-de549b51e300/f=auto,dpr=2,fit=scale-down,metadata=none)

### Faster app launch

Render UI before `vehicle_state` sync when minimum required state is present, instead of blocking on full refresh during iOS startup.

#### Activity

Linear created the issue via Slack on behalf of karri · 2min ago

Triage Intelligence added the label Performance and iOS · 2min ago

karri· 4 min ago

Right now we show a spinner forever, which makes it look like the car disappeared...

jori· just now

**@Linear** can you take a stab at this?

Linear

connected by jori·2 min ago

Changed 2 filesDraft PR awaiting your review·2 min ago

Linear moved from Todo to In Progress · just now

joriconnected Linear to ENG-2703

Examining the startup path...Thinking...

## A new species of product tool. Purpose-built for modern teams with AI workflows at its core, Linear sets a new standard for planning and building products.

Purpose-built

Linear is shaped by the practices and principles of world-class product teams.

Powered by agents

Designed for workflows shared by humans and agents. From drafting PRDs to pushing PRs.

Designed for speed

Reduces noise and restores momentum to help teams ship with high velocity and focus.

FIG 0.2 Purpose-built

Linear is shaped by the practices and principles of world-class product teams.

FIG 0.3

Powered by agents

Designed for workflows shared by humans and agents. From drafting PRDs to pushing PRs.

FIG 0.4 Designed for speed

Reduces noise and restores momentum to help teams ship with high velocity and focus.

## Make product operations self-driving

Turn conversations and customer feedback into actionable issues that are routed, labeled, and prioritized for the right team.[1.0Intake→](https://linear.app/intake)

Backlog8

ENG-2085

Reduce UI flicker during autonomy...

ENG-2094

Add buffering for autonomy event streams

ENG-2092

Reduce startup delay caused by vehicle sync

ENG-2200

Fix delayed route updates during rerouting

Todo71

ENG-926

Remove UI inconsistencies

BugDesign

ENG-2088

TypeError: Cannot read properties

Bug

ENG-924

Upgrade to Claude Opus 4.8

AI

ENG-1882

Optimize load times

Performance

In Progress3

ENG-1487

Remove contentData from GraphQL API

61039

MKT-1028

Launch page assets

Design

ENG-2187

Prevent duplicate ride requests on poor...

Bug62048

Done53

ENG-2074

Clean up deprecated APIs...

API61002

ENG-1912

Reduce latency in autonomy st...

61005

ENG-1951

Reduce ETA fluctuations durin...

61202

ENG-1960

Improve fallback messaging

UI61149

ENG-1991

Improve rider visibility into veh...

lena

Anyone else noticing the iOS app feels slow to open if you haven't used it in a bit?

didier

Yea, we're still blocking initial render on a full vehicle\_state sync every time...

andreas

Feels like we could render sooner and load the rest in the background. Probably also worth tracking startup timing so we know how often this happens!

@Linearcreate issues urgent issues and assign to me

## Define the product direction

Plan and navigate from idea to launch. Align your team with product initiatives, strategic roadmaps, and clear, up-to-date PRDs.[2.0Plan→](https://linear.app/plan)

![](https://linear.app/cdn-cgi/imagedelivery/fO02fVwohEs9s9UHFwon6A/7d7115d9-a0eb-4a92-5900-3ca3ee077d00/f=auto,dpr=2,fit=scale-down,metadata=none)

FEB

MAR

APR

MAY

JUN

JUL

AUG

SEP

2

9

16

23

2

9

16

23

30

6

13

20

27

4

11

18

25

1

8

15

22

29

6

13

20

27

3

10

17

24

31

7

14

21

28

Split fares

Internal

Public Beta

Autonomy status clarity

Alpha

GA

Infra stability28

Autonomous systems16

Mobile apps8

Japan Launch12

Customer-driven priorities9

## Move work forward across teams and agents

Build and deploy AI agents that work alongside your team. Work on complex tasks together or delegate entire issues end-to-end.[3.0Build→](https://linear.app/build)

![](https://linear.app/cdn-cgi/imagedelivery/fO02fVwohEs9s9UHFwon6A/584d7dbd-ff4a-41bb-4fab-74fd5217a400/f=auto,dpr=2,fit=scale-down,metadata=none)

On it! I've received your request.

Kicked off a task in kinetic/kinetic-iOS environment.

Searching for root AGENTS file

kinetic/kinetic-iOS$ /bin/bash -lc rg --files -g 'AGENTS.md'  
AGENTS.md

Locating initialization logic for vehicle\_state

Thinking...

## Review PRs and agent output

Understand code changes at a glance with structural diffs for human and agent output. Review, discuss, and merge — all within Linear.[4.0Diffs→](https://linear.app/diffs)

![](https://linear.app/cdn-cgi/imagedelivery/fO02fVwohEs9s9UHFwon6A/c16152f3-a36c-468e-89ae-f87c2f244d00/f=auto,dpr=2,fit=scale-down,metadata=none)

```js
import React from 'react'
import { View, ActivityIndicator } from 'react-native'
import { useVehicleState } from '@hooks/useVehicleState'
import { Dashboard } from '@components/Dashboard'

export const HomeScreen = () => {
  const { vehicleState, isFullySynced } = useVehicleState()

  if (!isFullySynced) {
    return <ActivityIndicator size="large" />
  }

  return (
    <View>
      <Dashboard state={vehicleState} />
    </View>
  )
}
```

```js
import React from 'react'
import { View, ActivityIndicator } from 'react-native'
import { useVehicleState, SyncStatus } from '@hooks/useVehicleState'
import { Dashboard } from '@components/Dashboard'

export const HomeScreen = () => {
  const { vehicleState, syncStatus } = useVehicleState()

  if (syncStatus === SyncStatus.PENDING) {
    return <ActivityIndicator size="large" />
  }

  return (
    <View>
      <Dashboard state={vehicleState} syncStatus={syncStatus} />
    </View>
  )
}
import React from 'react'
import { View, ActivityIndicator } from 'react-native'
import { useVehicleState, SyncStatus } from '@hooks/useVehicleState'
import { Dashboard } from '@components/Dashboard'

export const HomeScreen = () => {
  const { vehicleState, syncStatus } = useVehicleState()

  if (syncStatus === SyncStatus.PENDING) {
    return <ActivityIndicator size="large" />
  }

  return (
    <View>
      <Dashboard state={vehicleState} syncStatus={syncStatus} />
    </View>
  )
}
```

```js
export const CodeReview = () => {
  <Diff.Provider>
    <Slow />
    <Fragmented />
    <HumanOnly />
    <Frictionless />
    <Integrated />
    <AgentReady />
  </Diff.Provider>
};
```

## Understand progress at scale

Take the guesswork out of product development with project updates, analytics, and dashboards that surface what needs your attention.[5.0Monitor→](https://linear.app/monitor)

![](https://linear.app/cdn-cgi/imagedelivery/fO02fVwohEs9s9UHFwon6A/33ec1482-c0b8-402e-d67e-c4902a71ee00/f=auto,dpr=2,fit=scale-down,metadata=none)

18

16

14

12

10

8

6

4

2

0

Feb 2025May 2025Aug 2025Nov 2025

Cursor

Codex

No Agent

Projects

At risk

By romain · 1 day ago

- iOS implementation is mostly complete, but Android updates are still work in progress
- Risk of timeline slip if remaining design decisions aren’t finalized soon

On track

By julian · 3 hours ago

- Localization efforts have been completed
- Everything else on track for launch in early September

## Changelog[Coding sessions on mobileYour coding session doesn’t have to stop when you leave your desk. Use the Linear mobile app to review code changes, comment on specific lines, and iterate with Linear Agent.Jul 30, 2026](https://linear.app/changelog/2026-07-30-coding-sessions-on-mobile)[Agent-assisted text editingDocuments and project descriptions are critical context for your teams and agents.Jul 22, 2026](https://linear.app/changelog/2026-07-23-agent-assisted-editing)[LoopsLoops are a new way for Linear Agent to take on recurring work for your team.Jul 16, 2026](https://linear.app/changelog/2026-07-20-introducing-loops)[Initiative propertiesInitiatives define your company's high-level goals and organize the projects that contribute to them. To help you manage initiatives as your roadmap grows, we've added a new set of focused initiative properties:Jun 30, 2026](https://linear.app/changelog/2026-07-02-initiative-properties)[View all→](https://linear.app/changelog)> [You’ll probably build a better product, just because of the craft that using Linear infuses on your brain.](https://linear.app/customers/openai)

[Gabriel PealOpenAI](https://linear.app/customers/openai)

[

> Our speed is intense and Linear helps us be action biased.

Nik KoblovRamp

](https://linear.app/customers/ramp)[

> Linear is excellent, just excellent. It has the right opinions for fast moving teams.

Kaz NejatianOpendoor

](https://linear.app/customers/opendoor)[You’ll probably build a better product, just because of the craft that using Linear infuses on your brain.](https://linear.app/customers/openai)

[Gabriel PealStaff Software Engineer, OpenAI](https://linear.app/customers/openai)

[

Our speed is intense and Linear helps us be action biased.

Nik KoblovHead of Engineering, Ramp

](https://linear.app/customers/ramp)