---
slug: "/reference/java/com/signalwire/sdk/swaig/swaig/function-result/record-call"
title: "recordCall"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.swaig.FunctionResult.recordCall"
  parent: "com.signalwire.sdk.swaig.FunctionResult"
  module: "com.signalwire.sdk.swaig.FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swaig/FunctionResult.java"
  visibility: "public"
---
# `recordCall`

Start background call recording via SWML.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.swaig.FunctionResult recordCall(
    java.lang.String controlId,
    boolean stereo,
    java.lang.String format,
    java.lang.String direction
)
```

**Overload 2**

```java
public com.signalwire.sdk.swaig.FunctionResult recordCall()
```

## Parameters (Overload 1)

| Name        | Type               | Required | Default | Description |
| ----------- | ------------------ | -------- | ------- | ----------- |
| `controlId` | `java.lang.String` | yes      | —       | —           |
| `stereo`    | `boolean`          | yes      | —       | —           |
| `format`    | `java.lang.String` | yes      | —       | —           |
| `direction` | `java.lang.String` | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.swaig.FunctionResult`

## Returns (Overload 2)

`com.signalwire.sdk.swaig.FunctionResult`

## Source

[`src/main/java/com/signalwire/sdk/swaig/FunctionResult.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swaig/FunctionResult.java)

Line 278.
