---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/datamap/datamap/create-expression-tool"
title: "CreateExpressionTool"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/datamap.CreateExpressionTool"
  parent: "github.com/signalwire/signalwire-go/pkg/datamap"
  module: "github.com.signalwire.signalwire-go.pkg.datamap"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/datamap/datamap.go"
---
# `CreateExpressionTool`

CreateExpressionTool creates a DataMap configured for expression-based pattern matching. name is the function name. patterns maps test values to an ExpressionPattern where Pattern is the regex string and Result is the \*swaig.FunctionResult to return on match. parameters maps parameter names to their definitions (each with "type", "description", "required" keys).

## Signature

```go
func CreateExpressionTool(
	name string,
	patterns map[string]ExpressionPattern,
	parameters map[string]map[string]any
) *DataMap
```

## Parameters

| Name         | Type                           | Required | Default | Description |
| ------------ | ------------------------------ | -------- | ------- | ----------- |
| `name`       | `string`                       | yes      | —       | —           |
| `patterns`   | `map[string]ExpressionPattern` | yes      | —       | —           |
| `parameters` | `map[string]map[string]any`    | yes      | —       | —           |

## Returns

`*DataMap`

## Source

[`pkg/datamap/datamap.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/datamap/datamap.go)

Line 441.
