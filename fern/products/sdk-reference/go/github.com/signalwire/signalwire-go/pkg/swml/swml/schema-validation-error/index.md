---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/schema-validation-error"
title: "SchemaValidationError"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.SchemaValidationError"
  parent: "github.com/signalwire/signalwire-go/pkg/swml"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/schema_utils.go"
---
# `SchemaValidationError`

SchemaValidationError is the canonical error type raised when SWML schema validation fails. Mirrors Python's SchemaValidationError.

## Signature

```go
type SchemaValidationError struct
```

## Properties

| Name       | Type              | Required | Default | Description |
| ---------- | ----------------- | -------- | ------- | ----------- |
| `Errors`   | `Errors []string` | yes      | —       | —           |
| `VerbName` | `VerbName string` | yes      | —       | —           |

## Methods

- [`Error`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/schema-validation-error/error) — Error renders the validation failure as a single string.

## Source

[`pkg/swml/schema_utils.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/schema_utils.go)

Line 29.
