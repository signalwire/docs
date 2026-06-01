---
slug: "/reference/typescript/prefabs/receptionist-agent/receptionist-department"
title: "ReceptionistDepartment"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "prefabs.ReceptionistAgent.ReceptionistDepartment"
  parent: "prefabs.ReceptionistAgent"
  module: "prefabs.ReceptionistAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/ReceptionistAgent.ts"
---
# `ReceptionistDepartment`

A department the receptionist can route callers to.

## Signature

```typescript
interface ReceptionistDepartment
```

## Properties

| Name          | Type     | Required | Default | Description                                                |
| ------------- | -------- | -------- | ------- | ---------------------------------------------------------- |
| `description` | `string` | yes      | —       | Description of the department's purpose (shown to the AI). |
| `name`        | `string` | yes      | —       | Department identifier (e.g. `"sales"`, `"support"`).       |
| `number`      | `string` | yes      | —       | Phone number (or SIP address) used by `transfer_call`.     |

## Source

[`src/prefabs/ReceptionistAgent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/ReceptionistAgent.ts)

Line 17.
