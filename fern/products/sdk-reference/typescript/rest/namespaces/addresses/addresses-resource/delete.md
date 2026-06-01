---
slug: "/reference/typescript/rest/namespaces/addresses/addresses-resource/delete"
title: "delete"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.addresses.AddressesResource.delete"
  parent: "rest.namespaces.addresses.AddressesResource"
  module: "rest.namespaces.addresses"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/addresses.ts"
---
# `delete`

Delete an address.

## Signature

```typescript
delete(addressId: string): Promise<any>
```

## Parameters

| Name        | Type     | Required | Default | Description                       |
| ----------- | -------- | -------- | ------- | --------------------------------- |
| `addressId` | `string` | yes      | —       | Unique identifier of the address. |

## Returns

`Promise<any>` — The platform's delete response.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/addresses.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/addresses.ts)

Line 61.
