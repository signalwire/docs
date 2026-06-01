---
slug: "/reference/typescript/rest/rest-error/rest-error"
title: "RestError"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "rest.RestError.RestError"
  parent: "rest.RestError"
  module: "rest.RestError"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/RestError.ts"
---
# `RestError`

Custom error class for REST API errors.

`body` may be a parsed JSON object (when the server returned valid JSON)
or a plain string (when JSON parsing failed), matching the Python SDK's
`SignalWireRestError` behavior.

## Signature

```typescript
class RestError extends Error
```

## Inheritance

**Extends:** `Error`

## Properties

| Name         | Type                                | Required | Default | Description                                                                                                       |
| ------------ | ----------------------------------- | -------- | ------- | ----------------------------------------------------------------------------------------------------------------- |
| `body`       | `string \| Record<string, unknown>` | yes      | —       | Parsed response body. An object when the server returned valid JSON, otherwise the raw response text as a string. |
| `method`     | `string`                            | yes      | —       | HTTP method that produced the error (`GET`, `POST`, etc.).                                                        |
| `statusCode` | `number`                            | yes      | —       | HTTP status code returned by the server (e.g. `404`, `500`).                                                      |
| `url`        | `string`                            | yes      | —       | Fully-qualified URL that produced the error.                                                                      |

## Methods

- [`constructor`](/reference/typescript/rest/rest-error/rest-error/constructor)

## Source

[`src/rest/RestError.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/RestError.ts)

Line 8.
