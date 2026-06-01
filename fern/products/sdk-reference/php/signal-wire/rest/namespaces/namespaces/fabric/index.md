---
slug: "/reference/php/signal-wire/rest/namespaces/namespaces/fabric"
title: "Fabric"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\REST\\Namespaces\\Fabric"
  parent: "SignalWire\\REST\\Namespaces"
  module: "SignalWire.REST.Namespaces"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/Namespaces/Fabric.php"
---
# `Fabric`

Fabric API namespace.

Mirrors Python `signalwire.rest.namespaces.fabric.FabricNamespace`:
groups all Fabric sub-resources (subscribers, SIP endpoints, call flows,
SWML scripts, conference rooms, AI agents, etc.) under a single object.

Sub-resources fall into a few buckets:

- PUT-update CRUD: `swml_scripts`, `relay_applications`,
  `call_flows`, `conference_rooms`, `freeswitch_connectors`,
  `subscribers`, `sip_endpoints`, `cxml_scripts`,
  `cxml_applications`.
- PATCH-update CRUD: `swml_webhooks`, `ai_agents`, `sip_gateways`,
  `cxml_webhooks`.
- Special:  `resources` (generic `/api/fabric/resources`),
  `addresses` (read-only `/api/fabric/addresses`), `tokens`
  (subscriber/guest/embed token creation).

## Signature

```php
class Fabric
```

## Methods

- [`__construct`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric/construct)
- [`addresses`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric/addresses) — Read-only fabric addresses (`/api/fabric/addresses`).
- [`aiAgents`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric/ai-agents)
- [`callFlows`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric/call-flows)
- [`callQueues`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric/call-queues)
- [`conferenceRooms`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric/conference-rooms)
- [`conversations`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric/conversations)
- [`cxmlApplications`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric/cxml-applications)
- [`cxmlScripts`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric/cxml-scripts)
- [`cxmlWebhooks`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric/cxml-webhooks)
- [`dialPlans`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric/dial-plans)
- [`freeclimbApps`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric/freeclimb-apps)
- [`freeswitchConnectors`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric/freeswitch-connectors)
- [`getClient`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric/get-client)
- [`phoneNumbers`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric/phone-numbers)
- [`relayApplications`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric/relay-applications)
- [`resources`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric/resources) — Generic operations across all fabric resource types
- [`sipEndpoints`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric/sip-endpoints)
- [`sipGateways`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric/sip-gateways)
- [`sipProfiles`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric/sip-profiles)
- [`subscribers`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric/subscribers)
- [`swmlScripts`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric/swml-scripts)
- [`swmlWebhooks`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric/swml-webhooks)
- [`tokens`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric/tokens) — Subscriber / guest / invite / embed token creation

## Source

[`/src/src/SignalWire/REST/Namespaces/Fabric.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/Namespaces/Fabric.php)

Line 28.
