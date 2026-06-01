---
slug: "/reference/typescript/rest/namespaces/registry/registry-campaigns/create-order"
title: "createOrder"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.registry.RegistryCampaigns.createOrder"
  parent: "rest.namespaces.registry.RegistryCampaigns"
  module: "rest.namespaces.registry"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/registry.ts"
---
# `createOrder`

Create a new number-assignment order against a campaign.

## Signature

```typescript
createOrder(campaignId: string, body: any): Promise<any>
```

## Parameters

| Name         | Type     | Required | Default | Description                             |
| ------------ | -------- | -------- | ------- | --------------------------------------- |
| `campaignId` | `string` | yes      | —       | Unique identifier of the campaign.      |
| `body`       | `any`    | yes      | —       | Order payload (phone number IDs, etc.). |

## Returns

`Promise<any>` — The newly-created order record.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/registry.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/registry.ts)

Line 136.
