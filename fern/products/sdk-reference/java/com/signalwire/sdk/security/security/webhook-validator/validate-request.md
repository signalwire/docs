---
slug: "/reference/java/com/signalwire/sdk/security/security/webhook-validator/validate-request"
title: "validateRequest"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.security.WebhookValidator.validateRequest"
  parent: "com.signalwire.sdk.security.WebhookValidator"
  module: "com.signalwire.sdk.security.WebhookValidator"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/security/WebhookValidator.java"
  visibility: "public"
---
# `validateRequest`

Legacy `@signalwire/compatibility-api` drop-in entry point.

<p>Dispatches on the runtime type of `paramsOrRawBody`:
 <ul>
   <li>`String` \u2192 delegates to
       String, String, String).</li>
   <li>`Map` or any `Iterable` of `Map.Entry` (or
       2-element arrays / lists) \u2192 treats the value as pre-parsed form
       params and runs Scheme B directly with URL port normalization.</li>
   <li>`null` \u2192 treated as an empty params map (Scheme B).</li>
   <li>Anything else \u2192 `IllegalArgumentException`.</li>
 </ul>

**Modifiers:** `static`

## Signature

```java
public static boolean validateRequest(
    java.lang.String signingKey,
    java.lang.String signature,
    java.lang.String url,
    java.lang.Object paramsOrRawBody
)
```

## Parameters

| Name              | Type               | Required | Default | Description                                   |
| ----------------- | ------------------ | -------- | ------- | --------------------------------------------- |
| `signingKey`      | `java.lang.String` | yes      | —       | customer's Signing Key. Non-empty.            |
| `signature`       | `java.lang.String` | yes      | —       | header value. `null` / empty returns `false`. |
| `url`             | `java.lang.String` | yes      | —       | full URL SignalWire POSTed to.                |
| `paramsOrRawBody` | `java.lang.Object` | yes      | —       | `String` raw body OR pre-parsed form params.  |

## Returns

`boolean` — `true` on match, `false` otherwise.

## Throws

- `IllegalArgumentException` — when `signingKey` is empty or `paramsOrRawBody` is of an unsupported type.

## Source

[`src/main/java/com/signalwire/sdk/security/WebhookValidator.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/security/WebhookValidator.java)

Line 171.
