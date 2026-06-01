---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/tool-lister"
title: "ToolLister"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "interface"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/contexts.ToolLister"
  parent: "github.com/signalwire/signalwire-go/pkg/contexts"
  module: "github.com.signalwire.signalwire-go.pkg.contexts"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go"
---
# `ToolLister`

ToolLister is implemented by an agent so ContextBuilder.Validate() can check registered SWAIG tool names against ReservedNativeToolNames. AgentBase implements this by returning the insertion-ordered list of registered tool names.

## Signature

```go
type ToolLister interface { ListToolNames }
```

## Methods

- [`ListToolNames`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/tool-lister/list-tool-names) — ListToolNames returns the names of every registered SWAIG tool.

## Source

[`pkg/contexts/contexts.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go)

Line 761.
