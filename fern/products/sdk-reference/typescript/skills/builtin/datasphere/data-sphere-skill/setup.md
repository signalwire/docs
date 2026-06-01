---
slug: "/reference/typescript/skills/builtin/datasphere/data-sphere-skill/setup"
title: "setup"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.datasphere.DataSphereSkill.setup"
  parent: "skills.builtin.datasphere.DataSphereSkill"
  module: "skills.builtin.datasphere"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/datasphere.ts"
---
# `setup`

Validate required credentials before the skill becomes active.

Mirrors Python skills/datasphere/skill.py:120-128: `setup()` returns false
when any of `space_name`, `project_id`, `token`, or `document_id` is
missing from either config or env. Fails closed so SkillManager refuses
to register a skill that would break at call time.

## Signature

```typescript
setup(): Promise<boolean>
```

## Returns

`Promise<boolean>`

## Source

[`src/skills/builtin/datasphere.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/datasphere.ts)

Line 195.
