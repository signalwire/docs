---
slug: "/reference/java/com/signalwire/sdk/relay/relay/call/detect-with"
title: "detectWith"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.Call.detectWith"
  parent: "com.signalwire.sdk.relay.Call"
  module: "com.signalwire.sdk.relay.Call"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java"
  visibility: "public"
---
# `detectWith`

Detect with an explicit control\_id (test helper).

Wraps in <config>.

## Signature

```java
public com.signalwire.sdk.relay.Action.DetectAction detectWith(
    java.util.Map<java.lang.String,java.lang.Object> detectConfig,
    java.lang.String controlId
)
```

## Parameters

| Name           | Type                                               | Required | Default | Description |
| -------------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `detectConfig` | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | —           |
| `controlId`    | `java.lang.String`                                 | yes      | —       | —           |

## Returns

`com.signalwire.sdk.relay.Action.DetectAction`

## Source

[`src/main/java/com/signalwire/sdk/relay/Call.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java)

Line 565.
