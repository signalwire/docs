---
slug: "/reference/java/com/signalwire/sdk/swml/swml/service/on-swml-request"
title: "onSwmlRequest"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.swml.Service.onSwmlRequest"
  parent: "com.signalwire.sdk.swml.Service"
  module: "com.signalwire.sdk.swml.Service"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Service.java"
  visibility: "public"
---
# `onSwmlRequest`

Customization point for subclasses to modify SWML based on
request data.

The default implementation returns `null`
(no modification). Subclasses override to inspect the body or
callback path and return a map of SWML overrides.

 <p>Python parity: callback_path). The Python third `request` parameter is
 FastAPI-specific and intentionally not mirrored.

## Signature

```java
public java.util.Map<java.lang.String,java.lang.Object> onSwmlRequest(
    java.util.Map<java.lang.String,java.lang.Object> requestData,
    java.lang.String callbackPath
)
```

## Parameters

| Name           | Type                                               | Required | Default | Description                           |
| -------------- | -------------------------------------------------- | -------- | ------- | ------------------------------------- |
| `requestData`  | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | parsed request body, or `null`        |
| `callbackPath` | `java.lang.String`                                 | yes      | —       | optional callback sub-path, or `null` |

## Returns

`java.util.Map<java.lang.String,java.lang.Object>` — modifications map, or `null`

## Source

[`src/main/java/com/signalwire/sdk/swml/Service.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Service.java)

Line 380.
