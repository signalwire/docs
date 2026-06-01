---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/join-conference"
title: "JoinConference"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swaig.FunctionResult.JoinConference"
  parent: "github.com/signalwire/signalwire-go/pkg/swaig.FunctionResult"
  module: "github.com.signalwire.signalwire-go.pkg.swaig"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go"
---
# `JoinConference`

JoinConference joins an ad-hoc audio conference. Pass nil for opts to use default behavior (muted=false, beep="true", no holdAudio).

## Signature

```go
func (*FunctionResult) JoinConference(name string, opts *JoinConferenceOptions) *FunctionResult
```

## Parameters

| Name   | Type                     | Required | Default | Description |
| ------ | ------------------------ | -------- | ------- | ----------- |
| `name` | `string`                 | yes      | —       | —           |
| `opts` | `*JoinConferenceOptions` | yes      | —       | —           |

## Returns

`*FunctionResult`

## Source

[`pkg/swaig/function_result.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go)

Line 510.
