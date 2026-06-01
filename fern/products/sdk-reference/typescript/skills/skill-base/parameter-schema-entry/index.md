---
slug: "/reference/typescript/skills/skill-base/parameter-schema-entry"
title: "ParameterSchemaEntry"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "skills.SkillBase.ParameterSchemaEntry"
  parent: "skills.SkillBase"
  module: "skills.SkillBase"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts"
---
# `ParameterSchemaEntry`

Schema entry describing a single skill configuration parameter.

## Signature

```typescript
interface ParameterSchemaEntry
```

## Properties

| Name          | Type                                                                    | Required | Default | Description                                                                      |
| ------------- | ----------------------------------------------------------------------- | -------- | ------- | -------------------------------------------------------------------------------- |
| `default`     | `unknown`                                                               | no       | —       | Default value used when the parameter is not provided.                           |
| `description` | `string`                                                                | yes      | —       | Human-readable description of the parameter.                                     |
| `enum`        | `unknown[]`                                                             | no       | —       | Allowed values for the parameter.                                                |
| `env_var`     | `string`                                                                | no       | —       | Environment variable that can supply this parameter's value.                     |
| `hidden`      | `boolean`                                                               | no       | —       | Whether the parameter should be hidden from user-facing output (e.g., API keys). |
| `items`       | `Record<string, unknown>`                                               | no       | —       | Item schema for array-type parameters.                                           |
| `max`         | `number`                                                                | no       | —       | Maximum value (for numeric types).                                               |
| `min`         | `number`                                                                | no       | —       | Minimum value (for numeric types).                                               |
| `required`    | `boolean`                                                               | no       | —       | Whether the parameter must be supplied.                                          |
| `type`        | `"string" \| "number" \| "boolean" \| "object" \| "integer" \| "array"` | yes      | —       | JSON Schema type of the parameter value.                                         |

## Source

[`src/skills/SkillBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts)

Line 61.
