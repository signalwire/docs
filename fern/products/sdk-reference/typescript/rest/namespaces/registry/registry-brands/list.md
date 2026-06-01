---
slug: "/reference/typescript/rest/namespaces/registry/registry-brands/list"
title: "list"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.registry.RegistryBrands.list"
  parent: "rest.namespaces.registry.RegistryBrands"
  module: "rest.namespaces.registry"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/registry.ts"
---
# `list`

List all 10DLC brands in the project.

## Signature

```typescript
list(params?: QueryParams): Promise<any>
```

## Parameters

| Name     | Type          | Required | Default | Description                                    |
| -------- | ------------- | -------- | ------- | ---------------------------------------------- |
| `params` | `QueryParams` | no       | —       | Optional filter / pagination query parameters. |

## Returns

`Promise<any>` — A paginated list of brands.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/registry.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/registry.ts)

Line 24.
