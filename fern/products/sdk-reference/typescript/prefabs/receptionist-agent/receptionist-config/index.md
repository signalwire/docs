---
slug: "/reference/typescript/prefabs/receptionist-agent/receptionist-config"
title: "ReceptionistConfig"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "prefabs.ReceptionistAgent.ReceptionistConfig"
  parent: "prefabs.ReceptionistAgent"
  module: "prefabs.ReceptionistAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/ReceptionistAgent.ts"
---
# `ReceptionistConfig`

Configuration for the [ReceptionistAgent](/reference/typescript/prefabs/receptionist-agent/receptionist-agent).

## Signature

```typescript
interface ReceptionistConfig
```

## Properties

| Name               | Type                                                         | Required | Default | Description                                                             |
| ------------------ | ------------------------------------------------------------ | -------- | ------- | ----------------------------------------------------------------------- |
| `agentOptions`     | `Partial<AgentOptions>`                                      | no       | —       | Additional AgentBase options forwarded to super().                      |
| `checkInEnabled`   | `boolean`                                                    | no       | —       | Whether visitor check-in functionality is enabled. Default `false`.     |
| `companyName`      | `string`                                                     | no       | —       | Optional company name. Appended to the greeting when provided.          |
| `departments`      | `ReceptionistDepartment[]`                                   | yes      | —       | Departments the agent can transfer callers to.                          |
| `greeting`         | `string`                                                     | no       | —       | Initial greeting message. Defaults to the Python receptionist greeting. |
| `name`             | `string`                                                     | no       | —       | Agent display name (defaults to `"receptionist"`).                      |
| `onVisitorCheckIn` | `(visitor: Record<string, string>) => void \| Promise<void>` | no       | —       | Callback fired when a visitor checks in.                                |
| `route`            | `string`                                                     | no       | —       | HTTP route for this agent (defaults to `"/receptionist"`).              |
| `voice`            | `string`                                                     | no       | —       | Voice identifier passed to `addLanguage`. Defaults to `"rime.spore"`.   |

## Source

[`src/prefabs/ReceptionistAgent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/ReceptionistAgent.ts)

Line 27.
