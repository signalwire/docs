---
slug: "/reference/typescript/prefabs/receptionist-agent/receptionist-agent/has-skill"
title: "hasSkill"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ReceptionistAgent.ReceptionistAgent.hasSkill"
  parent: "prefabs.ReceptionistAgent.ReceptionistAgent"
  module: "prefabs.ReceptionistAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `hasSkill`

Check whether a skill with the given name is registered.

## Signature

```typescript
hasSkill(skillName: string): boolean
```

## Parameters

| Name        | Type     | Required | Default | Description              |
| ----------- | -------- | -------- | ------- | ------------------------ |
| `skillName` | `string` | yes      | —       | The skill name to check. |

## Returns

`boolean` — True if a skill with that name exists.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1657.
