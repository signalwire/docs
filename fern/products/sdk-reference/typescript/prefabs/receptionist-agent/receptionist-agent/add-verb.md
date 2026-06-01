---
slug: "/reference/typescript/prefabs/receptionist-agent/receptionist-agent/add-verb"
title: "addVerb"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ReceptionistAgent.ReceptionistAgent.addVerb"
  parent: "prefabs.ReceptionistAgent.ReceptionistAgent"
  module: "prefabs.ReceptionistAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts"
---
# `addVerb`

Add a verb to the SWML document.

## Signature

```typescript
addVerb(name: string, config: unknown): this
```

## Parameters

| Name     | Type      | Required | Default | Description                                   |
| -------- | --------- | -------- | ------- | --------------------------------------------- |
| `name`   | `string`  | yes      | —       | Verb name (e.g., 'answer', 'play', 'hangup'). |
| `config` | `unknown` | yes      | —       | Verb configuration.                           |

## Returns

`this` — This service for chaining.

## Source

[`src/SWMLService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts)

Line 642.
