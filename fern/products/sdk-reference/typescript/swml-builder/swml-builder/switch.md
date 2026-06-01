---
slug: "/reference/typescript/swml-builder/swml-builder/switch"
title: "switch"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SwmlBuilder.SwmlBuilder.switch"
  parent: "SwmlBuilder.SwmlBuilder"
  module: "SwmlBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts"
---
# `switch`

Execute different instructions based on a variable's value.

## Signature

```typescript
switch(config: { ...3 fields }): this
```

## Parameters

| Name              | Type                                                                       | Required | Default | Description |
| ----------------- | -------------------------------------------------------------------------- | -------- | ------- | ----------- |
| `config`          | `{ case: Record<string, unknown>; default?: unknown[]; variable: string }` | yes      | —       | —           |
| `config.case`     | `Record<string, unknown>`                                                  | yes      | —       | —           |
| `config.default`  | `unknown[]`                                                                | no       | —       | —           |
| `config.variable` | `string`                                                                   | yes      | —       | —           |

## Returns

`this`

## Source

[`src/SwmlVerbMethods.generated.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts)

Line 177.
