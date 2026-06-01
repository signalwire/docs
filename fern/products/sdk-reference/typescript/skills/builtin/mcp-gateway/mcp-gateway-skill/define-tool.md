---
slug: "/reference/typescript/skills/builtin/mcp-gateway/mcp-gateway-skill/define-tool"
title: "defineTool"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.mcp_gateway.McpGatewaySkill.defineTool"
  parent: "skills.builtin.mcp_gateway.McpGatewaySkill"
  module: "skills.builtin.mcp_gateway"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts"
  visibility: "protected"
---
# `defineTool`

Imperatively register a tool with this skill.

Python parity: `core/skill_base.py:58` `def define_tool(self, **kwargs)`.
Merges `this.swaigFields` into the tool definition (explicit fields on
`toolDef` take precedence), then pushes the result into `_dynamicTools`
so the default `getTools()` returns it at SWML render time.

Intended for skills whose tool shape depends on config evaluated at
`setup()` time. Skills with a static tool list should override
`getTools()` instead.

## Signature

```typescript
defineTool(toolDef: SkillToolDefinition): void
```

## Parameters

| Name      | Type                  | Required | Default | Description                                                                                                  |
| --------- | --------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------ |
| `toolDef` | `SkillToolDefinition` | yes      | —       | The tool definition to register. Must include at minimum `name`, `description`, `parameters`, and `handler`. |

## Returns

`void`

## Source

[`src/skills/SkillBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts)

Line 351.
