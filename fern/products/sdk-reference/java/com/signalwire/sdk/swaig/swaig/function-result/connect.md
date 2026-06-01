---
slug: "/reference/java/com/signalwire/sdk/swaig/swaig/function-result/connect"
title: "connect"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.swaig.FunctionResult.connect"
  parent: "com.signalwire.sdk.swaig.FunctionResult"
  module: "com.signalwire.sdk.swaig.FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swaig/FunctionResult.java"
  visibility: "public"
---
# `connect`

Connect/transfer the call to another destination via SWML connect verb.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.swaig.FunctionResult connect(
    java.lang.String destination,
    boolean isFinal,
    java.lang.String from
)
```

**Overload 2**

```java
public com.signalwire.sdk.swaig.FunctionResult connect(
    java.lang.String destination,
    boolean isFinal
)
```

## Parameters (Overload 1)

| Name          | Type               | Required | Default | Description |
| ------------- | ------------------ | -------- | ------- | ----------- |
| `destination` | `java.lang.String` | yes      | —       | —           |
| `isFinal`     | `boolean`          | yes      | —       | —           |
| `from`        | `java.lang.String` | yes      | —       | —           |

## Parameters (Overload 2)

| Name          | Type               | Required | Default | Description |
| ------------- | ------------------ | -------- | ------- | ----------- |
| `destination` | `java.lang.String` | yes      | —       | —           |
| `isFinal`     | `boolean`          | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.swaig.FunctionResult`

## Returns (Overload 2)

`com.signalwire.sdk.swaig.FunctionResult`

## Source

[`src/main/java/com/signalwire/sdk/swaig/FunctionResult.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swaig/FunctionResult.java)

Line 83.
