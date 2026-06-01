---
slug: "/reference/dotnet/signal-wire.agent/agent-base/prompt-add-section-string-string-list-string-bool-bool-list-dictionary-string-object"
title: "PromptAddSection(string, string, List<string>?, bool, bool, List<Dictionary<string, object>>?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Agent.AgentBase.PromptAddSection(string, string, System.Collections.Generic.List<string>?, bool, bool, System.Collections.Generic.List<System.Collections.Generic.Dictionary<string, object>>?)"
  parent: "SignalWire.Agent.AgentBase"
  module: "SignalWire.Agent"
  visibility: "public"
---
# `PromptAddSection(string, string, List<string>?, bool, bool, List<Dictionary<string, object>>?)`

Add a top-level POM section with an optional body, bullets,
numbering, and subsections. (Python parity: `prompt_add_section`.)

## Signature

```dotnet
public AgentBase PromptAddSection(string title, string body = "", List<string>? bullets = null, bool numbered = false, bool numberedBullets = false, List<Dictionary<string, object>>? subsections = null)
```

## Parameters

| Name              | Type                              | Required | Default | Description |
| ----------------- | --------------------------------- | -------- | ------- | ----------- |
| `title`           | `string`                          | yes      | —       | —           |
| `body`            | `string`                          | no       | `""`    | —           |
| `bullets`         | `List<string>`                    | no       | `null`  | —           |
| `numbered`        | `bool`                            | no       | `false` | —           |
| `numberedBullets` | `bool`                            | no       | `false` | —           |
| `subsections`     | `List<Dictionary<string,object>>` | no       | `null`  | —           |

## Returns

`SignalWire.Agent.AgentBase`
