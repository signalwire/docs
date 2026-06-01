---
slug: "/reference/dotnet/signal-wire.skills.builtin/datetime-skill"
title: "DatetimeSkill"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Skills.Builtin.DatetimeSkill"
  parent: "SignalWire.Skills.Builtin"
  module: "SignalWire.Skills.Builtin"
  visibility: "public"
---
# `DatetimeSkill`

Get current date, time, and timezone information.

**Modifiers:** `sealed`

## Signature

```dotnet
public sealed class DatetimeSkill : SkillBase
```

## Inheritance

**Extends:** [SignalWire.Skills.SkillBase](/reference/dotnet/signal-wire.skills/skill-base)

## Properties

| Name          | Type                                          | Required | Default | Description |
| ------------- | --------------------------------------------- | -------- | ------- | ----------- |
| `Description` | `public override string Description { get; }` | yes      | —       | —           |
| `Name`        | `public override string Name { get; }`        | yes      | —       | —           |

## Methods

- [`GetPromptSections()`](/reference/dotnet/signal-wire.skills.builtin/datetime-skill/get-prompt-sections)
- [`RegisterTools(AgentBase)`](/reference/dotnet/signal-wire.skills.builtin/datetime-skill/register-tools-agent-base)
- [`Setup(AgentBase, Dictionary<string, object>)`](/reference/dotnet/signal-wire.skills.builtin/datetime-skill/setup-agent-base-dictionary-string-object)
