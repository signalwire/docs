---
slug: "/reference/java/com/signalwire/sdk/swml/swml/service/send-payload-too-large"
title: "sendPayloadTooLarge"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.swml.Service.sendPayloadTooLarge"
  parent: "com.signalwire.sdk.swml.Service"
  module: "com.signalwire.sdk.swml.Service"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Service.java"
  visibility: "protected"
---
# `sendPayloadTooLarge`

Send a 413 Payload Too Large response.

## Signature

```java
protected void sendPayloadTooLarge(com.sun.net.httpserver.HttpExchange exchange)
```

## Parameters

| Name       | Type                                  | Required | Default | Description |
| ---------- | ------------------------------------- | -------- | ------- | ----------- |
| `exchange` | `com.sun.net.httpserver.HttpExchange` | yes      | —       | —           |

## Throws

- `IOException`

## Source

[`src/main/java/com/signalwire/sdk/swml/Service.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Service.java)

Line 683.
