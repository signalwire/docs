---
slug: "/reference/java/com/signalwire/sdk/relay/relay/call/tap"
title: "tap"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.Call.tap"
  parent: "com.signalwire.sdk.relay.Call"
  module: "com.signalwire.sdk.relay.Call"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java"
  visibility: "public"
---
# `tap`

Tap audio from the call.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.relay.Action.TapAction tap(
    java.util.Map<java.lang.String,java.lang.Object> tapConfig,
    java.util.Map<java.lang.String,java.lang.Object> tapDevice,
    java.util.Map<java.lang.String,java.lang.Object> options
)
```

**Overload 2**

```java
public com.signalwire.sdk.relay.Action.TapAction tap(
    java.util.Map<java.lang.String,java.lang.Object> tapConfig,
    java.util.Map<java.lang.String,java.lang.Object> tapDevice,
    java.lang.String controlId
)
```

## Parameters (Overload 1)

| Name        | Type                                               | Required | Default | Description            |
| ----------- | -------------------------------------------------- | -------- | ------- | ---------------------- |
| `tapConfig` | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | tap configuration      |
| `tapDevice` | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | tap device (rtp or ws) |
| `options`   | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | optional parameters    |

## Parameters (Overload 2)

| Name        | Type                                               | Required | Default | Description |
| ----------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `tapConfig` | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | —           |
| `tapDevice` | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | —           |
| `controlId` | `java.lang.String`                                 | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.relay.Action.TapAction` — a TapAction

## Returns (Overload 2)

`com.signalwire.sdk.relay.Action.TapAction`

## Source

[`src/main/java/com/signalwire/sdk/relay/Call.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java)

Line 755.
