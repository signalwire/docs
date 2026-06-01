---
slug: "/reference/java/com/signalwire/sdk/relay/relay/relay-client/dial"
title: "dial"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.RelayClient.dial"
  parent: "com.signalwire.sdk.relay.RelayClient"
  module: "com.signalwire.sdk.relay.RelayClient"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/RelayClient.java"
  visibility: "public"
---
# `dial`

Dial an outbound call.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.relay.Call dial(
    java.util.List<java.util.List<java.util.Map<java.lang.String,java.lang.Object>>> devices,
    java.util.Map<java.lang.String,java.lang.Object> options,
    long timeout
)
```

**Overload 2**

```java
public com.signalwire.sdk.relay.Call dial(
    java.util.List<java.util.List<java.util.Map<java.lang.String,java.lang.Object>>> devices
)
```

## Parameters (Overload 1)

| Name      | Type                                                                               | Required | Default | Description                                           |
| --------- | ---------------------------------------------------------------------------------- | -------- | ------- | ----------------------------------------------------- |
| `devices` | `java.util.List<java.util.List<java.util.Map<java.lang.String,java.lang.Object>>>` | yes      | —       | nested array: outer = sequential, inner = parallel    |
| `options` | `java.util.Map<java.lang.String,java.lang.Object>`                                 | yes      | —       | optional parameters (region, max\_price\_per\_minute) |
| `timeout` | `long`                                                                             | yes      | —       | timeout in milliseconds                               |

## Parameters (Overload 2)

| Name      | Type                                                                               | Required | Default | Description |
| --------- | ---------------------------------------------------------------------------------- | -------- | ------- | ----------- |
| `devices` | `java.util.List<java.util.List<java.util.Map<java.lang.String,java.lang.Object>>>` | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.relay.Call` — the answered Call

## Returns (Overload 2)

`com.signalwire.sdk.relay.Call`

## Source

[`src/main/java/com/signalwire/sdk/relay/RelayClient.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/RelayClient.java)

Line 290.
