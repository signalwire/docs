---
slug: "/reference/java/com/signalwire/sdk/swml/swml/service/on-request"
title: "onRequest"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.swml.Service.onRequest"
  parent: "com.signalwire.sdk.swml.Service"
  module: "com.signalwire.sdk.swml.Service"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Service.java"
  visibility: "public"
---
# `onRequest`

Customization hook called when SWML is requested.

Default
delegates to String) and
returns its result. Subclasses typically override
`onSwmlRequest` rather than this method.

 <p>Returning `null` uses the default rendered SWML;
 returning a non-null map merges the entries as modifications.

 <p>Python parity: callback_path). The Python third `request` parameter is
 FastAPI-specific and intentionally not mirrored.

## Signature

```java
public java.util.Map<java.lang.String,java.lang.Object> onRequest(
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

`java.util.Map<java.lang.String,java.lang.Object>` — modifications map, or `null` for default rendering

## Source

[`src/main/java/com/signalwire/sdk/swml/Service.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Service.java)

Line 360.
