---
slug: "/reference/typescript/relay/call/call/live-translate"
title: "liveTranslate"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.liveTranslate"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `liveTranslate`

Start or stop live translation on the call.

## Signature

```typescript
liveTranslate(
  action: Record<string, unknown>,
  options: { ...1 fields } = {}
): Promise<Record<string, unknown>>
```

## Parameters

| Name                | Type                      | Required | Default | Description                                                                    |
| ------------------- | ------------------------- | -------- | ------- | ------------------------------------------------------------------------------ |
| `action`            | `Record<string, unknown>` | yes      | —       | Platform-shaped action block (`start` or `stop` plus source/target languages). |
| `options`           | `{ statusUrl?: string }`  | yes      | `{}`    | Live-translate behaviour.                                                      |
| `options.statusUrl` | `string`                  | no       | —       | Webhook URL for translation status events.                                     |

## Returns

`Promise<Record<string, unknown>>` — The platform's live\_translate response.

## Throws

- When the live\_translate command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 1037.
