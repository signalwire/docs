---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-registry-namespace"
title: "NewRegistryNamespace"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.NewRegistryNamespace"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/registry.go"
---
# `NewRegistryNamespace`

NewRegistryNamespace creates a new RegistryNamespace with all sub-resources.

## Signature

```go
func NewRegistryNamespace(client HTTPClient) *RegistryNamespace
```

## Parameters

| Name     | Type         | Required | Default | Description |
| -------- | ------------ | -------- | ------- | ----------- |
| `client` | `HTTPClient` | yes      | —       | —           |

## Returns

`*RegistryNamespace`

## Source

[`pkg/rest/namespaces/registry.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/registry.go)

Line 109.
