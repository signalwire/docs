---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/step"
title: "Step"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/contexts.Step"
  parent: "github.com/signalwire/signalwire-go/pkg/contexts"
  module: "github.com.signalwire.signalwire-go.pkg.contexts"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go"
---
# `Step`

Step represents a single step within a context. All setter methods return \*Step so they can be chained.

## Signature

```go
type Step struct
```

## Methods

- [`AddBullets`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/step/add-bullets) — AddBullets adds a POM section with bullet points.
- [`AddGatherQuestion`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/step/add-gather-question) — AddGatherQuestion adds a question to this step's gather\_info. SetGatherInfo should be called first (this method silently initialises the struct if not, to keep callers from having to worry about ordering). Returns the Step for chaining.
- [`AddSection`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/step/add-section) — AddSection adds a POM section to the step.
- [`ClearSections`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/step/clear-sections) — ClearSections removes all POM sections and direct text from this step.
- [`Name`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/step/name) — Name returns the step's name.
- [`SetEnd`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/step/set-end) — SetEnd marks this step as terminal for the step flow.
- [`SetFunctions`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/step/set-functions) — SetFunctions sets which non-internal functions are callable while this step is active.
- [`SetGatherInfo`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/step/set-gather-info) — SetGatherInfo enables info gathering for this step and returns the Step for fluent chaining. This matches the Python SDK's set\_gather\_info, which returns self so that step-level setters (SetFunctions, SetValidSteps, etc.) can be chained after configuring gather info.
- [`SetResetConsolidate`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/step/set-reset-consolidate) — SetResetConsolidate sets whether to consolidate conversation on context switch.
- [`SetResetFullReset`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/step/set-reset-full-reset) — SetResetFullReset sets whether to do a full reset on context switch.
- [`SetResetSystemPrompt`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/step/set-reset-system-prompt) — SetResetSystemPrompt sets the system prompt for context switching.
- [`SetResetUserPrompt`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/step/set-reset-user-prompt) — SetResetUserPrompt sets the user prompt for context switching.
- [`SetSkipToNextStep`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/step/set-skip-to-next-step) — SetSkipToNextStep sets whether to automatically advance to the next step.
- [`SetSkipUserTurn`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/step/set-skip-user-turn) — SetSkipUserTurn sets whether to skip waiting for user input after this step.
- [`SetStepCriteria`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/step/set-step-criteria) — SetStepCriteria sets the criteria for determining when this step is complete.
- [`SetText`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/step/set-text) — SetText sets the step's prompt text directly.
- [`SetValidContexts`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/step/set-valid-contexts) — SetValidContexts sets which contexts can be navigated to from this step.
- [`SetValidSteps`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/step/set-valid-steps) — SetValidSteps sets which steps can be navigated to from this step.
- [`ToMap`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/step/to-map) — ToMap serialises the step to the SWML map format.

## Source

[`pkg/contexts/contexts.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go)

Line 166.
