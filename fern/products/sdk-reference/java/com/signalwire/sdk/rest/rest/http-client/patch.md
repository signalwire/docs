---
slug: "/reference/java/com/signalwire/sdk/rest/rest/http-client/patch"
title: "patch"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.HttpClient.patch"
  parent: "com.signalwire.sdk.rest.HttpClient"
  module: "com.signalwire.sdk.rest.HttpClient"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/HttpClient.java"
  visibility: "public"
---
# `patch`

PATCH request with JSON body.

java.net.http.HttpRequest doesn't have a
dedicated builder for PATCH, so use ...).

## Signature

```java
public java.util.Map<java.lang.String,java.lang.Object> patch(
    java.lang.String path,
    java.util.Map<java.lang.String,java.lang.Object> body
)
```

## Parameters

| Name   | Type                                               | Required | Default | Description |
| ------ | -------------------------------------------------- | -------- | ------- | ----------- |
| `path` | `java.lang.String`                                 | yes      | —       | —           |
| `body` | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | —           |

## Returns

`java.util.Map<java.lang.String,java.lang.Object>`

## Source

[`src/main/java/com/signalwire/sdk/rest/HttpClient.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/HttpClient.java)

Line 131.
