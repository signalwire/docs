---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/registry-orders/get"
title: "Get"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.RegistryOrders.Get"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.RegistryOrders"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/registry.go"
---
# `Get`

Get retrieves an order by ID.

## Signature

```go
func (*RegistryOrders) Get(orderID string) (map[string]any, error)
```

## Parameters

| Name      | Type     | Required | Default | Description |
| --------- | -------- | -------- | ------- | ----------- |
| `orderID` | `string` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/registry.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/registry.go)

Line 82.
