---
slug: "/reference/java/com/signalwire/sdk/runtime/lambda/lambda/lambda-response/json"
title: "json"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.runtime.lambda.LambdaResponse.json"
  parent: "com.signalwire.sdk.runtime.lambda.LambdaResponse"
  module: "com.signalwire.sdk.runtime.lambda.LambdaResponse"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/runtime/lambda/LambdaResponse.java"
  visibility: "public"
---
# `json`

Convenience builder for a 200 JSON response.

**Modifiers:** `static`

## Signature

**Overload 1**

```java
public static com.signalwire.sdk.runtime.lambda.LambdaResponse json(
    java.lang.String body
)
```

**Overload 2**

```java
public static com.signalwire.sdk.runtime.lambda.LambdaResponse json(
    int statusCode,
    java.lang.String body
)
```

## Parameters (Overload 1)

| Name   | Type               | Required | Default | Description      |
| ------ | ------------------ | -------- | ------- | ---------------- |
| `body` | `java.lang.String` | yes      | —       | raw JSON string. |

## Parameters (Overload 2)

| Name         | Type               | Required | Default | Description      |
| ------------ | ------------------ | -------- | ------- | ---------------- |
| `statusCode` | `int`              | yes      | —       | HTTP status.     |
| `body`       | `java.lang.String` | yes      | —       | raw JSON string. |

## Returns (Overload 1)

`com.signalwire.sdk.runtime.lambda.LambdaResponse` — LambdaResponse.

## Returns (Overload 2)

`com.signalwire.sdk.runtime.lambda.LambdaResponse` — LambdaResponse.

## Source

[`src/main/java/com/signalwire/sdk/runtime/lambda/LambdaResponse.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/runtime/lambda/LambdaResponse.java)

Line 75.
