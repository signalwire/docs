---
slug: "/reference/typescript/rest/base/base-resource/base-resource/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.base.BaseResource.BaseResource.constructor"
  parent: "rest.base.BaseResource.BaseResource"
  module: "rest.base.BaseResource"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/BaseResource.ts"
---
# `constructor`

## Signature

```typescript
constructor(http: HttpClient, basePath: string): BaseResource
```

## Parameters

| Name       | Type         | Required | Default | Description                                                    |
| ---------- | ------------ | -------- | ------- | -------------------------------------------------------------- |
| `http`     | `HttpClient` | yes      | —       | Shared HTTP client to issue requests through.                  |
| `basePath` | `string`     | yes      | —       | Absolute path prefix (e.g. `'/api/relay/rest/phone_numbers'`). |

## Returns

`BaseResource`

## Source

[`src/rest/base/BaseResource.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/BaseResource.ts)

Line 18.
