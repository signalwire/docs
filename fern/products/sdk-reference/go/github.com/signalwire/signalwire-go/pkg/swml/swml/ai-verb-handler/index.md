---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/ai-verb-handler"
title: "AIVerbHandler"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.AIVerbHandler"
  parent: "github.com/signalwire/signalwire-go/pkg/swml"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/ai_verb_handler.go"
---
# `AIVerbHandler`

AIVerbHandler is a concrete VerbHandler for the SWML "ai" verb.

It implements the VerbHandler interface and provides validation and configuration-building logic for the AI verb. This is the Go equivalent of the Python AIVerbHandler class in core/swml\_handler.py.

The AI verb is complex and requires specialized handling, particularly for managing prompts, SWAIG functions, and AI configurations.

## Signature

```go
type AIVerbHandler struct
```

## Methods

- [`BuildConfig`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/ai-verb-handler/build-config) — BuildConfig assembles an AI verb configuration map from the provided params.
- [`GetVerbName`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/ai-verb-handler/get-verb-name) — GetVerbName returns "ai", the name of the SWML verb this handler handles.
- [`ValidateConfig`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/ai-verb-handler/validate-config) — ValidateConfig validates the configuration map for the AI verb.

## Source

[`pkg/swml/ai_verb_handler.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/ai_verb_handler.go)

Line 20.
