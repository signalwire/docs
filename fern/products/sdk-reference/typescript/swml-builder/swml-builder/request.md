---
slug: "/reference/typescript/swml-builder/swml-builder/request"
title: "request"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SwmlBuilder.SwmlBuilder.request"
  parent: "SwmlBuilder.SwmlBuilder"
  module: "SwmlBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts"
---
# `request`

Send a GET, POST, PUT, or DELETE request to a remote URL.

## Signature

```typescript
request(config: { ...7 fields }): this
```

## Parameters

| Name                     | Type                                                                                                                                                                                                               | Required | Default | Description |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- | ------- | ----------- |
| `config`                 | `{ body?: string \| Record<string, unknown>; connect_timeout?: number; headers?: Record<string, unknown>; method: "GET" \| "POST" \| "PUT" \| "DELETE"; save_variables?: boolean; timeout?: number; url: string }` | yes      | —       | —           |
| `config.body`            | `string \| Record<string, unknown>`                                                                                                                                                                                | no       | —       | —           |
| `config.connect_timeout` | `number`                                                                                                                                                                                                           | no       | —       | —           |
| `config.headers`         | `Record<string, unknown>`                                                                                                                                                                                          | no       | —       | —           |
| `config.method`          | `"GET" \| "POST" \| "PUT" \| "DELETE"`                                                                                                                                                                             | yes      | —       | —           |
| `config.save_variables`  | `boolean`                                                                                                                                                                                                          | no       | —       | —           |
| `config.timeout`         | `number`                                                                                                                                                                                                           | no       | —       | —           |
| `config.url`             | `string`                                                                                                                                                                                                           | yes      | —       | —           |

## Returns

`this`

## Source

[`src/SwmlVerbMethods.generated.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts)

Line 137.
