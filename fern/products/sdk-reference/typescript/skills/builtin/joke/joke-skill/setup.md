---
slug: "/reference/typescript/skills/builtin/joke/joke-skill/setup"
title: "setup"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.joke.JokeSkill.setup"
  parent: "skills.builtin.joke.JokeSkill"
  module: "skills.builtin.joke"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts"
---
# `setup`

Setup the skill. Called when the skill is added to an agent.
Override to perform initialization (API connections, config validation, etc.)

## Signature

```typescript
setup(): Promise<boolean>
```

## Returns

`Promise<boolean>` — `true` if setup succeeded, `false` otherwise. Python equivalent: abstract `setup() -> bool`.

## Source

[`src/skills/SkillBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts)

Line 313.
