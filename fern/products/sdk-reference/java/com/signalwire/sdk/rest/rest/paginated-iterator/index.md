---
slug: "/reference/java/com/signalwire/sdk/rest/rest/paginated-iterator"
title: "PaginatedIterator"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.PaginatedIterator"
  parent: "com.signalwire.sdk.rest"
  module: "com.signalwire.sdk.rest"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/PaginatedIterator.java"
  visibility: "public"
---
# `PaginatedIterator`

Iterator that walks paged REST responses by following the
`links.next` cursor.

<p>Mirrors `signalwire.rest._pagination.PaginatedIterator`: the
 constructor records the `http` client, path, query params, and the
 data-list key without performing an HTTP fetch. Each call to
 `#next()` returns the next item from the buffered page; when the
 buffer is exhausted the iterator follows `links.next`, parses the
 URL query into the next request's params, and fetches the next page.

 <p>Iteration terminates when the buffer is empty and a fetched response
 either lacks a `links.next` cursor or returns an empty data list.

**Modifiers:** `final`

## Signature

```java
public final class PaginatedIterator implements java.util.Iterator<java.util.Map<java.lang.String,java.lang.Object>>, java.lang.Iterable<java.util.Map<java.lang.String,java.lang.Object>>
```

## Inheritance

**Implements:** `java.util.Iterator<java.util.Map<java.lang.String,java.lang.Object>>`, `java.lang.Iterable<java.util.Map<java.lang.String,java.lang.Object>>`

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/rest/rest/paginated-iterator/init)
- [`hasNext`](/reference/java/com/signalwire/sdk/rest/rest/paginated-iterator/has-next)
- [`iterator`](/reference/java/com/signalwire/sdk/rest/rest/paginated-iterator/iterator)
- [`next`](/reference/java/com/signalwire/sdk/rest/rest/paginated-iterator/next)

## Source

[`src/main/java/com/signalwire/sdk/rest/PaginatedIterator.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/PaginatedIterator.java)

Line 34.
