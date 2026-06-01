---
slug: "/reference/typescript/rest/namespaces/fabric/subscribers-resource/delete-sip-endpoint"
title: "deleteSipEndpoint"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.fabric.SubscribersResource.deleteSipEndpoint"
  parent: "rest.namespaces.fabric.SubscribersResource"
  module: "rest.namespaces.fabric"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts"
---
# `deleteSipEndpoint`

Delete a SIP endpoint.

## Signature

```typescript
deleteSipEndpoint(subscriberId: string, endpointId: string): Promise<any>
```

## Parameters

| Name           | Type     | Required | Default | Description                            |
| -------------- | -------- | -------- | ------- | -------------------------------------- |
| `subscriberId` | `string` | yes      | —       | Unique identifier of the subscriber.   |
| `endpointId`   | `string` | yes      | —       | Unique identifier of the SIP endpoint. |

## Returns

`Promise<any>` — The platform's delete response.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/fabric.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts)

Line 157.
