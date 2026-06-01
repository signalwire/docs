---
slug: "/reference/typescript/rest/namespaces/registry/registry-campaigns/update"
title: "update"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.registry.RegistryCampaigns.update"
  parent: "rest.namespaces.registry.RegistryCampaigns"
  module: "rest.namespaces.registry"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/registry.ts"
---
# `update`

Update a campaign's attributes.

## Signature

```typescript
update(campaignId: string, body: any): Promise<any>
```

## Parameters

| Name         | Type     | Required | Default | Description                                           |
| ------------ | -------- | -------- | ------- | ----------------------------------------------------- |
| `campaignId` | `string` | yes      | —       | Unique identifier of the campaign.                    |
| `body`       | `any`    | yes      | —       | Full updated campaign attributes (replace semantics). |

## Returns

`Promise<any>` — The updated campaign record.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/registry.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/registry.ts)

Line 100.
