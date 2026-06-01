---
slug: "/reference/typescript/rest/namespaces/compat/compat-queues/get-member"
title: "getMember"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatQueues.getMember"
  parent: "rest.namespaces.compat.CompatQueues"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `getMember`

Fetch a specific member (by call SID) currently waiting in a queue.

## Signature

```typescript
getMember(queueSid: string, callSid: string): Promise<any>
```

## Parameters

| Name       | Type     | Required | Default | Description                    |
| ---------- | -------- | -------- | ------- | ------------------------------ |
| `queueSid` | `string` | yes      | —       | Queue SID.                     |
| `callSid`  | `string` | yes      | —       | Call SID of the queued member. |

## Returns

`Promise<any>` — The queue-member record.

## Throws

- On any non-2xx HTTP response (including `404`).

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 611.
