---
slug: "/reference/typescript/prefabs/info-gatherer-agent/info-gatherer-agent/register-verb-handler"
title: "registerVerbHandler"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.InfoGathererAgent.InfoGathererAgent.registerVerbHandler"
  parent: "prefabs.InfoGathererAgent.InfoGathererAgent"
  module: "prefabs.InfoGathererAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts"
---
# `registerVerbHandler`

Register a custom verb handler.
Mirrors Python's `register_verb_handler()`.

## Signature

```typescript
registerVerbHandler(handler: SWMLVerbHandler): void
```

## Parameters

| Name      | Type              | Required | Default | Description                   |
| --------- | ----------------- | -------- | ------- | ----------------------------- |
| `handler` | `SWMLVerbHandler` | yes      | —       | The verb handler to register. |

## Returns

`void`

## Source

[`src/SWMLService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts)

Line 726.
