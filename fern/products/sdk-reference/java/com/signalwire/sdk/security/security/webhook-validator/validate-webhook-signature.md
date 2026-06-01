---
slug: "/reference/java/com/signalwire/sdk/security/security/webhook-validator/validate-webhook-signature"
title: "validateWebhookSignature"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.security.WebhookValidator.validateWebhookSignature"
  parent: "com.signalwire.sdk.security.WebhookValidator"
  module: "com.signalwire.sdk.security.WebhookValidator"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/security/WebhookValidator.java"
  visibility: "public"
---
# `validateWebhookSignature`

Validate a SignalWire webhook signature against both schemes.

<p>Tries Scheme A (hex HMAC-SHA1 over + rawBody) first; on
 miss, tries Scheme B (base64 HMAC-SHA1 over + sortedFormParams)
 with both port-normalization variants of the URL and an optional
 `bodySHA256` fallback for JSON-on-compat-surface.

**Modifiers:** `static`

## Signature

```java
public static boolean validateWebhookSignature(
    java.lang.String signingKey,
    java.lang.String signature,
    java.lang.String url,
    java.lang.String rawBody
)
```

## Parameters

| Name         | Type               | Required | Default | Description                                                                                                                                                                               |
| ------------ | ------------------ | -------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `signingKey` | `java.lang.String` | yes      | —       | customer's Signing Key from the Dashboard. Must be non-null and non-empty; otherwise an `IllegalArgumentException` is thrown \u2014 that's a programming error, not a validation failure. |
| `signature`  | `java.lang.String` | yes      | —       | the `X-SignalWire-Signature` header value (or the `X-Twilio-Signature` alias). `null` or empty returns `false` without throwing.                                                          |
| `url`        | `java.lang.String` | yes      | —       | the full URL SignalWire POSTed to (scheme, host, optional port, path, query). Must match what the platform saw \u2014 see the URL reconstruction section of `porting-sdk/webhooks.md`.    |
| `rawBody`    | `java.lang.String` | yes      | —       | the raw UTF-8 request body bytes as a string, <b>before</b> any JSON / form parsing. May be empty but must not be `null` \u2014 pass `""` when the body was empty.                        |

## Returns

`boolean` — `true` when the signature matches either scheme, otherwise `false`.

## Throws

- `IllegalArgumentException` — when `signingKey` is `null` or empty, or when `rawBody` is `null`.

## Source

[`src/main/java/com/signalwire/sdk/security/WebhookValidator.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/security/WebhookValidator.java)

Line 94.
