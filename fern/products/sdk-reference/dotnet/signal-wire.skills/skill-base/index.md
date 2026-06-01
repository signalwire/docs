---
slug: "/reference/dotnet/signal-wire.skills/skill-base"
title: "SkillBase"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Skills.SkillBase"
  parent: "SignalWire.Skills"
  module: "SignalWire.Skills"
  visibility: "public"
---
# `SkillBase`

Abstract base class for all skills. Provides lifecycle hooks, tool registration,
hint/globalData/prompt merging, and a <xref href="SignalWire.Skills.SkillBase.DefineTool(System.String%2cSystem.String%2cSystem.Collections.Generic.Dictionary%7bSystem.String%2cSystem.Object%7d%2cSystem.Func%7bSystem.Collections.Generic.Dictionary%7bSystem.String%2cSystem.Object%7d%2cSystem.Collections.Generic.Dictionary%7bSystem.String%2cSystem.Object%7d%2cSignalWire.SWAIG.FunctionResult%7d)" data-throw-if-not-resolved="false"></xref> helper that
delegates to the owning agent.

**Modifiers:** `abstract`

## Signature

```dotnet
public abstract class SkillBase
```

## Properties

| Name                        | Type                                                     | Required | Default | Description                                      |
| --------------------------- | -------------------------------------------------------- | -------- | ------- | ------------------------------------------------ |
| `Agent`                     | `public AgentBase Agent { get; }`                        | yes      | —       | —                                                |
| `Description`               | `public abstract string Description { get; }`            | yes      | —       | —                                                |
| `Name`                      | `public abstract string Name { get; }`                   | yes      | —       | —                                                |
| `Params`                    | `public Dictionary<string, object> Params { get; }`      | yes      | —       | —                                                |
| `RequiredEnvVars`           | `public virtual List<string> RequiredEnvVars { get; }`   | yes      | —       | —                                                |
| `SkipPrompt`                | `protected bool SkipPrompt { get; }`                     | yes      | —       | Check whether prompt sections should be skipped. |
| `SupportsMultipleInstances` | `public virtual bool SupportsMultipleInstances { get; }` | yes      | —       | —                                                |
| `Version`                   | `public virtual string Version { get; }`                 | yes      | —       | —                                                |

## Methods

- [`Cleanup()`](/reference/dotnet/signal-wire.skills/skill-base/cleanup)
- [`DefineTool(string, string, Dictionary<string, object>, Func<Dictionary<string, object>, Dictionary<string, object?>, FunctionResult>)`](/reference/dotnet/signal-wire.skills/skill-base/define-tool-string-string-dictionary-string-object-func-dictionary-string-object-dictionary-string-object-function-result) — Convenience wrapper that merges swaig\_fields and delegates to AgentBase.DefineTool.
- [`GetGlobalData()`](/reference/dotnet/signal-wire.skills/skill-base/get-global-data)
- [`GetHints()`](/reference/dotnet/signal-wire.skills/skill-base/get-hints)
- [`GetInstanceKey()`](/reference/dotnet/signal-wire.skills/skill-base/get-instance-key)
- [`GetParameterSchema()`](/reference/dotnet/signal-wire.skills/skill-base/get-parameter-schema)
- [`GetPromptSections()`](/reference/dotnet/signal-wire.skills/skill-base/get-prompt-sections)
- [`GetToolName(string)`](/reference/dotnet/signal-wire.skills/skill-base/get-tool-name-string) — Return the tool name override from params, or <code class="paramref">defaultName</code>.
- [`RegisterTools(AgentBase)`](/reference/dotnet/signal-wire.skills/skill-base/register-tools-agent-base)
- [`Setup(AgentBase, Dictionary<string, object>)`](/reference/dotnet/signal-wire.skills/skill-base/setup-agent-base-dictionary-string-object)
- [`ValidateEnvVars()`](/reference/dotnet/signal-wire.skills/skill-base/validate-env-vars)
- [`Wire(AgentBase, Dictionary<string, object>)`](/reference/dotnet/signal-wire.skills/skill-base/wire-agent-base-dictionary-string-object)
