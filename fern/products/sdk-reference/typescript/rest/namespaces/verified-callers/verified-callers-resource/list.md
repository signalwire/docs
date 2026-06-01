---
slug: "/reference/typescript/rest/namespaces/verified-callers/verified-callers-resource/list"
title: "list"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.verified-callers.VerifiedCallersResource.list"
  parent: "rest.namespaces.verified-callers.VerifiedCallersResource"
  module: "rest.namespaces.verified-callers"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/CrudResource.ts"
---
# `list`

List resources with optional query parameters.

## Signature

```typescript
list(params?: QueryParams): Promise<any>
```

## Parameters

| Name     | Type          | Required | Default | Description                                    |
| -------- | ------------- | -------- | ------- | ---------------------------------------------- |
| `params` | `QueryParams` | no       | —       | Optional filter / pagination query parameters. |

## Returns

`Promise<any>` — The paginated list response.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/base/CrudResource.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/CrudResource.ts)

Line 44.
