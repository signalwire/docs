---
slug: "/reference/typescript/rest/namespaces/fabric/subscribers-resource/update-sip-endpoint"
title: "updateSipEndpoint"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.fabric.SubscribersResource.updateSipEndpoint"
  parent: "rest.namespaces.fabric.SubscribersResource"
  module: "rest.namespaces.fabric"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts"
---
# `updateSipEndpoint`

Update a SIP endpoint's settings.

## Signature

```typescript
updateSipEndpoint(
  subscriberId: string,
  endpointId: string,
  body: any
): Promise<any>
```

## Parameters

| Name           | Type     | Required | Default | Description                               |
| -------------- | -------- | -------- | ------- | ----------------------------------------- |
| `subscriberId` | `string` | yes      | —       | Unique identifier of the subscriber.      |
| `endpointId`   | `string` | yes      | —       | Unique identifier of the SIP endpoint.    |
| `body`         | `any`    | yes      | —       | Partial update payload (PATCH semantics). |

## Returns

`Promise<any>` — The updated SIP endpoint record.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/fabric.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts)

Line 145.
