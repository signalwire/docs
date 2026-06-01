---
slug: "/reference/java/com/signalwire/sdk/swml/swml/service/add-security-headers"
title: "addSecurityHeaders"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.swml.Service.addSecurityHeaders"
  parent: "com.signalwire.sdk.swml.Service"
  module: "com.signalwire.sdk.swml.Service"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Service.java"
  visibility: "protected"
---
# `addSecurityHeaders`

Add security headers to every authenticated response.

## Signature

```java
protected void addSecurityHeaders(com.sun.net.httpserver.HttpExchange exchange)
```

## Parameters

| Name       | Type                                  | Required | Default | Description |
| ---------- | ------------------------------------- | -------- | ------- | ----------- |
| `exchange` | `com.sun.net.httpserver.HttpExchange` | yes      | —       | —           |

## Source

[`src/main/java/com/signalwire/sdk/swml/Service.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Service.java)

Line 411.
