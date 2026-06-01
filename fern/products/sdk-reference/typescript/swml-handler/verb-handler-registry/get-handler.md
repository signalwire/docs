---
slug: "/reference/typescript/swml-handler/verb-handler-registry/get-handler"
title: "getHandler"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SWMLHandler.VerbHandlerRegistry.getHandler"
  parent: "SWMLHandler.VerbHandlerRegistry"
  module: "SWMLHandler"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLHandler.ts"
---
# `getHandler`

Get the handler for a specific verb.

## Signature

```typescript
getHandler(verbName: string): SWMLVerbHandler | undefined
```

## Parameters

| Name       | Type     | Required | Default | Description                       |
| ---------- | -------- | -------- | ------- | --------------------------------- |
| `verbName` | `string` | yes      | —       | The name of the verb (e.g. "ai"). |

## Returns

`SWMLVerbHandler | undefined` — The handler if found, or `undefined` otherwise.

## Source

[`src/SWMLHandler.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLHandler.ts)

Line 286.
