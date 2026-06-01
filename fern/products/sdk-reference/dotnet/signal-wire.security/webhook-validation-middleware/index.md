---
slug: "/reference/dotnet/signal-wire.security/webhook-validation-middleware"
title: "WebhookValidationMiddleware"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Security.WebhookValidationMiddleware"
  parent: "SignalWire.Security"
  module: "SignalWire.Security"
  visibility: "public"
---
# `WebhookValidationMiddleware`

HTTP middleware that validates the <code>X-SignalWire-Signature</code> header
on incoming requests using <xref href="SignalWire.Security.WebhookValidator" data-throw-if-not-resolved="false"></xref>. Designed for
the .NET port's HttpListener-based dispatch surface; adapts the same
contract Python's FastAPI dependency provides.

<p>Use <xref href="SignalWire.Security.WebhookValidationMiddleware.Validate(System.String%2cSystem.String%2cSystem.Collections.Generic.Dictionary%7bSystem.String%2cSystem.String%7d%2cSystem.String%2cSystem.String%2cSystem.Int32)" data-throw-if-not-resolved="false"></xref> to short-circuit invalid requests with
403 before they reach an agent's POST handler. Returns null on success
so the caller continues to dispatch.</p>

<p>This is intentionally a non-async type: the underlying validator
is pure CPU work and the dispatch surface uses synchronous strings.</p>

**Modifiers:** `sealed`

## Signature

```dotnet
public sealed class WebhookValidationMiddleware
```

## Properties

| Name                          | Type                                                                       | Required | Default | Description                                     |
| ----------------------------- | -------------------------------------------------------------------------- | -------- | ------- | ----------------------------------------------- |
| `SignalWireSignatureHeader`   | `public const string SignalWireSignatureHeader = "X-SignalWire-Signature"` | yes      | —       | The canonical SignalWire signature header name. |
| `TwilioCompatSignatureHeader` | `public const string TwilioCompatSignatureHeader = "X-Twilio-Signature"`   | yes      | —       | Legacy alias for cXML/Twilio-compat callers.    |

## Methods

- [`ExtractSignatureHeader(Dictionary<string, string>)`](/reference/dotnet/signal-wire.security/webhook-validation-middleware/extract-signature-header-dictionary-string-string) — Pull <code>X-SignalWire-Signature</code> from request headers, or the <code>X-Twilio-Signature</code> alias for cXML/Compat callers. Header lookups are case-insensitive (proxies / browsers vary).
- [`ReconstructUrl(Dictionary<string, string>, string, string?, int)`](/reference/dotnet/signal-wire.security/webhook-validation-middleware/reconstruct-url-dictionary-string-string-string-string-int) — Reconstruct the public URL SignalWire POSTed to. Resolution order: <ol><li><code>SWML\_PROXY\_URL\_BASE</code> env var (joined with path + query).</li><li><code>X-Forwarded-Proto</code> / <code>X-Forwarded-Host</code> headers when <code>trustProxy=true</code>.</li><li><code>http://hostFallback:portFallback{path}</code> as a last-resort local construction.</li></ol>
- [`Validate(string, string, Dictionary<string, string>, string?, string?, int)`](/reference/dotnet/signal-wire.security/webhook-validation-middleware/validate-string-string-dictionary-string-string-string-string-int) — Validate the incoming request and return a 403 short-circuit response if the signature is missing / invalid. Returns null when the request passed validation — caller proceeds to the real handler.
- [`WebhookValidationMiddleware(string, bool)`](/reference/dotnet/signal-wire.security/webhook-validation-middleware/webhook-validation-middleware-string-bool) — Construct a middleware bound to a single signing key.
