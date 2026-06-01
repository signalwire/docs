---
slug: "/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/fabric-namespace"
title: "FabricNamespace"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.namespaces.FabricNamespace"
  parent: "com.signalwire.sdk.rest.namespaces"
  module: "com.signalwire.sdk.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/FabricNamespace.java"
  visibility: "public"
---
# `FabricNamespace`

REST namespace for SignalWire Fabric resources.

<p>Mirrors `signalwire.rest.namespaces.fabric.FabricNamespace`: the
 sub-resources expose typed access to addresses, generic resources,
 subscribers (with sip-endpoint sub-resource ops), call-flow / conference-room
 address sub-paths, cxml-applications (read-only), and tokens. The
 `resources` entry-point handles cross-resource list/get/delete plus
 domain-application assignment.

## Signature

```java
public class FabricNamespace
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/fabric-namespace/init)
- [`addresses`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/fabric-namespace/addresses)
- [`aiAgents`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/fabric-namespace/ai-agents)
- [`callFlows`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/fabric-namespace/call-flows)
- [`conferenceRooms`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/fabric-namespace/conference-rooms)
- [`cxmlApplications`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/fabric-namespace/cxml-applications)
- [`cxmlScripts`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/fabric-namespace/cxml-scripts)
- [`cxmlWebhooks`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/fabric-namespace/cxml-webhooks)
- [`freeswitchConnectors`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/fabric-namespace/freeswitch-connectors)
- [`relayApplications`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/fabric-namespace/relay-applications)
- [`resources`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/fabric-namespace/resources)
- [`sipEndpoints`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/fabric-namespace/sip-endpoints)
- [`sipGateways`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/fabric-namespace/sip-gateways)
- [`subscribers`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/fabric-namespace/subscribers)
- [`swmlScripts`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/fabric-namespace/swml-scripts)
- [`swmlWebhooks`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/fabric-namespace/swml-webhooks)
- [`tokens`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/fabric-namespace/tokens)

## Classes

- [`CallFlowsResource`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/fabric-namespace/call-flows-resource) — Call flows resource \u2014 uses PUT for update and rewrites the path segment to singular `call_flow` for sub-collection paths (per the API spec).
- [`ConferenceRoomsResource`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/fabric-namespace/conference-rooms-resource) — Conference rooms \u2014 singular `conference_room` for sub-collections.
- [`CxmlApplicationsResource`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/fabric-namespace/cxml-applications-resource) — cXML applications \u2014 read/update/delete only (no create endpoint exists).
- [`FabricAddresses`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/fabric-namespace/fabric-addresses) — Read-only fabric addresses collection (top-level).
- [`FabricSubscribers`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/fabric-namespace/fabric-subscribers) — Subscribers resource with SIP-endpoint sub-resource.
- [`FabricTokens`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/fabric-namespace/fabric-tokens) — Subscriber, guest, invite, and embed token endpoints (all POST).
- [`GenericResources`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/fabric-namespace/generic-resources) — Generic operations against `/api/fabric/resources`: list, get, delete, plus address listing and domain-application assignment.

## Source

[`src/main/java/com/signalwire/sdk/rest/namespaces/FabricNamespace.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/FabricNamespace.java)

Line 24.
