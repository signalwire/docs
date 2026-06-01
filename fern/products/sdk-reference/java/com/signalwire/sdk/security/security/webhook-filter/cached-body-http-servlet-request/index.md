---
slug: "/reference/java/com/signalwire/sdk/security/security/webhook-filter/cached-body-http-servlet-request"
title: "CachedBodyHttpServletRequest"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.security.WebhookFilter.CachedBodyHttpServletRequest"
  parent: "com.signalwire.sdk.security.WebhookFilter"
  module: "com.signalwire.sdk.security"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/security/WebhookFilter.java"
  visibility: "public"
---
# `CachedBodyHttpServletRequest`

`HttpServletRequestWrapper` that buffers the request body so it
can be read multiple times (once by the filter for signature
validation, once by the downstream handler for parsing).

**Modifiers:** `static` `final`

## Signature

```java
public static final class CachedBodyHttpServletRequest extends javax.servlet.http.HttpServletRequestWrapper
```

## Inheritance

**Extends:** `javax.servlet.http.HttpServletRequestWrapper`

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/security/security/webhook-filter/cached-body-http-servlet-request/init)
- [`getCachedBody`](/reference/java/com/signalwire/sdk/security/security/webhook-filter/cached-body-http-servlet-request/get-cached-body) — Snapshot of the cached body bytes.
- [`getCachedBodyAsString`](/reference/java/com/signalwire/sdk/security/security/webhook-filter/cached-body-http-servlet-request/get-cached-body-as-string) — Cached body decoded as UTF-8 (or the request's declared charset).
- [`getInputStream`](/reference/java/com/signalwire/sdk/security/security/webhook-filter/cached-body-http-servlet-request/get-input-stream)
- [`getReader`](/reference/java/com/signalwire/sdk/security/security/webhook-filter/cached-body-http-servlet-request/get-reader)

## Source

[`src/main/java/com/signalwire/sdk/security/WebhookFilter.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/security/WebhookFilter.java)

Line 195.
