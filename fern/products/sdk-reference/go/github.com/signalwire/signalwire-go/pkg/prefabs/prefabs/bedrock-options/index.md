---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/bedrock-options"
title: "BedrockOptions"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/prefabs.BedrockOptions"
  parent: "github.com/signalwire/signalwire-go/pkg/prefabs"
  module: "github.com.signalwire.signalwire-go.pkg.prefabs"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/bedrock.go"
---
# `BedrockOptions`

BedrockOptions configures a new BedrockAgent.

BedrockAgent is the Go equivalent of the Python BedrockAgent class. It extends the standard agent infrastructure but renders the SWML document with the "amazon\_bedrock" verb instead of the default "ai" verb. All standard AgentBase capabilities (prompt, SWAIG tools, skills, post-prompt, dynamic config, etc.) work unchanged.

## Signature

```go
type BedrockOptions struct
```

## Properties

| Name           | Type                               | Required | Default | Description                                                                                                       |
| -------------- | ---------------------------------- | -------- | ------- | ----------------------------------------------------------------------------------------------------------------- |
| `AgentOptions` | `AgentOptions []agent.AgentOption` | yes      | —       | AgentOptions are functional options forwarded to NewAgentBase. Use them to set host, port, auth credentials, etc. |
| `MaxTokens`    | `MaxTokens int`                    | yes      | —       | MaxTokens is the maximum number of tokens to generate. Defaults to 1024.                                          |
| `Name`         | `Name string`                      | yes      | —       | Name is the agent name.  Defaults to "bedrock\_agent".                                                            |
| `Route`        | `Route string`                     | yes      | —       | Route is the HTTP route for the agent.  Defaults to "/bedrock".                                                   |
| `SystemPrompt` | `SystemPrompt string`              | yes      | —       | SystemPrompt is an optional initial system prompt.  It can be overridden later via SetPromptText.                 |
| `Temperature`  | `Temperature float64`              | yes      | —       | Temperature is the generation temperature (0–1).  Defaults to 0.7.                                                |
| `TopP`         | `TopP float64`                     | yes      | —       | TopP is the nucleus-sampling parameter (0–1).  Defaults to 0.9.                                                   |
| `VoiceID`      | `VoiceID string`                   | yes      | —       | VoiceID is the Bedrock voice identifier.  Defaults to "matthew".                                                  |

## Source

[`pkg/prefabs/bedrock.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/bedrock.go)

Line 21.
