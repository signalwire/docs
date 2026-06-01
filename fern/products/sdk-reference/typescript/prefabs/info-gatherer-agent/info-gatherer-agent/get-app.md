---
slug: "/reference/typescript/prefabs/info-gatherer-agent/info-gatherer-agent/get-app"
title: "getApp"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.InfoGathererAgent.InfoGathererAgent.getApp"
  parent: "prefabs.InfoGathererAgent.InfoGathererAgent"
  module: "prefabs.InfoGathererAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `getApp`

Get or lazily create the Hono HTTP application with all routes, middleware, auth, and CORS.

## Signature

```typescript
getApp(): Hono
```

## Returns

`Hono` — The configured Hono application instance.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 2250.
