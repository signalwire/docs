---
slug: "/reference/java/com/signalwire/sdk/datamap/datamap/data-map/expression"
title: "expression"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.datamap.DataMap.expression"
  parent: "com.signalwire.sdk.datamap.DataMap"
  module: "com.signalwire.sdk.datamap.DataMap"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/datamap/DataMap.java"
  visibility: "public"
---
# `expression`

Add an expression pattern for pattern-based responses.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.datamap.DataMap expression(
    java.lang.String testValue,
    java.lang.String pattern,
    com.signalwire.sdk.swaig.FunctionResult output,
    com.signalwire.sdk.swaig.FunctionResult nomatchOutput
)
```

**Overload 2**

```java
public com.signalwire.sdk.datamap.DataMap expression(
    java.lang.String testValue,
    java.lang.String pattern,
    com.signalwire.sdk.swaig.FunctionResult output
)
```

## Parameters (Overload 1)

| Name            | Type                                      | Required | Default | Description |
| --------------- | ----------------------------------------- | -------- | ------- | ----------- |
| `testValue`     | `java.lang.String`                        | yes      | —       | —           |
| `pattern`       | `java.lang.String`                        | yes      | —       | —           |
| `output`        | `com.signalwire.sdk.swaig.FunctionResult` | yes      | —       | —           |
| `nomatchOutput` | `com.signalwire.sdk.swaig.FunctionResult` | yes      | —       | —           |

## Parameters (Overload 2)

| Name        | Type                                      | Required | Default | Description |
| ----------- | ----------------------------------------- | -------- | ------- | ----------- |
| `testValue` | `java.lang.String`                        | yes      | —       | —           |
| `pattern`   | `java.lang.String`                        | yes      | —       | —           |
| `output`    | `com.signalwire.sdk.swaig.FunctionResult` | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.datamap.DataMap`

## Returns (Overload 2)

`com.signalwire.sdk.datamap.DataMap`

## Source

[`src/main/java/com/signalwire/sdk/datamap/DataMap.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/datamap/DataMap.java)

Line 128.
