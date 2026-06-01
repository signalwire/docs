---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/swaig-pre-dispatch"
title: "SwaigPreDispatch"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.Service.SwaigPreDispatch"
  parent: "github.com/signalwire/signalwire-go/pkg/swml.Service"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go"
---
# `SwaigPreDispatch`

SwaigPreDispatch is an extension hook invoked between argument parsing and function dispatch on POST /swaig. It returns a target Service to dispatch on (defaults to s) and an optional short-circuit response. Subclasses (AgentBase) override to add session-token validation or ephemeral dynamic-config copies.

## Signature

```go
func (*Service) SwaigPreDispatch(requestData map[string]any, funcName string) (target *Service, shortCircuit map[string]any)
```

## Parameters

| Name          | Type             | Required | Default | Description |
| ------------- | ---------------- | -------- | ------- | ----------- |
| `requestData` | `map[string]any` | yes      | —       | —           |
| `funcName`    | `string`         | yes      | —       | —           |

## Returns

`(*Service, map[string]any)`

## Source

[`pkg/swml/service.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go)

Line 1336.
