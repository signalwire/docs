---
slug: "/reference/java/com/signalwire/sdk/rest/rest/http-client/get"
title: "get"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.HttpClient.get"
  parent: "com.signalwire.sdk.rest.HttpClient"
  module: "com.signalwire.sdk.rest.HttpClient"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/HttpClient.java"
  visibility: "public"
---
# `get`

GET request, returns parsed JSON as a Map.

## Signature

**Overload 1**

```java
public java.util.Map<java.lang.String,java.lang.Object> get(
    java.lang.String path
)
```

**Overload 2**

```java
public java.util.Map<java.lang.String,java.lang.Object> get(
    java.lang.String path,
    java.util.Map<java.lang.String,java.lang.String> queryParams
)
```

## Parameters (Overload 1)

| Name   | Type               | Required | Default | Description |
| ------ | ------------------ | -------- | ------- | ----------- |
| `path` | `java.lang.String` | yes      | —       | —           |

## Parameters (Overload 2)

| Name          | Type                                               | Required | Default | Description |
| ------------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `path`        | `java.lang.String`                                 | yes      | —       | —           |
| `queryParams` | `java.util.Map<java.lang.String,java.lang.String>` | yes      | —       | —           |

## Returns (Overload 1)

`java.util.Map<java.lang.String,java.lang.Object>`

## Returns (Overload 2)

`java.util.Map<java.lang.String,java.lang.Object>`

## Source

[`src/main/java/com/signalwire/sdk/rest/HttpClient.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/HttpClient.java)

Line 86.
