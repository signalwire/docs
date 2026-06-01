---
slug: "/reference/typescript/serverless-adapter/serverless-adapter/generate-url"
title: "generateUrl"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ServerlessAdapter.ServerlessAdapter.generateUrl"
  parent: "ServerlessAdapter.ServerlessAdapter"
  module: "ServerlessAdapter"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ServerlessAdapter.ts"
---
# `generateUrl`

Generate the platform-specific invocation URL for a deployed function.

## Signature

```typescript
generateUrl(opts?: { ...5 fields }): string
```

## Parameters

| Name                | Type                                                                                             | Required | Default | Description                                                              |
| ------------------- | ------------------------------------------------------------------------------------------------ | -------- | ------- | ------------------------------------------------------------------------ |
| `opts`              | `{ apiId?: string; functionName?: string; projectId?: string; region?: string; stage?: string }` | no       | —       | Optional overrides for region, project, function name, stage, or API ID. |
| `opts.apiId`        | `string`                                                                                         | no       | —       | —                                                                        |
| `opts.functionName` | `string`                                                                                         | no       | —       | —                                                                        |
| `opts.projectId`    | `string`                                                                                         | no       | —       | —                                                                        |
| `opts.region`       | `string`                                                                                         | no       | —       | —                                                                        |
| `opts.stage`        | `string`                                                                                         | no       | —       | —                                                                        |

## Returns

`string` — The constructed URL string.

## Source

[`src/ServerlessAdapter.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ServerlessAdapter.ts)

Line 153.
