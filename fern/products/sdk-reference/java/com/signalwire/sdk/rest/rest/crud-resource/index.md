---
slug: "/reference/java/com/signalwire/sdk/rest/rest/crud-resource"
title: "CrudResource"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.CrudResource"
  parent: "com.signalwire.sdk.rest"
  module: "com.signalwire.sdk.rest"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/CrudResource.java"
  visibility: "public"
---
# `CrudResource`

Generic CRUD resource for REST API namespaces.

<p>
 Provides standard list, get, create, update, and delete operations
 against a base path. Used by namespace classes to avoid repetitive
 HTTP boilerplate.

 <pre>numbers = new CrudResource(httpClient, "/phone_numbers");
 var all = numbers.list();
 var one = numbers.get("pn-abc-123");</pre>

## Signature

```java
public class CrudResource
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/rest/rest/crud-resource/init) — Create a CRUD resource.
- [`create`](/reference/java/com/signalwire/sdk/rest/rest/crud-resource/create) — Create a new resource.
- [`delete`](/reference/java/com/signalwire/sdk/rest/rest/crud-resource/delete) — Delete a resource by ID.
- [`get`](/reference/java/com/signalwire/sdk/rest/rest/crud-resource/get) — Get a single resource by ID.
- [`getBasePath`](/reference/java/com/signalwire/sdk/rest/rest/crud-resource/get-base-path) — Get the base path for this resource.
- [`getHttpClient`](/reference/java/com/signalwire/sdk/rest/rest/crud-resource/get-http-client) — Get the underlying HTTP client.
- [`list`](/reference/java/com/signalwire/sdk/rest/rest/crud-resource/list) — List all resources.
- [`update`](/reference/java/com/signalwire/sdk/rest/rest/crud-resource/update) — Update an existing resource by ID.

## Source

[`src/main/java/com/signalwire/sdk/rest/CrudResource.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/CrudResource.java)

Line 24.
