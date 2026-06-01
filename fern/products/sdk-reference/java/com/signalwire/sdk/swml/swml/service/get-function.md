---
slug: "/reference/java/com/signalwire/sdk/swml/swml/service/get-function"
title: "getFunction"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.swml.Service.getFunction"
  parent: "com.signalwire.sdk.swml.Service"
  module: "com.signalwire.sdk.swml.Service"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Service.java"
  visibility: "public"
---
# `getFunction`

Get a registered SWAIG function by name, or null when absent.

(Python parity: `ToolRegistry.get_function`.)

## Signature

```java
public com.signalwire.sdk.swaig.ToolDefinition getFunction(
    java.lang.String name
)
```

## Parameters

| Name   | Type               | Required | Default | Description |
| ------ | ------------------ | -------- | ------- | ----------- |
| `name` | `java.lang.String` | yes      | —       | —           |

## Returns

`com.signalwire.sdk.swaig.ToolDefinition`

## Source

[`src/main/java/com/signalwire/sdk/swml/Service.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Service.java)

Line 271.
