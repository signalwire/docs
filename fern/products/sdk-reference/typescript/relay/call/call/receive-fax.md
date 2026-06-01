---
slug: "/reference/typescript/relay/call/call/receive-fax"
title: "receiveFax"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.receiveFax"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `receiveFax`

Receive a fax and save it server-side.

## Signature

```typescript
receiveFax(options: { ...2 fields } = {}): Promise<FaxAction>
```

## Parameters

| Name                  | Type                                                      | Required | Default | Description                                       |
| --------------------- | --------------------------------------------------------- | -------- | ------- | ------------------------------------------------- |
| `options`             | `{ controlId?: string; onCompleted?: CompletedCallback }` | yes      | `{}`    | Fax reception behaviour.                          |
| `options.controlId`   | `string`                                                  | no       | —       | Explicit control ID. Auto-generated when omitted. |
| `options.onCompleted` | `CompletedCallback`                                       | no       | —       | Callback fired when the fax completes.            |

## Returns

`Promise<FaxAction>` — A [FaxAction](/reference/typescript/relay/action/fax-action) for control and completion tracking.

## Throws

- When the receive\_fax command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 703.
