---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts"
title: "contexts"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "module"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/contexts"
  module: "github.com.signalwire.signalwire-go.pkg.contexts"
---
# `contexts`

Package contexts provides the Contexts & Steps workflow system for SignalWire AI agents.

Instead of a single flat prompt, agents can define structured Contexts (conversation flows) containing ordered Steps (sequential stages). Each step carries its own prompt, completion criteria, function restrictions, and navigation rules. The builder serialises the whole tree into the map\[string]any format expected by the SWML AI verb.

## Signature

```go
package contexts
```

## Constants

| Name                      | Type                      | Required | Default | Description                                                                                                                                                                                                                                                                                                                                        |
| ------------------------- | ------------------------- | -------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `MaxContexts`             | `MaxContexts`             | yes      | —       | Limits guard against unreasonable configurations.                                                                                                                                                                                                                                                                                                  |
| `MaxStepsPerContext`      | `MaxStepsPerContext`      | yes      | —       | Limits guard against unreasonable configurations.                                                                                                                                                                                                                                                                                                  |
| `ReservedNativeToolNames` | `ReservedNativeToolNames` | yes      | —       | ReservedNativeToolNames is the set of tool names the runtime auto-injects when contexts/steps are present. User-defined SWAIG tools must not collide with these names. ContextBuilder.Validate() rejects any agent that registers a user tool sharing one of these names — the runtime would never call the user tool because the native one wins. |

## Functions

- [`CreateSimpleContext`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/create-simple-context) — CreateSimpleContext creates a standalone Context. If name is empty it defaults to "default".
- [`NewContextBuilder`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/new-context-builder) — NewContextBuilder creates a new empty ContextBuilder.
- [`WithConfirm`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/with-confirm) — WithConfirm sets whether the model must confirm the answer with the user.
- [`WithFunctions`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/with-functions) — WithFunctions sets additional function names visible for this question.
- [`WithPrompt`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/with-prompt) — WithPrompt sets extra instruction text appended for this question.
- [`WithType`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/with-type) — WithType sets the JSON-schema type for the answer (default "string").

## Type Aliases

- [`GatherQuestionOption`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/gather-question-option) — GatherQuestionOption is a functional option applied to a GatherQuestion.

## Classes

- [`Context`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context) — Context represents a single context containing ordered steps. All setter methods return \*Context for chaining.
- [`ContextBuilder`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context-builder) — ContextBuilder is the top-level builder for multi-step, multi-context AI agent workflows.
- [`GatherInfo`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/gather-info) — GatherInfo configures information gathering for a step.
- [`GatherQuestion`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/gather-question) — GatherQuestion represents a single question in a gather\_info configuration.
- [`Step`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/step) — Step represents a single step within a context. All setter methods return \*Step so they can be chained.

## Interfaces

- [`ToolLister`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/tool-lister) — ToolLister is implemented by an agent so ContextBuilder.Validate() can check registered SWAIG tool names against ReservedNativeToolNames. AgentBase implements this by returning the insertion-ordered list of registered tool names.
