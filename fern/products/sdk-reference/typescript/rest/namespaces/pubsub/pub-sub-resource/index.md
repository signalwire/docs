---
slug: "/reference/typescript/rest/namespaces/pubsub/pub-sub-resource"
title: "PubSubResource"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "rest.namespaces.pubsub.PubSubResource"
  parent: "rest.namespaces.pubsub"
  module: "rest.namespaces.pubsub"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/pubsub.ts"
---
# `PubSubResource`

PubSub token generation.

Access via `client.pubsub.*`. Issues short-lived tokens that browser / mobile
clients can use to subscribe to project channels.

## Signature

```typescript
class PubSubResource extends BaseResource
```

## Inheritance

**Extends:** `BaseResource`

## Methods

- [`constructor`](/reference/typescript/rest/namespaces/pubsub/pub-sub-resource/constructor)
- [`createToken`](/reference/typescript/rest/namespaces/pubsub/pub-sub-resource/create-token) — Generate a short-lived PubSub token.

## Source

[`src/rest/namespaces/pubsub.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/pubsub.ts)

Line 16.
