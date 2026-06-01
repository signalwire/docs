---
slug: "/reference/java/com/signalwire/sdk/relay/relay/call/play"
title: "play"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.Call.play"
  parent: "com.signalwire.sdk.relay.Call"
  module: "com.signalwire.sdk.relay.Call"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java"
  visibility: "public"
---
# `play`

Play media on the call.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.relay.Action.PlayAction play(
    java.util.List<java.util.Map<java.lang.String,java.lang.Object>> media,
    java.util.Map<java.lang.String,java.lang.Object> options
)
```

**Overload 2**

```java
public com.signalwire.sdk.relay.Action.PlayAction play(
    java.util.List<java.util.Map<java.lang.String,java.lang.Object>> media
)
```

**Overload 3**

```java
public com.signalwire.sdk.relay.Action.PlayAction play(
    java.util.List<java.util.Map<java.lang.String,java.lang.Object>> media,
    java.lang.String controlId
)
```

## Parameters (Overload 1)

| Name      | Type                                                               | Required | Default | Description                                         |
| --------- | ------------------------------------------------------------------ | -------- | ------- | --------------------------------------------------- |
| `media`   | `java.util.List<java.util.Map<java.lang.String,java.lang.Object>>` | yes      | —       | list of media objects                               |
| `options` | `java.util.Map<java.lang.String,java.lang.Object>`                 | yes      | —       | optional parameters (volume, direction, loop, etc.) |

## Parameters (Overload 2)

| Name    | Type                                                               | Required | Default | Description |
| ------- | ------------------------------------------------------------------ | -------- | ------- | ----------- |
| `media` | `java.util.List<java.util.Map<java.lang.String,java.lang.Object>>` | yes      | —       | —           |

## Parameters (Overload 3)

| Name        | Type                                                               | Required | Default | Description |
| ----------- | ------------------------------------------------------------------ | -------- | ------- | ----------- |
| `media`     | `java.util.List<java.util.Map<java.lang.String,java.lang.Object>>` | yes      | —       | —           |
| `controlId` | `java.lang.String`                                                 | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.relay.Action.PlayAction` — a PlayAction that can be waited on, paused, resumed, stopped

## Returns (Overload 2)

`com.signalwire.sdk.relay.Action.PlayAction`

## Returns (Overload 3)

`com.signalwire.sdk.relay.Action.PlayAction`

## Source

[`src/main/java/com/signalwire/sdk/relay/Call.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java)

Line 461.
