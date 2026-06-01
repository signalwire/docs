---
slug: "/reference/typescript/livewire/function-tool"
title: "FunctionTool"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "livewire.FunctionTool"
  parent: "livewire"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `FunctionTool`

A tool definition that can be registered on an [Agent](/reference/typescript/livewire/agent).

## Signature

```typescript
interface FunctionTool
```

## Properties

| Name          | Type                                                 | Required | Default | Description                                                             |
| ------------- | ---------------------------------------------------- | -------- | ------- | ----------------------------------------------------------------------- |
| `description` | `string`                                             | yes      | —       | Human-readable description shown to the LLM.                            |
| `execute`     | `(params: any, context: { ctx: RunContext }) => any` | yes      | —       | Handler invoked by the platform when the LLM calls this tool.           |
| `name`        | `string`                                             | yes      | —       | Tool name. Populated when the tool is attached to an `Agent.tools` map. |
| `parameters`  | `Record<string, unknown>`                            | no       | —       | JSON schema (or Zod schema passthrough) for the tool's parameters.      |

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 122.
