---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/new-bedrock-agent"
title: "NewBedrockAgent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/prefabs.NewBedrockAgent"
  parent: "github.com/signalwire/signalwire-go/pkg/prefabs"
  module: "github.com.signalwire.signalwire-go.pkg.prefabs"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/bedrock.go"
---
# `NewBedrockAgent`

NewBedrockAgent creates a BedrockAgent with Bedrock-specific SWML rendering.

Python equivalent: BedrockAgent.**init**

## Signature

```go
func NewBedrockAgent(opts BedrockOptions) *BedrockAgent
```

## Parameters

| Name   | Type             | Required | Default | Description |
| ------ | ---------------- | -------- | ------- | ----------- |
| `opts` | `BedrockOptions` | yes      | —       | —           |

## Returns

`*BedrockAgent`

## Source

[`pkg/prefabs/bedrock.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/bedrock.go)

Line 75.
