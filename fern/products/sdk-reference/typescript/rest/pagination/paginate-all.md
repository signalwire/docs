---
slug: "/reference/typescript/rest/pagination/paginate-all"
title: "paginateAll"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "rest.pagination.paginateAll"
  parent: "rest.pagination"
  module: "rest.pagination"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/pagination.ts"
---
# `paginateAll`

Collect all paginated items into an array.

Convenience wrapper around [paginate](/reference/typescript/rest/pagination/paginate) for callers who want the full
list. Beware: loads every page into memory — for very large result sets,
iterate via `paginate()` directly.

## Signature

```typescript
paginateAll<T>(
  http: HttpClient,
  path: string,
  params?: QueryParams,
  dataKey: string = 'data'
): Promise<T[]>
```

## Type Parameters

| Name | Type | Required | Default | Description             |
| ---- | ---- | -------- | ------- | ----------------------- |
| `T`  | —    | yes      | —       | Element type collected. |

## Parameters

| Name      | Type          | Required | Default  | Description                                                                            |
| --------- | ------------- | -------- | -------- | -------------------------------------------------------------------------------------- |
| `http`    | `HttpClient`  | yes      | —        | [HttpClient](/reference/typescript/rest/http-client) instance used to fetch each page. |
| `path`    | `string`      | yes      | —        | Initial API path.                                                                      |
| `params`  | `QueryParams` | no       | —        | Query parameters applied to the first request.                                         |
| `dataKey` | `string`      | yes      | `'data'` | Key on each response containing the array of items. Defaults to `"data"`.              |

## Returns

`Promise<T[]>` — A flat array of every item across all pages.

## Source

[`src/rest/pagination.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/pagination.ts)

Line 87.
