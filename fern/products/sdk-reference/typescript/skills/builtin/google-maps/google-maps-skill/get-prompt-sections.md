---
slug: "/reference/typescript/skills/builtin/google-maps/google-maps-skill/get-prompt-sections"
title: "getPromptSections"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.google_maps.GoogleMapsSkill.getPromptSections"
  parent: "skills.builtin.google_maps.GoogleMapsSkill"
  module: "skills.builtin.google_maps"
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
