---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/schema-utils/generate-method-body"
title: "GenerateMethodBody"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.SchemaUtils.GenerateMethodBody"
  parent: "github.com/signalwire/signalwire-go/pkg/swml.SchemaUtils"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/schema_utils.go"
---
# `GenerateMethodBody`

GenerateMethodBody renders a Python-style method body for a verb. Mirrors Python's “generate\_method\_body(verb\_name)“.

## Signature

```go
func (*SchemaUtils) GenerateMethodBody(verbName string) string
```

## Parameters

| Name       | Type     | Required | Default | Description |
| ---------- | -------- | -------- | ------- | ----------- |
| `verbName` | `string` | yes      | —       | —           |

## Returns

`string`

## Source

[`pkg/swml/schema_utils.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/schema_utils.go)

Line 358.
