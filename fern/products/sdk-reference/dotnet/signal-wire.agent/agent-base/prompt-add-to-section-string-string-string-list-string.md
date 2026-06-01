---
slug: "/reference/dotnet/signal-wire.agent/agent-base/prompt-add-to-section-string-string-string-list-string"
title: "PromptAddToSection(string, string?, string?, List<string>?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Agent.AgentBase.PromptAddToSection(string, string?, string?, System.Collections.Generic.List<string>?)"
  parent: "SignalWire.Agent.AgentBase"
  module: "SignalWire.Agent"
  visibility: "public"
---
# `PromptAddToSection(string, string?, string?, List<string>?)`

Append body text, a single bullet, and/or bullets list to an
existing section. (Python parity:
`prompt_add_to_section(title, body, bullet, bullets)`.)

## Signature

```dotnet
public AgentBase PromptAddToSection(string title, string? body = null, string? bullet = null, List<string>? bullets = null)
```

## Parameters

| Name      | Type           | Required | Default | Description |
| --------- | -------------- | -------- | ------- | ----------- |
| `title`   | `string`       | yes      | —       | —           |
| `body`    | `string`       | no       | `null`  | —           |
| `bullet`  | `string`       | no       | `null`  | —           |
| `bullets` | `List<string>` | no       | `null`  | —           |

## Returns

`SignalWire.Agent.AgentBase`
