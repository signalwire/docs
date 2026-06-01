---
slug: "/reference/typescript/rest/namespaces/fabric/swml-webhooks-resource/get"
title: "get"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.fabric.SwmlWebhooksResource.get"
  parent: "rest.namespaces.fabric.SwmlWebhooksResource"
  module: "rest.namespaces.fabric"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/CrudResource.ts"
---
# `get`

Fetch a single resource by ID.

## Signature

```typescript
get(resourceId: string): Promise<any>
```

## Parameters

| Name         | Type     | Required | Default | Description                        |
| ------------ | -------- | -------- | ------- | ---------------------------------- |
| `resourceId` | `string` | yes      | —       | Unique identifier of the resource. |

## Returns

`Promise<any>` — The resource record.

## Throws

- On any non-2xx HTTP response (including `404`).

## Source

[`src/rest/base/CrudResource.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/CrudResource.ts)

Line 66.
