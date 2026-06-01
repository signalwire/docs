---
slug: "/reference/typescript/context-builder/context"
title: "Context"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "ContextBuilder.Context"
  parent: "ContextBuilder"
  module: "ContextBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts"
---
# `Context`

A named context containing ordered steps, prompt configuration, and navigation rules.

## Signature

```typescript
class Context
```

## Properties

| Name   | Type     | Required | Default | Description                               |
| ------ | -------- | -------- | ------- | ----------------------------------------- |
| `name` | `string` | yes      | —       | The unique name identifying this context. |

## Methods

- [`addBullets`](/reference/typescript/context-builder/context/add-bullets) — Adds a POM section with bullets to the context prompt, mutually exclusive with raw prompt text.
- [`addEnterFiller`](/reference/typescript/context-builder/context/add-enter-filler) — Adds enter filler phrases for a specific language.
- [`addExitFiller`](/reference/typescript/context-builder/context/add-exit-filler) — Adds exit filler phrases for a specific language.
- [`addSection`](/reference/typescript/context-builder/context/add-section) — Adds a POM section with a body to the context prompt, mutually exclusive with raw prompt text.
- [`addStep`](/reference/typescript/context-builder/context/add-step) — Adds a new step to this context.
- [`addSystemBullets`](/reference/typescript/context-builder/context/add-system-bullets) — Adds a POM section with bullets to the system prompt, mutually exclusive with raw system prompt text.
- [`addSystemSection`](/reference/typescript/context-builder/context/add-system-section) — Adds a POM section to the system prompt, mutually exclusive with raw system prompt text.
- [`constructor`](/reference/typescript/context-builder/context/constructor) — Creates a new Context.
- [`getStep`](/reference/typescript/context-builder/context/get-step) — Returns a step by name.
- [`moveStep`](/reference/typescript/context-builder/context/move-step) — Moves a step to a new position in the step order.
- [`removeStep`](/reference/typescript/context-builder/context/remove-step) — Removes a step from this context by name.
- [`setConsolidate`](/reference/typescript/context-builder/context/set-consolidate) — Sets whether to consolidate conversation history when entering this context.
- [`setEnterFillers`](/reference/typescript/context-builder/context/set-enter-fillers) — Sets filler phrases spoken when entering this context, keyed by language code.
- [`setExitFillers`](/reference/typescript/context-builder/context/set-exit-fillers) — Sets filler phrases spoken when exiting this context, keyed by language code.
- [`setFullReset`](/reference/typescript/context-builder/context/set-full-reset) — Sets whether to fully reset conversation history when entering this context.
- [`setInitialStep`](/reference/typescript/context-builder/context/set-initial-step) — Set which step the context starts on when entered.
- [`setIsolated`](/reference/typescript/context-builder/context/set-isolated) — Mark this context as isolated — entering it wipes conversation history.
- [`setPostPrompt`](/reference/typescript/context-builder/context/set-post-prompt) — Sets the post-prompt text for this context.
- [`setPrompt`](/reference/typescript/context-builder/context/set-prompt) — Sets raw prompt text for this context, mutually exclusive with POM prompt sections.
- [`setSystemPrompt`](/reference/typescript/context-builder/context/set-system-prompt) — Sets raw system prompt text, mutually exclusive with system POM sections.
- [`setUserPrompt`](/reference/typescript/context-builder/context/set-user-prompt) — Sets the user prompt text for this context.
- [`setValidContexts`](/reference/typescript/context-builder/context/set-valid-contexts) — Sets which contexts the AI may navigate to from this context.
- [`setValidSteps`](/reference/typescript/context-builder/context/set-valid-steps) — Sets which steps the AI may navigate to from this context.
- [`toDict`](/reference/typescript/context-builder/context/to-dict) — Serializes this context and all its steps to a plain object for SWML output.

## Source

[`src/ContextBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts)

Line 498.
