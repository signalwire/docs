---
slug: "/reference/typescript/types/function-include"
title: "FunctionInclude"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "types.FunctionInclude"
  parent: "types"
  module: "types"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/types.ts"
---
# `FunctionInclude`

Reference to an external SWAIG function endpoint to include in the AI configuration.

## Signature

```typescript
interface FunctionInclude
```

## Properties

| Name        | Type                      | Required | Default | Description                                              |
| ----------- | ------------------------- | -------- | ------- | -------------------------------------------------------- |
| `functions` | `string[]`                | yes      | —       | List of function names available at the remote endpoint. |
| `meta_data` | `Record<string, unknown>` | no       | —       | Optional metadata to pass along with the include.        |
| `url`       | `string`                  | yes      | —       | URL of the remote SWAIG endpoint.                        |

## Source

[`src/types.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/types.ts)

Line 133.
