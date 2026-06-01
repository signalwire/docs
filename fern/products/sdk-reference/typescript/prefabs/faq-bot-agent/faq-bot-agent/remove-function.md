---
slug: "/reference/typescript/prefabs/faq-bot-agent/faq-bot-agent/remove-function"
title: "removeFunction"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.FAQBotAgent.FAQBotAgent.removeFunction"
  parent: "prefabs.FAQBotAgent.FAQBotAgent"
  module: "prefabs.FAQBotAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts"
---
# `removeFunction`

Remove a registered SWAIG function. Returns true when removed,
false when not found. (Python parity:
`ToolRegistry.remove_function`.)

## Signature

```typescript
removeFunction(name: string): boolean
```

## Parameters

| Name   | Type     | Required | Default | Description |
| ------ | -------- | -------- | ------- | ----------- |
| `name` | `string` | yes      | —       | —           |

## Returns

`boolean`

## Source

[`src/SWMLService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts)

Line 540.
