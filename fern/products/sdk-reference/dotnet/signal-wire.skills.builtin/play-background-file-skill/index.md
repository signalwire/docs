---
slug: "/reference/dotnet/signal-wire.skills.builtin/play-background-file-skill"
title: "PlayBackgroundFileSkill"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Skills.Builtin.PlayBackgroundFileSkill"
  parent: "SignalWire.Skills.Builtin"
  module: "SignalWire.Skills.Builtin"
  visibility: "public"
---
# `PlayBackgroundFileSkill`

Control background file playback (DataMap).

**Modifiers:** `sealed`

## Signature

```dotnet
public sealed class PlayBackgroundFileSkill : SkillBase
```

## Inheritance

**Extends:** [SignalWire.Skills.SkillBase](/reference/dotnet/signal-wire.skills/skill-base)

## Properties

| Name                        | Type                                                      | Required | Default | Description |
| --------------------------- | --------------------------------------------------------- | -------- | ------- | ----------- |
| `Description`               | `public override string Description { get; }`             | yes      | —       | —           |
| `Name`                      | `public override string Name { get; }`                    | yes      | —       | —           |
| `SupportsMultipleInstances` | `public override bool SupportsMultipleInstances { get; }` | yes      | —       | —           |

## Methods

- [`RegisterTools(AgentBase)`](/reference/dotnet/signal-wire.skills.builtin/play-background-file-skill/register-tools-agent-base)
- [`Setup(AgentBase, Dictionary<string, object>)`](/reference/dotnet/signal-wire.skills.builtin/play-background-file-skill/setup-agent-base-dictionary-string-object)
