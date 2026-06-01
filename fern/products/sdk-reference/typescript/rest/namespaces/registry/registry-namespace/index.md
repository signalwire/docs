---
slug: "/reference/typescript/rest/namespaces/registry/registry-namespace"
title: "RegistryNamespace"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "rest.namespaces.registry.RegistryNamespace"
  parent: "rest.namespaces.registry"
  module: "rest.namespaces.registry"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/registry.ts"
---
# `RegistryNamespace`

10DLC Campaign Registry namespace.

Access via `client.registry.*`. Groups brand, campaign, order, and number
resources for US A2P 10DLC compliance registration.

## Signature

```typescript
class RegistryNamespace
```

## Properties

| Name        | Type                | Required | Default | Description                                                |
| ----------- | ------------------- | -------- | ------- | ---------------------------------------------------------- |
| `brands`    | `RegistryBrands`    | yes      | —       | 10DLC brand CRUD and nested campaign operations.           |
| `campaigns` | `RegistryCampaigns` | yes      | —       | 10DLC campaign CRUD, number listing, and order management. |
| `numbers`   | `RegistryNumbers`   | yes      | —       | 10DLC number assignment removal.                           |
| `orders`    | `RegistryOrders`    | yes      | —       | 10DLC number-assignment order read access.                 |

## Methods

- [`constructor`](/reference/typescript/rest/namespaces/registry/registry-namespace/constructor)

## Source

[`src/rest/namespaces/registry.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/registry.ts)

Line 183.
