---
slug: "/reference/dotnet/signal-wire.swml/service/on-request-dictionary-string-object-string"
title: "OnRequest(Dictionary<string, object?>?, string?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.SWML.Service.OnRequest(System.Collections.Generic.Dictionary<string, object?>?, string?)"
  parent: "SignalWire.SWML.Service"
  module: "SignalWire.SWML"
  visibility: "public"
---
# `OnRequest(Dictionary<string, object?>?, string?)`

Customization hook called when SWML is requested.
Default delegates to <xref href="SignalWire.SWML.Service.OnSwmlRequest(System.Collections.Generic.Dictionary%7bSystem.String%2cSystem.Object%7d%2cSystem.String)" data-throw-if-not-resolved="false"></xref>; subclasses
typically override <xref href="SignalWire.SWML.Service.OnSwmlRequest(System.Collections.Generic.Dictionary%7bSystem.String%2cSystem.Object%7d%2cSystem.String)" data-throw-if-not-resolved="false"></xref> instead of this
method. Return null to use the default SWML rendering, or a
dictionary of modifications to merge in.
(Python parity: `WebMixin.on_request`.)

**Modifiers:** `virtual`

## Signature

```dotnet
public virtual Dictionary<string, object>? OnRequest(Dictionary<string, object?>? requestData = null, string? callbackPath = null)
```

## Parameters

| Name           | Type                        | Required | Default | Description |
| -------------- | --------------------------- | -------- | ------- | ----------- |
| `requestData`  | `Dictionary<string,object>` | no       | `null`  | —           |
| `callbackPath` | `string`                    | no       | `null`  | —           |

## Returns

`Dictionary<string,object>`
