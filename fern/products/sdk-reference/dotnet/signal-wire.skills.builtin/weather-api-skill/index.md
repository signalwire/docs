---
slug: "/reference/dotnet/signal-wire.skills.builtin/weather-api-skill"
title: "WeatherApiSkill"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Skills.Builtin.WeatherApiSkill"
  parent: "SignalWire.Skills.Builtin"
  module: "SignalWire.Skills.Builtin"
  visibility: "public"
---
# `WeatherApiSkill`

Get current weather information from WeatherAPI.com (DataMap).

**Modifiers:** `sealed`

## Signature

```dotnet
public sealed class WeatherApiSkill : SkillBase
```

## Inheritance

**Extends:** [SignalWire.Skills.SkillBase](/reference/dotnet/signal-wire.skills/skill-base)

## Properties

| Name          | Type                                          | Required | Default | Description |
| ------------- | --------------------------------------------- | -------- | ------- | ----------- |
| `Description` | `public override string Description { get; }` | yes      | —       | —           |
| `Name`        | `public override string Name { get; }`        | yes      | —       | —           |

## Methods

- [`RegisterTools(AgentBase)`](/reference/dotnet/signal-wire.skills.builtin/weather-api-skill/register-tools-agent-base)
- [`Setup(AgentBase, Dictionary<string, object>)`](/reference/dotnet/signal-wire.skills.builtin/weather-api-skill/setup-agent-base-dictionary-string-object)
