---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context-builder/attach-agent"
title: "AttachAgent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/contexts.ContextBuilder.AttachAgent"
  parent: "github.com/signalwire/signalwire-go/pkg/contexts.ContextBuilder"
  module: "github.com.signalwire.signalwire-go.pkg.contexts"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go"
---
# `AttachAgent`

AttachAgent wires an agent into the builder so Validate() can check user-defined tool names against ReservedNativeToolNames. AgentBase calls this internally when you invoke DefineContexts().

## Signature

```go
func (*ContextBuilder) AttachAgent(a ToolLister) *ContextBuilder
```

## Parameters

| Name | Type         | Required | Default | Description |
| ---- | ------------ | -------- | ------- | ----------- |
| `a`  | `ToolLister` | yes      | —       | —           |

## Returns

`*ContextBuilder`

## Source

[`pkg/contexts/contexts.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go)

Line 809.
