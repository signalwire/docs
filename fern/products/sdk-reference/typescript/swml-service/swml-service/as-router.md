---
slug: "/reference/typescript/swml-service/swml-service/as-router"
title: "asRouter"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SWMLService.SWMLService.asRouter"
  parent: "SWMLService.SWMLService"
  module: "SWMLService"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts"
---
# `asRouter`

Alias for `getApp()`. Provided for cross-SDK consistency with Python's
`as_router()` method — allows Python callers porting to TypeScript to use
the familiar name without changes.

## Signature

```typescript
asRouter(): Hono
```

## Returns

`Hono` — The configured Hono app.

## Source

[`src/SWMLService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts)

Line 908.
