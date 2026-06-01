---
slug: "/reference/typescript/prefabs/info-gatherer-agent/info-gatherer-agent/manual-set-proxy-url"
title: "manualSetProxyUrl"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.InfoGathererAgent.InfoGathererAgent.manualSetProxyUrl"
  parent: "prefabs.InfoGathererAgent.InfoGathererAgent"
  module: "prefabs.InfoGathererAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `manualSetProxyUrl`

Manually set the proxy base URL used for webhook URL generation.

## Signature

```typescript
manualSetProxyUrl(url: string): this
```

## Parameters

| Name  | Type     | Required | Default | Description                                                   |
| ----- | -------- | -------- | ------- | ------------------------------------------------------------- |
| `url` | `string` | yes      | —       | The external-facing base URL (trailing slashes are stripped). |

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1735.
