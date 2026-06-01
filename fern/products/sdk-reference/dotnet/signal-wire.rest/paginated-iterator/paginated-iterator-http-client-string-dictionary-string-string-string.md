---
slug: "/reference/dotnet/signal-wire.rest/paginated-iterator/paginated-iterator-http-client-string-dictionary-string-string-string"
title: "PaginatedIterator(HttpClient, string, Dictionary<string, string>?, string)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.REST.PaginatedIterator.PaginatedIterator(SignalWire.REST.HttpClient, string, System.Collections.Generic.Dictionary<string, string>?, string)"
  parent: "SignalWire.REST.PaginatedIterator"
  module: "SignalWire.REST"
  visibility: "public"
---
# `PaginatedIterator(HttpClient, string, Dictionary<string, string>?, string)`

## Signature

```dotnet
public PaginatedIterator(HttpClient http, string path, Dictionary<string, string>? @params = null, string dataKey = "data")
```

## Parameters

| Name      | Type                         | Required | Default  | Description |
| --------- | ---------------------------- | -------- | -------- | ----------- |
| `http`    | `SignalWire.REST.HttpClient` | yes      | —        | —           |
| `path`    | `string`                     | yes      | —        | —           |
| `params`  | `Dictionary<string,string>`  | no       | `null`   | —           |
| `dataKey` | `string`                     | no       | `"data"` | —           |
