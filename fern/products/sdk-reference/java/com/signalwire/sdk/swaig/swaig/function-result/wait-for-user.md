---
slug: "/reference/java/com/signalwire/sdk/swaig/swaig/function-result/wait-for-user"
title: "waitForUser"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.swaig.FunctionResult.waitForUser"
  parent: "com.signalwire.sdk.swaig.FunctionResult"
  module: "com.signalwire.sdk.swaig.FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swaig/FunctionResult.java"
  visibility: "public"
---
# `waitForUser`

Control how agent waits for user input.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.swaig.FunctionResult waitForUser(
    java.lang.Boolean enabled,
    java.lang.Integer timeout,
    boolean answerFirst
)
```

**Overload 2**

```java
public com.signalwire.sdk.swaig.FunctionResult waitForUser()
```

## Parameters (Overload 1)

| Name          | Type                | Required | Default | Description |
| ------------- | ------------------- | -------- | ------- | ----------- |
| `enabled`     | `java.lang.Boolean` | yes      | —       | —           |
| `timeout`     | `java.lang.Integer` | yes      | —       | —           |
| `answerFirst` | `boolean`           | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.swaig.FunctionResult`

## Returns (Overload 2)

`com.signalwire.sdk.swaig.FunctionResult`

## Source

[`src/main/java/com/signalwire/sdk/swaig/FunctionResult.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swaig/FunctionResult.java)

Line 138.
