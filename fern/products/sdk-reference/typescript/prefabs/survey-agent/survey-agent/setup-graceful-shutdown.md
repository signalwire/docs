---
slug: "/reference/typescript/prefabs/survey-agent/survey-agent/setup-graceful-shutdown"
title: "setupGracefulShutdown"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.SurveyAgent.SurveyAgent.setupGracefulShutdown"
  parent: "prefabs.SurveyAgent.SurveyAgent"
  module: "prefabs.SurveyAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `setupGracefulShutdown`

Register process signal handlers for clean Kubernetes/Docker shutdown.
Handles SIGTERM and SIGINT, waits for a timeout, then exits.

**Modifiers:** `static`

## Signature

```typescript
setupGracefulShutdown(opts?: { ...1 fields }): void
```

## Parameters

| Name           | Type                   | Required | Default | Description                                      |
| -------------- | ---------------------- | -------- | ------- | ------------------------------------------------ |
| `opts`         | `{ timeout?: number }` | no       | —       | Optional timeout in milliseconds (default 5000). |
| `opts.timeout` | `number`               | no       | —       | —                                                |

## Returns

`void`

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 2732.
