---
slug: "/reference/typescript/skills/builtin/claude-skills/claude-skills-skill/setup"
title: "setup"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.claude_skills.ClaudeSkillsSkill.setup"
  parent: "skills.builtin.claude_skills.ClaudeSkillsSkill"
  module: "skills.builtin.claude_skills"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/claude_skills.ts"
---
# `setup`

Setup the Claude skills loader — discovers and parses all SKILL.md files.

Returns `true` on success and `false` on any failure (missing path,
invalid path, stat failure, or non-directory), mirroring the Python
skill's `setup() -> bool` contract.

## Signature

```typescript
setup(): Promise<boolean>
```

## Returns

`Promise<boolean>`

## Source

[`src/skills/builtin/claude_skills.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/claude_skills.ts)

Line 186.
