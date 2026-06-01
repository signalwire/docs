---
slug: "/reference/typescript/rest/namespaces/fabric/fabric-tokens"
title: "FabricTokens"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "rest.namespaces.fabric.FabricTokens"
  parent: "rest.namespaces.fabric"
  module: "rest.namespaces.fabric"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts"
---
# `FabricTokens`

Subscriber, guest, invite, and embed token creation.

## Signature

```typescript
class FabricTokens extends BaseResource
```

## Inheritance

**Extends:** `BaseResource`

## Methods

- [`constructor`](/reference/typescript/rest/namespaces/fabric/fabric-tokens/constructor)
- [`createEmbedToken`](/reference/typescript/rest/namespaces/fabric/fabric-tokens/create-embed-token) — Issue a short-lived embed token for browser-side SignalWire widgets.
- [`createGuestToken`](/reference/typescript/rest/namespaces/fabric/fabric-tokens/create-guest-token) — Issue a guest token (no subscriber account required).
- [`createInviteToken`](/reference/typescript/rest/namespaces/fabric/fabric-tokens/create-invite-token) — Create a single-use invite token for onboarding a new subscriber.
- [`createSubscriberToken`](/reference/typescript/rest/namespaces/fabric/fabric-tokens/create-subscriber-token) — Issue a new subscriber JWT used by end-user clients.
- [`refreshSubscriberToken`](/reference/typescript/rest/namespaces/fabric/fabric-tokens/refresh-subscriber-token) — Refresh an existing subscriber JWT, extending its lifetime.

## Source

[`src/rest/namespaces/fabric.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts)

Line 354.
