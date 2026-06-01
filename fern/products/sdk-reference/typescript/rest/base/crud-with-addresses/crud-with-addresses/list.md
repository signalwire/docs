---
slug: "/reference/typescript/rest/base/crud-with-addresses/crud-with-addresses/list"
title: "list"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.base.CrudWithAddresses.CrudWithAddresses.list"
  parent: "rest.base.CrudWithAddresses.CrudWithAddresses"
  module: "rest.base.CrudWithAddresses"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/CrudResource.ts"
---
# `list`

List resources with optional query parameters.

## Signature

```typescript
list(params?: QueryParams): Promise<TList>
```

## Parameters

| Name     | Type          | Required | Default | Description                                    |
| -------- | ------------- | -------- | ------- | ---------------------------------------------- |
| `params` | `QueryParams` | no       | —       | Optional filter / pagination query parameters. |

## Returns

`Promise<TList>` — The paginated list response.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/base/CrudResource.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/CrudResource.ts)

Line 44.
