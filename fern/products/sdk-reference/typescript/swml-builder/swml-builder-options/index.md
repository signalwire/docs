---
slug: "/reference/typescript/swml-builder/swml-builder-options"
title: "SwmlBuilderOptions"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "SwmlBuilder.SwmlBuilderOptions"
  parent: "SwmlBuilder"
  module: "SwmlBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlBuilder.ts"
---
# `SwmlBuilderOptions`

Options for constructing a SwmlBuilder.

## Signature

```typescript
interface SwmlBuilderOptions
```

## Properties

| Name               | Type                                                         | Required | Default | Description                                                                                                                                                                                                                                    |
| ------------------ | ------------------------------------------------------------ | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `enableValidation` | `boolean`                                                    | no       | —       | When false, disables verb schema validation. Defaults to true unless `SWML_SKIP_SCHEMA_VALIDATION=true` is set in the environment.                                                                                                             |
| `initialDocument`  | `{ sections?: Record<string, unknown[]>; version?: string }` | no       | —       | An initial SWML document to seed the builder with, enabling document injection. When provided, the builder uses this document instead of creating an empty one. This mirrors the Python SDK's pattern of injecting an SWMLService instance.    |
| `schemaPath`       | `string`                                                     | no       | —       | Optional path to a custom SWML schema JSON file. When set, the builder uses a per-instance SchemaUtils loaded from this path instead of the bundled schema. Mirrors Python's `schema_path` constructor parameter on `SWMLService`/`AgentBase`. |

## Source

[`src/SwmlBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlBuilder.ts)

Line 18.
