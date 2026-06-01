---
slug: "/reference/typescript/rest/http-client/http-client/get"
title: "get"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.HttpClient.HttpClient.get"
  parent: "rest.HttpClient.HttpClient"
  module: "rest.HttpClient"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/HttpClient.ts"
---
# `get`

Perform an authenticated HTTP GET and return the parsed JSON response.

## Signature

```typescript
get<T>(path: string, params?: QueryParams): Promise<T>
```

## Type Parameters

| Name | Type | Required | Default | Description                  |
| ---- | ---- | -------- | ------- | ---------------------------- |
| `T`  | —    | yes      | `any`   | Expected response body type. |

## Parameters

| Name     | Type          | Required | Default | Description                                                                                                         |
| -------- | ------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------- |
| `path`   | `string`      | yes      | —       | Absolute URL or path relative to [HttpClient.baseUrl](/reference/typescript/rest/http-client/http-client#base-url). |
| `params` | `QueryParams` | no       | —       | Optional query parameters; `undefined` values are skipped.                                                          |

## Returns

`Promise<T>` — The parsed JSON body, or `{}` on `204 No Content`.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/HttpClient.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/HttpClient.ts)

Line 109.
