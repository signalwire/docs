---
slug: "/reference/java/com/signalwire/sdk/relay/relay/call/collect"
title: "collect"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.Call.collect"
  parent: "com.signalwire.sdk.relay.Call"
  module: "com.signalwire.sdk.relay.Call"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java"
  visibility: "public"
---
# `collect`

Collect digits or speech input.

## Signature

```java
public com.signalwire.sdk.relay.Action.CollectAction collect(
    java.util.Map<java.lang.String,java.lang.Object> collectConfig,
    java.util.Map<java.lang.String,java.lang.Object> options
)
```

## Parameters

| Name            | Type                                               | Required | Default | Description           |
| --------------- | -------------------------------------------------- | -------- | ------- | --------------------- |
| `collectConfig` | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | collect configuration |
| `options`       | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | optional parameters   |

## Returns

`com.signalwire.sdk.relay.Action.CollectAction` — a CollectAction

## Source

[`src/main/java/com/signalwire/sdk/relay/Call.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java)

Line 576.
