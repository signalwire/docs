---
slug: "/reference/typescript/schema-utils/validation-result"
title: "ValidationResult"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "SchemaUtils.ValidationResult"
  parent: "SchemaUtils"
  module: "SchemaUtils"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SchemaUtils.ts"
---
# `ValidationResult`

Result of validating a SWML document.

## Signature

```typescript
interface ValidationResult
```

## Properties

| Name     | Type       | Required | Default | Description                                              |
| -------- | ---------- | -------- | ------- | -------------------------------------------------------- |
| `errors` | `string[]` | yes      | —       | List of human-readable error messages; empty when valid. |
| `valid`  | `boolean`  | yes      | —       | Whether the document passed all validation checks.       |

## Source

[`src/SchemaUtils.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SchemaUtils.ts)

Line 12.
