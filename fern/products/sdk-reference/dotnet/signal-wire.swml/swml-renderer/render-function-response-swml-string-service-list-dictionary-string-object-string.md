---
slug: "/reference/dotnet/signal-wire.swml/swml-renderer/render-function-response-swml-string-service-list-dictionary-string-object-string"
title: "RenderFunctionResponseSwml(string, Service, List<Dictionary<string, object>>?, string)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.SWML.SwmlRenderer.RenderFunctionResponseSwml(string, SignalWire.SWML.Service, System.Collections.Generic.List<System.Collections.Generic.Dictionary<string, object>>?, string)"
  parent: "SignalWire.SWML.SwmlRenderer"
  module: "SignalWire.SWML"
  visibility: "public"
---
# `RenderFunctionResponseSwml(string, Service, List<Dictionary<string, object>>?, string)`

Generate a SWML document for a SWAIG function response —
plays the response text and queues any follow-up actions.
(Python parity: `SwmlRenderer.render_function_response_swml`.)

**Modifiers:** `static`

## Signature

```dotnet
public static string RenderFunctionResponseSwml(string responseText, Service service, List<Dictionary<string, object>>? actions = null, string format = "json")
```

## Parameters

| Name           | Type                              | Required | Default  | Description |
| -------------- | --------------------------------- | -------- | -------- | ----------- |
| `responseText` | `string`                          | yes      | —        | —           |
| `service`      | `SignalWire.SWML.Service`         | yes      | —        | —           |
| `actions`      | `List<Dictionary<string,object>>` | no       | `null`   | —           |
| `format`       | `string`                          | no       | `"json"` | —           |

## Returns

`string`
