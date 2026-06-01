---
slug: "/reference/java/com/signalwire/sdk/swml/swml/service/on-function-call"
title: "onFunctionCall"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.swml.Service.onFunctionCall"
  parent: "com.signalwire.sdk.swml.Service"
  module: "com.signalwire.sdk.swml.Service"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Service.java"
  visibility: "public"
---
# `onFunctionCall`

Dispatch a function call to the registered handler.

## Signature

```java
public com.signalwire.sdk.swaig.FunctionResult onFunctionCall(
    java.lang.String funcName,
    java.util.Map<java.lang.String,java.lang.Object> args,
    java.util.Map<java.lang.String,java.lang.Object> rawData
)
```

## Parameters

| Name       | Type                                               | Required | Default | Description |
| ---------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `funcName` | `java.lang.String`                                 | yes      | —       | —           |
| `args`     | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | —           |
| `rawData`  | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | —           |

## Returns

`com.signalwire.sdk.swaig.FunctionResult`

## Source

[`src/main/java/com/signalwire/sdk/swml/Service.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Service.java)

Line 247.
