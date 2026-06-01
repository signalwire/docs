---
slug: "/reference/typescript/skills/skill-manager/skill-manager/remove-skill"
title: "removeSkill"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.SkillManager.SkillManager.removeSkill"
  parent: "skills.SkillManager.SkillManager"
  module: "skills.SkillManager"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillManager.ts"
---
# `removeSkill`

Remove a skill by its instance key or instance ID, calling cleanup() before removal.

**Remarks:** Equivalent to Python's `unload_skill(skill_identifier)`. Callers porting
from Python should change `skill_manager.unload_skill(id)` →
`skillManager.removeSkill(id)`.

## Signature

```typescript
removeSkill(keyOrId: string): Promise<boolean>
```

## Parameters

| Name      | Type     | Required | Default | Description                                             |
| --------- | -------- | -------- | ------- | ------------------------------------------------------- |
| `keyOrId` | `string` | yes      | —       | The instance key or instance ID of the skill to remove. |

## Returns

`Promise<boolean>` — True if the skill was found and removed, false otherwise.

## Source

[`src/skills/SkillManager.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillManager.ts)

Line 148.
