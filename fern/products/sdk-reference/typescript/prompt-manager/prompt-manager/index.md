---
slug: "/reference/typescript/prompt-manager/prompt-manager"
title: "PromptManager"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "PromptManager.PromptManager"
  parent: "PromptManager"
  module: "PromptManager"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/PromptManager.ts"
---
# `PromptManager`

Manages agent prompt text, supporting both raw text and structured POM-based prompts.

## Signature

```typescript
class PromptManager
```

## Methods

- [`addSection`](/reference/typescript/prompt-manager/prompt-manager/add-section) — Adds a POM section to the prompt, initializing the PomBuilder if needed.
- [`addSubsection`](/reference/typescript/prompt-manager/prompt-manager/add-subsection) — Adds a subsection under a parent POM section, creating the parent if absent.
- [`addToSection`](/reference/typescript/prompt-manager/prompt-manager/add-to-section) — Appends body text or bullets to an existing POM section, creating it if absent.
- [`constructor`](/reference/typescript/prompt-manager/prompt-manager/constructor) — Creates a new PromptManager.
- [`getPomBuilder`](/reference/typescript/prompt-manager/prompt-manager/get-pom-builder) — Returns the underlying PomBuilder instance, if POM mode is active.
- [`getPostPrompt`](/reference/typescript/prompt-manager/prompt-manager/get-post-prompt) — Returns the post-prompt text.
- [`getPrompt`](/reference/typescript/prompt-manager/prompt-manager/get-prompt) — Returns the fully rendered prompt text, either raw text or POM-rendered Markdown.
- [`getRawPrompt`](/reference/typescript/prompt-manager/prompt-manager/get-raw-prompt) — Returns the raw prompt text whatever `setPromptText` stored, or null when no raw prompt has been set. Mirrors Python's `PromptManager.get_raw_prompt`.
- [`hasSection`](/reference/typescript/prompt-manager/prompt-manager/has-section) — Checks whether a POM section with the given title exists.
- [`setPostPrompt`](/reference/typescript/prompt-manager/prompt-manager/set-post-prompt) — Sets the post-prompt text appended after the main prompt.
- [`setPromptText`](/reference/typescript/prompt-manager/prompt-manager/set-prompt-text) — Sets the raw prompt text, bypassing POM rendering.

## Source

[`src/PromptManager.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/PromptManager.ts)

Line 10.
