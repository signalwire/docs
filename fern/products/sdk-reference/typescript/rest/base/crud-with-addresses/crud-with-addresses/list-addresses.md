---
slug: "/reference/typescript/rest/base/crud-with-addresses/crud-with-addresses/list-addresses"
title: "listAddresses"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.base.CrudWithAddresses.CrudWithAddresses.listAddresses"
  parent: "rest.base.CrudWithAddresses.CrudWithAddresses"
  module: "rest.base.CrudWithAddresses"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/CrudWithAddresses.ts"
---
# `listAddresses`

List addresses associated with a specific resource instance.

## Signature

```typescript
listAddresses(resourceId: string, params?: QueryParams): Promise<any>
```

## Parameters

| Name         | Type          | Required | Default | Description                                    |
| ------------ | ------------- | -------- | ------- | ---------------------------------------------- |
| `resourceId` | `string`      | yes      | —       | Unique identifier of the owning resource.      |
| `params`     | `QueryParams` | no       | —       | Optional filter / pagination query parameters. |

## Returns

`Promise<any>` — A paginated list of addresses.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/base/CrudWithAddresses.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/CrudWithAddresses.ts)

Line 34.
