---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/datamap/datamap/data-map/expression"
title: "Expression"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/datamap.DataMap.Expression"
  parent: "github.com/signalwire/signalwire-go/pkg/datamap.DataMap"
  module: "github.com.signalwire.signalwire-go.pkg.datamap"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/datamap/datamap.go"
---
# `Expression`

Expression adds a pattern-matching expression for expression-based responses. testValue is the template string to test (e.g., "${args.command}"). pattern is the regex pattern to match against. output is the FunctionResult returned when the pattern matches. nomatchOutput is an optional FunctionResult returned when the pattern does not match (can be nil).

## Signature

```go
func (*DataMap) Expression(
	testValue string,
	pattern string,
	output *swaig.FunctionResult,
	nomatchOutput *swaig.FunctionResult
) *DataMap
```

## Parameters

| Name            | Type                    | Required | Default | Description |
| --------------- | ----------------------- | -------- | ------- | ----------- |
| `testValue`     | `string`                | yes      | —       | —           |
| `pattern`       | `string`                | yes      | —       | —           |
| `output`        | `*swaig.FunctionResult` | yes      | —       | —           |
| `nomatchOutput` | `*swaig.FunctionResult` | yes      | —       | —           |

## Returns

`*DataMap`

## Source

[`pkg/datamap/datamap.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/datamap/datamap.go)

Line 152.
