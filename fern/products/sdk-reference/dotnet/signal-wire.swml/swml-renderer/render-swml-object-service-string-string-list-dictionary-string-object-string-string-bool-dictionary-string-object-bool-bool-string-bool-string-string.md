---
slug: "/reference/dotnet/signal-wire.swml/swml-renderer/render-swml-object-service-string-string-list-dictionary-string-object-string-string-bool-dictionary-string-object-bool-bool-string-bool-string-string"
title: "RenderSwml(object, Service, string?, string?, List<Dictionary<string, object>>?, string?, string?, bool, Dictionary<string, object>?, bool, bool, string, bool, string, string?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.SWML.SwmlRenderer.RenderSwml(object, SignalWire.SWML.Service, string?, string?, System.Collections.Generic.List<System.Collections.Generic.Dictionary<string, object>>?, string?, string?, bool, System.Collections.Generic.Dictionary<string, object>?, bool, bool, string, bool, string, string?)"
  parent: "SignalWire.SWML.SwmlRenderer"
  module: "SignalWire.SWML"
  visibility: "public"
---
# `RenderSwml(object, Service, string?, string?, List<Dictionary<string, object>>?, string?, string?, bool, Dictionary<string, object>?, bool, bool, string, bool, string, string?)`

Generate a complete SWML document with AI configuration.
(Python parity: `SwmlRenderer.render_swml`.)

**Modifiers:** `static`

## Signature

```dotnet
public static string RenderSwml(object prompt, Service service, string? postPrompt = null, string? postPromptUrl = null, List<Dictionary<string, object>>? swaigFunctions = null, string? startupHookUrl = null, string? hangupHookUrl = null, bool promptIsPom = false, Dictionary<string, object>? @params = null, bool addAnswer = false, bool recordCall = false, string recordFormat = "mp4", bool recordStereo = true, string format = "json", string? defaultWebhookUrl = null)
```

## Parameters

| Name                | Type                              | Required | Default  | Description |
| ------------------- | --------------------------------- | -------- | -------- | ----------- |
| `prompt`            | `object`                          | yes      | —        | —           |
| `service`           | `SignalWire.SWML.Service`         | yes      | —        | —           |
| `postPrompt`        | `string`                          | no       | `null`   | —           |
| `postPromptUrl`     | `string`                          | no       | `null`   | —           |
| `swaigFunctions`    | `List<Dictionary<string,object>>` | no       | `null`   | —           |
| `startupHookUrl`    | `string`                          | no       | `null`   | —           |
| `hangupHookUrl`     | `string`                          | no       | `null`   | —           |
| `promptIsPom`       | `bool`                            | no       | `false`  | —           |
| `params`            | `Dictionary<string,object>`       | no       | `null`   | —           |
| `addAnswer`         | `bool`                            | no       | `false`  | —           |
| `recordCall`        | `bool`                            | no       | `false`  | —           |
| `recordFormat`      | `string`                          | no       | `"mp4"`  | —           |
| `recordStereo`      | `bool`                            | no       | `true`   | —           |
| `format`            | `string`                          | no       | `"json"` | —           |
| `defaultWebhookUrl` | `string`                          | no       | `null`   | —           |

## Returns

`string`
