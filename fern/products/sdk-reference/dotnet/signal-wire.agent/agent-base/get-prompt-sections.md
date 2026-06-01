---
slug: "/reference/dotnet/signal-wire.agent/agent-base/get-prompt-sections"
title: "GetPromptSections()"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Agent.AgentBase.GetPromptSections()"
  parent: "SignalWire.Agent.AgentBase"
  module: "SignalWire.Agent"
  visibility: "public"
---
# `GetPromptSections()`

The raw POM section dicts. Mirrors how the dotnet
agent has historically stored its prompt-object data and how
SWML rendering consumes it. Read-only snapshot.

## Signature

```dotnet
public IReadOnlyList<Dictionary<string, object>> GetPromptSections()
```

## Returns

`IReadOnlyList<Dictionary<string,object>>`
