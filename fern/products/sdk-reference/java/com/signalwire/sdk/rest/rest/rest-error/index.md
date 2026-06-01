---
slug: "/reference/java/com/signalwire/sdk/rest/rest/rest-error"
title: "RestError"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.RestError"
  parent: "com.signalwire.sdk.rest"
  module: "com.signalwire.sdk.rest"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/RestError.java"
  visibility: "public"
---
# `RestError`

Exception for SignalWire REST API errors.

<p>
 Contains the HTTP status code and error message from the server.

## Signature

```java
public class RestError extends java.lang.RuntimeException
```

## Inheritance

**Extends:** `java.lang.RuntimeException`

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/rest/rest/rest-error/init)
- [`getMethod`](/reference/java/com/signalwire/sdk/rest/rest/rest-error/get-method)
- [`getPath`](/reference/java/com/signalwire/sdk/rest/rest/rest-error/get-path)
- [`getResponseBody`](/reference/java/com/signalwire/sdk/rest/rest/rest-error/get-response-body)
- [`getStatusCode`](/reference/java/com/signalwire/sdk/rest/rest/rest-error/get-status-code)
- [`isClientError`](/reference/java/com/signalwire/sdk/rest/rest/rest-error/is-client-error) — Whether the error is a client error (4xx).
- [`isNotFound`](/reference/java/com/signalwire/sdk/rest/rest/rest-error/is-not-found) — Whether the resource was not found (404).
- [`isServerError`](/reference/java/com/signalwire/sdk/rest/rest/rest-error/is-server-error) — Whether the error is a server error (5xx).
- [`isUnauthorized`](/reference/java/com/signalwire/sdk/rest/rest/rest-error/is-unauthorized) — Whether access was denied (401 or 403).

## Source

[`src/main/java/com/signalwire/sdk/rest/RestError.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/RestError.java)

Line 14.
