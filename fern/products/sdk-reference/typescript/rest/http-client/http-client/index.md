---
slug: "/reference/typescript/rest/http-client/http-client"
title: "HttpClient"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "rest.HttpClient.HttpClient"
  parent: "rest.HttpClient"
  module: "rest.HttpClient"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/HttpClient.ts"
---
# `HttpClient`

Low-level HTTP client used by every REST namespace resource.

Handles Basic Auth, JSON encoding/decoding, and error normalisation
([RestError](/reference/typescript/rest/rest-error) on non-2xx). Normally you do not instantiate this
directly — construct a [RestClient](/reference/typescript/rest/rest-client) instead.

## Signature

```typescript
class HttpClient
```

## Properties

| Name      | Type     | Required | Default | Description                                   |
| --------- | -------- | -------- | ------- | --------------------------------------------- |
| `baseUrl` | `string` | yes      | —       | Fully-qualified base URL (no trailing slash). |

## Methods

- [`constructor`](/reference/typescript/rest/http-client/http-client/constructor) — Build a new HTTP client.
- [`delete`](/reference/typescript/rest/http-client/http-client/delete) — Perform an authenticated HTTP DELETE and return the parsed JSON response.
- [`get`](/reference/typescript/rest/http-client/http-client/get) — Perform an authenticated HTTP GET and return the parsed JSON response.
- [`patch`](/reference/typescript/rest/http-client/http-client/patch) — Perform an authenticated HTTP PATCH and return the parsed JSON response.
- [`post`](/reference/typescript/rest/http-client/http-client/post) — Perform an authenticated HTTP POST and return the parsed JSON response.
- [`put`](/reference/typescript/rest/http-client/http-client/put) — Perform an authenticated HTTP PUT and return the parsed JSON response.

## Source

[`src/rest/HttpClient.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/HttpClient.ts)

Line 23.
