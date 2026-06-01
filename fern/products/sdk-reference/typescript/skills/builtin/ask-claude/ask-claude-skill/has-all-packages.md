---
slug: "/reference/typescript/skills/builtin/ask-claude/ask-claude-skill/has-all-packages"
title: "hasAllPackages"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.ask_claude.AskClaudeSkill.hasAllPackages"
  parent: "skills.builtin.ask_claude.AskClaudeSkill"
  module: "skills.builtin.ask_claude"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts"
---
# `hasAllPackages`

Check if all required packages declared in the manifest are available.
Convenience wrapper around `validatePackages()` that returns a boolean,
matching the Python `validate_packages() -> bool` return type.

## Signature

```typescript
hasAllPackages(): Promise<boolean>
```

## Returns

`Promise<boolean>` — `true` if all required packages are importable, `false` otherwise.

## Source

[`src/skills/SkillBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts)

Line 579.
