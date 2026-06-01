---
slug: "/reference/dotnet/signal-wire.rest.namespaces/fabric"
title: "Fabric"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.REST.Namespaces.Fabric"
  parent: "SignalWire.REST.Namespaces"
  module: "SignalWire.REST.Namespaces"
  visibility: "public"
---
# `Fabric`

Fabric API namespace.

Groups all Fabric sub-resources (subscribers, SIP endpoints, call flows,
SWML scripts, conference rooms, AI agents, etc.) under a single object.
Each sub-resource is lazily initialised as a <xref href="SignalWire.REST.CrudResource" data-throw-if-not-resolved="false"></xref>
pointing at the correct API path under /api/fabric/resources.

## Signature

```dotnet
public class Fabric
```

## Properties

| Name                   | Type                                                         | Required | Default | Description                                                                                                                                     |
| ---------------------- | ------------------------------------------------------------ | -------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `Addresses`            | `public CrudResource Addresses { get; }`                     | yes      | —       | —                                                                                                                                               |
| `AddressesTopLevel`    | `public FabricAddresses AddressesTopLevel { get; }`          | yes      | —       | Top-level Fabric addresses (read-only — list/get) that lives at /api/fabric/addresses (NOT under /api/fabric/resources).                        |
| `AiAgents`             | `public CrudResource AiAgents { get; }`                      | yes      | —       | —                                                                                                                                               |
| `CallFlows`            | `public CrudResource CallFlows { get; }`                     | yes      | —       | —                                                                                                                                               |
| `CallFlowsOps`         | `public CallFlowsHelper CallFlowsOps { get; }`               | yes      | —       | CallFlows singular-path operations (list\_addresses, list\_versions, deploy\_version).                                                          |
| `CallQueues`           | `public CrudResource CallQueues { get; }`                    | yes      | —       | —                                                                                                                                               |
| `Client`               | `public HttpClient Client { get; }`                          | yes      | —       | —                                                                                                                                               |
| `ConferenceRooms`      | `public CrudResource ConferenceRooms { get; }`               | yes      | —       | —                                                                                                                                               |
| `ConferenceRoomsOps`   | `public ConferenceRoomsHelper ConferenceRoomsOps { get; }`   | yes      | —       | ConferenceRooms singular-path operations (list\_addresses).                                                                                     |
| `Conversations`        | `public CrudResource Conversations { get; }`                 | yes      | —       | —                                                                                                                                               |
| `CxmlApplications`     | `public CrudResource CxmlApplications { get; }`              | yes      | —       | —                                                                                                                                               |
| `CxmlApplicationsOps`  | `public CxmlApplicationsHelper CxmlApplicationsOps { get; }` | yes      | —       | cXML applications helper that exposes the deliberate NotImplementedException on Create (matching Python's `CxmlApplicationsResource.create`).   |
| `CxmlScripts`          | `public CrudResource CxmlScripts { get; }`                   | yes      | —       | —                                                                                                                                               |
| `CxmlWebhooks`         | `public CrudResource CxmlWebhooks { get; }`                  | yes      | —       | —                                                                                                                                               |
| `DialPlans`            | `public CrudResource DialPlans { get; }`                     | yes      | —       | —                                                                                                                                               |
| `FreeclimbApps`        | `public CrudResource FreeclimbApps { get; }`                 | yes      | —       | —                                                                                                                                               |
| `FreeswitchConnectors` | `public CrudResource FreeswitchConnectors { get; }`          | yes      | —       | —                                                                                                                                               |
| `PhoneNumbers`         | `public CrudResource PhoneNumbers { get; }`                  | yes      | —       | —                                                                                                                                               |
| `RelayApplications`    | `public CrudResource RelayApplications { get; }`             | yes      | —       | —                                                                                                                                               |
| `Resources`            | `public CrudResource Resources { get; }`                     | yes      | —       | —                                                                                                                                               |
| `ResourcesGeneric`     | `public FabricResources ResourcesGeneric { get; }`           | yes      | —       | Generic resources operations (list/get/delete/list\_addresses/ assign\_domain\_application) at /api/fabric/resources.                           |
| `SipEndpoints`         | `public CrudResource SipEndpoints { get; }`                  | yes      | —       | —                                                                                                                                               |
| `SipGateways`          | `public CrudResource SipGateways { get; }`                   | yes      | —       | —                                                                                                                                               |
| `SipProfiles`          | `public CrudResource SipProfiles { get; }`                   | yes      | —       | —                                                                                                                                               |
| `Subscribers`          | `public CrudResource Subscribers { get; }`                   | yes      | —       | —                                                                                                                                               |
| `SubscribersOps`       | `public SubscribersHelper SubscribersOps { get; }`           | yes      | —       | Subscriber-scoped SIP-endpoint operations (get/update/delete) under /api/fabric/resources/subscribers.                                          |
| `SwmlScripts`          | `public CrudResource SwmlScripts { get; }`                   | yes      | —       | —                                                                                                                                               |
| `SwmlWebhooks`         | `public CrudResource SwmlWebhooks { get; }`                  | yes      | —       | —                                                                                                                                               |
| `Tokens`               | `public CrudResource Tokens { get; }`                        | yes      | —       | Fabric tokens resource — note this lives at the top-level `/api/fabric/tokens` path, NOT under `/api/fabric/resources`.                         |
| `TokensApi`            | `public FabricTokens TokensApi { get; }`                     | yes      | —       | Subscriber/guest/invite/embed token endpoints under /api/fabric. Distinct from the per-account `Tokens` accessor which hits /api/fabric/tokens. |

## Methods

- [`Fabric(HttpClient)`](/reference/dotnet/signal-wire.rest.namespaces/fabric/fabric-http-client)
