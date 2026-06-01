---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/fabric-tokens/create-subscriber-token"
title: "CreateSubscriberToken"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.FabricTokens.CreateSubscriberToken"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.FabricTokens"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/fabric.go"
---
# `CreateSubscriberToken`

CreateSubscriberToken creates a subscriber token.

## Signature

```go
func (*FabricTokens) CreateSubscriberToken(data map[string]any) (map[string]any, error)
```

## Parameters

| Name   | Type             | Required | Default | Description |
| ------ | ---------------- | -------- | ------- | ----------- |
| `data` | `map[string]any` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/fabric.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/fabric.go)

Line 287.
