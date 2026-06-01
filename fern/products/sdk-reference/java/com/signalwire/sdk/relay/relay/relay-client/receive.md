---
slug: "/reference/java/com/signalwire/sdk/relay/relay/relay-client/receive"
title: "receive"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.RelayClient.receive"
  parent: "com.signalwire.sdk.relay.RelayClient"
  module: "com.signalwire.sdk.relay.RelayClient"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/RelayClient.java"
  visibility: "public"
---
# `receive`

Subscribe to additional contexts dynamically.

## Signature

```java
public java.util.Map<java.lang.String,java.lang.Object> receive(
    java.util.List<java.lang.String> newContexts
)
```

## Parameters

| Name          | Type                               | Required | Default | Description |
| ------------- | ---------------------------------- | -------- | ------- | ----------- |
| `newContexts` | `java.util.List<java.lang.String>` | yes      | —       | —           |

## Returns

`java.util.Map<java.lang.String,java.lang.Object>`

## Source

[`src/main/java/com/signalwire/sdk/relay/RelayClient.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/RelayClient.java)

Line 267.
