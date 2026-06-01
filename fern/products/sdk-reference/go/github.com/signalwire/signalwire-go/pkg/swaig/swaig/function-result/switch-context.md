---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/switch-context"
title: "SwitchContext"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swaig.FunctionResult.SwitchContext"
  parent: "github.com/signalwire/signalwire-go/pkg/swaig.FunctionResult"
  module: "github.com.signalwire.signalwire-go.pkg.swaig"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go"
---
# `SwitchContext`

SwitchContext changes the agent context/prompt during conversation. Only non-empty/true fields are included in the action.

## Signature

```go
func (*FunctionResult) SwitchContext(
	systemPrompt string,
	userPrompt string,
	consolidate bool,
	fullReset bool,
	isolated bool
) *FunctionResult
```

## Parameters

| Name           | Type     | Required | Default | Description |
| -------------- | -------- | -------- | ------- | ----------- |
| `systemPrompt` | `string` | yes      | —       | —           |
| `userPrompt`   | `string` | yes      | —       | —           |
| `consolidate`  | `bool`   | yes      | —       | —           |
| `fullReset`    | `bool`   | yes      | —       | —           |
| `isolated`     | `bool`   | yes      | —       | —           |

## Returns

`*FunctionResult`

## Source

[`pkg/swaig/function_result.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go)

Line 244.
