---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/execute-verb-to-section"
title: "ExecuteVerbToSection"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.Service.ExecuteVerbToSection"
  parent: "github.com/signalwire/signalwire-go/pkg/swml.Service"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go"
---
# `ExecuteVerbToSection`

ExecuteVerbToSection adds a SWML verb to a named section.

## Signature

```go
func (*Service) ExecuteVerbToSection(section string, verbName string, config any) error
```

## Parameters

| Name       | Type     | Required | Default | Description |
| ---------- | -------- | -------- | ------- | ----------- |
| `section`  | `string` | yes      | —       | —           |
| `verbName` | `string` | yes      | —       | —           |
| `config`   | `any`    | yes      | —       | —           |

## Returns

`error`

## Source

[`pkg/swml/service.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go)

Line 611.
