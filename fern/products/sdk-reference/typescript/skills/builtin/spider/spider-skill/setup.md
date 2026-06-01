---
slug: "/reference/typescript/skills/builtin/spider/spider-skill/setup"
title: "setup"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.spider.SpiderSkill.setup"
  parent: "skills.builtin.spider.SpiderSkill"
  module: "skills.builtin.spider"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/spider.ts"
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

[`src/skills/builtin/spider.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/spider.ts)

Line 207.
