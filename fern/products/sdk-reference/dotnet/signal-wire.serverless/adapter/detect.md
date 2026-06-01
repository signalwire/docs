---
slug: "/reference/dotnet/signal-wire.serverless/adapter/detect"
title: "Detect()"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Serverless.Adapter.Detect()"
  parent: "SignalWire.Serverless.Adapter"
  module: "SignalWire.Serverless"
  visibility: "public"
---
# `Detect()`

Detect the current runtime environment.

**Modifiers:** `static`

## Signature

```dotnet
public static string Detect()
```

## Returns

`string` — One of "lambda", "gcf", "azure", "cgi", or "server".
