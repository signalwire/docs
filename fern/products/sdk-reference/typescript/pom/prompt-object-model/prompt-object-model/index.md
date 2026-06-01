---
slug: "/reference/typescript/pom/prompt-object-model/prompt-object-model"
title: "PromptObjectModel"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "POM.PromptObjectModel.PromptObjectModel"
  parent: "POM.PromptObjectModel"
  module: "POM.PromptObjectModel"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/POM/PromptObjectModel.ts"
---
# `PromptObjectModel`

The Prompt Object Model — a structured, serializable representation of a
full prompt document. Direct port of Python's
`signalwire.pom.pom.PromptObjectModel`.

## Signature

```typescript
class PromptObjectModel
```

## Properties

| Name       | Type        | Required | Default | Description                                                                                                                             |
| ---------- | ----------- | -------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| `debug`    | `boolean`   | yes      | —       | Whether to print debug info during [renderMarkdown](/reference/typescript/pom/prompt-object-model/prompt-object-model/render-markdown). |
| `sections` | `Section[]` | yes      | —       | Top-level sections in the model.                                                                                                        |

## Methods

- [`addPomAsSubsection`](/reference/typescript/pom/prompt-object-model/prompt-object-model/add-pom-as-subsection) — Add another PromptObjectModel as subsections of an existing section.
- [`addSection`](/reference/typescript/pom/prompt-object-model/prompt-object-model/add-section) — Add a top-level section to the model.
- [`constructor`](/reference/typescript/pom/prompt-object-model/prompt-object-model/constructor)
- [`findSection`](/reference/typescript/pom/prompt-object-model/prompt-object-model/find-section) — Find a section by its title (recursive search through all sections and subsections).
- [`fromJson`](/reference/typescript/pom/prompt-object-model/prompt-object-model/from-json) — Create a PromptObjectModel from JSON data (string or already-parsed object).
- [`fromYaml`](/reference/typescript/pom/prompt-object-model/prompt-object-model/from-yaml) — Create a PromptObjectModel from YAML data (string or already-parsed object).
- [`renderMarkdown`](/reference/typescript/pom/prompt-object-model/prompt-object-model/render-markdown) — Render the entire model as markdown.
- [`renderXml`](/reference/typescript/pom/prompt-object-model/prompt-object-model/render-xml) — Render the entire model as XML.
- [`toDict`](/reference/typescript/pom/prompt-object-model/prompt-object-model/to-dict) — Convert the entire model to a list of dictionaries.
- [`toJson`](/reference/typescript/pom/prompt-object-model/prompt-object-model/to-json) — Convert the entire model to a JSON string (pretty-printed with 2-space indent).
- [`toYaml`](/reference/typescript/pom/prompt-object-model/prompt-object-model/to-yaml) — Convert the entire model to a YAML string.

## Source

[`src/POM/PromptObjectModel.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/POM/PromptObjectModel.ts)

Line 253.
