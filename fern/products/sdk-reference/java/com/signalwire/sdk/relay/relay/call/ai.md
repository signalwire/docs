---
slug: "/reference/java/com/signalwire/sdk/relay/relay/call/ai"
title: "ai"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.Call.ai"
  parent: "com.signalwire.sdk.relay.Call"
  module: "com.signalwire.sdk.relay.Call"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java"
  visibility: "public"
---
# `ai`

Start an AI agent on the call.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.relay.Action.AiAction ai(
    java.util.Map<java.lang.String,java.lang.Object> aiConfig
)
```

**Overload 2**

```java
public com.signalwire.sdk.relay.Action.AiAction ai(
    java.util.Map<java.lang.String,java.lang.Object> prompt,
    java.lang.String controlId
)
```

## Parameters (Overload 1)

| Name       | Type                                               | Required | Default | Description      |
| ---------- | -------------------------------------------------- | -------- | ------- | ---------------- |
| `aiConfig` | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | AI configuration |

## Parameters (Overload 2)

| Name        | Type                                               | Required | Default | Description |
| ----------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `prompt`    | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | —           |
| `controlId` | `java.lang.String`                                 | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.relay.Action.AiAction` — an AiAction

## Returns (Overload 2)

`com.signalwire.sdk.relay.Action.AiAction`

## Source

[`src/main/java/com/signalwire/sdk/relay/Call.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java)

Line 856.
