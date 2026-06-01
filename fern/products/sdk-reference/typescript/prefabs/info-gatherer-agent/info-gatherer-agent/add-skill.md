---
slug: "/reference/typescript/prefabs/info-gatherer-agent/info-gatherer-agent/add-skill"
title: "addSkill"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.InfoGathererAgent.InfoGathererAgent.addSkill"
  parent: "prefabs.InfoGathererAgent.InfoGathererAgent"
  module: "prefabs.InfoGathererAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `addSkill`

Add a skill to this agent, registering its tools, prompt sections, hints, and global data.

## Signature

```typescript
addSkill(skill: SkillBase): Promise<InfoGathererAgent>
```

## Parameters

| Name    | Type        | Required | Default | Description                |
| ------- | ----------- | -------- | ------- | -------------------------- |
| `skill` | `SkillBase` | yes      | —       | The skill instance to add. |

## Returns

`Promise<InfoGathererAgent>` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1562.
