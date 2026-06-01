---
slug: "/reference/typescript/relay/call/call/send-fax"
title: "sendFax"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.sendFax"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `sendFax`

Send a fax document.

## Signature

```typescript
sendFax(document: string, options: { ...4 fields } = {}): Promise<FaxAction>
```

## Parameters

| Name                  | Type                                                                                              | Required | Default | Description                                       |
| --------------------- | ------------------------------------------------------------------------------------------------- | -------- | ------- | ------------------------------------------------- |
| `document`            | `string`                                                                                          | yes      | —       | URL of the document to fax (TIFF or PDF).         |
| `options`             | `{ controlId?: string; headerInfo?: string; identity?: string; onCompleted?: CompletedCallback }` | yes      | `{}`    | Fax behaviour.                                    |
| `options.controlId`   | `string`                                                                                          | no       | —       | Explicit control ID. Auto-generated when omitted. |
| `options.headerInfo`  | `string`                                                                                          | no       | —       | Additional fax header text.                       |
| `options.identity`    | `string`                                                                                          | no       | —       | Caller identity string sent in the fax header.    |
| `options.onCompleted` | `CompletedCallback`                                                                               | no       | —       | Callback fired when the fax completes.            |

## Returns

`Promise<FaxAction>` — A [FaxAction](/reference/typescript/relay/action/fax-action) for control and completion tracking.

## Throws

- When the send\_fax command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 677.
