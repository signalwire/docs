---
slug: "/reference/typescript/rest/namespaces/compat/compat-queues/list-members"
title: "listMembers"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatQueues.listMembers"
  parent: "rest.namespaces.compat.CompatQueues"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `listMembers`

List members (calls) currently waiting in a queue.

## Signature

```typescript
listMembers(queueSid: string, params?: QueryParams): Promise<any>
```

## Parameters

| Name       | Type          | Required | Default | Description                                    |
| ---------- | ------------- | -------- | ------- | ---------------------------------------------- |
| `queueSid` | `string`      | yes      | —       | Queue SID.                                     |
| `params`   | `QueryParams` | no       | —       | Optional filter / pagination query parameters. |

## Returns

`Promise<any>` — A paginated list of queue members.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 599.
