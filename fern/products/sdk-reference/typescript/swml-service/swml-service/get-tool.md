---
slug: "/reference/typescript/swml-service/swml-service/get-tool"
title: "getTool"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SWMLService.SWMLService.getTool"
  parent: "SWMLService.SWMLService"
  module: "SWMLService"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts"
---
# `getTool`

Look up a registered SwaigFunction by name. Lifted from AgentBase so
`swaig-test --exec <name>` works against a non-AgentBase SWMLService
target.

## Signature

```typescript
getTool(name: string): SwaigFunction | undefined
```

## Parameters

| Name   | Type     | Required | Default | Description                  |
| ------ | -------- | -------- | ------- | ---------------------------- |
| `name` | `string` | yes      | —       | The tool name to search for. |

## Returns

`SwaigFunction | undefined` — The SwaigFunction instance, or undefined if not found or not a SwaigFunction.

## Source

[`src/SWMLService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts)

Line 581.
