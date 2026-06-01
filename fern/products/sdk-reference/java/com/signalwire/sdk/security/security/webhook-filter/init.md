---
slug: "/reference/java/com/signalwire/sdk/security/security/webhook-filter/init"
title: "<init>"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.security.WebhookFilter.<init>"
  parent: "com.signalwire.sdk.security.WebhookFilter"
  module: "com.signalwire.sdk.security.WebhookFilter"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/security/WebhookFilter.java"
  visibility: "public"
---
# `<init>`

Construct a filter with proxy trust disabled.

## Signature

**Overload 1**

```java
public void <init>(java.lang.String signingKey)
```

**Overload 2**

```java
public void <init>(java.lang.String signingKey, boolean trustProxy)
```

## Parameters (Overload 1)

| Name         | Type               | Required | Default | Description                                                                                                                             |
| ------------ | ------------------ | -------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| `signingKey` | `java.lang.String` | yes      | —       | customer's Signing Key. Must be non-empty; an empty value is a programming error and the constructor throws `IllegalArgumentException`. |

## Parameters (Overload 2)

| Name         | Type               | Required | Default | Description                                                                                                                                                                             |
| ------------ | ------------------ | -------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `signingKey` | `java.lang.String` | yes      | —       | customer's Signing Key. Required.                                                                                                                                                       |
| `trustProxy` | `boolean`          | yes      | —       | when `true`, honor `X-Forwarded-Proto` / `X-Forwarded-Host` for URL reconstruction. `false` by default since proxy headers are spoofable; only enable when you control the proxy chain. |

## Source

[`src/main/java/com/signalwire/sdk/security/WebhookFilter.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/security/WebhookFilter.java)

Line 75.
