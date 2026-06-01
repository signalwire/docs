---
slug: "/reference/typescript/skills/builtin/play-background-file/play-background-file-skill/set-agent"
title: "setAgent"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.play_background_file.PlayBackgroundFileSkill.setAgent"
  parent: "skills.builtin.play_background_file.PlayBackgroundFileSkill"
  module: "skills.builtin.play_background_file"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts"
---
# `setAgent`

Set the agent reference for this skill.
Called by the SkillManager/AgentBase when the skill is attached to an agent.
Python equivalent: `self.agent = agent` in `__init__`.

## Signature

```typescript
setAgent(agent: AgentBase): void
```

## Parameters

| Name    | Type        | Required | Default | Description                     |
| ------- | ----------- | -------- | ------- | ------------------------------- |
| `agent` | `AgentBase` | yes      | —       | The agent that owns this skill. |

## Returns

`void`

## Source

[`src/skills/SkillBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts)

Line 534.
