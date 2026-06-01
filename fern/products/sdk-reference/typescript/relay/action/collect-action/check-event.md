---
slug: "/reference/typescript/relay/action/collect-action/check-event"
title: "_checkEvent"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Action.CollectAction._checkEvent"
  parent: "relay.Action.CollectAction"
  module: "relay.Action"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Action.ts"
---
# `_checkEvent`

play\_and\_collect shares a control\_id across play and collect phases.
Only resolve on collect events, not play events.

## Signature

```typescript
_checkEvent(event: RelayEvent): void
```

## Parameters

| Name    | Type         | Required | Default | Description |
| ------- | ------------ | -------- | ------- | ----------- |
| `event` | `RelayEvent` | yes      | —       | —           |

## Returns

`void`

## Source

[`src/relay/Action.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Action.ts)

Line 286.
