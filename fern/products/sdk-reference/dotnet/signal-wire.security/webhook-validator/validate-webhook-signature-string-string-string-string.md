---
slug: "/reference/dotnet/signal-wire.security/webhook-validator/validate-webhook-signature-string-string-string-string"
title: "ValidateWebhookSignature(string, string?, string, string?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Security.WebhookValidator.ValidateWebhookSignature(string, string?, string, string?)"
  parent: "SignalWire.Security.WebhookValidator"
  module: "SignalWire.Security"
  visibility: "public"
---
# `ValidateWebhookSignature(string, string?, string, string?)`

Validate a SignalWire webhook signature against both schemes.

**Modifiers:** `static`

## Signature

```dotnet
public static bool ValidateWebhookSignature(string signingKey, string? signature, string url, string? rawBody)
```

## Parameters

| Name         | Type     | Required | Default | Description                                                                                                                                                                                                                    |
| ------------ | -------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `signingKey` | `string` | yes      | —       | Customer's Signing Key from the Dashboard. UTF-8 string, secret. Empty or null raises <xref href="System.ArgumentException" data-throw-if-not-resolved="false"></xref> — that's a programming error, not a validation failure. |
| `signature`  | `string` | yes      | —       | The <code>X-SignalWire-Signature</code> header value (or <code>X-Twilio-Signature</code> for cXML compat). Missing / empty returns <code>false</code> without throwing.                                                        |
| `url`        | `string` | yes      | —       | The full URL SignalWire POSTed to (scheme, host, optional port, path, query). Must match what the platform saw — see the <code>URL reconstruction</code> section of <code>porting-sdk/webhooks.md</code>.                      |
| `rawBody`    | `string` | yes      | —       | The raw request body bytes as a UTF-8 string, BEFORE any JSON / form parsing. Re-serialization breaks the Scheme A digest.                                                                                                     |

## Returns

`bool` — <code>true</code> if the signature matches either Scheme A (hex JSON) or Scheme B (base64 form, with port-normalization variants and optional bodySHA256 fallback). <code>false</code> otherwise.

## Throws

- `System.ArgumentException` — Thrown when <code class="paramref">signingKey</code> is null or empty.
