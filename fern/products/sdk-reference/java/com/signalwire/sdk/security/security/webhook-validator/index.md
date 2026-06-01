---
slug: "/reference/java/com/signalwire/sdk/security/security/webhook-validator"
title: "WebhookValidator"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.security.WebhookValidator"
  parent: "com.signalwire.sdk.security"
  module: "com.signalwire.sdk.security"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/security/WebhookValidator.java"
  visibility: "public"
---
# `WebhookValidator`

Webhook signature validation for SignalWire-signed HTTP requests.

<p>Implements both schemes from `porting-sdk/webhooks.md`:

 <ul>
   <li><b>Scheme A</b> (RELAY/SWML/JSON): url + rawBody)).</li>
   <li><b>Scheme B</b> (Compat/cXML form): url + sortedFormParams))
       with optional `bodySHA256` query-param fallback for JSON-on-compat-surface.</li>
 </ul>

 <p>All signature comparisons use byte[])
 (constant-time) so the secret cannot be leaked through timing differences.

 <p>Public API:
 <ul>
   <li>String, String, String) \u2014 combined entry point.</li>
   <li>String, String, Object) \u2014 legacy
       `@signalwire/compatibility-api` drop-in alias.</li>
 </ul>

 <p>This is a stateless utility \u2014 every method is static and the class is
 not intended to be instantiated.

**Modifiers:** `final`

## Signature

```java
public final class WebhookValidator
```

## Constants

| Name                             | Type                                                                    | Required | Default | Description                                                                |
| -------------------------------- | ----------------------------------------------------------------------- | -------- | ------- | -------------------------------------------------------------------------- |
| `SIGNALWIRE_SIGNATURE_HEADER`    | `java.lang.String SIGNALWIRE_SIGNATURE_HEADER = X-SignalWire-Signature` | yes      | —       | Header name that carries the signature on every signed SignalWire request. |
| `TWILIO_COMPAT_SIGNATURE_HEADER` | `java.lang.String TWILIO_COMPAT_SIGNATURE_HEADER = X-Twilio-Signature`  | yes      | —       | Legacy alias accepted by the cXML/Compatibility surface.                   |

## Methods

- [`validateRequest`](/reference/java/com/signalwire/sdk/security/security/webhook-validator/validate-request) — Legacy `@signalwire/compatibility-api` drop-in entry point.
- [`validateWebhookSignature`](/reference/java/com/signalwire/sdk/security/security/webhook-validator/validate-webhook-signature) — Validate a SignalWire webhook signature against both schemes.

## Source

[`src/main/java/com/signalwire/sdk/security/WebhookValidator.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/security/WebhookValidator.java)

Line 50.
