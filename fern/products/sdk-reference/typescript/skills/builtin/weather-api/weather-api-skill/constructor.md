---
slug: "/reference/typescript/skills/builtin/weather-api/weather-api-skill/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.weather_api.WeatherApiSkill.constructor"
  parent: "skills.builtin.weather_api.WeatherApiSkill"
  module: "skills.builtin.weather_api"
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
constructor(config?: SkillConfig): WeatherApiSkill
```

## Parameters

| Name     | Type          | Required | Default | Description                                                |
| -------- | ------------- | -------- | ------- | ---------------------------------------------------------- |
| `config` | `SkillConfig` | no       | —       | Optional configuration key-value pairs (Python: `params`). |

## Returns

`WeatherApiSkill`

## Source

[`src/skills/SkillBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts)

Line 282.
