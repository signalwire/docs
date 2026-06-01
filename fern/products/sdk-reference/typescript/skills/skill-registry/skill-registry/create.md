---
slug: "/reference/typescript/skills/skill-registry/skill-registry/create"
title: "create"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.SkillRegistry.SkillRegistry.create"
  parent: "skills.SkillRegistry.SkillRegistry"
  module: "skills.SkillRegistry"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillRegistry.ts"
---
# `create`

Create a new skill instance by looking up its class in the registry.
Matches Python's `skill_manager.load_skill(name)` class-lookup + instantiate
flow (`skill_manager.py:97`: `skill_instance = skill_class(self.agent, params)`).

## Signature

```typescript
create(name: string, config?: SkillConfig): SkillBase | null
```

## Parameters

| Name     | Type          | Required | Default | Description                                              |
| -------- | ------------- | -------- | ------- | -------------------------------------------------------- |
| `name`   | `string`      | yes      | —       | The registered skill name.                               |
| `config` | `SkillConfig` | no       | —       | Optional configuration to pass to the skill constructor. |

## Returns

`SkillBase | null` — A new skill instance, or null if the name is not registered.

## Source

[`src/skills/SkillRegistry.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillRegistry.ts)

Line 163.
