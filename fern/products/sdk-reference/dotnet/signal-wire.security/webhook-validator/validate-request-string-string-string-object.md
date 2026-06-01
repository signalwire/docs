---
slug: "/reference/dotnet/signal-wire.security/webhook-validator/validate-request-string-string-string-object"
title: "ValidateRequest(string, string?, string, object?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Security.WebhookValidator.ValidateRequest(string, string?, string, object?)"
  parent: "SignalWire.Security.WebhookValidator"
  module: "SignalWire.Security"
  visibility: "public"
---
# `ValidateRequest(string, string?, string, object?)`

Legacy <code>@signalwire/compatibility-api</code> drop-in entry point.

<p>If <code class="paramref">paramsOrRawBody</code> is a <xref href="System.String" data-throw-if-not-resolved="false"></xref>,
delegates to <xref href="SignalWire.Security.WebhookValidator.ValidateWebhookSignature(System.String%2cSystem.String%2cSystem.String%2cSystem.String)" data-throw-if-not-resolved="false"></xref> (Scheme A then
Scheme B with parsed form).</p>

<p>If it's an <xref href="System.Collections.IDictionary" data-throw-if-not-resolved="false"></xref> or list of key/value pairs,
treats it as pre-parsed form params and runs Scheme B directly (with
URL port normalization).</p>

**Modifiers:** `static`

## Signature

```dotnet
public static bool ValidateRequest(string signingKey, string? signature, string url, object? paramsOrRawBody)
```

## Parameters

| Name              | Type     | Required | Default | Description |
| ----------------- | -------- | -------- | ------- | ----------- |
| `signingKey`      | `string` | yes      | —       | —           |
| `signature`       | `string` | yes      | —       | —           |
| `url`             | `string` | yes      | —       | —           |
| `paramsOrRawBody` | `object` | yes      | —       | —           |

## Returns

`bool`

## Throws

- `System.ArgumentException` — Thrown when <code class="paramref">signingKey</code> is null or empty, or when <code class="paramref">paramsOrRawBody</code> is neither a string nor a dictionary/list of params.
