---
slug: "/reference/typescript/rest/rest-error/rest-error/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.RestError.RestError.constructor"
  parent: "rest.RestError.RestError"
  module: "rest.RestError"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/RestError.ts"
---
# `constructor`

## Signature

```typescript
constructor(
  statusCode: number,
  body: string | Record<string, unknown>,
  url: string,
  method: string = 'GET'
): RestError
```

## Parameters

| Name         | Type                                | Required | Default | Description                                                                   |
| ------------ | ----------------------------------- | -------- | ------- | ----------------------------------------------------------------------------- |
| `statusCode` | `number`                            | yes      | —       | HTTP status code returned by the server.                                      |
| `body`       | `string \| Record<string, unknown>` | yes      | —       | Response body — an object if JSON-parseable, otherwise the raw response text. |
| `url`        | `string`                            | yes      | —       | Fully-qualified URL that produced the error.                                  |
| `method`     | `string`                            | yes      | `'GET'` | HTTP method that produced the error. Defaults to `"GET"`.                     |

## Returns

`RestError`

## Source

[`src/rest/RestError.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/RestError.ts)

Line 28.
