---
slug: "/reference/typescript/relay/action/pay-action/stop"
title: "stop"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Action.PayAction.stop"
  parent: "relay.Action.PayAction"
  module: "relay.Action"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Action.ts"
---
# `stop`

Cancel the payment collection before it completes.

## Signature

```typescript
stop(): Promise<Record<string, unknown>>
```

## Returns

`Promise<Record<string, unknown>>` — The platform's stop response.

## Throws

- When the stop command is rejected.

## Source

[`src/relay/Action.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Action.ts)

Line 441.
