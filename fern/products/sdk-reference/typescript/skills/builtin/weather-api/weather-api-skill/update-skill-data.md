---
slug: "/reference/typescript/skills/builtin/weather-api/weather-api-skill/update-skill-data"
title: "updateSkillData"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.weather_api.WeatherApiSkill.updateSkillData"
  parent: "skills.builtin.weather_api.WeatherApiSkill"
  module: "skills.builtin.weather_api"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts"
---
# `updateSkillData`

Update this skill's namespaced data on a FunctionResult via updateGlobalData.

## Signature

```typescript
updateSkillData(
  result: FunctionResult,
  data: Record<string, unknown>
): FunctionResult
```

## Parameters

| Name     | Type                      | Required | Default | Description                                     |
| -------- | ------------------------- | -------- | ------- | ----------------------------------------------- |
| `result` | `FunctionResult`          | yes      | —       | The FunctionResult to update.                   |
| `data`   | `Record<string, unknown>` | yes      | —       | The data to store under this skill's namespace. |

## Returns

`FunctionResult` — The FunctionResult for chaining.

## Source

[`src/skills/SkillBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts)

Line 462.
