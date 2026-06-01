---
slug: "/reference/typescript/rest/namespaces/addresses/addresses-resource/create"
title: "create"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.addresses.AddressesResource.create"
  parent: "rest.namespaces.addresses.AddressesResource"
  module: "rest.namespaces.addresses"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/addresses.ts"
---
# `create`

Create a new address.

## Signature

```typescript
create(body: any): Promise<any>
```

## Parameters

| Name   | Type  | Required | Default | Description                                             |
| ------ | ----- | -------- | ------- | ------------------------------------------------------- |
| `body` | `any` | yes      | —       | Address attributes (name, display name, context, etc.). |

## Returns

`Promise<any>` — The newly-created address.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/addresses.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/addresses.ts)

Line 39.
