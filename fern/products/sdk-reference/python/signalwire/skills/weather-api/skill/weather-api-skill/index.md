---
slug: "/reference/python/signalwire/skills/weather-api/skill/weather-api-skill"
title: "WeatherApiSkill"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.skills.weather_api.skill.WeatherApiSkill"
  parent: "signalwire.skills.weather_api.skill"
  module: "signalwire.skills.weather_api.skill"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/weather_api/skill.py"
---
# `WeatherApiSkill`

Skill for getting weather information from WeatherAPI.com.

Provides current weather data with configurable temperature units and
TTS-optimized natural language responses.

Configuration:

- tool\_name: Custom name for the generated SWAIG function
- api\_key: WeatherAPI.com API key
- temperature\_unit: "fahrenheit" or "celsius" for temperature display

> \[!NOTE]
> agent.add\_skill("weather\_api", {
> "tool\_name": "get\_weather",
> "api\_key": "your\_weatherapi\_key",
> "temperature\_unit": "fahrenheit"
> })

## Signature

```python
class WeatherApiSkill(SkillBase)
```

## Inheritance

**Extends:** [SkillBase](/reference/python/signalwire/core/skill-base/skill-base)

## Properties

| Name                          | Type                          | Required | Default | Description |
| ----------------------------- | ----------------------------- | -------- | ------- | ----------- |
| `api_key`                     | `api_key`                     | yes      | —       | —           |
| `REQUIRED_ENV_VARS`           | `REQUIRED_ENV_VARS`           | yes      | —       | —           |
| `SKILL_DESCRIPTION`           | `SKILL_DESCRIPTION`           | yes      | —       | —           |
| `SKILL_NAME`                  | `SKILL_NAME`                  | yes      | —       | —           |
| `SUPPORTS_MULTIPLE_INSTANCES` | `SUPPORTS_MULTIPLE_INSTANCES` | yes      | —       | —           |
| `temperature_unit`            | `temperature_unit`            | yes      | —       | —           |
| `tool_name`                   | `tool_name`                   | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/skills/weather-api/skill/weather-api-skill/init) — Initialize the skill with configuration parameters.
- [`get_parameter_schema`](/reference/python/signalwire/skills/weather-api/skill/weather-api-skill/get-parameter-schema) — Get parameter schema for weather API skill
- [`get_tools`](/reference/python/signalwire/skills/weather-api/skill/weather-api-skill/get-tools) — Generate the SWAIG tool with DataMap webhook.
- [`register_tools`](/reference/python/signalwire/skills/weather-api/skill/weather-api-skill/register-tools) — Register SWAIG tools with the agent
- [`setup`](/reference/python/signalwire/skills/weather-api/skill/weather-api-skill/setup) — Setup the skill - validates API key is available.

## Source

[`/src/signalwire/signalwire/skills/weather_api/skill.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/weather_api/skill.py)

Line 22.
