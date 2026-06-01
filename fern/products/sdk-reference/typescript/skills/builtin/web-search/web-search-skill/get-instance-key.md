---
slug: "/reference/typescript/skills/builtin/web-search/web-search-skill/get-instance-key"
title: "getInstanceKey"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.web_search.WebSearchSkill.getInstanceKey"
  parent: "skills.builtin.web_search.WebSearchSkill"
  module: "skills.builtin.web_search"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/web_search.ts"
---
# `getInstanceKey`

Instance key for the SkillManager. Includes the configured
`search_engine_id` (or `"default"`) and `tool_name` (or `"web_search"`)
to match Python's `"{SKILL_NAME}_{search_engine_id}_{tool_name}"` scheme.

## Signature

```typescript
getInstanceKey(): string
```

## Returns

`string`

## Source

[`src/skills/builtin/web_search.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/web_search.ts)

Line 346.
