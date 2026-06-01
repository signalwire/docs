---
slug: "/reference/typescript/rest/base/crud-with-addresses/crud-with-addresses/get"
title: "get"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.base.CrudWithAddresses.CrudWithAddresses.get"
  parent: "rest.base.CrudWithAddresses.CrudWithAddresses"
  module: "rest.base.CrudWithAddresses"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/CrudResource.ts"
---
# `get`

Fetch a single resource by ID.

## Signature

```typescript
get(resourceId: string): Promise<TItem>
```

## Parameters

| Name         | Type     | Required | Default | Description                        |
| ------------ | -------- | -------- | ------- | ---------------------------------- |
| `resourceId` | `string` | yes      | —       | Unique identifier of the resource. |

## Returns

`Promise<TItem>` — The resource record.

## Throws

- On any non-2xx HTTP response (including `404`).

## Source

[`src/rest/base/CrudResource.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/CrudResource.ts)

Line 66.
