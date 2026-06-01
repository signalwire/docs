---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/get-contexts"
title: "GetContexts"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase.GetContexts"
  parent: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `GetContexts`

GetContexts returns the contexts as a serialised map (the same shape SWML expects), or nil when no contexts have been defined yet. This mirrors Python's “PromptManager.get\_contexts“ which returns the contexts dict or “None“.

Python equivalent: prompt\_manager.PromptManager.get\_contexts

## Signature

```go
func (*AgentBase) GetContexts() map[string]any
```

## Returns

`map[string]any`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 889.
