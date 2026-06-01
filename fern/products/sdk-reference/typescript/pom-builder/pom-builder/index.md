---
slug: "/reference/typescript/pom-builder/pom-builder"
title: "PomBuilder"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "PomBuilder.PomBuilder"
  parent: "PomBuilder"
  module: "PomBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/PomBuilder.ts"
---
# `PomBuilder`

Builds a structured prompt by composing named POM sections, with Markdown and dict export.

The Prompt Object Model lets you assemble a large system prompt from reusable,
named sections (Role, Objective, Constraints, etc.) instead of a single string.
This plays well with [AgentBase](/reference/typescript/agent-base) methods like `promptAddSection()` and
`promptAddToSection()` that let user code and skills add prompt content
incrementally.

## Signature

```typescript
class PomBuilder
```

## Examples

```typescript
import { PomBuilder } from '@signalwire/sdk';

const pom = new PomBuilder()
  .addSection('Role', { body: 'You are a friendly customer service agent.' })
  .addSection('Objectives', { bullets: [
    'Identify the customer politely',
    'Resolve their issue in under 3 turns if possible',
  ]})
  .addSection('Constraints', { bullets: [
    'Never reveal internal tool names',
  ]});

const systemPrompt = pom.renderMarkdown();
```

## See Also

- \- \[PomSection]\(/reference/typescript/pom-builder/pom-section)
  \- \[AgentBase.promptAddSection]\(/reference/typescript/agent-base/agent-base/prompt-add-section)

## Properties

| Name  | Type                           | Required | Default | Description                                                                                                                                                                                                                                                                                         |
| ----- | ------------------------------ | -------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `pom` | `get pom(): PromptObjectModel` | yes      | —       | Returns the underlying `PromptObjectModel` for the builder. Mirrors Python's `PomBuilder.pom` attribute (the wrapped low-level model). Returns a fresh `PromptObjectModel` populated from the builder's current sections; mutations on the returned instance do not propagate back to this builder. |

## Methods

- [`addPomAsSubsection`](/reference/typescript/pom-builder/pom-builder/add-pom-as-subsection) — Appends every top-level section of another PomBuilder as subsections of a target section.
- [`addSection`](/reference/typescript/pom-builder/pom-builder/add-section) — Adds a new top-level section to the prompt.
- [`addSubsection`](/reference/typescript/pom-builder/pom-builder/add-subsection) — Adds a subsection under an existing parent section, creating the parent if absent.
- [`addToSection`](/reference/typescript/pom-builder/pom-builder/add-to-section) — Appends body text or bullets to an existing section, creating it if absent.
- [`constructor`](/reference/typescript/pom-builder/pom-builder/constructor)
- [`findSection`](/reference/typescript/pom-builder/pom-builder/find-section) — Recursively searches all sections and subsections for one matching the given title.
- [`fromSections`](/reference/typescript/pom-builder/pom-builder/from-sections) — Creates a PomBuilder from an array of section data objects.
- [`getSection`](/reference/typescript/pom-builder/pom-builder/get-section) — Returns a top-level section by title.
- [`hasSection`](/reference/typescript/pom-builder/pom-builder/has-section) — Checks whether a top-level section with the given title exists.
- [`renderMarkdown`](/reference/typescript/pom-builder/pom-builder/render-markdown) — Renders all sections as a combined Markdown string.
- [`renderXml`](/reference/typescript/pom-builder/pom-builder/render-xml) — Renders all sections as a combined XML string with a `<prompt>` root element.
- [`reset`](/reference/typescript/pom-builder/pom-builder/reset) — Clears all sections, returning the builder to its initial empty state.
- [`toDict`](/reference/typescript/pom-builder/pom-builder/to-dict) — Serializes all sections to an array of plain data objects.
- [`toJson`](/reference/typescript/pom-builder/pom-builder/to-json) — Serializes all sections to a JSON string.

## Source

[`src/PomBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/PomBuilder.ts)

Line 235.
