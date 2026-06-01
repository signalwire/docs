---
slug: "/reference/typescript/context-builder/step/set-functions"
title: "setFunctions"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ContextBuilder.Step.setFunctions"
  parent: "ContextBuilder.Step"
  module: "ContextBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts"
---
# `setFunctions`

Set which non-internal functions are callable while this step is active.

IMPORTANT — inheritance behavior:
If you do NOT call this method, the step inherits whichever function
set was active on the previous step (or the previous context's last
step). The server-side runtime only resets the active set when a
step explicitly declares its `functions` field. This is by design,
but it is the most common source of bugs in multi-step agents:
forgetting setFunctions() on a later step lets the previous step's
tools leak through.

Best practice: call setFunctions() explicitly on every step that
should have a different toolset than the previous one.

Keep the per-step active set small: LLM tool selection accuracy
degrades noticeably past ~7-8 simultaneously-active tools per call.
Use per-step whitelisting to partition large tool collections.

Internal functions (e.g. `startup_hook`, `hangup_hook`, `gather_submit`)
are ALWAYS protected and cannot be deactivated by this whitelist. The
native navigation tools `next_step` and `change_context` are injected
automatically when validSteps/validContexts is set; they are not
affected by this list and do not need to appear in it.

## Signature

```typescript
setFunctions(functions: string | string[]): this
```

## Parameters

| Name        | Type                 | Required | Default | Description |
| ----------- | -------------------- | -------- | ------- | ----------- |
| `functions` | `string \| string[]` | yes      | —       | One of:     |

## Returns

`this` — This step for chaining.

## Examples

```typescript
step.setFunctions(['lookup_account', 'check_balance']); // whitelist
step.setFunctions([]);                                  // disable all
step.setFunctions('none');                              // disable all (alt)
```

## Source

[`src/ContextBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts)

Line 268.
