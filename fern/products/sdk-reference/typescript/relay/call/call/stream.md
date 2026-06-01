---
slug: "/reference/typescript/relay/call/call/stream"
title: "stream"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.stream"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `stream`

Start streaming call audio to a WebSocket endpoint.

## Signature

```typescript
stream(url: string, options: { ...9 fields } = {}): Promise<StreamAction>
```

## Parameters

| Name                               | Type                                                                                                                                                                                                                                  | Required | Default | Description                                                  |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- | ------------------------------------------------------------ |
| `url`                              | `string`                                                                                                                                                                                                                              | yes      | —       | WebSocket URL to stream audio to.                            |
| `options`                          | `{ authorizationBearerToken?: string; codec?: string; controlId?: string; customParameters?: Record<string, unknown>; name?: string; onCompleted?: CompletedCallback; statusUrl?: string; statusUrlMethod?: string; track?: string }` | yes      | `{}`    | Stream behaviour.                                            |
| `options.authorizationBearerToken` | `string`                                                                                                                                                                                                                              | no       | —       | Bearer token sent to the stream endpoint.                    |
| `options.codec`                    | `string`                                                                                                                                                                                                                              | no       | —       | Audio codec (e.g. `"PCMU"`, `"PCMA"`).                       |
| `options.controlId`                | `string`                                                                                                                                                                                                                              | no       | —       | Explicit control ID. Auto-generated when omitted.            |
| `options.customParameters`         | `Record<string, unknown>`                                                                                                                                                                                                             | no       | —       | Extra parameters forwarded to the stream endpoint.           |
| `options.name`                     | `string`                                                                                                                                                                                                                              | no       | —       | Friendly name for the stream.                                |
| `options.onCompleted`              | `CompletedCallback`                                                                                                                                                                                                                   | no       | —       | Callback fired when the stream completes.                    |
| `options.statusUrl`                | `string`                                                                                                                                                                                                                              | no       | —       | Webhook URL for stream status events.                        |
| `options.statusUrlMethod`          | `string`                                                                                                                                                                                                                              | no       | —       | HTTP method for `statusUrl` requests.                        |
| `options.track`                    | `string`                                                                                                                                                                                                                              | no       | —       | Which track to send: `"inbound"`, `"outbound"`, or `"both"`. |

## Returns

`Promise<StreamAction>` — A [StreamAction](/reference/typescript/relay/action/stream-action) for control and completion tracking.

## Throws

- When the stream command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 766.
