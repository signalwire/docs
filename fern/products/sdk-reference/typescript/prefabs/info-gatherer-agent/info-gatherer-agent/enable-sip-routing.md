---
slug: "/reference/typescript/prefabs/info-gatherer-agent/info-gatherer-agent/enable-sip-routing"
title: "enableSipRouting"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.InfoGathererAgent.InfoGathererAgent.enableSipRouting"
  parent: "prefabs.InfoGathererAgent.InfoGathererAgent"
  module: "prefabs.InfoGathererAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `enableSipRouting`

Enable SIP routing for this agent.

## Signature

```typescript
enableSipRouting(autoMap: boolean = true, path: string = '/sip'): this
```

## Parameters

| Name      | Type      | Required | Default  | Description                                                                       |
| --------- | --------- | -------- | -------- | --------------------------------------------------------------------------------- |
| `autoMap` | `boolean` | yes      | `true`   | When true, automatically map SIP usernames to the agent route (defaults to true). |
| `path`    | `string`  | yes      | `'/sip'` | HTTP path for the SIP routing endpoint (defaults to '/sip').                      |

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1024.
