---
slug: "/reference/typescript/rest/namespaces/registry/registry-campaigns/list-numbers"
title: "listNumbers"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.registry.RegistryCampaigns.listNumbers"
  parent: "rest.namespaces.registry.RegistryCampaigns"
  module: "rest.namespaces.registry"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/registry.ts"
---
# `listNumbers`

List the phone numbers assigned to a campaign.

## Signature

```typescript
listNumbers(campaignId: string, params?: QueryParams): Promise<any>
```

## Parameters

| Name         | Type          | Required | Default | Description                                    |
| ------------ | ------------- | -------- | ------- | ---------------------------------------------- |
| `campaignId` | `string`      | yes      | —       | Unique identifier of the campaign.             |
| `params`     | `QueryParams` | no       | —       | Optional filter / pagination query parameters. |

## Returns

`Promise<any>` — A paginated list of assigned numbers.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/registry.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/registry.ts)

Line 112.
