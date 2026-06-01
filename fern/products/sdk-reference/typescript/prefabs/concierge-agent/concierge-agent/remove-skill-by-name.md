---
slug: "/reference/typescript/prefabs/concierge-agent/concierge-agent/remove-skill-by-name"
title: "removeSkillByName"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ConciergeAgent.ConciergeAgent.removeSkillByName"
  parent: "prefabs.ConciergeAgent.ConciergeAgent"
  module: "prefabs.ConciergeAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `removeSkillByName`

Remove a skill by its name (Python parity).

Python's `remove_skill(skill_name)` removes by skill name.
The existing `removeSkill(instanceId)` removes by instance ID.
This method provides name-based removal for cross-SDK parity.

## Signature

```typescript
removeSkillByName(skillName: string): Promise<boolean>
```

## Parameters

| Name        | Type     | Required | Default | Description               |
| ----------- | -------- | -------- | ------- | ------------------------- |
| `skillName` | `string` | yes      | —       | The skill name to remove. |

## Returns

`Promise<boolean>` — True if a skill with that name was found and removed.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1671.
