---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/new-ai-verb-handler"
title: "NewAIVerbHandler"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.NewAIVerbHandler"
  parent: "github.com/signalwire/signalwire-go/pkg/swml"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/ai_verb_handler.go"
---
# `NewAIVerbHandler`

NewAIVerbHandler returns a new AIVerbHandler ready for registration.

Example:

```
svc.RegisterVerbHandler(swml.NewAIVerbHandler())
```

## Signature

```go
func NewAIVerbHandler() *AIVerbHandler
```

## Returns

`*AIVerbHandler`

## Examples

**Example 1**

```go
svc.RegisterVerbHandler(swml.NewAIVerbHandler())
```

**Example 2**

```go
svc.RegisterVerbHandler(swml.NewAIVerbHandler())
```

## Source

[`pkg/swml/ai_verb_handler.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/ai_verb_handler.go)

Line 27.
