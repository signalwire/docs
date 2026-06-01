---
slug: "/reference/typescript/schema-utils/schema-utils/validate"
title: "validate"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SchemaUtils.SchemaUtils.validate"
  parent: "SchemaUtils.SchemaUtils"
  module: "SchemaUtils"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SchemaUtils.ts"
---
# `validate`

Validate a SWML document against structural rules.

## Signature

```typescript
validate(swml: string | Record<string, unknown>): ValidationResult
```

## Parameters

| Name   | Type                                | Required | Default | Description                                          |
| ------ | ----------------------------------- | -------- | ------- | ---------------------------------------------------- |
| `swml` | `string \| Record<string, unknown>` | yes      | —       | The SWML document as a JSON string or parsed object. |

## Returns

`ValidationResult` — The validation result indicating success or a list of errors.

## Source

[`src/SchemaUtils.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SchemaUtils.ts)

Line 231.
