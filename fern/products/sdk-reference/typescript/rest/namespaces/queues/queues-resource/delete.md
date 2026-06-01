---
slug: "/reference/typescript/rest/namespaces/queues/queues-resource/delete"
title: "delete"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.queues.QueuesResource.delete"
  parent: "rest.namespaces.queues.QueuesResource"
  module: "rest.namespaces.queues"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/CrudResource.ts"
---
# `delete`

Delete a resource by ID.

## Signature

```typescript
delete(resourceId: string): Promise<any>
```

## Parameters

| Name         | Type     | Required | Default | Description                        |
| ------------ | -------- | -------- | ------- | ---------------------------------- |
| `resourceId` | `string` | yes      | —       | Unique identifier of the resource. |

## Returns

`Promise<any>` — The platform's delete response (often an empty body on success).

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/base/CrudResource.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/CrudResource.ts)

Line 95.
