---
slug: "/reference/typescript/swml-service/on-request-callback"
title: "OnRequestCallback"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "type_alias"
  language: "typescript"
  qualified_name: "SWMLService.OnRequestCallback"
  parent: "SWMLService"
  module: "SWMLService"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts"
---
# `OnRequestCallback`

Callback invoked per-request to dynamically build SWML.

## Signature

```typescript
type OnRequestCallback = (queryParams: Record<string, string>, bodyParams: Record<string, unknown>, headers: Record<string, string>) => SwmlBuilder | Promise<SwmlBuilder>
```

## Source

[`src/SWMLService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts)

Line 140.
