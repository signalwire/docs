---
slug: "/reference/dotnet/signal-wire.swml/schema/validate-document-dictionary-string-object"
title: "ValidateDocument(Dictionary<string, object>)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.SWML.Schema.ValidateDocument(System.Collections.Generic.Dictionary<string, object>)"
  parent: "SignalWire.SWML.Schema"
  module: "SignalWire.SWML"
  visibility: "public"
---
# `ValidateDocument(Dictionary<string, object>)`

Validate a SWML document against the loaded schema.
Returns `(true, [])` on success or `(false, [errors...])` on
failure. Lightweight verb-presence check — full JSON-Schema
validation is out of scope for the bundled SDK.
(Python parity:
`SchemaUtils.validate_document(document) -> (bool, list)`.)

## Signature

```dotnet
public (bool Valid, List<string> Errors) ValidateDocument(Dictionary<string, object> document)
```

## Parameters

| Name       | Type                        | Required | Default | Description |
| ---------- | --------------------------- | -------- | ------- | ----------- |
| `document` | `Dictionary<string,object>` | yes      | —       | —           |

## Returns

`System.ValueTuple<bool,List<string>>`
