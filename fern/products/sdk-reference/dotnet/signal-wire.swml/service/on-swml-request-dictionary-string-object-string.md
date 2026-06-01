---
slug: "/reference/dotnet/signal-wire.swml/service/on-swml-request-dictionary-string-object-string"
title: "OnSwmlRequest(Dictionary<string, object?>?, string?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.SWML.Service.OnSwmlRequest(System.Collections.Generic.Dictionary<string, object?>?, string?)"
  parent: "SignalWire.SWML.Service"
  module: "SignalWire.SWML"
  visibility: "public"
---
# `OnSwmlRequest(Dictionary<string, object?>?, string?)`

Customization hook for subclasses to modify SWML based
on request data. Return null to use default rendering, or a
dictionary of modifications. (Python parity:
`WebMixin.on_swml_request`.)

**Modifiers:** `virtual`

## Signature

```dotnet
public virtual Dictionary<string, object>? OnSwmlRequest(Dictionary<string, object?>? requestData = null, string? callbackPath = null)
```

## Parameters

| Name           | Type                        | Required | Default | Description |
| -------------- | --------------------------- | -------- | ------- | ----------- |
| `requestData`  | `Dictionary<string,object>` | no       | `null`  | —           |
| `callbackPath` | `string`                    | no       | `null`  | —           |

## Returns

`Dictionary<string,object>`
