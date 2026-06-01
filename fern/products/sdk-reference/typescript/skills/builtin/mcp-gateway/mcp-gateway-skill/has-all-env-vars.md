---
slug: "/reference/typescript/skills/builtin/mcp-gateway/mcp-gateway-skill/has-all-env-vars"
title: "hasAllEnvVars"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.mcp_gateway.McpGatewaySkill.hasAllEnvVars"
  parent: "skills.builtin.mcp_gateway.McpGatewaySkill"
  module: "skills.builtin.mcp_gateway"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts"
---
# `hasAllEnvVars`

Check if all required environment variables are present.
Convenience wrapper around `validateEnvVars()` that returns a boolean,
matching the Python `validate_env_vars() -> bool` return type.

## Signature

```typescript
hasAllEnvVars(): boolean
```

## Returns

`boolean` — `true` if all required env vars are set, `false` otherwise.

## Source

[`src/skills/SkillBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts)

Line 544.
