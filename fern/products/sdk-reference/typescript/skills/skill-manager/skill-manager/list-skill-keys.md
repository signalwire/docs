---
slug: "/reference/typescript/skills/skill-manager/skill-manager/list-skill-keys"
title: "listSkillKeys"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.SkillManager.SkillManager.listSkillKeys"
  parent: "skills.SkillManager.SkillManager"
  module: "skills.SkillManager"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillManager.ts"
---
# `listSkillKeys`

List the instance keys of all currently loaded skills.
Python equivalent: `list_loaded_skills() -> List[str]` which returns
`list(self.loaded_skills.keys())`.

Use `listSkills()` for richer objects (name, instanceId, initialized).
Use `listSkillKeys()` for a flat list of instance key strings.

**Remarks:** Equivalent to Python's `list_loaded_skills()`. Callers porting from
Python should change `skill_manager.list_loaded_skills()` →
`skillManager.listSkillKeys()`.

## Signature

```typescript
listSkillKeys(): string[]
```

## Returns

`string[]` — Array of instance key strings.

## Source

[`src/skills/SkillManager.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillManager.ts)

Line 310.
