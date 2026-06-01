---
slug: "/reference/typescript/swml-builder/swml-builder/execute"
title: "execute"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SwmlBuilder.SwmlBuilder.execute"
  parent: "SwmlBuilder.SwmlBuilder"
  module: "SwmlBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts"
---
# `execute`

Execute a specified section or URL as a subroutine, and upon completion, return to the current document. Use the return statement to pass any return values or objects back to the current document.

## Signature

```typescript
execute(config: { ...5 fields }): this
```

## Parameters

| Name               | Type                                                                                                                            | Required | Default | Description |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- | ----------- |
| `config`           | `{ dest: string; meta?: Record<string, unknown>; on_return?: unknown[]; params?: Record<string, unknown>; result?: unknown[] }` | yes      | —       | —           |
| `config.dest`      | `string`                                                                                                                        | yes      | —       | —           |
| `config.meta`      | `Record<string, unknown>`                                                                                                       | no       | —       | —           |
| `config.on_return` | `unknown[]`                                                                                                                     | no       | —       | —           |
| `config.params`    | `Record<string, unknown>`                                                                                                       | no       | —       | —           |
| `config.result`    | `unknown[]`                                                                                                                     | no       | —       | —           |

## Returns

`this`

## Source

[`src/SwmlVerbMethods.generated.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts)

Line 62.
