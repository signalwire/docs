---
slug: "/reference/java/com/signalwire/sdk/runtime/lambda/lambda/lambda-response/init"
title: "<init>"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.runtime.lambda.LambdaResponse.<init>"
  parent: "com.signalwire.sdk.runtime.lambda.LambdaResponse"
  module: "com.signalwire.sdk.runtime.lambda.LambdaResponse"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/runtime/lambda/LambdaResponse.java"
  visibility: "public"
---
# `<init>`

Create a Lambda response with the given fields.

## Signature

```java
public void <init>(
    int statusCode,
    java.util.Map<java.lang.String,java.lang.String> headers,
    java.lang.String body,
    boolean isBase64Encoded
)
```

## Parameters

| Name              | Type                                               | Required | Default | Description                                                                  |
| ----------------- | -------------------------------------------------- | -------- | ------- | ---------------------------------------------------------------------------- |
| `statusCode`      | `int`                                              | yes      | —       | HTTP status code.                                                            |
| `headers`         | `java.util.Map<java.lang.String,java.lang.String>` | yes      | —       | response headers (must not be null \u2014 pass an empty map for no headers). |
| `body`            | `java.lang.String`                                 | yes      | —       | raw response body as a string.                                               |
| `isBase64Encoded` | `boolean`                                          | yes      | —       | whether the body is base64-encoded binary.                                   |

## Source

[`src/main/java/com/signalwire/sdk/runtime/lambda/LambdaResponse.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/runtime/lambda/LambdaResponse.java)

Line 33.
