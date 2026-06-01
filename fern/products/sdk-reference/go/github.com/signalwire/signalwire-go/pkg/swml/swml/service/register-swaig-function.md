---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/register-swaig-function"
title: "RegisterSwaigFunction"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.Service.RegisterSwaigFunction"
  parent: "github.com/signalwire/signalwire-go/pkg/swml.Service"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go"
---
# `RegisterSwaigFunction`

RegisterSwaigFunction registers a raw SWAIG function definition (e.g. DataMap tools that have no local handler). The map must contain a "function" key giving the tool name.

## Signature

```go
func (*Service) RegisterSwaigFunction(funcDef map[string]any) *Service
```

## Parameters

| Name      | Type             | Required | Default | Description |
| --------- | ---------------- | -------- | ------- | ----------- |
| `funcDef` | `map[string]any` | yes      | —       | —           |

## Returns

`*Service`

## Source

[`pkg/swml/service.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go)

Line 1277.
