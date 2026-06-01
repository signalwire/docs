---
slug: "/reference/typescript/swml-service/swml-service/build-swml-for-request"
title: "buildSwmlForRequest"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SWMLService.SWMLService.buildSwmlForRequest"
  parent: "SWMLService.SWMLService"
  module: "SWMLService"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts"
  visibility: "protected"
---
# `buildSwmlForRequest`

Service-side SWML-builder hook. Subclasses return a `SwmlBuilder`
to fully replace the document for this request, or `null` to fall
through to `setOnRequestCallback` or the static builder.

This is distinct from the WebMixin `onRequest(requestData,
callbackPath)` hook on AgentBase (which mirrors Python's
`on_request -> on_swml_request` modification-merge contract).
Use this hook when you want to swap the entire SWML builder; use
`onRequest` / `onSwmlRequest` on AgentBase when you want to merge
targeted modifications into the rendered document.

Default implementation returns `null` (no-op).

## Signature

```typescript
buildSwmlForRequest(
  _queryParams: Record<string, string>,
  _bodyParams: Record<string, unknown>,
  _headers: Record<string, string>,
  _callbackPath?: string
): SwmlBuilder | null
```

## Parameters

| Name            | Type                      | Required | Default | Description |
| --------------- | ------------------------- | -------- | ------- | ----------- |
| `_queryParams`  | `Record<string, string>`  | yes      | —       | —           |
| `_bodyParams`   | `Record<string, unknown>` | yes      | —       | —           |
| `_headers`      | `Record<string, string>`  | yes      | —       | —           |
| `_callbackPath` | `string`                  | no       | —       | —           |

## Returns

`SwmlBuilder | null` — A `SwmlBuilder` whose document is sent as the response, or `null` to delegate to the next handler in the chain.

## Source

[`src/SWMLService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts)

Line 834.
