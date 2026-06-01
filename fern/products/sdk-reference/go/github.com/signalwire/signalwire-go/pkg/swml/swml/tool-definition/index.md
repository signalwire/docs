---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/tool-definition"
title: "ToolDefinition"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.ToolDefinition"
  parent: "github.com/signalwire/signalwire-go/pkg/swml"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go"
---
# `ToolDefinition`

ToolDefinition is a SWAIG tool registered on the Service.

## Signature

```go
type ToolDefinition struct
```

## Properties

| Name          | Type                        | Required | Default | Description |
| ------------- | --------------------------- | -------- | ------- | ----------- |
| `Description` | `Description string`        | yes      | —       | —           |
| `Handler`     | `Handler ToolHandler`       | yes      | —       | —           |
| `Name`        | `Name string`               | yes      | —       | —           |
| `Parameters`  | `Parameters map[string]any` | yes      | —       | —           |
| `Secure`      | `Secure bool`               | yes      | —       | —           |

## Source

[`pkg/swml/service.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go)

Line 26.
