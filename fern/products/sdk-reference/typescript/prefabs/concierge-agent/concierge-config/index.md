---
slug: "/reference/typescript/prefabs/concierge-agent/concierge-config"
title: "ConciergeConfig"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "prefabs.ConciergeAgent.ConciergeConfig"
  parent: "prefabs.ConciergeAgent"
  module: "prefabs.ConciergeAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/ConciergeAgent.ts"
---
# `ConciergeConfig`

Configuration for the [ConciergeAgent](/reference/typescript/prefabs/concierge-agent/concierge-agent).

## Signature

```typescript
interface ConciergeConfig
```

## Properties

| Name                  | Type                                     | Required | Default | Description                                                                  |
| --------------------- | ---------------------------------------- | -------- | ------- | ---------------------------------------------------------------------------- |
| `agentOptions`        | `Partial<AgentOptions>`                  | no       | —       | Additional AgentBase options forwarded to `super()`.                         |
| `amenities`           | `Record<string, Record<string, string>>` | yes      | —       | Dictionary of amenities, each mapping to a dict of detail keys/values.       |
| `hoursOfOperation`    | `Record<string, string>`                 | no       | —       | Optional hours of operation by category (e.g. `{ default: "9 AM - 5 PM" }`). |
| `name`                | `string`                                 | no       | —       | Agent display name (defaults to `"concierge"`).                              |
| `route`               | `string`                                 | no       | —       | HTTP route for this agent (defaults to `"/concierge"`).                      |
| `services`            | `string[]`                               | yes      | —       | List of services offered by the venue (required).                            |
| `specialInstructions` | `string[]`                               | no       | —       | Optional special instructions appended to the agent's instruction bullets.   |
| `venueName`           | `string`                                 | yes      | —       | Name of the venue or business (required).                                    |
| `welcomeMessage`      | `string`                                 | no       | —       | Optional custom welcome message spoken as a non-bargeable static greeting.   |

## Source

[`src/prefabs/ConciergeAgent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/ConciergeAgent.ts)

Line 16.
