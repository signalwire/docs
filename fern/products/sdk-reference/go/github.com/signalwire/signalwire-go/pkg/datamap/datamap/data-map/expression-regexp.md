---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/datamap/datamap/data-map/expression-regexp"
title: "ExpressionRegexp"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/datamap.DataMap.ExpressionRegexp"
  parent: "github.com/signalwire/signalwire-go/pkg/datamap.DataMap"
  module: "github.com.signalwire.signalwire-go.pkg.datamap"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/datamap/datamap.go"
---
# `ExpressionRegexp`

ExpressionRegexp adds a pattern-matching expression using a compiled \*regexp.Regexp. This mirrors Python's expression() which accepts either a plain string or a compiled re.Pattern object — when a compiled pattern is passed, Python extracts pattern.pattern (the raw string). Here, pattern.String() serves the same role.

testValue is the template string to test (e.g., "${args.command}"). pattern is a compiled regexp whose string representation is used as the match pattern. output is the FunctionResult returned when the pattern matches. nomatchOutput is an optional FunctionResult returned when the pattern does not match (can be nil).

## Signature

```go
func (*DataMap) ExpressionRegexp(
	testValue string,
	pattern *regexp.Regexp,
	output *swaig.FunctionResult,
	nomatchOutput *swaig.FunctionResult
) *DataMap
```

## Parameters

| Name            | Type                    | Required | Default | Description |
| --------------- | ----------------------- | -------- | ------- | ----------- |
| `testValue`     | `string`                | yes      | —       | —           |
| `pattern`       | `*regexp.Regexp`        | yes      | —       | —           |
| `output`        | `*swaig.FunctionResult` | yes      | —       | —           |
| `nomatchOutput` | `*swaig.FunctionResult` | yes      | —       | —           |

## Returns

`*DataMap`

## Source

[`pkg/datamap/datamap.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/datamap/datamap.go)

Line 171.
