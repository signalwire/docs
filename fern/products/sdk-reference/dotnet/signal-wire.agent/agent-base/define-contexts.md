---
slug: "/reference/dotnet/signal-wire.agent/agent-base/define-contexts"
title: "DefineContexts()"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Agent.AgentBase.DefineContexts()"
  parent: "SignalWire.Agent.AgentBase"
  module: "SignalWire.Agent"
  visibility: "public"
---
# `DefineContexts()`

Return the ContextBuilder, creating it lazily on first access.
The builder is wired to report registered SWAIG tool names back
so its <xref href="SignalWire.Contexts.ContextBuilder.Validate" data-throw-if-not-resolved="false"></xref> can check for
collisions with reserved native tool names (<code>next\_step</code>, <code>change\_context</code>, <code>gather\_submit</code>).

## Signature

```dotnet
public ContextBuilder DefineContexts()
```

## Returns

`SignalWire.Contexts.ContextBuilder`
