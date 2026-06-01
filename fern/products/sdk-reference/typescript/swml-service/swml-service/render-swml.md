---
slug: "/reference/typescript/swml-service/swml-service/render-swml"
title: "renderSwml"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SWMLService.SWMLService.renderSwml"
  parent: "SWMLService.SWMLService"
  module: "SWMLService"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts"
---
# `renderSwml`

Render the SWML document.

Subclass-override-friendly signature: AgentBase overrides this with
`(callId?: string, modifications?: Record<string, unknown>): string`
to return a serialized JSON string built from prompts + dynamic config.
Plain SWMLService returns the in-memory document object.

## Signature

```typescript
renderSwml(
  _callId?: string,
  _modifications?: Record<string, unknown>
): string | Record<string, unknown>
```

## Parameters

| Name             | Type                      | Required | Default | Description |
| ---------------- | ------------------------- | -------- | ------- | ----------- |
| `_callId`        | `string`                  | no       | —       | —           |
| `_modifications` | `Record<string, unknown>` | no       | —       | —           |

## Returns

`string | Record<string, unknown>` — The SWML document (object) or its serialized form (subclass).

## Source

[`src/SWMLService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts)

Line 694.
