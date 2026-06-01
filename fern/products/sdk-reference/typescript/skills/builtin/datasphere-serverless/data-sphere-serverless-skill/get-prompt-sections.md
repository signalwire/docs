---
slug: "/reference/typescript/skills/builtin/datasphere-serverless/data-sphere-serverless-skill/get-prompt-sections"
title: "getPromptSections"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.datasphere_serverless.DataSphereServerlessSkill.getPromptSections"
  parent: "skills.builtin.datasphere_serverless.DataSphereServerlessSkill"
  module: "skills.builtin.datasphere_serverless"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts"
---
# `getPromptSections`

Get prompt sections to inject into the agent's system prompt.
Respects the `skip_prompt` config option — returns `[]` if set to `true`.
Subclasses should override `_getPromptSections()` instead of this method.

## Signature

```typescript
getPromptSections(): SkillPromptSection[]
```

## Returns

`SkillPromptSection[]` — Array of prompt sections with titles, bodies, and bullets.

## Source

[`src/skills/SkillBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts)

Line 382.
