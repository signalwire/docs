---
slug: "/reference/typescript/swml-handler/swml-verb-handler/build-config"
title: "buildConfig"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SWMLHandler.SWMLVerbHandler.buildConfig"
  parent: "SWMLHandler.SWMLVerbHandler"
  module: "SWMLHandler"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLHandler.ts"
---
# `buildConfig`

Build a configuration object for this verb from the provided arguments.

**Modifiers:** `abstract`

## Signature

```typescript
buildConfig(opts: Record<string, unknown>): Record<string, unknown>
```

## Parameters

| Name   | Type                      | Required | Default | Description                                |
| ------ | ------------------------- | -------- | ------- | ------------------------------------------ |
| `opts` | `Record<string, unknown>` | yes      | —       | Key-value arguments specific to this verb. |

## Returns

`Record<string, unknown>` — A configuration dictionary ready for inclusion in a SWML document.

## Source

[`src/SWMLHandler.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLHandler.ts)

Line 63.
