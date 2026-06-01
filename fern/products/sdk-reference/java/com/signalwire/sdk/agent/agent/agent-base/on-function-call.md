---
slug: "/reference/java/com/signalwire/sdk/agent/agent/agent-base/on-function-call"
title: "onFunctionCall"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.agent.AgentBase.onFunctionCall"
  parent: "com.signalwire.sdk.agent.AgentBase"
  module: "com.signalwire.sdk.agent.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java"
  visibility: "public"
---
# `onFunctionCall`

## Signature

```java
public com.signalwire.sdk.swaig.FunctionResult onFunctionCall(
    java.lang.String name,
    java.util.Map<java.lang.String,java.lang.Object> args,
    java.util.Map<java.lang.String,java.lang.Object> rawData
)
```

## Parameters

| Name      | Type                                               | Required | Default | Description |
| --------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `name`    | `java.lang.String`                                 | yes      | —       | —           |
| `args`    | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | —           |
| `rawData` | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | —           |

## Returns

`com.signalwire.sdk.swaig.FunctionResult`

## Source

[`src/main/java/com/signalwire/sdk/agent/AgentBase.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java)

Line 591.
