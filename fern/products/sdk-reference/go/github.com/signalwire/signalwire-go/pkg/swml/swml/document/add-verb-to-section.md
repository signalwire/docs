---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/document/add-verb-to-section"
title: "AddVerbToSection"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.Document.AddVerbToSection"
  parent: "github.com/signalwire/signalwire-go/pkg/swml.Document"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/document.go"
---
# `AddVerbToSection`

AddVerbToSection appends a verb to a named section. Creates the section if it doesn't exist.

## Signature

```go
func (*Document) AddVerbToSection(section string, verbName string, config any) error
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

[`pkg/swml/document.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/document.go)

Line 72.
