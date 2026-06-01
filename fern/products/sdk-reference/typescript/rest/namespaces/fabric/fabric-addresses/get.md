---
slug: "/reference/typescript/rest/namespaces/fabric/fabric-addresses/get"
title: "get"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.fabric.FabricAddresses.get"
  parent: "rest.namespaces.fabric.FabricAddresses"
  module: "rest.namespaces.fabric"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts"
---
# `get`

Fetch a single fabric address by ID.

## Signature

```typescript
get(addressId: string): Promise<any>
```

## Parameters

| Name        | Type     | Required | Default | Description                       |
| ----------- | -------- | -------- | ------- | --------------------------------- |
| `addressId` | `string` | yes      | —       | Unique identifier of the address. |

## Returns

`Promise<any>` — The address record.

## Throws

- On any non-2xx HTTP response (including `404`).

## Source

[`src/rest/namespaces/fabric.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts)

Line 348.
