---
slug: "/reference/typescript/swml-service/swml-service/register-routing-callback"
title: "registerRoutingCallback"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SWMLService.SWMLService.registerRoutingCallback"
  parent: "SWMLService.SWMLService"
  module: "SWMLService"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts"
---
# `registerRoutingCallback`

Register a routing callback at a given path.
When a POST request arrives at `path`, the callback is invoked with the
parsed request body. If it returns a string, the response is a 307 redirect
to that route; if it returns null, normal SWML serving continues.
Mirrors Python's `register_routing_callback()`.

## Signature

```typescript
registerRoutingCallback(
  callbackFn: RoutingCallback,
  path: string = '/sip'
): void
```

## Parameters

| Name         | Type              | Required | Default  | Description                                                        |
| ------------ | ----------------- | -------- | -------- | ------------------------------------------------------------------ |
| `callbackFn` | `RoutingCallback` | yes      | —        | Callback receiving the request body and returning a route or null. |
| `path`       | `string`          | yes      | `'/sip'` | HTTP path for the callback (default '/sip').                       |

## Returns

`void`

## Source

[`src/SWMLService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts)

Line 742.
