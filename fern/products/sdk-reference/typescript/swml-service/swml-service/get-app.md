---
slug: "/reference/typescript/swml-service/swml-service/get-app"
title: "getApp"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SWMLService.SWMLService.getApp"
  parent: "SWMLService.SWMLService"
  module: "SWMLService"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts"
---
# `getApp`

Get the Hono application for mounting or testing.
This is the TypeScript equivalent of Python's `as_router()`, which returns
a FastAPI `APIRouter`. Both expose the underlying app/router so callers can
mount it into a larger framework. Use `asRouter()` when porting Python code
that calls `as_router()` directly.

## Signature

```typescript
getApp(): Hono
```

## Returns

`Hono` — The configured Hono app.

## Source

[`src/SWMLService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts)

Line 898.
