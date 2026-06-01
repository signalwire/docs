---
slug: "/reference/dotnet/signal-wire.agent/agent-base/prompt-add-subsection-string-string-string-list-string"
title: "PromptAddSubsection(string, string, string, List<string>?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Agent.AgentBase.PromptAddSubsection(string, string, string, System.Collections.Generic.List<string>?)"
  parent: "SignalWire.Agent.AgentBase"
  module: "SignalWire.Agent"
  visibility: "public"
---
# `PromptAddSubsection(string, string, string, List<string>?)`

Add a subsection nested under an existing parent section.
(Python parity: `prompt_add_subsection(parent_title, title, body, bullets)`.)

## Signature

```dotnet
public AgentBase PromptAddSubsection(string parentTitle, string title, string body = "", List<string>? bullets = null)
```

## Parameters

| Name          | Type           | Required | Default | Description |
| ------------- | -------------- | -------- | ------- | ----------- |
| `parentTitle` | `string`       | yes      | —       | —           |
| `title`       | `string`       | yes      | —       | —           |
| `body`        | `string`       | no       | `""`    | —           |
| `bullets`     | `List<string>` | no       | `null`  | —           |

## Returns

`SignalWire.Agent.AgentBase`
