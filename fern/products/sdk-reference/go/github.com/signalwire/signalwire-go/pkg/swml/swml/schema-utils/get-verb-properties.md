---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/schema-utils/get-verb-properties"
title: "GetVerbProperties"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.SchemaUtils.GetVerbProperties"
  parent: "github.com/signalwire/signalwire-go/pkg/swml.SchemaUtils"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/schema_utils.go"
---
# `GetVerbProperties`

GetVerbProperties returns the inner “properties\[verb\_name]“ block for a verb, or an empty map when the verb is unknown. Mirrors Python's “get\_verb\_properties(verb\_name)“.

## Signature

```go
func (*SchemaUtils) GetVerbProperties(verbName string) map[string]any
```

## Parameters

| Name       | Type     | Required | Default | Description |
| ---------- | -------- | -------- | ------- | ----------- |
| `verbName` | `string` | yes      | —       | —           |

## Returns

`map[string]any`

## Source

[`pkg/swml/schema_utils.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/schema_utils.go)

Line 217.
