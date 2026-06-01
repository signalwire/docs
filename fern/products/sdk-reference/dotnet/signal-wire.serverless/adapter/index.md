---
slug: "/reference/dotnet/signal-wire.serverless/adapter"
title: "Adapter"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Serverless.Adapter"
  parent: "SignalWire.Serverless"
  module: "SignalWire.Serverless"
  visibility: "public"
---
# `Adapter`

Auto-detect and handle serverless environments (Lambda, Azure, GCF, CGI)
or fall back to the built-in ASP.NET server.

**Modifiers:** `static`

## Signature

```dotnet
public static class Adapter
```

## Methods

- [`Detect()`](/reference/dotnet/signal-wire.serverless/adapter/detect) — Detect the current runtime environment.
- [`HandleAzure(Service, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.serverless/adapter/handle-azure-service-dictionary-string-object) — Handle an Azure Functions invocation. Extracts method, path, headers, and body from the Azure request dictionary, calls agent.HandleRequest(), and returns an Azure-compatible response dictionary.
- [`HandleLambda(Service, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.serverless/adapter/handle-lambda-service-dictionary-string-object) — Handle an AWS Lambda (API Gateway) invocation. Extracts method, path, headers, and body from the API Gateway event format, calls agent.HandleRequest(), and returns an API Gateway compatible response.
- [`Serve(dynamic)`](/reference/dotnet/signal-wire.serverless/adapter/serve-dynamic) — Auto-detect the runtime environment and serve the agent. For serverless environments, reads from stdin and dispatches to the appropriate handler. For "server", calls agent.Run().
