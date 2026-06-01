---
slug: "/reference/typescript/skills/skill-base/skill-prompt-section"
title: "SkillPromptSection"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "skills.SkillBase.SkillPromptSection"
  parent: "skills.SkillBase"
  module: "skills.SkillBase"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts"
---
# `SkillPromptSection`

A section of prompt content injected into the agent's system prompt by a skill.

## Signature

```typescript
interface SkillPromptSection
```

## Properties

| Name       | Type       | Required | Default | Description                                                      |
| ---------- | ---------- | -------- | ------- | ---------------------------------------------------------------- |
| `body`     | `string`   | no       | —       | Optional body text for the section.                              |
| `bullets`  | `string[]` | no       | —       | Optional bullet points appended after the body.                  |
| `numbered` | `boolean`  | no       | —       | If true, render bullets as a numbered list instead of unordered. |
| `title`    | `string`   | yes      | —       | Section heading displayed in the prompt.                         |

## Source

[`src/skills/SkillBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts)

Line 49.
