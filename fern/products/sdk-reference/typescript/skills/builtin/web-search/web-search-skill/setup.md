---
slug: "/reference/typescript/skills/builtin/web-search/web-search-skill/setup"
title: "setup"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.web_search.WebSearchSkill.setup"
  parent: "skills.builtin.web_search.WebSearchSkill"
  module: "skills.builtin.web_search"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/web_search.ts"
---
# `setup`

Validate required credentials before the skill becomes active.

Mirrors Python's `setup()` (skill.py:559-600) which checks `api_key` and
`search_engine_id` and returns `False` (logging an error) if either is
absent. In the TS SDK credentials may also arrive via environment variables
(`GOOGLE_SEARCH_API_KEY` / `GOOGLE_SEARCH_ENGINE_ID` or the legacy alias
`GOOGLE_SEARCH_CX`), so both config params and env vars are checked.

## Signature

```typescript
setup(): Promise<boolean>
```

## Returns

`Promise<boolean>` — `true` if all required credentials are present, `false` otherwise.

## Source

[`src/skills/builtin/web_search.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/web_search.ts)

Line 321.
