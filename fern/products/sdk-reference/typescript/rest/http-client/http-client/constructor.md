---
slug: "/reference/typescript/rest/http-client/http-client/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.HttpClient.HttpClient.constructor"
  parent: "rest.HttpClient.HttpClient"
  module: "rest.HttpClient"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/HttpClient.ts"
---
# `constructor`

Build a new HTTP client.

## Signature

```typescript
constructor(options: HttpClientOptions): HttpClient
```

## Parameters

| Name      | Type                | Required | Default | Description                                                                                                                                                              |
| --------- | ------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `options` | `HttpClientOptions` | yes      | —       | Connection options. Either `host` (bare hostname; `https://` is prepended automatically) or `baseUrl` (fully-qualified) must be provided along with `project` + `token`. |

## Returns

`HttpClient`

## Throws

- When neither `host` nor `baseUrl` is supplied.

## Source

[`src/rest/HttpClient.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/HttpClient.ts)

Line 37.
