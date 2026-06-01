---
slug: "/reference/typescript/data-map/create-simple-api-tool"
title: "createSimpleApiTool"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "DataMap.createSimpleApiTool"
  parent: "DataMap"
  module: "DataMap"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/DataMap.ts"
---
# `createSimpleApiTool`

Create a DataMap tool that calls a single API endpoint and formats the response.

## Signature

```typescript
createSimpleApiTool(opts: { ...8 fields }): DataMap
```

## Parameters

| Name                    | Type                                                                                                                                                                                                                                                         | Required | Default | Description                                                                    |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- | ------- | ------------------------------------------------------------------------------ |
| `opts`                  | `{ body?: Record<string, unknown>; errorKeys?: string[]; headers?: Record<string, string>; method?: string; name: string; parameters?: Record<string, { description?: string; required?: boolean; type?: string }>; responseTemplate: string; url: string }` | yes      | —       | Configuration including name, URL, response template, and optional parameters. |
| `opts.body`             | `Record<string, unknown>`                                                                                                                                                                                                                                    | no       | —       | —                                                                              |
| `opts.errorKeys`        | `string[]`                                                                                                                                                                                                                                                   | no       | —       | —                                                                              |
| `opts.headers`          | `Record<string, string>`                                                                                                                                                                                                                                     | no       | —       | —                                                                              |
| `opts.method`           | `string`                                                                                                                                                                                                                                                     | no       | —       | —                                                                              |
| `opts.name`             | `string`                                                                                                                                                                                                                                                     | yes      | —       | —                                                                              |
| `opts.parameters`       | `Record<string, { description?: string; required?: boolean; type?: string }>`                                                                                                                                                                                | no       | —       | —                                                                              |
| `opts.responseTemplate` | `string`                                                                                                                                                                                                                                                     | yes      | —       | —                                                                              |
| `opts.url`              | `string`                                                                                                                                                                                                                                                     | yes      | —       | —                                                                              |

## Returns

`DataMap` — A configured DataMap instance ready for registration.

## Source

[`src/DataMap.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/DataMap.ts)

Line 430.
