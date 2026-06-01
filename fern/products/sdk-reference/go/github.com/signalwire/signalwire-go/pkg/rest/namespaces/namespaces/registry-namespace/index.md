---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/registry-namespace"
title: "RegistryNamespace"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.RegistryNamespace"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/registry.go"
---
# `RegistryNamespace`

RegistryNamespace groups all 10DLC Campaign Registry resources.

## Signature

```go
type RegistryNamespace struct
```

## Properties

| Name        | Type                           | Required | Default | Description |
| ----------- | ------------------------------ | -------- | ------- | ----------- |
| `Brands`    | `Brands *RegistryBrands`       | yes      | —       | —           |
| `Campaigns` | `Campaigns *RegistryCampaigns` | yes      | —       | —           |
| `Numbers`   | `Numbers *RegistryNumbers`     | yes      | —       | —           |
| `Orders`    | `Orders *RegistryOrders`       | yes      | —       | —           |

## Source

[`pkg/rest/namespaces/registry.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/registry.go)

Line 101.
