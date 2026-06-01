---
slug: "/reference/typescript/relay/call/call/bind-digit"
title: "bindDigit"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.bindDigit"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `bindDigit`

Bind a DTMF digit sequence to trigger a RELAY method automatically when
the caller presses it.

## Signature

```typescript
bindDigit(
  digits: string,
  bindMethod: string,
  options: { ...3 fields } = {}
): Promise<Record<string, unknown>>
```

## Parameters

| Name                  | Type                                                                             | Required | Default | Description                                                |
| --------------------- | -------------------------------------------------------------------------------- | -------- | ------- | ---------------------------------------------------------- |
| `digits`              | `string`                                                                         | yes      | —       | DTMF sequence that triggers the binding (e.g. `"*9"`).     |
| `bindMethod`          | `string`                                                                         | yes      | —       | RELAY method to invoke when the sequence is detected.      |
| `options`             | `{ bindParams?: Record<string, unknown>; maxTriggers?: number; realm?: string }` | yes      | `{}`    | Binding behaviour.                                         |
| `options.bindParams`  | `Record<string, unknown>`                                                        | no       | —       | Params forwarded to `bindMethod` on trigger.               |
| `options.maxTriggers` | `number`                                                                         | no       | —       | Maximum number of times the binding can fire.              |
| `options.realm`       | `string`                                                                         | no       | —       | Optional realm label so bindings can be cleared in groups. |

## Returns

`Promise<Record<string, unknown>>` — The platform's bind\_digit response.

## Throws

- When the bind\_digit command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 980.
