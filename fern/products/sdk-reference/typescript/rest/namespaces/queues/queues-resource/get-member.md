---
slug: "/reference/typescript/rest/namespaces/queues/queues-resource/get-member"
title: "getMember"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.queues.QueuesResource.getMember"
  parent: "rest.namespaces.queues.QueuesResource"
  module: "rest.namespaces.queues"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/queues.ts"
---
# `getMember`

Fetch a specific queue member by ID.

## Signature

```typescript
getMember(queueId: string, memberId: string): Promise<any>
```

## Parameters

| Name       | Type     | Required | Default | Description                            |
| ---------- | -------- | -------- | ------- | -------------------------------------- |
| `queueId`  | `string` | yes      | —       | Unique identifier of the queue.        |
| `memberId` | `string` | yes      | —       | Unique identifier of the queue member. |

## Returns

`Promise<any>` — The queue member record.

## Throws

- On any non-2xx HTTP response (including `404`).

## Source

[`src/rest/namespaces/queues.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/queues.ts)

Line 55.
