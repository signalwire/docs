---
slug: "/reference/java/com/signalwire/sdk/rest/rest/http-client/with-base-url"
title: "withBaseUrl"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.HttpClient.withBaseUrl"
  parent: "com.signalwire.sdk.rest.HttpClient"
  module: "com.signalwire.sdk.rest.HttpClient"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/HttpClient.java"
  visibility: "public"
---
# `withBaseUrl`

Create an HTTP client with an explicit base URL (e.g., plain HTTP for
local integration tests, or to point a `RestClient` at an audit
fixture).

Production callers use the project, token)
constructor instead.

**Modifiers:** `static`

## Signature

```java
public static com.signalwire.sdk.rest.HttpClient withBaseUrl(
    java.lang.String baseUrl,
    java.lang.String project,
    java.lang.String token
)
```

## Parameters

| Name      | Type               | Required | Default | Description                               |
| --------- | ------------------ | -------- | ------- | ----------------------------------------- |
| `baseUrl` | `java.lang.String` | yes      | —       | fully qualified base URL ending in `/api` |
| `project` | `java.lang.String` | yes      | —       | project ID used as Basic Auth username    |
| `token`   | `java.lang.String` | yes      | —       | API token used as Basic Auth password     |

## Returns

`com.signalwire.sdk.rest.HttpClient` — a configured HTTP client

## Source

[`src/main/java/com/signalwire/sdk/rest/HttpClient.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/HttpClient.java)

Line 67.
