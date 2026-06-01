---
slug: "/reference/dotnet/signal-wire.security/webhook-validation-middleware/extract-signature-header-dictionary-string-string"
title: "ExtractSignatureHeader(Dictionary<string, string>)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Security.WebhookValidationMiddleware.ExtractSignatureHeader(System.Collections.Generic.Dictionary<string, string>)"
  parent: "SignalWire.Security.WebhookValidationMiddleware"
  module: "SignalWire.Security"
  visibility: "public"
---
# `ExtractSignatureHeader(Dictionary<string, string>)`

Pull <code>X-SignalWire-Signature</code> from request headers, or the <code>X-Twilio-Signature</code> alias for cXML/Compat callers. Header
lookups are case-insensitive (proxies / browsers vary).

**Modifiers:** `static`

## Signature

```dotnet
public static string? ExtractSignatureHeader(Dictionary<string, string> headers)
```

## Parameters

| Name      | Type                        | Required | Default | Description |
| --------- | --------------------------- | -------- | ------- | ----------- |
| `headers` | `Dictionary<string,string>` | yes      | —       | —           |

## Returns

`string`
