---
slug: "/reference/typescript/relay/call/call/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.constructor"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `constructor`

## Signature

```typescript
constructor(
  client: RelayClientLike,
  callId: string,
  nodeId: string,
  projectId: string,
  context: string,
  options: { ...5 fields } = {}
): Call
```

## Parameters

| Name                | Type                                                                                                     | Required | Default | Description |
| ------------------- | -------------------------------------------------------------------------------------------------------- | -------- | ------- | ----------- |
| `client`            | `RelayClientLike`                                                                                        | yes      | —       | —           |
| `callId`            | `string`                                                                                                 | yes      | —       | —           |
| `nodeId`            | `string`                                                                                                 | yes      | —       | —           |
| `projectId`         | `string`                                                                                                 | yes      | —       | —           |
| `context`           | `string`                                                                                                 | yes      | —       | —           |
| `options`           | `{ device?: Record<string, any>; direction?: string; segmentId?: string; state?: string; tag?: string }` | yes      | `{}`    | —           |
| `options.device`    | `Record<string, any>`                                                                                    | no       | —       | —           |
| `options.direction` | `string`                                                                                                 | no       | —       | —           |
| `options.segmentId` | `string`                                                                                                 | no       | —       | —           |
| `options.state`     | `string`                                                                                                 | no       | —       | —           |
| `options.tag`       | `string`                                                                                                 | no       | —       | —           |

## Returns

`Call`

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 91.
