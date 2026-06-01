---
slug: "/reference/typescript/context-builder/context/add-step"
title: "addStep"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ContextBuilder.Context.addStep"
  parent: "ContextBuilder.Context"
  module: "ContextBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts"
---
# `addStep`

Adds a new step to this context.

## Signature

```typescript
addStep(name: string, opts?: { ...5 fields }): Step
```

## Parameters

| Name              | Type                                                                                                              | Required | Default | Description                                                                      |
| ----------------- | ----------------------------------------------------------------------------------------------------------------- | -------- | ------- | -------------------------------------------------------------------------------- |
| `name`            | `string`                                                                                                          | yes      | —       | The unique step name within this context.                                        |
| `opts`            | `{ bullets?: string[]; criteria?: string; functions?: string \| string[]; task?: string; validSteps?: string[] }` | no       | —       | Optional shorthand for task text, bullets, criteria, functions, and valid steps. |
| `opts.bullets`    | `string[]`                                                                                                        | no       | —       | —                                                                                |
| `opts.criteria`   | `string`                                                                                                          | no       | —       | —                                                                                |
| `opts.functions`  | `string \| string[]`                                                                                              | no       | —       | —                                                                                |
| `opts.task`       | `string`                                                                                                          | no       | —       | —                                                                                |
| `opts.validSteps` | `string[]`                                                                                                        | no       | —       | —                                                                                |

## Returns

`Step` — The newly created Step for further configuration.

## Source

[`src/ContextBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts)

Line 532.
