---
slug: "/reference/dotnet/signal-wire.skills/skill-registry/get-factory-string"
title: "GetFactory(string)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Skills.SkillRegistry.GetFactory(string)"
  parent: "SignalWire.Skills.SkillRegistry"
  module: "SignalWire.Skills"
  visibility: "public"
---
# `GetFactory(string)`

Get the factory for a skill name. Checks custom registrations first,
then falls back to built-in factories.

## Signature

```dotnet
public Func<SkillBase>? GetFactory(string name)
```

## Parameters

| Name   | Type     | Required | Default | Description |
| ------ | -------- | -------- | ------- | ----------- |
| `name` | `string` | yes      | —       | —           |

## Returns

`System.Func<SignalWire.Skills.SkillBase>`
