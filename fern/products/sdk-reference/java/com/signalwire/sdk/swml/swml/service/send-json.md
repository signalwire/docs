---
slug: "/reference/java/com/signalwire/sdk/swml/swml/service/send-json"
title: "sendJson"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.swml.Service.sendJson"
  parent: "com.signalwire.sdk.swml.Service"
  module: "com.signalwire.sdk.swml.Service"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Service.java"
  visibility: "protected"
---
# `sendJson`

Send a JSON response.

## Signature

```java
protected void sendJson(
    com.sun.net.httpserver.HttpExchange exchange,
    int status,
    java.lang.Object body
)
```

## Parameters

| Name       | Type                                  | Required | Default | Description |
| ---------- | ------------------------------------- | -------- | ------- | ----------- |
| `exchange` | `com.sun.net.httpserver.HttpExchange` | yes      | —       | —           |
| `status`   | `int`                                 | yes      | —       | —           |
| `body`     | `java.lang.Object`                    | yes      | —       | —           |

## Throws

- `IOException`

## Source

[`src/main/java/com/signalwire/sdk/swml/Service.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Service.java)

Line 661.
