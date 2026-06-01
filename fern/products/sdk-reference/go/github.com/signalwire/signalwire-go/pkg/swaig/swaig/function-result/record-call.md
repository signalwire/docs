---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/record-call"
title: "RecordCall"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swaig.FunctionResult.RecordCall"
  parent: "github.com/signalwire/signalwire-go/pkg/swaig.FunctionResult"
  module: "github.com.signalwire.signalwire-go.pkg.swaig"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go"
---
# `RecordCall`

RecordCall starts background call recording using SWML. controlID, stereo, format, and direction are the primary parameters. Use opts to specify additional optional parameters (pass nil to use defaults).

## Signature

```go
func (*FunctionResult) RecordCall(
	controlID string,
	stereo bool,
	format string,
	direction string,
	opts *RecordCallOptions
) *FunctionResult
```

## Parameters

| Name        | Type                 | Required | Default | Description |
| ----------- | -------------------- | -------- | ------- | ----------- |
| `controlID` | `string`             | yes      | —       | —           |
| `stereo`    | `bool`               | yes      | —       | —           |
| `format`    | `string`             | yes      | —       | —           |
| `direction` | `string`             | yes      | —       | —           |
| `opts`      | `*RecordCallOptions` | yes      | —       | —           |

## Returns

`*FunctionResult`

## Source

[`pkg/swaig/function_result.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go)

Line 335.
