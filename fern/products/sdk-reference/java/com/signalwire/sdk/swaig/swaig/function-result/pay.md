---
slug: "/reference/java/com/signalwire/sdk/swaig/swaig/function-result/pay"
title: "pay"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.swaig.FunctionResult.pay"
  parent: "com.signalwire.sdk.swaig.FunctionResult"
  module: "com.signalwire.sdk.swaig.FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swaig/FunctionResult.java"
  visibility: "public"
---
# `pay`

Process payment via SWML pay action.

## Signature

```java
public com.signalwire.sdk.swaig.FunctionResult pay(
    java.lang.String connectorUrl,
    java.lang.String inputMethod,
    java.lang.String statusUrl,
    int timeout,
    int maxAttempts
)
```

## Parameters

| Name           | Type               | Required | Default | Description |
| -------------- | ------------------ | -------- | ------- | ----------- |
| `connectorUrl` | `java.lang.String` | yes      | —       | —           |
| `inputMethod`  | `java.lang.String` | yes      | —       | —           |
| `statusUrl`    | `java.lang.String` | yes      | —       | —           |
| `timeout`      | `int`              | yes      | —       | —           |
| `maxAttempts`  | `int`              | yes      | —       | —           |

## Returns

`com.signalwire.sdk.swaig.FunctionResult`

## Source

[`src/main/java/com/signalwire/sdk/swaig/FunctionResult.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swaig/FunctionResult.java)

Line 488.
