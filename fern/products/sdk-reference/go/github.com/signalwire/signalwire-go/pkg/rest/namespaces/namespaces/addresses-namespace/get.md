---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/addresses-namespace/get"
title: "Get"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.AddressesNamespace.Get"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.AddressesNamespace"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/addresses.go"
---
# `Get`

Get retrieves an address by ID.

## Signature

```go
func (*AddressesNamespace) Get(id string) (map[string]any, error)
```

## Parameters

| Name | Type     | Required | Default | Description |
| ---- | -------- | -------- | ------- | ----------- |
| `id` | `string` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/addresses.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/addresses.go)

Line 33.
