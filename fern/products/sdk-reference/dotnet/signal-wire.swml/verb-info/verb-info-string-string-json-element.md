---
slug: "/reference/dotnet/signal-wire.swml/verb-info/verb-info-string-string-json-element"
title: "VerbInfo(string, string, JsonElement)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.SWML.VerbInfo.VerbInfo(string, string, System.Text.Json.JsonElement)"
  parent: "SignalWire.SWML.VerbInfo"
  module: "SignalWire.SWML"
  visibility: "public"
---
# `VerbInfo(string, string, JsonElement)`

Metadata about a single SWML verb parsed from the schema.

## Signature

```dotnet
public VerbInfo(string Name, string SchemaName, JsonElement Definition)
```

## Parameters

| Name         | Type                           | Required | Default | Description                                                  |
| ------------ | ------------------------------ | -------- | ------- | ------------------------------------------------------------ |
| `Name`       | `string`                       | yes      | —       | The actual verb name used in SWML documents (e.g. "answer"). |
| `SchemaName` | `string`                       | yes      | —       | The definition key in the JSON schema (e.g. "Answer").       |
| `Definition` | `System.Text.Json.JsonElement` | yes      | —       | The full JSON schema definition for this verb.               |
