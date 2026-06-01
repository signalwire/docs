---
slug: "/reference/typescript/type-inference/create-typed-handler-wrapper"
title: "createTypedHandlerWrapper"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "TypeInference.createTypedHandlerWrapper"
  parent: "TypeInference"
  module: "TypeInference"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/TypeInference.ts"
---
# `createTypedHandlerWrapper`

Create a wrapper function that adapts a typed handler to the standard
`(args, rawData) => result` SWAIG handler signature.

The wrapper extracts named parameters from the args dict and passes them
as positional arguments to the original function.

## Signature

```typescript
createTypedHandlerWrapper(
  fn: Function,
  paramNames: string[],
  hasRawData: boolean
): SwaigHandler
```

## Parameters

| Name         | Type       | Required | Default | Description                                                                                                                        |
| ------------ | ---------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `fn`         | `Function` | yes      | —       | The typed handler whose parameters match `paramNames` in order.                                                                    |
| `paramNames` | `string[]` | yes      | —       | Ordered list of parameter names extracted from `fn`, produced by [inferSchema](/reference/typescript/type-inference/infer-schema). |
| `hasRawData` | `boolean`  | yes      | —       | When `true`, the raw-data record is appended as the final positional argument to mirror the old-style handler shape.               |

## Returns

`SwaigHandler` — A [SwaigHandler](/reference/typescript/swaig-function/swaig-handler) suitable for registration with [AgentBase.defineTool](/reference/typescript/agent-base/agent-base/define-tool).

## Source

[`src/TypeInference.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/TypeInference.ts)

Line 187.
