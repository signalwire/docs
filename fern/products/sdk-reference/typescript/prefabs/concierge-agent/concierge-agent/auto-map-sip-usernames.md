---
slug: "/reference/typescript/prefabs/concierge-agent/concierge-agent/auto-map-sip-usernames"
title: "autoMapSipUsernames"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ConciergeAgent.ConciergeAgent.autoMapSipUsernames"
  parent: "prefabs.ConciergeAgent.ConciergeAgent"
  module: "prefabs.ConciergeAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `autoMapSipUsernames`

Automatically register common SIP usernames based on this agent's
name and route. Derives cleaned variants (alphanumeric + underscore)
and registers each via `registerSipUsername()`.

Port of Python's `auto_map_sip_usernames()`:

- Registers a cleaned version of the agent name
- Registers a cleaned version of the route (if different from name)
- For names longer than 3 characters, also registers a vowel-stripped variant

## Signature

```typescript
autoMapSipUsernames(): this
```

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1057.
