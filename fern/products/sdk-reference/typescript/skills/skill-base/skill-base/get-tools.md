---
slug: "/reference/typescript/skills/skill-base/skill-base/get-tools"
title: "getTools"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.SkillBase.SkillBase.getTools"
  parent: "skills.SkillBase.SkillBase"
  module: "skills.SkillBase"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts"
---
# `getTools`

Return the SWAIG tool definitions this skill provides.

Default implementation returns tools registered imperatively via
`defineTool()`. Skills using the declarative pattern override this
method to return a static array built from their config.

Python parity: replaces the `@abstractmethod register_tools()` contract
— Python skills call `self.define_tool(...)` inside `register_tools()`;
TypeScript skills either call `this.defineTool(...)` in `setup()` (and
let the default `getTools()` return them) or override `getTools()`
directly.

## Signature

```typescript
getTools(): SkillToolDefinition[]
```

## Returns

`SkillToolDefinition[]` — Array of tool definitions to register with the agent.

## Source

[`src/skills/SkillBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts)

Line 332.
