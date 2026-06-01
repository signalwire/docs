---
slug: "/reference/typescript/skills/builtin/weather-api/weather-api-skill/get-skill-namespace"
title: "getSkillNamespace"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.weather_api.WeatherApiSkill.getSkillNamespace"
  parent: "skills.builtin.weather_api.WeatherApiSkill"
  module: "skills.builtin.weather_api"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts"
---
# `getSkillNamespace`

Get the namespaced key for storing per-skill data in global\_data.

## Signature

```typescript
getSkillNamespace(): string
```

## Returns

`string` — A string like "skill:datetime" or "skill:my\_prefix".

## Source

[`src/skills/SkillBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts)

Line 440.
