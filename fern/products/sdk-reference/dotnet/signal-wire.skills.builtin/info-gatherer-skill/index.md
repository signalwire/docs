---
slug: "/reference/dotnet/signal-wire.skills.builtin/info-gatherer-skill"
title: "InfoGathererSkill"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Skills.Builtin.InfoGathererSkill"
  parent: "SignalWire.Skills.Builtin"
  module: "SignalWire.Skills.Builtin"
  visibility: "public"
---
# `InfoGathererSkill`

Gather answers to a configurable list of questions.

**Modifiers:** `sealed`

## Signature

```dotnet
public sealed class InfoGathererSkill : SkillBase
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

- [`GetGlobalData()`](/reference/dotnet/signal-wire.skills.builtin/info-gatherer-skill/get-global-data)
- [`GetPromptSections()`](/reference/dotnet/signal-wire.skills.builtin/info-gatherer-skill/get-prompt-sections)
- [`RegisterTools(AgentBase)`](/reference/dotnet/signal-wire.skills.builtin/info-gatherer-skill/register-tools-agent-base)
- [`Setup(AgentBase, Dictionary<string, object>)`](/reference/dotnet/signal-wire.skills.builtin/info-gatherer-skill/setup-agent-base-dictionary-string-object)
