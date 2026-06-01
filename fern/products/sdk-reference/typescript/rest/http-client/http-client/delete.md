---
slug: "/reference/typescript/rest/http-client/http-client/delete"
title: "delete"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.HttpClient.HttpClient.delete"
  parent: "rest.HttpClient.HttpClient"
  module: "rest.HttpClient"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/HttpClient.ts"
---
# `delete`

Perform an authenticated HTTP DELETE and return the parsed JSON response.

## Signature

```typescript
delete<T>(path: string): Promise<T>
```

## Type Parameters

| Name | Type | Required | Default | Description                  |
| ---- | ---- | -------- | ------- | ---------------------------- |
| `T`  | —    | yes      | `any`   | Expected response body type. |

## Parameters

| Name   | Type     | Required | Default | Description                                                                                                         |
| ------ | -------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------- |
| `path` | `string` | yes      | —       | Absolute URL or path relative to [HttpClient.baseUrl](/reference/typescript/rest/http-client/http-client#base-url). |

## Returns

`Promise<T>` — The parsed JSON body, or `{}` on `204 No Content`.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/HttpClient.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/HttpClient.ts)

Line 161.
