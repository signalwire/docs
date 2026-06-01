---
slug: "/reference/java/com/signalwire/sdk/relay/relay/relay-client/execute"
title: "execute"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.RelayClient.execute"
  parent: "com.signalwire.sdk.relay.RelayClient"
  module: "com.signalwire.sdk.relay.RelayClient"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/RelayClient.java"
  visibility: "public"
---
# `execute`

Execute an RPC method and wait for the response.

## Signature

```java
public java.util.Map<java.lang.String,java.lang.Object> execute(
    java.lang.String method,
    java.util.Map<java.lang.String,java.lang.Object> params
)
```

## Parameters

| Name     | Type                                               | Required | Default | Description |
| -------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `method` | `java.lang.String`                                 | yes      | —       | —           |
| `params` | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | —           |

## Returns

`java.util.Map<java.lang.String,java.lang.Object>`

## Source

[`src/main/java/com/signalwire/sdk/relay/RelayClient.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/RelayClient.java)

Line 406.
