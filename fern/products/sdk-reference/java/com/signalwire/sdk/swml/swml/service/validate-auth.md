---
slug: "/reference/java/com/signalwire/sdk/swml/swml/service/validate-auth"
title: "validateAuth"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.swml.Service.validateAuth"
  parent: "com.signalwire.sdk.swml.Service"
  module: "com.signalwire.sdk.swml.Service"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Service.java"
  visibility: "protected"
---
# `validateAuth`

Timing-safe basic auth validation using MessageDigest.isEqual.

## Signature

```java
protected boolean validateAuth(com.sun.net.httpserver.HttpExchange exchange)
```

## Parameters

| Name       | Type                                  | Required | Default | Description |
| ---------- | ------------------------------------- | -------- | ------- | ----------- |
| `exchange` | `com.sun.net.httpserver.HttpExchange` | yes      | —       | —           |

## Returns

`boolean`

## Source

[`src/main/java/com/signalwire/sdk/swml/Service.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Service.java)

Line 176.
