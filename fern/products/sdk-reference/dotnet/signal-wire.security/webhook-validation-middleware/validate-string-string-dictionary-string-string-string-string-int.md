---
slug: "/reference/dotnet/signal-wire.security/webhook-validation-middleware/validate-string-string-dictionary-string-string-string-string-int"
title: "Validate(string, string, Dictionary<string, string>, string?, string?, int)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Security.WebhookValidationMiddleware.Validate(string, string, System.Collections.Generic.Dictionary<string, string>, string?, string?, int)"
  parent: "SignalWire.Security.WebhookValidationMiddleware"
  module: "SignalWire.Security"
  visibility: "public"
---
# `Validate(string, string, Dictionary<string, string>, string?, string?, int)`

Validate the incoming request and return a 403 short-circuit
response if the signature is missing / invalid. Returns null when
the request passed validation — caller proceeds to the real handler.

**Remarks:** The raw body is the caller's <code class="paramref">body</code> string verbatim;
the caller is expected to capture the body once (before any JSON /
form parser consumes the stream) and pass it here. The
HttpListenerContext dispatcher in <code>SignalWire.SWML.Service.Run</code> already does this, so AgentBase
and standalone HttpListener integrations can wire it in directly.

## Signature

```dotnet
public (int Status, Dictionary<string, string> Headers, string Body)? Validate(string method, string path, Dictionary<string, string> headers, string? body, string? hostFallback = null, int portFallback = 0)
```

## Parameters

| Name           | Type                        | Required | Default | Description |
| -------------- | --------------------------- | -------- | ------- | ----------- |
| `method`       | `string`                    | yes      | —       | —           |
| `path`         | `string`                    | yes      | —       | —           |
| `headers`      | `Dictionary<string,string>` | yes      | —       | —           |
| `body`         | `string`                    | yes      | —       | —           |
| `hostFallback` | `string`                    | yes      | —       | —           |
| `portFallback` | `int`                       | yes      | —       | —           |

## Returns

`System.Nullable<System.ValueTuple<int,Dictionary<string,string>,string>>`
