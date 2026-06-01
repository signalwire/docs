---
slug: "/reference/typescript/swml-builder/swml-builder/goto"
title: "goto"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SwmlBuilder.SwmlBuilder.goto"
  parent: "SwmlBuilder.SwmlBuilder"
  module: "SwmlBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts"
---
# `goto`

Jump to a label within the current section, optionally based on a condition. The goto method will only navigate to a label within the same section.

## Signature

```typescript
goto(config: { ...3 fields }): this
```

## Parameters

| Name           | Type                                             | Required | Default | Description |
| -------------- | ------------------------------------------------ | -------- | ------- | ----------- |
| `config`       | `{ label: string; max?: number; when?: string }` | yes      | —       | —           |
| `config.label` | `string`                                         | yes      | —       | —           |
| `config.max`   | `number`                                         | no       | —       | —           |
| `config.when`  | `string`                                         | no       | —       | —           |

## Returns

`this`

## Source

[`src/SwmlVerbMethods.generated.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts)

Line 69.
