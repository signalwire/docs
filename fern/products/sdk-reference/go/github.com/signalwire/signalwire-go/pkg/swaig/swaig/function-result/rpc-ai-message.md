---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/rpc-ai-message"
title: "RpcAiMessage"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swaig.FunctionResult.RpcAiMessage"
  parent: "github.com/signalwire/signalwire-go/pkg/swaig.FunctionResult"
  module: "github.com.signalwire.signalwire-go.pkg.swaig"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go"
---
# `RpcAiMessage`

RpcAiMessage injects a message into an AI agent on another call. role defaults to "system" when empty, matching the Python SDK default. This matches the Python SDK's rpc\_ai\_message() which calls execute\_rpc(method="ai\_message", ...).

## Signature

```go
func (*FunctionResult) RpcAiMessage(callID string, messageText string, role string) *FunctionResult
```

## Parameters

| Name          | Type     | Required | Default | Description |
| ------------- | -------- | -------- | ------- | ----------- |
| `callID`      | `string` | yes      | —       | —           |
| `messageText` | `string` | yes      | —       | —           |
| `role`        | `string` | yes      | —       | —           |

## Returns

`*FunctionResult`

## Source

[`pkg/swaig/function_result.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go)

Line 915.
