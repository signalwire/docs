---
slug: "/reference/typescript/skills/builtin/claude-skills/claude-skills-skill/get-parameter-schema"
title: "getParameterSchema"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.claude_skills.ClaudeSkillsSkill.getParameterSchema"
  parent: "skills.builtin.claude_skills.ClaudeSkillsSkill"
  module: "skills.builtin.claude_skills"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/claude_skills.ts"
---
# `getParameterSchema`

Get the parameter schema for this skill class, describing all accepted configuration options.
Subclasses should override and call `super.getParameterSchema()` to include base parameters.

Mirrors Python's `SkillBase.get_parameter_schema()` (skill\_base.py:197-266):
returns `swaig_fields` + `skip_prompt` for all skills, and additionally adds a
`tool_name` entry with `default: cls.SKILL_NAME` for classes with
`SUPPORTS_MULTIPLE_INSTANCES = true`.

**Modifiers:** `static`

## Signature

```typescript
getParameterSchema(): Record<string, ParameterSchemaEntry>
```

## Returns

`Record<string, ParameterSchemaEntry>` — Record mapping parameter names to their schema entries.

## Source

[`src/skills/builtin/claude_skills.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/claude_skills.ts)

Line 99.
