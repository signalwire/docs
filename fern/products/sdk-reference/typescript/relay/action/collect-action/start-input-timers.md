---
slug: "/reference/typescript/relay/action/collect-action/start-input-timers"
title: "startInputTimers"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Action.CollectAction.startInputTimers"
  parent: "relay.Action.CollectAction"
  module: "relay.Action"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Action.ts"
---
# `startInputTimers`

Start the collect input timers (useful when `initial_timeout` should be
reset after an async side effect completes).

## Signature

```typescript
startInputTimers(): Promise<Record<string, unknown>>
```

## Returns

`Promise<Record<string, unknown>>` — The platform's start\_input\_timers response.

## Throws

- When the command is rejected.

## Source

[`src/relay/Action.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Action.ts)

Line 324.
