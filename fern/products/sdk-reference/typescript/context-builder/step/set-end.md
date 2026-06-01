---
slug: "/reference/typescript/context-builder/step/set-end"
title: "setEnd"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ContextBuilder.Step.setEnd"
  parent: "ContextBuilder.Step"
  module: "ContextBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts"
---
# `setEnd`

Mark this step as terminal for the step flow.

IMPORTANT: `end=true` does NOT end the conversation or hang up the
call. It exits step mode entirely after this step executes — clearing
the steps list, current step index, validSteps, and validContexts.
The agent keeps running, but operates only under the base system
prompt and the context-level prompt; no more step instructions are
injected and no more `next_step` tool is offered.

To actually end the call, call a hangup tool or define a hangup hook.

## Signature

```typescript
setEnd(end: boolean): this
```

## Parameters

| Name  | Type      | Required | Default | Description                             |
| ----- | --------- | -------- | ------- | --------------------------------------- |
| `end` | `boolean` | yes      | —       | True to exit step mode after this step. |

## Returns

`this` — This step for chaining.

## Source

[`src/ContextBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts)

Line 308.
