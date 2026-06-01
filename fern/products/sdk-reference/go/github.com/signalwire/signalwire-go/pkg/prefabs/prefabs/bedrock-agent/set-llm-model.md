---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/bedrock-agent/set-llm-model"
title: "SetLLMModel"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/prefabs.BedrockAgent.SetLLMModel"
  parent: "github.com/signalwire/signalwire-go/pkg/prefabs.BedrockAgent"
  module: "github.com.signalwire.signalwire-go.pkg.prefabs"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/bedrock.go"
---
# `SetLLMModel`

SetLLMModel logs a warning and does nothing. Bedrock uses a fixed voice-to-voice model, so overriding the model name is not meaningful.

Python equivalent: BedrockAgent.set\_llm\_model

## Signature

```go
func (*BedrockAgent) SetLLMModel(model string)
```

## Parameters

| Name    | Type     | Required | Default | Description |
| ------- | -------- | -------- | ------- | ----------- |
| `model` | `string` | yes      | —       | —           |

## Source

[`pkg/prefabs/bedrock.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/bedrock.go)

Line 201.
