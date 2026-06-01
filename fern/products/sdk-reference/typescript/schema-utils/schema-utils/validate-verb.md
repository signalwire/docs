---
slug: "/reference/typescript/schema-utils/schema-utils/validate-verb"
title: "validateVerb"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SchemaUtils.SchemaUtils.validateVerb"
  parent: "SchemaUtils.SchemaUtils"
  module: "SchemaUtils"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SchemaUtils.ts"
---
# `validateVerb`

Lightweight validation of a verb config against the schema.
Checks that the verb exists and required properties are present.
Mirrors Python SDK's `_validate_verb_lightweight()`.

## Signature

```typescript
validateVerb(verbName: string, config: unknown): ValidationResult
```

## Parameters

| Name       | Type      | Required | Default | Description                         |
| ---------- | --------- | -------- | ------- | ----------------------------------- |
| `verbName` | `string`  | yes      | —       | The verb name.                      |
| `config`   | `unknown` | yes      | —       | The verb configuration to validate. |

## Returns

`ValidationResult` — Validation result.

## Source

[`src/SchemaUtils.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SchemaUtils.ts)

Line 181.
