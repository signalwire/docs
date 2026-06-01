---
slug: "/reference/typescript/relay/action/collect-action/volume"
title: "volume"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Action.CollectAction.volume"
  parent: "relay.Action.CollectAction"
  module: "relay.Action"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Action.ts"
---
# `volume`

Adjust playback volume of the prompt audio mid-collect.

## Signature

```typescript
volume(volume: number): Promise<Record<string, unknown>>
```

## Parameters

| Name     | Type     | Required | Default | Description              |
| -------- | -------- | -------- | ------- | ------------------------ |
| `volume` | `number` | yes      | —       | Volume adjustment in dB. |

## Returns

`Promise<Record<string, unknown>>` — The platform's volume response.

## Throws

- When the volume command is rejected.

## Source

[`src/relay/Action.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Action.ts)

Line 313.
