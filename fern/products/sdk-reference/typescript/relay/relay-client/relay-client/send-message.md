---
slug: "/reference/typescript/relay/relay-client/relay-client/send-message"
title: "sendMessage"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.RelayClient.RelayClient.sendMessage"
  parent: "relay.RelayClient.RelayClient"
  module: "relay.RelayClient"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayClient.ts"
---
# `sendMessage`

Send an outbound SMS / MMS message.

The method returns as soon as the server has accepted the send; track the
message's terminal state with [Message.wait](/reference/typescript/relay/message/message/wait) or the `onCompleted`
callback.

## Signature

```typescript
sendMessage(options: { ...8 fields }): Promise<Message>
```

## Parameters

| Name                  | Type                                                                                                                                                                                 | Required | Default | Description                                                                                           |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- | ------- | ----------------------------------------------------------------------------------------------------- |
| `options`             | `{ body?: string; context?: string; fromNumber: string; media?: string[]; onCompleted?: (event: any) => void \| Promise<void>; region?: string; tags?: string[]; toNumber: string }` | yes      | —       | Send parameters.                                                                                      |
| `options.body`        | `string`                                                                                                                                                                             | no       | —       | Text body of the message.                                                                             |
| `options.context`     | `string`                                                                                                                                                                             | no       | —       | Context for receiving state events. Defaults to the negotiated relay protocol.                        |
| `options.fromNumber`  | `string`                                                                                                                                                                             | yes      | —       | Sender phone number in E.164 format.                                                                  |
| `options.media`       | `string[]`                                                                                                                                                                           | no       | —       | List of media URLs for MMS.                                                                           |
| `options.onCompleted` | `(event: any) => void \| Promise<void>`                                                                                                                                              | no       | —       | Optional callback fired when the message reaches a terminal state (delivered / failed / undelivered). |
| `options.region`      | `string`                                                                                                                                                                             | no       | —       | Origination region override.                                                                          |
| `options.tags`        | `string[]`                                                                                                                                                                           | no       | —       | Tags attached to the message for correlation.                                                         |
| `options.toNumber`    | `string`                                                                                                                                                                             | yes      | —       | Destination phone number in E.164 format.                                                             |

## Returns

`Promise<Message>` — A [Message](/reference/typescript/relay/message) tracking the outbound send.

## Throws

- When the server rejects the send request.

## Source

[`src/relay/RelayClient.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayClient.ts)

Line 655.
