---
slug: "/reference/typescript/pom/prompt-object-model/prompt-object-model/add-pom-as-subsection"
title: "addPomAsSubsection"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "POM.PromptObjectModel.PromptObjectModel.addPomAsSubsection"
  parent: "POM.PromptObjectModel.PromptObjectModel"
  module: "POM.PromptObjectModel"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/POM/PromptObjectModel.ts"
---
# `addPomAsSubsection`

Add another PromptObjectModel as subsections of an existing section.

## Signature

```typescript
addPomAsSubsection(target: string | Section, pomToAdd: PromptObjectModel): void
```

## Parameters

| Name       | Type                | Required | Default | Description                                                         |
| ---------- | ------------------- | -------- | ------- | ------------------------------------------------------------------- |
| `target`   | `string \| Section` | yes      | —       | Either the title of the target section, or a `Section` reference.   |
| `pomToAdd` | `PromptObjectModel` | yes      | —       | The model whose top-level sections will be appended as subsections. |

## Returns

`void`

## Throws

- Error if `target` is a string and no section with that title is found.

## Source

[`src/POM/PromptObjectModel.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/POM/PromptObjectModel.ts)

Line 412.
