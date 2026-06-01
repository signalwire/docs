---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/schema-utils/get-verb-parameters"
title: "GetVerbParameters"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.SchemaUtils.GetVerbParameters"
  parent: "github.com/signalwire/signalwire-go/pkg/swml.SchemaUtils"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/schema_utils.go"
---
# `GetVerbParameters`

GetVerbParameters returns the parameter-definition block used for codegen — verb\_props\["properties"]. Mirrors Python's “get\_verb\_parameters(verb\_name)“.

## Signature

```go
func (*SchemaUtils) GetVerbParameters(verbName string) map[string]any
```

## Parameters

| Name       | Type     | Required | Default | Description |
| ---------- | -------- | -------- | ------- | ----------- |
| `verbName` | `string` | yes      | —       | —           |

## Returns

`map[string]any`

## Source

[`pkg/swml/schema_utils.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/schema_utils.go)

Line 253.
