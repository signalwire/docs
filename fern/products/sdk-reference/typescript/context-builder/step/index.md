---
slug: "/reference/typescript/context-builder/step"
title: "Step"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "ContextBuilder.Step"
  parent: "ContextBuilder"
  module: "ContextBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts"
---
# `Step`

A single step within a context, with prompt content, criteria, function restrictions, and navigation rules.

## Signature

```typescript
class Step
```

## Properties

| Name   | Type     | Required | Default | Description                                               |
| ------ | -------- | -------- | ------- | --------------------------------------------------------- |
| `name` | `string` | yes      | —       | The unique name identifying this step within its context. |

## Methods

- [`addBullets`](/reference/typescript/context-builder/step/add-bullets) — Adds a POM section with bullet points, mutually exclusive with raw text.
- [`addGatherQuestion`](/reference/typescript/context-builder/step/add-gather-question) — Add a question to this step's gather\_info configuration. setGatherInfo() must be called before this method.
- [`addSection`](/reference/typescript/context-builder/step/add-section) — Adds a POM section with a body, mutually exclusive with raw text.
- [`clearSections`](/reference/typescript/context-builder/step/clear-sections) — Removes all POM sections and raw text from this step.
- [`constructor`](/reference/typescript/context-builder/step/constructor) — Creates a new Step.
- [`setEnd`](/reference/typescript/context-builder/step/set-end) — Mark this step as terminal for the step flow.
- [`setFunctions`](/reference/typescript/context-builder/step/set-functions) — Set which non-internal functions are callable while this step is active.
- [`setGatherInfo`](/reference/typescript/context-builder/step/set-gather-info) — Initializes a gather info operation on this step for collecting structured data.
- [`setResetConsolidate`](/reference/typescript/context-builder/step/set-reset-consolidate) — Sets whether to consolidate conversation history when resetting at this step.
- [`setResetFullReset`](/reference/typescript/context-builder/step/set-reset-full-reset) — Sets whether to perform a full conversation reset at this step.
- [`setResetSystemPrompt`](/reference/typescript/context-builder/step/set-reset-system-prompt) — Sets the system prompt to use when resetting context at this step.
- [`setResetUserPrompt`](/reference/typescript/context-builder/step/set-reset-user-prompt) — Sets the user prompt to use when resetting context at this step.
- [`setSkipToNextStep`](/reference/typescript/context-builder/step/set-skip-to-next-step) — Sets whether to automatically advance to the next step after this one completes.
- [`setSkipUserTurn`](/reference/typescript/context-builder/step/set-skip-user-turn) — Sets whether to skip waiting for user input when entering this step.
- [`setStepCriteria`](/reference/typescript/context-builder/step/set-step-criteria) — Sets the criteria that must be met before this step is considered complete.
- [`setText`](/reference/typescript/context-builder/step/set-text) — Sets raw text content for this step, mutually exclusive with POM sections.
- [`setValidContexts`](/reference/typescript/context-builder/step/set-valid-contexts) — Sets which contexts the AI may navigate to from this step.
- [`setValidSteps`](/reference/typescript/context-builder/step/set-valid-steps) — Sets which steps the AI may navigate to from this step.
- [`toDict`](/reference/typescript/context-builder/step/to-dict) — Serializes this step to a plain object for SWML output.

## Source

[`src/ContextBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts)

Line 160.
