---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/tap"
title: "Tap"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swaig.FunctionResult.Tap"
  parent: "github.com/signalwire/signalwire-go/pkg/swaig.FunctionResult"
  module: "github.com.signalwire.signalwire-go.pkg.swaig"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go"
---
# `Tap`

Tap starts background call tapping, streaming media to the given URI. rtpPtime sets the packetization time in milliseconds for RTP streams (0 = use default of 20ms). Pass empty string for statusURL to omit it.

## Signature

```go
func (*FunctionResult) Tap(
	uri string,
	controlID string,
	direction string,
	codec string,
	rtpPtime int,
	statusURL string
) *FunctionResult
```

## Parameters

| Name        | Type     | Required | Default | Description |
| ----------- | -------- | -------- | ------- | ----------- |
| `uri`       | `string` | yes      | —       | —           |
| `controlID` | `string` | yes      | —       | —           |
| `direction` | `string` | yes      | —       | —           |
| `codec`     | `string` | yes      | —       | —           |
| `rtpPtime`  | `int`    | yes      | —       | —           |
| `statusURL` | `string` | yes      | —       | —           |

## Returns

`*FunctionResult`

## Source

[`pkg/swaig/function_result.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go)

Line 608.
