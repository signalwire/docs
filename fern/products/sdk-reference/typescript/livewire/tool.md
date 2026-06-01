---
slug: "/reference/typescript/livewire/tool"
title: "tool"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "livewire.tool"
  parent: "livewire"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `tool`

Create a tool definition — mirrors `llm.tool()` from `@livekit/agents-js`.

The returned tool has an empty `name` — the caller assigns it when the tool
is attached to an agent's tools map (see the [Agent](/reference/typescript/livewire/agent) example).

## Signature

```typescript
tool<P>(options: { ...3 fields }): FunctionTool
```

## Type Parameters

| Name | Type | Required | Default | Description                           |
| ---- | ---- | -------- | ------- | ------------------------------------- |
| `P`  | —    | yes      | `any`   | Parameter type passed into `execute`. |

## Parameters

| Name                  | Type                                                                                                   | Required | Default | Description                                             |
| --------------------- | ------------------------------------------------------------------------------------------------------ | -------- | ------- | ------------------------------------------------------- |
| `options`             | `{ description: string; execute: (params: P, context: { ctx: RunContext }) => any; parameters?: any }` | yes      | —       | Tool configuration.                                     |
| `options.description` | `string`                                                                                               | yes      | —       | Human-readable tool description exposed to the LLM.     |
| `options.execute`     | `(params: P, context: { ctx: RunContext }) => any`                                                     | yes      | —       | Handler invoked when the LLM calls the tool.            |
| `options.parameters`  | `any`                                                                                                  | no       | —       | JSON Schema or Zod schema describing the tool's inputs. |

## Returns

`FunctionTool` — A [FunctionTool](/reference/typescript/livewire/function-tool) ready to be attached to an agent.

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 691.
