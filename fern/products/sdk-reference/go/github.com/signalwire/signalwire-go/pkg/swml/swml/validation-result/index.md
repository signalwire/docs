---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/validation-result"
title: "ValidationResult"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.ValidationResult"
  parent: "github.com/signalwire/signalwire-go/pkg/swml"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/schema_utils.go"
---
# `ValidationResult`

ValidationResult mirrors Python's “Tuple\[bool, List\[str]]“ return shape used by ValidateVerb / ValidateDocument.

The cross-language type alias table maps this struct to the canonical “tuple\<bool,list\<string>>“ so audits accept it as Python-shaped.

## Signature

```go
type ValidationResult struct
```

## Properties

| Name     | Type              | Required | Default | Description |
| -------- | ----------------- | -------- | ------- | ----------- |
| `Errors` | `Errors []string` | yes      | —       | —           |
| `Valid`  | `Valid bool`      | yes      | —       | —           |

## Source

[`pkg/swml/schema_utils.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/schema_utils.go)

Line 53.
