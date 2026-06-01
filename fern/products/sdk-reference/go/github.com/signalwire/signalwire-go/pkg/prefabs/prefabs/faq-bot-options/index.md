---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/faq-bot-options"
title: "FAQBotOptions"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/prefabs.FAQBotOptions"
  parent: "github.com/signalwire/signalwire-go/pkg/prefabs"
  module: "github.com.signalwire.signalwire-go.pkg.prefabs"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/faq_bot.go"
---
# `FAQBotOptions`

FAQBotOptions configures a new FAQBotAgent.

## Signature

```go
type FAQBotOptions struct
```

## Properties

| Name             | Type                               | Required | Default | Description                                                                                                                         |
| ---------------- | ---------------------------------- | -------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| `AgentOptions`   | `AgentOptions []agent.AgentOption` | yes      | —       | AgentOptions holds additional functional options forwarded to NewAgentBase, matching the \*\*kwargs pass-through in the Python SDK. |
| `FAQs`           | `FAQs []FAQ`                       | yes      | —       | —                                                                                                                                   |
| `Name`           | `Name string`                      | yes      | —       | —                                                                                                                                   |
| `Persona`        | `Persona string`                   | yes      | —       | —                                                                                                                                   |
| `Route`          | `Route string`                     | yes      | —       | —                                                                                                                                   |
| `SuggestRelated` | `SuggestRelated *bool`             | yes      | —       | SuggestRelated controls whether the agent suggests related questions. Defaults to true when nil, matching the Python SDK default.   |

## Source

[`pkg/prefabs/faq_bot.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/faq_bot.go)

Line 23.
