---
slug: "/reference/java/com/signalwire/sdk/relay/relay/call/transcribe"
title: "transcribe"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.Call.transcribe"
  parent: "com.signalwire.sdk.relay.Call"
  module: "com.signalwire.sdk.relay.Call"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java"
  visibility: "public"
---
# `transcribe`

Start transcription on the call.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.relay.Action.TranscribeAction transcribe(
    java.util.Map<java.lang.String,java.lang.Object> options
)
```

**Overload 2**

```java
public com.signalwire.sdk.relay.Action.TranscribeAction transcribe(
    java.lang.String controlId
)
```

## Parameters (Overload 1)

| Name      | Type                                               | Required | Default | Description         |
| --------- | -------------------------------------------------- | -------- | ------- | ------------------- |
| `options` | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | optional parameters |

## Parameters (Overload 2)

| Name        | Type               | Required | Default | Description |
| ----------- | ------------------ | -------- | ------- | ----------- |
| `controlId` | `java.lang.String` | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.relay.Action.TranscribeAction` — a TranscribeAction

## Returns (Overload 2)

`com.signalwire.sdk.relay.Action.TranscribeAction`

## Source

[`src/main/java/com/signalwire/sdk/relay/Call.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java)

Line 827.
