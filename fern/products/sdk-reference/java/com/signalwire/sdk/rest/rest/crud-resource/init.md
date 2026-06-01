---
slug: "/reference/java/com/signalwire/sdk/rest/rest/crud-resource/init"
title: "<init>"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.CrudResource.<init>"
  parent: "com.signalwire.sdk.rest.CrudResource"
  module: "com.signalwire.sdk.rest.CrudResource"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/CrudResource.java"
  visibility: "public"
---
# `<init>`

Create a CRUD resource.

## Signature

```java
public void <init>(
    com.signalwire.sdk.rest.HttpClient httpClient,
    java.lang.String basePath
)
```

## Parameters

| Name         | Type                                 | Required | Default | Description                                           |
| ------------ | ------------------------------------ | -------- | ------- | ----------------------------------------------------- |
| `httpClient` | `com.signalwire.sdk.rest.HttpClient` | yes      | —       | the HTTP client                                       |
| `basePath`   | `java.lang.String`                   | yes      | —       | base path for this resource (e.g., "/phone\_numbers") |

## Source

[`src/main/java/com/signalwire/sdk/rest/CrudResource.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/CrudResource.java)

Line 35.
