---
slug: "/reference/typescript/swml-builder/swml-builder/set-validation"
title: "setValidation"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SwmlBuilder.SwmlBuilder.setValidation"
  parent: "SwmlBuilder.SwmlBuilder"
  module: "SwmlBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlBuilder.ts"
---
# `setValidation`

Enable or disable verb schema validation at runtime.
Matches the Python `schema_validation` constructor parameter on AgentBase.

## Signature

```typescript
setValidation(enabled: boolean): void
```

## Parameters

| Name      | Type      | Required | Default | Description                                  |
| --------- | --------- | -------- | ------- | -------------------------------------------- |
| `enabled` | `boolean` | yes      | —       | True to enable validation, false to disable. |

## Returns

`void`

## Source

[`src/SwmlBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlBuilder.ts)

Line 112.
