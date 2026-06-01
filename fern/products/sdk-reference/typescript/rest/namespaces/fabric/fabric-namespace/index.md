---
slug: "/reference/typescript/rest/namespaces/fabric/fabric-namespace"
title: "FabricNamespace"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "rest.namespaces.fabric.FabricNamespace"
  parent: "rest.namespaces.fabric"
  module: "rest.namespaces.fabric"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts"
---
# `FabricNamespace`

Fabric API namespace grouping all resource types.

Access via `client.fabric.*`.

## Signature

```typescript
class FabricNamespace
```

## Examples

```typescript
const agents = await client.fabric.aiAgents.list();
const flow = await client.fabric.callFlows.create({ name: 'main-ivr' });
const token = await client.fabric.tokens.createSubscriberToken({ subscriber_id: 'sub_123' });
```

## Properties

| Name                   | Type                       | Required | Default | Description                                                                                                                                                                                                                                                                   |
| ---------------------- | -------------------------- | -------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `addresses`            | `FabricAddresses`          | yes      | —       | Read-only access to the unified fabric address table.                                                                                                                                                                                                                         |
| `aiAgents`             | `FabricResource`           | yes      | —       | AI Agent CRUD — the platform-managed agent registration resource.                                                                                                                                                                                                             |
| `callFlows`            | `CallFlowsResource`        | yes      | —       | Call Flow CRUD with version listing and publishing.                                                                                                                                                                                                                           |
| `conferenceRooms`      | `ConferenceRoomsResource`  | yes      | —       | Conference Room CRUD with address listing.                                                                                                                                                                                                                                    |
| `cxmlApplications`     | `CxmlApplicationsResource` | yes      | —       | cXML application read / update / delete (no create).                                                                                                                                                                                                                          |
| `cxmlScripts`          | `FabricResourcePUT`        | yes      | —       | cXML (LaML) script CRUD.                                                                                                                                                                                                                                                      |
| `cxmlWebhooks`         | `CxmlWebhooksResource`     | yes      | —       | cXML webhook CRUD. **Auto-materialized** as a side-effect of [PhoneNumbersResource.setCxmlWebhook](/reference/typescript/rest/namespaces/phone-numbers/phone-numbers-resource/set-cxml-webhook); direct `create` produces an orphan resource and emits a deprecation warning. |
| `freeswitchConnectors` | `FabricResourcePUT`        | yes      | —       | FreeSWITCH Connector CRUD.                                                                                                                                                                                                                                                    |
| `relayApplications`    | `FabricResourcePUT`        | yes      | —       | Relay Application CRUD (full-replacement `PUT` update).                                                                                                                                                                                                                       |
| `resources`            | `GenericResources`         | yes      | —       | Generic operations across all resource types (list, get, delete, phone route assignment).                                                                                                                                                                                     |
| `sipEndpoints`         | `FabricResourcePUT`        | yes      | —       | Top-level SIP endpoint CRUD.                                                                                                                                                                                                                                                  |
| `sipGateways`          | `FabricResource`           | yes      | —       | SIP Gateway CRUD.                                                                                                                                                                                                                                                             |
| `subscribers`          | `SubscribersResource`      | yes      | —       | Subscriber CRUD plus nested SIP endpoint management.                                                                                                                                                                                                                          |
| `swmlScripts`          | `FabricResourcePUT`        | yes      | —       | SWML script CRUD (full-replacement `PUT` update).                                                                                                                                                                                                                             |
| `swmlWebhooks`         | `SwmlWebhooksResource`     | yes      | —       | SWML webhook CRUD. **Auto-materialized** as a side-effect of [PhoneNumbersResource.setSwmlWebhook](/reference/typescript/rest/namespaces/phone-numbers/phone-numbers-resource/set-swml-webhook); direct `create` produces an orphan resource and emits a deprecation warning. |
| `tokens`               | `FabricTokens`             | yes      | —       | Subscriber, guest, invite, and embed token generation.                                                                                                                                                                                                                        |

## Methods

- [`constructor`](/reference/typescript/rest/namespaces/fabric/fabric-namespace/constructor)

## Source

[`src/rest/namespaces/fabric.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts)

Line 428.
