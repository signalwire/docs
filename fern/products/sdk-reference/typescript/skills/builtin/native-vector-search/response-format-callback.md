---
slug: "/reference/typescript/skills/builtin/native-vector-search/response-format-callback"
title: "ResponseFormatCallback"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "type_alias"
  language: "typescript"
  qualified_name: "skills.builtin.native_vector_search.ResponseFormatCallback"
  parent: "skills.builtin.native_vector_search"
  module: "skills.builtin.native_vector_search"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/native_vector_search.ts"
---
# `ResponseFormatCallback`

Callback signature for customizing the formatted search response.

The context object is the TypeScript idiom for Python's positional-args
convention: `(response, agent, query, results, args)`. All Python fields are
present plus TS-specific additions (`count`, `skill`):

- `response`  — pre-formatted response string (same as Python arg 1)
- `agent`     — the AgentBase instance that owns this skill (same as Python arg 2)
- `query`     — the search query string (same as Python arg 3)
- `results`   — array of search results (same as Python arg 4)
- `args`      — raw tool call arguments (same as Python arg 5)
- `count`     — requested result count (TS addition)
- `skill`     — this skill instance (TS addition)

## Signature

```typescript
type ResponseFormatCallback = (ctx: { agent?: AgentBase; args: Record<string, unknown>; count: number; query: string; response: string; results: { content: string; metadata: Record<string, unknown>; score: number }[]; skill: NativeVectorSearchSkill }) => string
```

## Source

[`src/skills/builtin/native_vector_search.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/native_vector_search.ts)

Line 47.
