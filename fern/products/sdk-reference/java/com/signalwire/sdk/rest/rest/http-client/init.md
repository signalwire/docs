---
slug: "/reference/java/com/signalwire/sdk/rest/rest/http-client/init"
title: "<init>"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.HttpClient.<init>"
  parent: "com.signalwire.sdk.rest.HttpClient"
  module: "com.signalwire.sdk.rest.HttpClient"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/HttpClient.java"
  visibility: "public"
---
# `<init>`

Create an HTTP client.

## Signature

```java
public void <init>(
    java.lang.String space,
    java.lang.String project,
    java.lang.String token
)
```

## Parameters

| Name      | Type               | Required | Default | Description                                       |
| --------- | ------------------ | -------- | ------- | ------------------------------------------------- |
| `space`   | `java.lang.String` | yes      | —       | SignalWire space (e.g., "example.signalwire.com") |
| `project` | `java.lang.String` | yes      | —       | project ID used as Basic Auth username            |
| `token`   | `java.lang.String` | yes      | —       | API token used as Basic Auth password             |

## Source

[`src/main/java/com/signalwire/sdk/rest/HttpClient.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/HttpClient.java)

Line 46.
