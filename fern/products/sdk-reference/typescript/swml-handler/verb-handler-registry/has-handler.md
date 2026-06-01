---
slug: "/reference/typescript/swml-handler/verb-handler-registry/has-handler"
title: "hasHandler"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SWMLHandler.VerbHandlerRegistry.hasHandler"
  parent: "SWMLHandler.VerbHandlerRegistry"
  module: "SWMLHandler"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLHandler.ts"
---
# `hasHandler`

Check if a handler exists for a specific verb.

## Signature

```typescript
hasHandler(verbName: string): boolean
```

## Parameters

| Name       | Type     | Required | Default | Description           |
| ---------- | -------- | -------- | ------- | --------------------- |
| `verbName` | `string` | yes      | —       | The name of the verb. |

## Returns

`boolean` — `true` if a handler is registered for the verb, `false` otherwise.

## Source

[`src/SWMLHandler.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLHandler.ts)

Line 295.
