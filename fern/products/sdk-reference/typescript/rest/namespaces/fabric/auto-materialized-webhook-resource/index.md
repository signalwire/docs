---
slug: "/reference/typescript/rest/namespaces/fabric/auto-materialized-webhook-resource"
title: "AutoMaterializedWebhookResource"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "rest.namespaces.fabric.AutoMaterializedWebhookResource"
  parent: "rest.namespaces.fabric"
  module: "rest.namespaces.fabric"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts"
---
# `AutoMaterializedWebhookResource`

Fabric webhook resource that is normally auto-materialized by the
corresponding `phoneNumbers.set*Webhook` helper.

Creating directly produces an orphan Fabric resource that isn't bound to
any phone number — the API's binding model configures the webhook on the
phone number, and the server materializes the Fabric resource as a
side-effect.  `create` remains for backwards compatibility but emits a
one-time deprecation warning on first call.

See the porting-sdk's `phone-binding.md` for the full model.

## Signature

```typescript
class AutoMaterializedWebhookResource extends FabricResource
```

## Inheritance

**Extends:** [FabricResource](/reference/typescript/rest/namespaces/fabric/fabric-resource)

## Methods

- [`constructor`](/reference/typescript/rest/namespaces/fabric/auto-materialized-webhook-resource/constructor)
- [`create`](/reference/typescript/rest/namespaces/fabric/auto-materialized-webhook-resource/create)
- [`delete`](/reference/typescript/rest/namespaces/fabric/auto-materialized-webhook-resource/delete) — Delete a resource by ID.
- [`get`](/reference/typescript/rest/namespaces/fabric/auto-materialized-webhook-resource/get) — Fetch a single resource by ID.
- [`list`](/reference/typescript/rest/namespaces/fabric/auto-materialized-webhook-resource/list) — List resources with optional query parameters.
- [`listAddresses`](/reference/typescript/rest/namespaces/fabric/auto-materialized-webhook-resource/list-addresses) — List addresses associated with a specific resource instance.
- [`update`](/reference/typescript/rest/namespaces/fabric/auto-materialized-webhook-resource/update) — Update a resource by ID.

## Source

[`src/rest/namespaces/fabric.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts)

Line 185.
