---
slug: "/reference/typescript/skills/builtin/info-gatherer/info-gatherer-skill/setup"
title: "setup"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.info_gatherer.InfoGathererSkill.setup"
  parent: "skills.builtin.info_gatherer.InfoGathererSkill"
  module: "skills.builtin.info_gatherer"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/info_gatherer.ts"
---
# `setup`

Validate the `questions` config, derive tool names (with optional prefix),
and cache the completion message.

Python parity: skill.py:91-121. Returns `false` (logging an error) when
`questions` is missing or fails validation; setup must produce a
functional skill or fail closed.

## Signature

```typescript
setup(): Promise<boolean>
```

## Returns

`Promise<boolean>`

## Source

[`src/skills/builtin/info_gatherer.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/info_gatherer.ts)

Line 129.
