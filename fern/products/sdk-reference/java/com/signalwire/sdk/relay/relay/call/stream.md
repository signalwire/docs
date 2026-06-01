---
slug: "/reference/java/com/signalwire/sdk/relay/relay/call/stream"
title: "stream"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.Call.stream"
  parent: "com.signalwire.sdk.relay.Call"
  module: "com.signalwire.sdk.relay.Call"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java"
  visibility: "public"
---
# `stream`

Start streaming audio from the call.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.relay.Action.StreamAction stream(
    java.lang.String url,
    java.util.Map<java.lang.String,java.lang.Object> options
)
```

**Overload 2**

```java
public com.signalwire.sdk.relay.Action.StreamAction stream(
    java.lang.String url,
    java.lang.String controlId
)
```

**Overload 3**

```java
public com.signalwire.sdk.relay.Action.StreamAction stream(
    java.lang.String url,
    java.lang.String codec,
    java.lang.String controlId
)
```

## Parameters (Overload 1)

| Name      | Type                                               | Required | Default | Description                                    |
| --------- | -------------------------------------------------- | -------- | ------- | ---------------------------------------------- |
| `url`     | `java.lang.String`                                 | yes      | —       | WebSocket URL                                  |
| `options` | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | optional parameters (name, codec, track, etc.) |

## Parameters (Overload 2)

| Name        | Type               | Required | Default | Description |
| ----------- | ------------------ | -------- | ------- | ----------- |
| `url`       | `java.lang.String` | yes      | —       | —           |
| `controlId` | `java.lang.String` | yes      | —       | —           |

## Parameters (Overload 3)

| Name        | Type               | Required | Default | Description |
| ----------- | ------------------ | -------- | ------- | ----------- |
| `url`       | `java.lang.String` | yes      | —       | —           |
| `codec`     | `java.lang.String` | yes      | —       | —           |
| `controlId` | `java.lang.String` | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.relay.Action.StreamAction` — a StreamAction

## Returns (Overload 2)

`com.signalwire.sdk.relay.Action.StreamAction`

## Returns (Overload 3)

`com.signalwire.sdk.relay.Action.StreamAction`

## Source

[`src/main/java/com/signalwire/sdk/relay/Call.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java)

Line 787.
