---
slug: "/reference/typescript/rest/namespaces/fabric/subscribers-resource/list-sip-endpoints"
title: "listSipEndpoints"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.fabric.SubscribersResource.listSipEndpoints"
  parent: "rest.namespaces.fabric.SubscribersResource"
  module: "rest.namespaces.fabric"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts"
---
# `listSipEndpoints`

List the SIP endpoints registered under a subscriber.

## Signature

```typescript
listSipEndpoints(subscriberId: string, params?: QueryParams): Promise<any>
```

## Parameters

| Name           | Type          | Required | Default | Description                                    |
| -------------- | ------------- | -------- | ------- | ---------------------------------------------- |
| `subscriberId` | `string`      | yes      | —       | Unique identifier of the subscriber.           |
| `params`       | `QueryParams` | no       | —       | Optional filter / pagination query parameters. |

## Returns

`Promise<any>` — A paginated list of SIP endpoints.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/fabric.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts)

Line 108.
