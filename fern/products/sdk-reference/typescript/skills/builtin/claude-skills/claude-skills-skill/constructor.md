---
slug: "/reference/typescript/skills/builtin/claude-skills/claude-skills-skill/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.claude_skills.ClaudeSkillsSkill.constructor"
  parent: "skills.builtin.claude_skills.ClaudeSkillsSkill"
  module: "skills.builtin.claude_skills"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts"
---
# `constructor`

Create a new skill instance.

Python parity: `core/skill_base.py:32-43`.
Python `__init__` raises `ValueError` if `SKILL_NAME` or `SKILL_DESCRIPTION`
is left as `None` on the subclass. TS throws the equivalent when the static
defaults haven't been overridden.

## Signature

```typescript
constructor(config?: SkillConfig): ClaudeSkillsSkill
```

## Parameters

| Name     | Type          | Required | Default | Description                                                |
| -------- | ------------- | -------- | ------- | ---------------------------------------------------------- |
| `config` | `SkillConfig` | no       | —       | Optional configuration key-value pairs (Python: `params`). |

## Returns

`ClaudeSkillsSkill`

## Source

[`src/skills/SkillBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts)

Line 282.
