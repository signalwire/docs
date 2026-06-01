---
slug: "/reference/typescript/prefabs/info-gatherer-agent/info-gatherer-agent/get-function"
title: "getFunction"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.InfoGathererAgent.InfoGathererAgent.getFunction"
  parent: "prefabs.InfoGathererAgent.InfoGathererAgent"
  module: "prefabs.InfoGathererAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts"
---
# `getFunction`

Get a registered SWAIG function entry, or undefined.
(Python parity: `ToolRegistry.get_function`.)

## Signature

```typescript
getFunction(name: string): Record<string, unknown> | SwaigFunction | undefined
```

## Parameters

| Name   | Type     | Required | Default | Description |
| ------ | -------- | -------- | ------- | ----------- |
| `name` | `string` | yes      | —       | —           |

## Returns

`Record<string, unknown> | SwaigFunction | undefined`

## Source

[`src/SWMLService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts)

Line 523.
