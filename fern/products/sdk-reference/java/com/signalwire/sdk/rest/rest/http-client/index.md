---
slug: "/reference/java/com/signalwire/sdk/rest/rest/http-client"
title: "HttpClient"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.HttpClient"
  parent: "com.signalwire.sdk.rest"
  module: "com.signalwire.sdk.rest"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/HttpClient.java"
  visibility: "public"
---
# `HttpClient`

HTTP client for the SignalWire REST API.

<p>
 Uses `java.net.http.HttpClient` (JDK 11+ built-in) with Basic Auth
 and JSON content types. Provides low-level GET, POST, PUT, DELETE methods
 used by `CrudResource` and namespace classes.

## Signature

```java
public class HttpClient
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/rest/rest/http-client/init) — Create an HTTP client.
- [`delete`](/reference/java/com/signalwire/sdk/rest/rest/http-client/delete) — DELETE request.
- [`get`](/reference/java/com/signalwire/sdk/rest/rest/http-client/get) — GET request, returns parsed JSON as a Map.
- [`getBaseUrl`](/reference/java/com/signalwire/sdk/rest/rest/http-client/get-base-url) — Get the base URL.
- [`patch`](/reference/java/com/signalwire/sdk/rest/rest/http-client/patch) — PATCH request with JSON body.
- [`post`](/reference/java/com/signalwire/sdk/rest/rest/http-client/post) — POST request with JSON body.
- [`put`](/reference/java/com/signalwire/sdk/rest/rest/http-client/put) — PUT request with JSON body.
- [`withBaseUrl`](/reference/java/com/signalwire/sdk/rest/rest/http-client/with-base-url) — Create an HTTP client with an explicit base URL (e.g., plain HTTP for local integration tests, or to point a `RestClient` at an audit fixture).

## Source

[`src/main/java/com/signalwire/sdk/rest/HttpClient.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/HttpClient.java)

Line 29.
