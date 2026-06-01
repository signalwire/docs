---
slug: "/reference/typescript/prefabs/survey-agent/survey-agent/on-swml-request"
title: "onSwmlRequest"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.SurveyAgent.SurveyAgent.onSwmlRequest"
  parent: "prefabs.SurveyAgent.SurveyAgent"
  module: "prefabs.SurveyAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `onSwmlRequest`

Lifecycle hook called on every SWML request before rendering. Override in subclasses.

May optionally return a modification dict that will be merged into the
rendered SWML document (matching Python's `Optional[dict]` return type).

Matches Python `on_swml_request(request_data, callback_path, request)` — the third
parameter is the FastAPI `Request` in Python; here it is the raw Hono context object
so that subclasses can access query parameters (`context.req.query()`), raw request
headers (`context.req.raw.headers`), etc.

## Signature

```typescript
onSwmlRequest(
  _rawData: Record<string, unknown>,
  _callbackPath?: string,
  _context?: any
): void | Record<string, unknown> | Promise<void | Record<string, unknown>>
```

## Parameters

| Name            | Type                      | Required | Default | Description                                                                    |
| --------------- | ------------------------- | -------- | ------- | ------------------------------------------------------------------------------ |
| `_rawData`      | `Record<string, unknown>` | yes      | —       | The parsed request body.                                                       |
| `_callbackPath` | `string`                  | no       | —       | Optional callback path from the request.                                       |
| `_context`      | `any`                     | no       | —       | The raw Hono context object (c), providing access to headers and query params. |

## Returns

`void | Record<string, unknown> | Promise<void | Record<string, unknown>>` — Optionally a dict of SWML modifications, or void.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1939.
