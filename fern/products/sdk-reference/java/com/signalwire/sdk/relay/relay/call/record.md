---
slug: "/reference/java/com/signalwire/sdk/relay/relay/call/record"
title: "record"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.Call.record"
  parent: "com.signalwire.sdk.relay.Call"
  module: "com.signalwire.sdk.relay.Call"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java"
  visibility: "public"
---
# `record`

Record the call.

## Signature

```java
public com.signalwire.sdk.relay.Action.RecordAction record(
    java.util.Map<java.lang.String,java.lang.Object> recordConfig,
    java.util.Map<java.lang.String,java.lang.Object> options
)
```

## Parameters

| Name           | Type                                               | Required | Default | Description                 |
| -------------- | -------------------------------------------------- | -------- | ------- | --------------------------- |
| `recordConfig` | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | record configuration object |
| `options`      | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | optional parameters         |

## Returns

`com.signalwire.sdk.relay.Action.RecordAction` — a RecordAction

## Source

[`src/main/java/com/signalwire/sdk/relay/Call.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java)

Line 505.
