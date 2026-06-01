---
slug: "/reference/typescript/swml-handler/verb-handler-registry/register-handler"
title: "registerHandler"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SWMLHandler.VerbHandlerRegistry.registerHandler"
  parent: "SWMLHandler.VerbHandlerRegistry"
  module: "SWMLHandler"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLHandler.ts"
---
# `registerHandler`

Register a new verb handler, replacing any existing handler for the same verb name.

## Signature

```typescript
registerHandler(handler: SWMLVerbHandler): void
```

## Parameters

| Name      | Type              | Required | Default | Description              |
| --------- | ----------------- | -------- | ------- | ------------------------ |
| `handler` | `SWMLVerbHandler` | yes      | —       | The handler to register. |

## Returns

`void`

## Source

[`src/SWMLHandler.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLHandler.ts)

Line 276.
