---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/bedrock-agent"
title: "BedrockAgent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/prefabs.BedrockAgent"
  parent: "github.com/signalwire/signalwire-go/pkg/prefabs"
  module: "github.com.signalwire.signalwire-go.pkg.prefabs"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/bedrock.go"
---
# `BedrockAgent`

BedrockAgent wraps AgentBase and configures it to emit the "amazon\_bedrock" SWML verb instead of the standard "ai" verb.

The voice\_id, temperature, and top\_p values are injected into the rendered prompt config (matching Python's \_add\_voice\_to\_prompt). Keys that are text-model-specific (barge\_confidence, presence\_penalty, frequency\_penalty) are removed from the prompt config because they do not apply to Bedrock's voice-to-voice model.

## Signature

```go
type BedrockAgent struct
```

## Properties

| Name        | Type               | Required | Default | Description |
| ----------- | ------------------ | -------- | ------- | ----------- |
| `AgentBase` | `*agent.AgentBase` | yes      | —       | —           |

## Methods

- [`SetInferenceParams`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/bedrock-agent/set-inference-params) — SetInferenceParams updates one or more Bedrock inference parameters. Pass zero-value pointers to leave a parameter unchanged.
- [`SetLLMModel`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/bedrock-agent/set-llm-model) — SetLLMModel logs a warning and does nothing. Bedrock uses a fixed voice-to-voice model, so overriding the model name is not meaningful.
- [`SetLLMTemperature`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/bedrock-agent/set-llm-temperature) — SetLLMTemperature is a convenience wrapper that delegates to SetInferenceParams.
- [`SetPostPromptLLMParams`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/bedrock-agent/set-post-prompt-llm-params) — SetPostPromptLLMParams logs a warning and ignores the parameters. Bedrock's post-prompt summarisation uses OpenAI configured at the platform level (in the C code), so SDK-level overrides have no effect. The keys of params are listed in the warning so the caller can see what was ignored.
- [`SetPromptLLMParams`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/bedrock-agent/set-prompt-llm-params) — SetPromptLLMParams logs a warning directing the caller to SetInferenceParams instead. The keys of params are listed in the warning so the caller can see what was ignored.
- [`SetVoice`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/bedrock-agent/set-voice) — SetVoice sets the Bedrock voice ID.

## Source

[`pkg/prefabs/bedrock.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/bedrock.go)

Line 58.
