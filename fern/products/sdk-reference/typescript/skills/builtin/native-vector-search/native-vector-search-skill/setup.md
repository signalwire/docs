---
slug: "/reference/typescript/skills/builtin/native-vector-search/native-vector-search-skill/setup"
title: "setup"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.native_vector_search.NativeVectorSearchSkill.setup"
  parent: "skills.builtin.native_vector_search.NativeVectorSearchSkill"
  module: "skills.builtin.native_vector_search"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/native_vector_search.ts"
---
# `setup`

Setup the skill. Called when the skill is added to an agent.
Override to perform initialization (API connections, config validation, etc.)

## Signature

```typescript
setup(): Promise<boolean>
```

## Returns

`Promise<boolean>` — `true` if setup succeeded, `false` otherwise. Python equivalent: abstract `setup() -> bool`.

## Source

[`src/skills/builtin/native_vector_search.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/native_vector_search.ts)

Line 412.
