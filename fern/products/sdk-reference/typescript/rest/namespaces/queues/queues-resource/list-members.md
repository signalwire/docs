---
slug: "/reference/typescript/rest/namespaces/queues/queues-resource/list-members"
title: "listMembers"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.queues.QueuesResource.listMembers"
  parent: "rest.namespaces.queues.QueuesResource"
  module: "rest.namespaces.queues"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/queues.ts"
---
# `listMembers`

List members in a queue.

## Signature

```typescript
listMembers(queueId: string, params?: QueryParams): Promise<any>
```

## Parameters

| Name      | Type          | Required | Default | Description                                    |
| --------- | ------------- | -------- | ------- | ---------------------------------------------- |
| `queueId` | `string`      | yes      | —       | Unique identifier of the queue.                |
| `params`  | `QueryParams` | no       | —       | Optional filter / pagination query parameters. |

## Returns

`Promise<any>` — A paginated list of queue members.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/queues.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/queues.ts)

Line 31.
