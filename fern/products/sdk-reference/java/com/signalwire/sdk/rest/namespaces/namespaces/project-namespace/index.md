---
slug: "/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/project-namespace"
title: "ProjectNamespace"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.namespaces.ProjectNamespace"
  parent: "com.signalwire.sdk.rest.namespaces"
  module: "com.signalwire.sdk.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/ProjectNamespace.java"
  visibility: "public"
---
# `ProjectNamespace`

REST namespace for project management resources.

<p>Mirrors `signalwire.rest.namespaces.project.ProjectNamespace`:
 exposes `ProjectTokens` for API token CRUD (PATCH for update,
 DELETE for revoke).

## Signature

```java
public class ProjectNamespace
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/project-namespace/init)
- [`createToken`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/project-namespace/create-token) — Create a project token (legacy single-method form).
- [`get`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/project-namespace/get) — Get project info.
- [`listTokens`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/project-namespace/list-tokens) — List project tokens (legacy single-method form).
- [`tokens`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/project-namespace/tokens)
- [`update`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/project-namespace/update) — Update project settings.

## Classes

- [`ProjectTokens`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/project-namespace/project-tokens) — Project API token management.

## Source

[`src/main/java/com/signalwire/sdk/rest/namespaces/ProjectNamespace.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/ProjectNamespace.java)

Line 20.
