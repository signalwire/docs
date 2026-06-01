---
slug: "/reference/typescript/skills/builtin/weather-api/weather-api-skill/setup"
title: "setup"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.weather_api.WeatherApiSkill.setup"
  parent: "skills.builtin.weather_api.WeatherApiSkill"
  module: "skills.builtin.weather_api"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/weather_api.ts"
---
# `setup`

Validates that an API key is available either via inline config or the
`WEATHER_API_KEY` environment variable. Fails fast (returns `false`) when
neither source provides a key — matching Python SDK behaviour where
`_validate_config()` raises on construction when `api_key` is absent.

## Signature

```typescript
setup(): Promise<boolean>
```

## Returns

`Promise<boolean>` — `true` if a key is present, `false` otherwise.

## Source

[`src/skills/builtin/weather_api.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/weather_api.ts)

Line 84.
