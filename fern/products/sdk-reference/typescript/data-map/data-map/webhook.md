---
slug: "/reference/typescript/data-map/data-map/webhook"
title: "webhook"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "DataMap.DataMap.webhook"
  parent: "DataMap.DataMap"
  module: "DataMap"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/DataMap.ts"
---
# `webhook`

Add a webhook that is called when this data map tool is invoked.

## Signature

```typescript
webhook(method: string, url: string, opts?: { ...4 fields }): this
```

## Parameters

| Name                     | Type                                                                                                            | Required | Default | Description                                                   |
| ------------------------ | --------------------------------------------------------------------------------------------------------------- | -------- | ------- | ------------------------------------------------------------- |
| `method`                 | `string`                                                                                                        | yes      | —       | HTTP method (e.g., "GET", "POST").                            |
| `url`                    | `string`                                                                                                        | yes      | —       | The webhook URL to call.                                      |
| `opts`                   | `{ formParam?: string; headers?: Record<string, string>; inputArgsAsParams?: boolean; requireArgs?: string[] }` | no       | —       | Optional headers, form parameter name, and argument settings. |
| `opts.formParam`         | `string`                                                                                                        | no       | —       | —                                                             |
| `opts.headers`           | `Record<string, string>`                                                                                        | no       | —       | —                                                             |
| `opts.inputArgsAsParams` | `boolean`                                                                                                       | no       | —       | —                                                             |
| `opts.requireArgs`       | `string[]`                                                                                                      | no       | —       | —                                                             |

## Returns

`this` — This instance for chaining.

## Source

[`src/DataMap.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/DataMap.ts)

Line 257.
