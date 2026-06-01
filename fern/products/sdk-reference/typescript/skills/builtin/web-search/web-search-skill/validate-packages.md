---
slug: "/reference/typescript/skills/builtin/web-search/web-search-skill/validate-packages"
title: "validatePackages"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.web_search.WebSearchSkill.validatePackages"
  parent: "skills.builtin.web_search.WebSearchSkill"
  module: "skills.builtin.web_search"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts"
---
# `validatePackages`

Validate that all required packages declared on the skill class can be imported.

Python parity: `core/skill_base.py:112-124` reads `self.REQUIRED_PACKAGES`
directly and tries `importlib.import_module(pkg)` for each; TS does the
equivalent with a dynamic `import()`.

## Signature

```typescript
validatePackages(): Promise<string[]>
```

## Returns

`Promise<string[]>` — Array of package names that could not be imported (empty if all present).

## Source

[`src/skills/SkillBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts)

Line 557.
