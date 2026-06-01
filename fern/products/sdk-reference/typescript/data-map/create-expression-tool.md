---
slug: "/reference/typescript/data-map/create-expression-tool"
title: "createExpressionTool"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "DataMap.createExpressionTool"
  parent: "DataMap"
  module: "DataMap"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/DataMap.ts"
---
# `createExpressionTool`

Create a DataMap tool that evaluates expressions against patterns without making HTTP calls.

## Signature

```typescript
createExpressionTool(opts: { ...3 fields }): DataMap
```

## Parameters

| Name              | Type                                                                                                                                                             | Required | Default | Description                                                                  |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- | ---------------------------------------------------------------------------- |
| `opts`            | `{ name: string; parameters?: Record<string, { description?: string; required?: boolean; type?: string }>; patterns: Record<string, [string, FunctionResult]> }` | yes      | —       | Configuration including name, pattern-result pairs, and optional parameters. |
| `opts.name`       | `string`                                                                                                                                                         | yes      | —       | —                                                                            |
| `opts.parameters` | `Record<string, { description?: string; required?: boolean; type?: string }>`                                                                                    | no       | —       | —                                                                            |
| `opts.patterns`   | `Record<string, [string, FunctionResult]>`                                                                                                                       | yes      | —       | —                                                                            |

## Returns

`DataMap` — A configured DataMap instance ready for registration.

## Source

[`src/DataMap.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/DataMap.ts)

Line 460.
