---
slug: "/reference/java/com/signalwire/sdk/swml/swml/service/swaig-pre-dispatch"
title: "swaigPreDispatch"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.swml.Service.swaigPreDispatch"
  parent: "com.signalwire.sdk.swml.Service"
  module: "com.signalwire.sdk.swml.Service"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Service.java"
  visibility: "protected"
---
# `swaigPreDispatch`

Extension point: invoked between argument parsing and function
dispatch.

Returns a 2-element array: \[target Service, shortCircuit Map].
If shortCircuit is non-null, it's returned as the SWAIG response
without calling onFunctionCall. AgentBase may override to add
session-token validation or ephemeral dynamic-config copies.

## Signature

```java
protected java.lang.Object[] swaigPreDispatch(
    java.util.Map<java.lang.String,java.lang.Object> requestData,
    java.lang.String funcName
)
```

## Parameters

| Name          | Type                                               | Required | Default | Description |
| ------------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `requestData` | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | —           |
| `funcName`    | `java.lang.String`                                 | yes      | —       | —           |

## Returns

`java.lang.Object[]`

## Source

[`src/main/java/com/signalwire/sdk/swml/Service.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Service.java)

Line 321.
