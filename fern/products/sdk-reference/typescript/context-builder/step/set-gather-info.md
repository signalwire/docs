---
slug: "/reference/typescript/context-builder/step/set-gather-info"
title: "setGatherInfo"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ContextBuilder.Step.setGatherInfo"
  parent: "ContextBuilder.Step"
  module: "ContextBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts"
---
# `setGatherInfo`

Initializes a gather info operation on this step for collecting structured data.

## Signature

```typescript
setGatherInfo(opts?: { ...3 fields }): this
```

## Parameters

| Name                    | Type                                                                 | Required | Default | Description                                                       |
| ----------------------- | -------------------------------------------------------------------- | -------- | ------- | ----------------------------------------------------------------- |
| `opts`                  | `{ completionAction?: string; outputKey?: string; prompt?: string }` | no       | —       | Optional output key, completion action, and prompt configuration. |
| `opts.completionAction` | `string`                                                             | no       | —       | —                                                                 |
| `opts.outputKey`        | `string`                                                             | no       | —       | —                                                                 |
| `opts.prompt`           | `string`                                                             | no       | —       | —                                                                 |

## Returns

`this` — This step for chaining.

## Source

[`src/ContextBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts)

Line 338.
