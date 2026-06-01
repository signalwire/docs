---
slug: "/reference/typescript/skills/builtin/play-background-file/play-background-file-skill/get-skill-namespace"
title: "getSkillNamespace"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.play_background_file.PlayBackgroundFileSkill.getSkillNamespace"
  parent: "skills.builtin.play_background_file.PlayBackgroundFileSkill"
  module: "skills.builtin.play_background_file"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts"
---
# `getSkillNamespace`

Get the namespaced key for storing per-skill data in global\_data.

## Signature

```typescript
getSkillNamespace(): string
```

## Returns

`string` — A string like "skill:datetime" or "skill:my\_prefix".

## Source

[`src/skills/SkillBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts)

Line 440.
