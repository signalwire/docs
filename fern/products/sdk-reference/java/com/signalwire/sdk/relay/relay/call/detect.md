---
slug: "/reference/java/com/signalwire/sdk/relay/relay/call/detect"
title: "detect"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.Call.detect"
  parent: "com.signalwire.sdk.relay.Call"
  module: "com.signalwire.sdk.relay.Call"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java"
  visibility: "public"
---
# `detect`

Detect answering machine, fax, or digits.

## Signature

```java
public com.signalwire.sdk.relay.Action.DetectAction detect(
    java.util.Map<java.lang.String,java.lang.Object> detectConfig,
    java.util.Map<java.lang.String,java.lang.Object> options
)
```

## Parameters

| Name           | Type                                               | Required | Default | Description                         |
| -------------- | -------------------------------------------------- | -------- | ------- | ----------------------------------- |
| `detectConfig` | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | detect configuration                |
| `options`      | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | optional parameters (timeout, etc.) |

## Returns

`com.signalwire.sdk.relay.Action.DetectAction` — a DetectAction

## Source

[`src/main/java/com/signalwire/sdk/relay/Call.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java)

Line 542.
