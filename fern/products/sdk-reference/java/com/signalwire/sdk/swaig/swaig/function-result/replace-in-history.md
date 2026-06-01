---
slug: "/reference/java/com/signalwire/sdk/swaig/swaig/function-result/replace-in-history"
title: "replaceInHistory"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.swaig.FunctionResult.replaceInHistory"
  parent: "com.signalwire.sdk.swaig.FunctionResult"
  module: "com.signalwire.sdk.swaig.FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swaig/FunctionResult.java"
  visibility: "public"
---
# `replaceInHistory`

Replace tool\_call+result pair in conversation history.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.swaig.FunctionResult replaceInHistory(
    java.lang.String text
)
```

**Overload 2**

```java
public com.signalwire.sdk.swaig.FunctionResult replaceInHistory(boolean summary)
```

## Parameters (Overload 1)

| Name   | Type               | Required | Default | Description |
| ------ | ------------------ | -------- | ------- | ----------- |
| `text` | `java.lang.String` | yes      | —       | —           |

## Parameters (Overload 2)

| Name      | Type      | Required | Default | Description |
| --------- | --------- | -------- | ------- | ----------- |
| `summary` | `boolean` | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.swaig.FunctionResult`

## Returns (Overload 2)

`com.signalwire.sdk.swaig.FunctionResult`

## Source

[`src/main/java/com/signalwire/sdk/swaig/FunctionResult.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swaig/FunctionResult.java)

Line 240.
