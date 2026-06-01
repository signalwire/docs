---
slug: "/reference/dotnet/signal-wire.skills.builtin/google-maps-skill"
title: "GoogleMapsSkill"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Skills.Builtin.GoogleMapsSkill"
  parent: "SignalWire.Skills.Builtin"
  module: "SignalWire.Skills.Builtin"
  visibility: "public"
---
# `GoogleMapsSkill`

Validate addresses and compute driving routes using Google Maps (DataMap).

**Modifiers:** `sealed`

## Signature

```dotnet
public sealed class GoogleMapsSkill : SkillBase
```

## Inheritance

**Extends:** [SignalWire.Skills.SkillBase](/reference/dotnet/signal-wire.skills/skill-base)

## Properties

| Name          | Type                                          | Required | Default | Description |
| ------------- | --------------------------------------------- | -------- | ------- | ----------- |
| `Description` | `public override string Description { get; }` | yes      | —       | —           |
| `Name`        | `public override string Name { get; }`        | yes      | —       | —           |

## Methods

- [`GetHints()`](/reference/dotnet/signal-wire.skills.builtin/google-maps-skill/get-hints)
- [`GetPromptSections()`](/reference/dotnet/signal-wire.skills.builtin/google-maps-skill/get-prompt-sections)
- [`RegisterTools(AgentBase)`](/reference/dotnet/signal-wire.skills.builtin/google-maps-skill/register-tools-agent-base)
- [`Setup(AgentBase, Dictionary<string, object>)`](/reference/dotnet/signal-wire.skills.builtin/google-maps-skill/setup-agent-base-dictionary-string-object)
