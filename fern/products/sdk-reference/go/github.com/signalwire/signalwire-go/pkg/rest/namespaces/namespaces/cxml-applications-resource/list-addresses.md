---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/cxml-applications-resource/list-addresses"
title: "ListAddresses"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CxmlApplicationsResource.ListAddresses"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CxmlApplicationsResource"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/fabric.go"
---
# `ListAddresses`

ListAddresses lists addresses for a cXML application.

## Signature

```go
func (*CxmlApplicationsResource) ListAddresses(id string, params map[string]string) (map[string]any, error)
```

## Parameters

| Name     | Type                | Required | Default | Description |
| -------- | ------------------- | -------- | ------- | ----------- |
| `id`     | `string`            | yes      | —       | —           |
| `params` | `map[string]string` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/fabric.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/fabric.go)

Line 170.
