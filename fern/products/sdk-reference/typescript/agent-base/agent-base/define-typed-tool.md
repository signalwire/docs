---
slug: "/reference/typescript/agent-base/agent-base/define-typed-tool"
title: "defineTypedTool"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "AgentBase.AgentBase.defineTypedTool"
  parent: "AgentBase.AgentBase"
  module: "AgentBase"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `defineTypedTool`

Register a SWAIG tool with a typed handler that receives named parameters
instead of the standard `(args, rawData)` convention.

The SDK wraps the handler to unpack the args dict into positional params.
If no `parameters` schema is provided, one is inferred from the handler's
source code (parameter names and default values).

## Signature

```typescript
defineTypedTool(opts: { ...9 fields }): this
```

## Parameters

| Name                 | Type                                                                                                                                                                                                                   | Required | Default | Description                                    |
| -------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- | ---------------------------------------------- |
| `opts`               | `{ description: string; fillers?: Record<string, string[]>; handler: Function; name: string; parameters?: Record<string, unknown>; required?: string[]; secure?: boolean; waitFile?: string; waitFileLoops?: number }` | yes      | —       | Tool definition with a typed handler function. |
| `opts.description`   | `string`                                                                                                                                                                                                               | yes      | —       | —                                              |
| `opts.fillers`       | `Record<string, string[]>`                                                                                                                                                                                             | no       | —       | —                                              |
| `opts.handler`       | `Function`                                                                                                                                                                                                             | yes      | —       | —                                              |
| `opts.name`          | `string`                                                                                                                                                                                                               | yes      | —       | —                                              |
| `opts.parameters`    | `Record<string, unknown>`                                                                                                                                                                                              | no       | —       | —                                              |
| `opts.required`      | `string[]`                                                                                                                                                                                                             | no       | —       | —                                              |
| `opts.secure`        | `boolean`                                                                                                                                                                                                              | no       | —       | —                                              |
| `opts.waitFile`      | `string`                                                                                                                                                                                                               | no       | —       | —                                              |
| `opts.waitFileLoops` | `number`                                                                                                                                                                                                               | no       | —       | —                                              |

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1372.
