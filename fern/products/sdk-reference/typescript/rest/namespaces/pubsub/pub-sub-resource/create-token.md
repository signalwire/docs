---
slug: "/reference/typescript/rest/namespaces/pubsub/pub-sub-resource/create-token"
title: "createToken"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.pubsub.PubSubResource.createToken"
  parent: "rest.namespaces.pubsub.PubSubResource"
  module: "rest.namespaces.pubsub"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/pubsub.ts"
---
# `createToken`

Generate a short-lived PubSub token.

## Signature

```typescript
createToken(body: any): Promise<any>
```

## Parameters

| Name   | Type  | Required | Default | Description                                                 |
| ------ | ----- | -------- | ------- | ----------------------------------------------------------- |
| `body` | `any` | yes      | —       | Token payload (e.g. `{ namespace, channels, expires_in }`). |

## Returns

`Promise<any>` — The token record, typically `{ token: "eyJ..." }`.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/pubsub.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/pubsub.ts)

Line 28.
