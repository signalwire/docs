---
slug: "/reference/java/com/signalwire/sdk/swaig/swaig/function-result/switch-context"
title: "switchContext"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.swaig.FunctionResult.switchContext"
  parent: "com.signalwire.sdk.swaig.FunctionResult"
  module: "com.signalwire.sdk.swaig.FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swaig/FunctionResult.java"
  visibility: "public"
---
# `switchContext`

Switch context with optional reset parameters.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.swaig.FunctionResult switchContext(
    java.lang.String systemPrompt,
    java.lang.String userPrompt,
    boolean consolidate,
    boolean fullReset
)
```

**Overload 2**

```java
public com.signalwire.sdk.swaig.FunctionResult switchContext(
    java.lang.String systemPrompt
)
```

## Parameters (Overload 1)

| Name           | Type               | Required | Default | Description |
| -------------- | ------------------ | -------- | ------- | ----------- |
| `systemPrompt` | `java.lang.String` | yes      | —       | —           |
| `userPrompt`   | `java.lang.String` | yes      | —       | —           |
| `consolidate`  | `boolean`          | yes      | —       | —           |
| `fullReset`    | `boolean`          | yes      | —       | —           |

## Parameters (Overload 2)

| Name           | Type               | Required | Default | Description |
| -------------- | ------------------ | -------- | ------- | ----------- |
| `systemPrompt` | `java.lang.String` | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.swaig.FunctionResult`

## Returns (Overload 2)

`com.signalwire.sdk.swaig.FunctionResult`

## Source

[`src/main/java/com/signalwire/sdk/swaig/FunctionResult.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swaig/FunctionResult.java)

Line 210.
