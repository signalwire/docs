---
slug: "/reference/dotnet/signal-wire.swml/swml-builder/ai-string-list-dictionary-string-object-string-string-dictionary-string-object-dictionary-string-object"
title: "Ai(string?, List<Dictionary<string, object>>?, string?, string?, Dictionary<string, object>?, Dictionary<string, object>?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.SWML.SWMLBuilder.Ai(string?, System.Collections.Generic.List<System.Collections.Generic.Dictionary<string, object>>?, string?, string?, System.Collections.Generic.Dictionary<string, object>?, System.Collections.Generic.Dictionary<string, object>?)"
  parent: "SignalWire.SWML.SWMLBuilder"
  module: "SignalWire.SWML"
  visibility: "public"
---
# `Ai(string?, List<Dictionary<string, object>>?, string?, string?, Dictionary<string, object>?, Dictionary<string, object>?)`

Add an `ai` verb. (Python parity:
`SWMLBuilder.ai(prompt_text, prompt_pom, post_prompt, post_prompt_url, swaig, ...)`.)

## Signature

```dotnet
public SWMLBuilder Ai(string? promptText = null, List<Dictionary<string, object>>? promptPom = null, string? postPrompt = null, string? postPromptUrl = null, Dictionary<string, object>? swaig = null, Dictionary<string, object>? extraParams = null)
```

## Parameters

| Name            | Type                              | Required | Default | Description |
| --------------- | --------------------------------- | -------- | ------- | ----------- |
| `promptText`    | `string`                          | no       | `null`  | —           |
| `promptPom`     | `List<Dictionary<string,object>>` | no       | `null`  | —           |
| `postPrompt`    | `string`                          | no       | `null`  | —           |
| `postPromptUrl` | `string`                          | no       | `null`  | —           |
| `swaig`         | `Dictionary<string,object>`       | no       | `null`  | —           |
| `extraParams`   | `Dictionary<string,object>`       | no       | `null`  | —           |

## Returns

`SignalWire.SWML.SWMLBuilder`
