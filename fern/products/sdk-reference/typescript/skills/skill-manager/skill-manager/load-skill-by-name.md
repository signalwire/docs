---
slug: "/reference/typescript/skills/skill-manager/skill-manager/load-skill-by-name"
title: "loadSkillByName"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.SkillManager.SkillManager.loadSkillByName"
  parent: "skills.SkillManager.SkillManager"
  module: "skills.SkillManager"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillManager.ts"
---
# `loadSkillByName`

Load a skill by name from the global SkillRegistry, construct it, and add it.
This is the TypeScript equivalent of Python's `load_skill(skill_name)` path
where `skill_class=None` triggers a registry lookup.

**Remarks:** Equivalent to Python's `load_skill(skill_name)` (registry path, where
`skill_class=None`). Callers porting from Python should change
`skill_manager.load_skill(name)` → `skillManager.loadSkillByName(name)`.

## Signature

```typescript
loadSkillByName(
  skillName: string,
  config?: SkillConfig
): Promise<[boolean, string]>
```

## Parameters

| Name        | Type          | Required | Default | Description                                                |
| ----------- | ------------- | -------- | ------- | ---------------------------------------------------------- |
| `skillName` | `string`      | yes      | —       | The registered skill name to look up in the SkillRegistry. |
| `config`    | `SkillConfig` | no       | —       | Optional configuration to pass to the skill factory.       |

## Returns

`Promise<[boolean, string]>` — A tuple `[success, errorMessage]` matching Python's `load_skill` return contract. `errorMessage` is an empty string on success.

## Source

[`src/skills/SkillManager.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillManager.ts)

Line 270.
