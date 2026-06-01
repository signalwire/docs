---
slug: "/reference/typescript/agent-base/agent-base/add-skill"
title: "addSkill"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "AgentBase.AgentBase.addSkill"
  parent: "AgentBase.AgentBase"
  module: "AgentBase"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `addSkill`

Add a skill to this agent, registering its tools, prompt sections, hints, and global data.

## Signature

```typescript
addSkill(skill: SkillBase): Promise<AgentBase>
```

## Parameters

| Name    | Type        | Required | Default | Description                |
| ------- | ----------- | -------- | ------- | -------------------------- |
| `skill` | `SkillBase` | yes      | —       | The skill instance to add. |

## Returns

`Promise<AgentBase>` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1562.
