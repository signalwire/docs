---
slug: "/reference/typescript/skills/builtin/wikipedia-search/wikipedia-search-skill/search-wiki"
title: "searchWiki"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.wikipedia_search.WikipediaSearchSkill.searchWiki"
  parent: "skills.builtin.wikipedia_search.WikipediaSearchSkill"
  module: "skills.builtin.wikipedia_search"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/wikipedia_search.ts"
---
# `searchWiki`

Search Wikipedia and return a formatted text summary.

Mirrors the Python `search_wiki()` public entry point so the logic can be
tested and reused outside the SWAIG handler. Uses `num_results` to decide
how many articles to aggregate.

## Signature

```typescript
searchWiki(query: string): Promise<string>
```

## Parameters

| Name    | Type     | Required | Default | Description             |
| ------- | -------- | -------- | ------- | ----------------------- |
| `query` | `string` | yes      | —       | Plain-text search term. |

## Returns

`Promise<string>` — Formatted text ready for display to the caller.

## Source

[`src/skills/builtin/wikipedia_search.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/wikipedia_search.ts)

Line 166.
