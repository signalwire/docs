---
slug: "/reference/typescript/rest/namespaces/fabric/subscribers-resource/create-sip-endpoint"
title: "createSipEndpoint"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.fabric.SubscribersResource.createSipEndpoint"
  parent: "rest.namespaces.fabric.SubscribersResource"
  module: "rest.namespaces.fabric"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts"
---
# `createSipEndpoint`

Register a new SIP endpoint under a subscriber.

## Signature

```typescript
createSipEndpoint(subscriberId: string, body: any): Promise<any>
```

## Parameters

| Name           | Type     | Required | Default | Description                                       |
| -------------- | -------- | -------- | ------- | ------------------------------------------------- |
| `subscriberId` | `string` | yes      | —       | Unique identifier of the subscriber.              |
| `body`         | `any`    | yes      | —       | SIP endpoint payload (credentials, codecs, etc.). |

## Returns

`Promise<any>` — The newly-created SIP endpoint record.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/fabric.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts)

Line 120.
