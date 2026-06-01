---
slug: "/reference/dotnet/signal-wire.prefabs/info-gatherer-agent/info-gatherer-agent-string-list-dictionary-string-object-agent-options"
title: "InfoGathererAgent(string, List<Dictionary<string, object>>, AgentOptions?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Prefabs.InfoGathererAgent.InfoGathererAgent(string, System.Collections.Generic.List<System.Collections.Generic.Dictionary<string, object>>, SignalWire.Agent.AgentOptions?)"
  parent: "SignalWire.Prefabs.InfoGathererAgent"
  module: "SignalWire.Prefabs"
  visibility: "public"
---
# `InfoGathererAgent(string, List<Dictionary<string, object>>, AgentOptions?)`

## Signature

```dotnet
public InfoGathererAgent(string name, List<Dictionary<string, object>> questions, AgentOptions? options = null)
```

## Parameters

| Name        | Type                              | Required | Default | Description                                                                                                 |
| ----------- | --------------------------------- | -------- | ------- | ----------------------------------------------------------------------------------------------------------- |
| `name`      | `string`                          | yes      | —       | Agent name (defaults to "info\_gatherer").                                                                  |
| `questions` | `List<Dictionary<string,object>>` | yes      | —       | List of question dicts with key\_name, question\_text, and optional confirm.                                |
| `options`   | `SignalWire.Agent.AgentOptions`   | no       | `null`  | Additional <xref href="SignalWire.Agent.AgentOptions" data-throw-if-not-resolved="false"></xref> overrides. |
