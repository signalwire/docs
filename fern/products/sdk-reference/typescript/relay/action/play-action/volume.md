---
slug: "/reference/typescript/relay/action/play-action/volume"
title: "volume"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Action.PlayAction.volume"
  parent: "relay.Action.PlayAction"
  module: "relay.Action"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Action.ts"
---
# `volume`

Adjust playback volume.

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

Line 198.
