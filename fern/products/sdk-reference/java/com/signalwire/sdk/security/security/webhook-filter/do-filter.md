---
slug: "/reference/java/com/signalwire/sdk/security/security/webhook-filter/do-filter"
title: "doFilter"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.security.WebhookFilter.doFilter"
  parent: "com.signalwire.sdk.security.WebhookFilter"
  module: "com.signalwire.sdk.security.WebhookFilter"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/security/WebhookFilter.java"
  visibility: "public"
---
# `doFilter`

**Decorators:** `@Override`

## Signature

```java
public void doFilter(
    javax.servlet.ServletRequest request,
    javax.servlet.ServletResponse response,
    javax.servlet.FilterChain chain
)
```

## Parameters

| Name       | Type                            | Required | Default | Description |
| ---------- | ------------------------------- | -------- | ------- | ----------- |
| `request`  | `javax.servlet.ServletRequest`  | yes      | —       | —           |
| `response` | `javax.servlet.ServletResponse` | yes      | —       | —           |
| `chain`    | `javax.servlet.FilterChain`     | yes      | —       | —           |

## Throws

- `IOException`
- `ServletException`

## Source

[`src/main/java/com/signalwire/sdk/security/WebhookFilter.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/security/WebhookFilter.java)

Line 107.
