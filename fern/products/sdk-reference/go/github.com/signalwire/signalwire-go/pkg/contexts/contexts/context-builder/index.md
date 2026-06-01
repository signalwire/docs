---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context-builder"
title: "ContextBuilder"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/contexts.ContextBuilder"
  parent: "github.com/signalwire/signalwire-go/pkg/contexts"
  module: "github.com.signalwire.signalwire-go.pkg.contexts"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go"
---
# `ContextBuilder`

ContextBuilder is the top-level builder for multi-step, multi-context AI agent workflows.

A ContextBuilder owns one or more Contexts; each Context owns an ordered list of Steps. Only one context and one step is active at a time. Per chat turn, the runtime injects the current step's instructions as a system message, then asks the LLM for a response.

When a step (or its enclosing context) declares valid\_steps or valid\_contexts, the runtime auto-injects two native tools so the model can navigate the flow:

- next\_step(step: enum) — present when valid\_steps is set
- change\_context(context: enum) — present when valid\_contexts is set

Their enum schemas are rewritten on every turn to match whatever valid\_steps / valid\_contexts apply to the current step. You do NOT need to define these tools yourself; they appear automatically.

A third native tool — gather\_submit — is injected during gather\_info questioning (see Step.SetGatherInfo / Step.AddGatherQuestion).

These three names — next\_step, change\_context, gather\_submit — are reserved. ContextBuilder.Validate() rejects any agent that defines a SWAIG tool with one of these names. See ReservedNativeToolNames.

Each step may declare a functions whitelist. The whitelist is applied in-memory at the start of each LLM turn. CRITICALLY: if a step does NOT declare a functions field, it INHERITS the previous step's active set. See Step.SetFunctions for details and examples.

## Signature

```go
type ContextBuilder struct
```

## Methods

- [`AddContext`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context-builder/add-context) — AddContext creates a new context with the given name and returns it.
- [`AttachAgent`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context-builder/attach-agent) — AttachAgent wires an agent into the builder so Validate() can check user-defined tool names against ReservedNativeToolNames. AgentBase calls this internally when you invoke DefineContexts().
- [`GetContext`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context-builder/get-context) — GetContext returns the context with the given name, or nil if not found.
- [`Reset`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context-builder/reset) — Reset removes all contexts, returning the builder to its initial state. Use this in a dynamic config callback when you need to rebuild contexts from scratch for a specific request.
- [`ToMap`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context-builder/to-map) — ToMap serialises all contexts to the SWML map format. It calls Validate first and returns an error if validation fails.
- [`Validate`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context-builder/validate) — Validate checks the builder configuration for common errors:

## Source

[`pkg/contexts/contexts.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go)

Line 800.
