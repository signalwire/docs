---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/document/add-verb"
title: "AddVerb"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.Document.AddVerb"
  parent: "github.com/signalwire/signalwire-go/pkg/swml.Document"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/document.go"
---
# `AddVerb`

AddVerb appends a verb to the "main" section. Returns an error if the verb name is empty.

## Signature

```go
func (*Document) AddVerb(verbName string, config any) error
```

## Parameters

| Name       | Type     | Required | Default | Description |
| ---------- | -------- | -------- | ------- | ----------- |
| `verbName` | `string` | yes      | —       | —           |
| `config`   | `any`    | yes      | —       | —           |

## Returns

`error`

## Source

[`pkg/swml/document.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/document.go)

Line 66.
