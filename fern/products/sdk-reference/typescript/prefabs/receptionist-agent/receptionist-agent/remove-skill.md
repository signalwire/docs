---
slug: "/reference/typescript/prefabs/receptionist-agent/receptionist-agent/remove-skill"
title: "removeSkill"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ReceptionistAgent.ReceptionistAgent.removeSkill"
  parent: "prefabs.ReceptionistAgent.ReceptionistAgent"
  module: "prefabs.ReceptionistAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `removeSkill`

Remove a previously added skill by its instance ID.

## Signature

```typescript
removeSkill(instanceId: string): Promise<boolean>
```

## Parameters

| Name         | Type     | Required | Default | Description                                    |
| ------------ | -------- | -------- | ------- | ---------------------------------------------- |
| `instanceId` | `string` | yes      | —       | The unique instance ID of the skill to remove. |

## Returns

`Promise<boolean>` — True if the skill was found and removed.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1640.
