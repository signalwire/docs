---
slug: "/reference/dotnet/signal-wire.rest/rest-client/rest-client-string-string-string"
title: "RestClient(string, string, string)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.REST.RestClient.RestClient(string, string, string)"
  parent: "SignalWire.REST.RestClient"
  module: "SignalWire.REST"
  visibility: "public"
---
# `RestClient(string, string, string)`

## Signature

```dotnet
public RestClient(string projectId = "", string token = "", string space = "")
```

## Parameters

| Name        | Type     | Required | Default | Description                                                 |
| ----------- | -------- | -------- | ------- | ----------------------------------------------------------- |
| `projectId` | `string` | no       | `""`    | Project ID (falls back to SIGNALWIRE\_PROJECT\_ID env var). |
| `token`     | `string` | no       | `""`    | API token (falls back to SIGNALWIRE\_API\_TOKEN env var).   |
| `space`     | `string` | no       | `""`    | Space host (falls back to SIGNALWIRE\_SPACE env var).       |
