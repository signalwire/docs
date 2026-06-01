---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context"
title: "Context"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/contexts.Context"
  parent: "github.com/signalwire/signalwire-go/pkg/contexts"
  module: "github.com.signalwire.signalwire-go.pkg.contexts"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go"
---
# `Context`

Context represents a single context containing ordered steps. All setter methods return \*Context for chaining.

## Signature

```go
type Context struct
```

## Methods

- [`AddBullets`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/add-bullets) — AddBullets adds a POM section with bullet points to the context prompt.
- [`AddEnterFiller`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/add-enter-filler) — AddEnterFiller adds enter fillers for a specific language code.
- [`AddExitFiller`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/add-exit-filler) — AddExitFiller adds exit fillers for a specific language code.
- [`AddSection`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/add-section) — AddSection adds a POM section to the context prompt.
- [`AddStep`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/add-step) — AddStep creates a new step, appends it to the ordered list, stores it in the lookup map, and returns the Step for further configuration.
- [`AddSystemBullets`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/add-system-bullets) — AddSystemBullets adds a POM section with bullet points to the system prompt.
- [`AddSystemSection`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/add-system-section) — AddSystemSection adds a POM section to the system prompt.
- [`GetStep`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/get-step) — GetStep returns the step with the given name, or nil if not found.
- [`MoveStep`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/move-step) — MoveStep moves an existing step to the given position (0-based index). Returns the receiver for method chaining.
- [`Name`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/name) — Name returns the context's name.
- [`RemoveStep`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/remove-step) — RemoveStep removes a step by name. Returns the receiver for method chaining.
- [`SetConsolidate`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/set-consolidate) — SetConsolidate sets whether to consolidate conversation history on entry.
- [`SetEnterFillers`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/set-enter-fillers) — SetEnterFillers sets all enter fillers at once.
- [`SetExitFillers`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/set-exit-fillers) — SetExitFillers sets all exit fillers at once.
- [`SetFullReset`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/set-full-reset) — SetFullReset sets whether to do a full reset when entering this context.
- [`SetInitialStep`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/set-initial-step) — SetInitialStep sets which step the context starts on when entered.
- [`SetIsolated`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/set-isolated) — SetIsolated marks this context as isolated — entering it wipes conversation history.
- [`SetPostPrompt`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/set-post-prompt) — SetPostPrompt sets the post-prompt override for this context.
- [`SetPrompt`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/set-prompt) — SetPrompt sets the context's prompt text directly.
- [`SetSystemPrompt`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/set-system-prompt) — SetSystemPrompt sets the system prompt for context switching.
- [`SetUserPrompt`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/set-user-prompt) — SetUserPrompt sets the user prompt to inject when entering this context.
- [`SetValidContexts`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/set-valid-contexts) — SetValidContexts sets which contexts can be navigated to from this context.
- [`SetValidSteps`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/set-valid-steps) — SetValidSteps sets which steps can be navigated to from any step in this context.
- [`ToMap`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/to-map) — ToMap serialises the context to the SWML map format.

## Source

[`pkg/contexts/contexts.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go)

Line 445.
