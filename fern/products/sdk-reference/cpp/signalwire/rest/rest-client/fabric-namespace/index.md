---
slug: "/reference/cpp/signalwire/rest/rest-client/fabric-namespace"
title: "FabricNamespace"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::FabricNamespace"
  parent: "signalwire::rest::RestClient"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `FabricNamespace`

## Signature

```cpp
struct signalwire::rest::RestClient::FabricNamespace
```

## Properties

| Name                    | Type                                       | Required | Default | Description |
| ----------------------- | ------------------------------------------ | -------- | ------- | ----------- |
| `addresses`             | `FabricAddresses addresses`                | yes      | —       | —           |
| `agents`                | `CrudResource agents`                      | yes      | —       | —           |
| `ai_agents`             | `FabricResource ai_agents`                 | yes      | —       | —           |
| `call_flows`            | `FabricCallFlows call_flows`               | yes      | —       | —           |
| `conference_rooms`      | `FabricConferenceRooms conference_rooms`   | yes      | —       | —           |
| `conferences`           | `CrudResource conferences`                 | yes      | —       | —           |
| `cxml_applications`     | `FabricCxmlApplications cxml_applications` | yes      | —       | —           |
| `cxml_scripts`          | `FabricResourcePUT cxml_scripts`           | yes      | —       | —           |
| `cxml_webhooks`         | `FabricResource cxml_webhooks`             | yes      | —       | —           |
| `domains`               | `CrudResource domains`                     | yes      | —       | —           |
| `freeswitch_connectors` | `FabricResourcePUT freeswitch_connectors`  | yes      | —       | —           |
| `relay_applications`    | `FabricResourcePUT relay_applications`     | yes      | —       | —           |
| `resources`             | `FabricGenericResources resources`         | yes      | —       | —           |
| `routing`               | `CrudResource routing`                     | yes      | —       | —           |
| `sip_endpoints`         | `FabricResourcePUT sip_endpoints`          | yes      | —       | —           |
| `sip_gateways`          | `FabricResource sip_gateways`              | yes      | —       | —           |
| `subscribers`           | `FabricSubscribers subscribers`            | yes      | —       | —           |
| `swml_scripts`          | `FabricResourcePUT swml_scripts`           | yes      | —       | —           |
| `swml_webhooks`         | `FabricResource swml_webhooks`             | yes      | —       | —           |
| `tokens`                | `FabricTokens tokens`                      | yes      | —       | —           |
| `topics`                | `CrudResource topics`                      | yes      | —       | —           |
| `webhooks`              | `CrudResource webhooks`                    | yes      | —       | —           |

## Methods

- [`FabricNamespace`](/reference/cpp/signalwire/rest/rest-client/fabric-namespace/fabric-namespace)

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 209.
