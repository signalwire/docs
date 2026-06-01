---
slug: "/reference/java/com/signalwire/sdk/utils/utils/url-validator/validate-url"
title: "validateUrl"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.utils.UrlValidator.validateUrl"
  parent: "com.signalwire.sdk.utils.UrlValidator"
  module: "com.signalwire.sdk.utils.UrlValidator"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/utils/UrlValidator.java"
  visibility: "public"
---
# `validateUrl`

Validate that a URL is safe to fetch.

**Modifiers:** `static`

## Signature

```java
public static boolean validateUrl(java.lang.String url, boolean allowPrivate)
```

## Parameters

| Name           | Type               | Required | Default | Description                               |
| -------------- | ------------------ | -------- | ------- | ----------------------------------------- |
| `url`          | `java.lang.String` | yes      | —       | URL string to validate.                   |
| `allowPrivate` | `boolean`          | yes      | —       | when true, bypass the IP-blocklist check. |

## Returns

`boolean` — true when the URL is safe to fetch, false otherwise.

## Source

[`src/main/java/com/signalwire/sdk/utils/UrlValidator.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/utils/UrlValidator.java)

Line 73.
