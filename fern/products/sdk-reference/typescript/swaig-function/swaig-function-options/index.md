---
slug: "/reference/typescript/swaig-function/swaig-function-options"
title: "SwaigFunctionOptions"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "SwaigFunction.SwaigFunctionOptions"
  parent: "SwaigFunction"
  module: "SwaigFunction"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwaigFunction.ts"
---
# `SwaigFunctionOptions`

Configuration options for creating a SwaigFunction.

## Signature

```typescript
interface SwaigFunctionOptions
```

## Properties

| Name             | Type                       | Required | Default | Description                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| ---------------- | -------------------------- | -------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `description`    | `string`                   | yes      | —       | Human-readable description of what the tool does, shown to the AI.                                                                                                                                                                                                                                                                                                                                                                                 |
| `extraFields`    | `Record<string, unknown>`  | no       | —       | Additional fields to merge directly into the SWAIG function definition. **Python equivalent:** `**extra_swaig_fields` kwargs on the constructor. In Python these are passed as bare keyword arguments and merged directly into the output dict via `function_def.update(self.extra_swaig_fields)`. In TypeScript the same fields are collected under this single options key and merged identically in `toSwaig()` — the wire format is identical. |
| `fillers`        | `Record<string, string[]>` | no       | —       | Language-keyed filler phrases spoken while the tool executes.                                                                                                                                                                                                                                                                                                                                                                                      |
| `handler`        | `SwaigHandler`             | yes      | —       | The handler function called when the tool is invoked.                                                                                                                                                                                                                                                                                                                                                                                              |
| `isTypedHandler` | `boolean`                  | no       | —       | Whether this tool uses a typed handler with named parameters.                                                                                                                                                                                                                                                                                                                                                                                      |
| `name`           | `string`                   | yes      | —       | Unique name used to register and invoke this tool.                                                                                                                                                                                                                                                                                                                                                                                                 |
| `parameters`     | `Record<string, unknown>`  | no       | —       | JSON Schema properties describing the tool's parameters.                                                                                                                                                                                                                                                                                                                                                                                           |
| `required`       | `string[]`                 | no       | —       | List of required parameter names.                                                                                                                                                                                                                                                                                                                                                                                                                  |
| `secure`         | `boolean`                  | no       | —       | Whether this tool requires session token authentication.                                                                                                                                                                                                                                                                                                                                                                                           |
| `waitFile`       | `string`                   | no       | —       | Audio file URL to play while waiting for the tool to complete.                                                                                                                                                                                                                                                                                                                                                                                     |
| `waitFileLoops`  | `number`                   | no       | —       | Number of times to loop the wait file.                                                                                                                                                                                                                                                                                                                                                                                                             |
| `webhookUrl`     | `string`                   | no       | —       | External webhook URL; makes this an externally-hosted tool.                                                                                                                                                                                                                                                                                                                                                                                        |

## Source

[`src/SwaigFunction.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwaigFunction.ts)

Line 25.
