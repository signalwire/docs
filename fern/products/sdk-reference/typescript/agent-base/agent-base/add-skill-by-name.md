---
slug: "/reference/typescript/agent-base/agent-base/add-skill-by-name"
title: "addSkillByName"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "AgentBase.AgentBase.addSkillByName"
  parent: "AgentBase.AgentBase"
  module: "AgentBase"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `addSkillByName`

Add a skill by its registered name, looking it up in the global SkillRegistry.

Matches Python's `add_skill(skill_name, params)` which loads skills by string
name via the SkillManager registry. Throws a `ValueError`-equivalent if the
skill name is not found in the registry.

## Signature

```typescript
addSkillByName(skillName: string, params?: SkillConfig): Promise<AgentBase>
```

## Parameters

| Name        | Type          | Required | Default | Description                                                       |
| ----------- | ------------- | -------- | ------- | ----------------------------------------------------------------- |
| `skillName` | `string`      | yes      | —       | The name the skill was registered under in the SkillRegistry.     |
| `params`    | `SkillConfig` | no       | —       | Optional configuration parameters forwarded to the skill factory. |

## Returns

`Promise<AgentBase>` — This agent instance for chaining.

## Throws

- Error if no skill with the given name is registered.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1627.
