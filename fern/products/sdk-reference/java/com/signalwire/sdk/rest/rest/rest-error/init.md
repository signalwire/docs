---
slug: "/reference/java/com/signalwire/sdk/rest/rest/rest-error/init"
title: "<init>"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.RestError.<init>"
  parent: "com.signalwire.sdk.rest.RestError"
  module: "com.signalwire.sdk.rest.RestError"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/RestError.java"
  visibility: "public"
---
# `<init>`

## Signature

**Overload 1**

```java
public void <init>(
    int statusCode,
    java.lang.String method,
    java.lang.String path,
    java.lang.String responseBody
)
```

**Overload 2**

```java
public void <init>(
    int statusCode,
    java.lang.String method,
    java.lang.String path,
    java.lang.String responseBody,
    java.lang.Throwable cause
)
```

## Parameters (Overload 1)

| Name           | Type               | Required | Default | Description |
| -------------- | ------------------ | -------- | ------- | ----------- |
| `statusCode`   | `int`              | yes      | —       | —           |
| `method`       | `java.lang.String` | yes      | —       | —           |
| `path`         | `java.lang.String` | yes      | —       | —           |
| `responseBody` | `java.lang.String` | yes      | —       | —           |

## Parameters (Overload 2)

| Name           | Type                  | Required | Default | Description |
| -------------- | --------------------- | -------- | ------- | ----------- |
| `statusCode`   | `int`                 | yes      | —       | —           |
| `method`       | `java.lang.String`    | yes      | —       | —           |
| `path`         | `java.lang.String`    | yes      | —       | —           |
| `responseBody` | `java.lang.String`    | yes      | —       | —           |
| `cause`        | `java.lang.Throwable` | yes      | —       | —           |

## Source

[`src/main/java/com/signalwire/sdk/rest/RestError.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/RestError.java)

Line 21.
