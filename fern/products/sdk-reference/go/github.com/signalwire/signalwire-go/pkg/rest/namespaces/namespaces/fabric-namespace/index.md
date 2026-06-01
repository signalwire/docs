---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/fabric-namespace"
title: "FabricNamespace"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.FabricNamespace"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/fabric.go"
---
# `FabricNamespace`

FabricNamespace groups all Fabric API resource types.

## Signature

```go
type FabricNamespace struct
```

## Properties

| Name                   | Type                                         | Required | Default | Description                                                                                                                                                                                                              |
| ---------------------- | -------------------------------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `Addresses`            | `Addresses *FabricAddresses`                 | yes      | —       | —                                                                                                                                                                                                                        |
| `AIAgents`             | `AIAgents *FabricResource`                   | yes      | —       | —                                                                                                                                                                                                                        |
| `CallFlows`            | `CallFlows *CallFlowsResource`               | yes      | —       | —                                                                                                                                                                                                                        |
| `ConferenceRooms`      | `ConferenceRooms *ConferenceRoomsResource`   | yes      | —       | —                                                                                                                                                                                                                        |
| `CXMLApplications`     | `CXMLApplications *CxmlApplicationsResource` | yes      | —       | —                                                                                                                                                                                                                        |
| `CXMLScripts`          | `CXMLScripts *FabricResourcePUT`             | yes      | —       | —                                                                                                                                                                                                                        |
| `CXMLWebhooks`         | `CXMLWebhooks *CxmlWebhooksResource`         | yes      | —       | —                                                                                                                                                                                                                        |
| `FreeSwitchConnectors` | `FreeSwitchConnectors *FabricResourcePUT`    | yes      | —       | —                                                                                                                                                                                                                        |
| `RelayApplications`    | `RelayApplications *FabricResourcePUT`       | yes      | —       | —                                                                                                                                                                                                                        |
| `Resources`            | `Resources *GenericResources`                | yes      | —       | Special resources                                                                                                                                                                                                        |
| `SIPEndpoints`         | `SIPEndpoints *FabricResourcePUT`            | yes      | —       | —                                                                                                                                                                                                                        |
| `SIPGateways`          | `SIPGateways *FabricResource`                | yes      | —       | —                                                                                                                                                                                                                        |
| `Subscribers`          | `Subscribers *SubscribersResource`           | yes      | —       | —                                                                                                                                                                                                                        |
| `SWMLScripts`          | `SWMLScripts *FabricResourcePUT`             | yes      | —       | PUT-update resources                                                                                                                                                                                                     |
| `SWMLWebhooks`         | `SWMLWebhooks *SwmlWebhooksResource`         | yes      | —       | PATCH-update resources SWMLWebhooks and CXMLWebhooks are auto-materialized: prefer PhoneNumbers.SetSwmlWebhook / SetCxmlWebhook for creation. Direct .Create still works for backcompat but emits a deprecation warning. |
| `Tokens`               | `Tokens *FabricTokens`                       | yes      | —       | —                                                                                                                                                                                                                        |

## Source

[`pkg/rest/namespaces/fabric.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/fabric.go)

Line 333.
