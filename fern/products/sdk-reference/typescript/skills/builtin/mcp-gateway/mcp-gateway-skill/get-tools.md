---
slug: "/reference/typescript/skills/builtin/mcp-gateway/mcp-gateway-skill/get-tools"
title: "getTools"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.mcp_gateway.McpGatewaySkill.getTools"
  parent: "skills.builtin.mcp_gateway.McpGatewaySkill"
  module: "skills.builtin.mcp_gateway"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/mcp_gateway.ts"
---
# `getTools`

## Signature

```typescript
getTools(): SkillToolDefinition[]
```

## Returns

`SkillToolDefinition[]` — Dynamically discovered MCP tools plus an internal hangup-cleanup tool. If discovery has not completed, returns a single fallback `mcp_invoke` tool that explains configuration is missing.

## Source

[`src/skills/builtin/mcp_gateway.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/mcp_gateway.ts)

Line 290.
