---
slug: "/reference/typescript/rest/namespaces/fabric"
title: "fabric"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "module"
  language: "typescript"
  qualified_name: "rest.namespaces.fabric"
  module: "rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts"
---
# `fabric`

## Signature

```typescript
module fabric
```

## Classes

- [`AutoMaterializedWebhookResource`](/reference/typescript/rest/namespaces/fabric/auto-materialized-webhook-resource) — Fabric webhook resource that is normally auto-materialized by the corresponding `phoneNumbers.set*Webhook` helper.
- [`CallFlowsResource`](/reference/typescript/rest/namespaces/fabric/call-flows-resource) — Call flows with version management. Uses singular `call_flow` for sub-resource paths.
- [`ConferenceRoomsResource`](/reference/typescript/rest/namespaces/fabric/conference-rooms-resource) — Conference rooms — uses singular 'conference\_room' for sub-resource paths.
- [`CxmlApplicationsResource`](/reference/typescript/rest/namespaces/fabric/cxml-applications-resource) — cXML applications — no create method (read/update/delete only).
- [`CxmlWebhooksResource`](/reference/typescript/rest/namespaces/fabric/cxml-webhooks-resource) — Auto-materialized cXML webhook — normally created via `phoneNumbers.setCxmlWebhook`.
- [`FabricAddresses`](/reference/typescript/rest/namespaces/fabric/fabric-addresses) — Read-only fabric addresses.
- [`FabricNamespace`](/reference/typescript/rest/namespaces/fabric/fabric-namespace) — Fabric API namespace grouping all resource types.
- [`FabricResource`](/reference/typescript/rest/namespaces/fabric/fabric-resource) — Standard fabric resource with CRUD + addresses (PATCH updates).
- [`FabricResourcePUT`](/reference/typescript/rest/namespaces/fabric/fabric-resource-put) — Fabric resource that uses PUT for updates.
- [`FabricTokens`](/reference/typescript/rest/namespaces/fabric/fabric-tokens) — Subscriber, guest, invite, and embed token creation.
- [`GenericResources`](/reference/typescript/rest/namespaces/fabric/generic-resources) — Generic resource operations across all fabric resource types.
- [`SubscribersResource`](/reference/typescript/rest/namespaces/fabric/subscribers-resource) — Subscribers with SIP endpoint management.
- [`SwmlWebhooksResource`](/reference/typescript/rest/namespaces/fabric/swml-webhooks-resource) — Auto-materialized SWML webhook — normally created via `phoneNumbers.setSwmlWebhook`.

## Source

[`src/rest/namespaces/fabric.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts)

Line 1.
