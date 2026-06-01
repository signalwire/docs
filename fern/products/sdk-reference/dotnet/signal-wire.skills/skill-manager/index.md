---
slug: "/reference/dotnet/signal-wire.skills/skill-manager"
title: "SkillManager"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Skills.SkillManager"
  parent: "SignalWire.Skills"
  module: "SignalWire.Skills"
  visibility: "public"
---
# `SkillManager`

Loads, unloads, and queries skills on behalf of an <xref href="SignalWire.Agent.AgentBase" data-throw-if-not-resolved="false"></xref>.
Validates env vars, calls Setup/RegisterTools, and merges hints/globalData/prompts.

**Modifiers:** `sealed`

## Signature

```dotnet
public sealed class SkillManager
```

## Properties

| Name     | Type                            | Required | Default | Description                                                                          |
| -------- | ------------------------------- | -------- | ------- | ------------------------------------------------------------------------------------ |
| `Logger` | `public Logger Logger { get; }` | yes      | —       | The skill\_manager logger (Python parity: `SkillManager.logger` instance attribute). |

## Methods

- [`GetSkill(string)`](/reference/dotnet/signal-wire.skills/skill-manager/get-skill-string)
- [`HasSkill(string)`](/reference/dotnet/signal-wire.skills/skill-manager/has-skill-string)
- [`ListSkills()`](/reference/dotnet/signal-wire.skills/skill-manager/list-skills)
- [`LoadSkill(string, Dictionary<string, object>?)`](/reference/dotnet/signal-wire.skills/skill-manager/load-skill-string-dictionary-string-object) — Load a skill by name (resolved via registry) or by explicit type. Returns (success, errorMessage).
- [`SkillManager(AgentBase)`](/reference/dotnet/signal-wire.skills/skill-manager/skill-manager-agent-base)
- [`UnloadSkill(string)`](/reference/dotnet/signal-wire.skills/skill-manager/unload-skill-string)
