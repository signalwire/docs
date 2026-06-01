---
slug: "/reference/java/com/signalwire/sdk/swaig/swaig/function-result/execute-rpc"
title: "executeRpc"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.swaig.FunctionResult.executeRpc"
  parent: "com.signalwire.sdk.swaig.FunctionResult"
  module: "com.signalwire.sdk.swaig.FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swaig/FunctionResult.java"
  visibility: "public"
---
# `executeRpc`

Execute an RPC method via SWML.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.swaig.FunctionResult executeRpc(
    java.lang.String method,
    java.util.Map<java.lang.String,java.lang.Object> params,
    java.lang.String callId,
    java.lang.String nodeId
)
```

**Overload 2**

```java
public com.signalwire.sdk.swaig.FunctionResult executeRpc(
    java.lang.String method,
    java.util.Map<java.lang.String,java.lang.Object> params
)
```

## Parameters (Overload 1)

| Name     | Type                                               | Required | Default | Description |
| -------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `method` | `java.lang.String`                                 | yes      | —       | —           |
| `params` | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | —           |
| `callId` | `java.lang.String`                                 | yes      | —       | —           |
| `nodeId` | `java.lang.String`                                 | yes      | —       | —           |

## Parameters (Overload 2)

| Name     | Type                                               | Required | Default | Description |
| -------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `method` | `java.lang.String`                                 | yes      | —       | —           |
| `params` | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.swaig.FunctionResult`

## Returns (Overload 2)

`com.signalwire.sdk.swaig.FunctionResult`

## Source

[`src/main/java/com/signalwire/sdk/swaig/FunctionResult.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swaig/FunctionResult.java)

Line 513.
