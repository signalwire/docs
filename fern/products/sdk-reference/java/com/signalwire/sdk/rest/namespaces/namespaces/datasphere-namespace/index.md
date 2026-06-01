---
slug: "/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/datasphere-namespace"
title: "DatasphereNamespace"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.namespaces.DatasphereNamespace"
  parent: "com.signalwire.sdk.rest.namespaces"
  module: "com.signalwire.sdk.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/DatasphereNamespace.java"
  visibility: "public"
---
# `DatasphereNamespace`

REST namespace for DataSphere (knowledge base) resources.

<p>Mirrors `signalwire.rest.namespaces.datasphere.DatasphereNamespace`:
 documents are CRUD-shaped, plus `search` (POST) and chunk-level
 operations.

## Signature

```java
public class DatasphereNamespace
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/datasphere-namespace/init)
- [`documents`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/datasphere-namespace/documents)
- [`search`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/datasphere-namespace/search) — Legacy convenience for knowledge-base search; the canonical entry point is `DatasphereDocuments#search(Map)`.

## Classes

- [`DatasphereDocuments`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/datasphere-namespace/datasphere-documents) — Document management with search and chunk operations.

## Source

[`src/main/java/com/signalwire/sdk/rest/namespaces/DatasphereNamespace.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/DatasphereNamespace.java)

Line 21.
