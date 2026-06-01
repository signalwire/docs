---
slug: "/reference/typescript/skills/builtin/play-background-file/play-background-file-skill/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.play_background_file.PlayBackgroundFileSkill.constructor"
  parent: "skills.builtin.play_background_file.PlayBackgroundFileSkill"
  module: "skills.builtin.play_background_file"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts"
---
# `constructor`

Create a new skill instance.

Python parity: `core/skill_base.py:32-43`.
Python `__init__` raises `ValueError` if `SKILL_NAME` or `SKILL_DESCRIPTION`
is left as `None` on the subclass. TS throws the equivalent when the static
defaults haven't been overridden.

## Signature

```typescript
constructor(config?: SkillConfig): PlayBackgroundFileSkill
```

## Parameters

| Name     | Type          | Required | Default | Description                                                |
| -------- | ------------- | -------- | ------- | ---------------------------------------------------------- |
| `config` | `SkillConfig` | no       | —       | Optional configuration key-value pairs (Python: `params`). |

## Returns

`PlayBackgroundFileSkill`

## Source

[`src/skills/SkillBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts)

Line 282.
