---
slug: "/reference/java/com/signalwire/sdk/relay/relay/call/connect"
title: "connect"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.Call.connect"
  parent: "com.signalwire.sdk.relay.Call"
  module: "com.signalwire.sdk.relay.Call"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java"
  visibility: "public"
---
# `connect`

Connect another device to this call.

## Signature

```java
public java.util.Map<java.lang.String,java.lang.Object> connect(
    java.util.List<java.util.List<java.util.Map<java.lang.String,java.lang.Object>>> devices,
    java.util.Map<java.lang.String,java.lang.Object> options
)
```

## Parameters

| Name      | Type                                                                               | Required | Default | Description |
| --------- | ---------------------------------------------------------------------------------- | -------- | ------- | ----------- |
| `devices` | `java.util.List<java.util.List<java.util.Map<java.lang.String,java.lang.Object>>>` | yes      | —       | —           |
| `options` | `java.util.Map<java.lang.String,java.lang.Object>`                                 | yes      | —       | —           |

## Returns

`java.util.Map<java.lang.String,java.lang.Object>`

## Source

[`src/main/java/com/signalwire/sdk/relay/Call.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java)

Line 362.
