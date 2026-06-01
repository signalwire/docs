---
slug: "/reference/dotnet/signal-wire.agent/agent-base/add-skill-string-dictionary-string-object"
title: "AddSkill(string, Dictionary<string, object>?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Agent.AgentBase.AddSkill(string, System.Collections.Generic.Dictionary<string, object>?)"
  parent: "SignalWire.Agent.AgentBase"
  module: "SignalWire.Agent"
  visibility: "public"
---
# `AddSkill(string, Dictionary<string, object>?)`

Load and activate a skill by name. Resolves through <xref href="SignalWire.Skills.SkillRegistry" data-throw-if-not-resolved="false"></xref>,
validates env vars, calls Setup/RegisterTools, and merges hints/globalData/prompts.

## Signature

```dotnet
public AgentBase AddSkill(string name, Dictionary<string, object>? parameters = null)
```

## Parameters

| Name         | Type                        | Required | Default | Description |
| ------------ | --------------------------- | -------- | ------- | ----------- |
| `name`       | `string`                    | yes      | —       | —           |
| `parameters` | `Dictionary<string,object>` | no       | `null`  | —           |

## Returns

`SignalWire.Agent.AgentBase`
