---
slug: "/reference/typescript/rest/pagination/paginate"
title: "paginate"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "rest.pagination.paginate"
  parent: "rest.pagination"
  module: "rest.pagination"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/pagination.ts"
---
# `paginate`

Async generator that yields items across paginated API responses.

Handles both relay REST (`links.next`) and LAML (`next_page_uri`) pagination
styles transparently.

## Signature

```typescript
paginate<T>(
  http: HttpClient,
  path: string,
  params?: QueryParams,
  dataKey: string = 'data'
): AsyncGenerator<T, void, undefined>
```

## Type Parameters

| Name | Type | Required | Default | Description           |
| ---- | ---- | -------- | ------- | --------------------- |
| `T`  | —    | yes      | —       | Element type yielded. |

## Parameters

| Name      | Type          | Required | Default  | Description                                                                                                           |
| --------- | ------------- | -------- | -------- | --------------------------------------------------------------------------------------------------------------------- |
| `http`    | `HttpClient`  | yes      | —        | [HttpClient](/reference/typescript/rest/http-client) instance used to fetch each page.                                |
| `path`    | `string`      | yes      | —        | Initial API path (absolute URL or path relative to `http.baseUrl`).                                                   |
| `params`  | `QueryParams` | no       | —        | Query parameters applied to the first request only. Subsequent pages use the server-supplied next-page URL unchanged. |
| `dataKey` | `string`      | yes      | `'data'` | Key on each response containing the array of items. Defaults to `"data"`.                                             |

## Returns

`AsyncGenerator<T, void, undefined>` — An async iterable that yields one `T` per call until exhausted.

## Source

[`src/rest/pagination.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/pagination.ts)

Line 27.
