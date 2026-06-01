---
slug: "/reference/typescript/skills/builtin/weather-api/weather-api-skill/get-skill-data"
title: "getSkillData"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.weather_api.WeatherApiSkill.getSkillData"
  parent: "skills.builtin.weather_api.WeatherApiSkill"
  module: "skills.builtin.weather_api"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts"
---
# `getSkillData`

Read this skill's data from a raw call data object's global\_data.

## Signature

```typescript
getSkillData(rawData: Record<string, unknown>): Record<string, unknown>
```

## Parameters

| Name      | Type                      | Required | Default | Description                                   |
| --------- | ------------------------- | -------- | ------- | --------------------------------------------- |
| `rawData` | `Record<string, unknown>` | yes      | —       | The raw request data containing global\_data. |

## Returns

`Record<string, unknown>` — The skill's stored data, or an empty object if not found.

## Source

[`src/skills/SkillBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts)

Line 450.
