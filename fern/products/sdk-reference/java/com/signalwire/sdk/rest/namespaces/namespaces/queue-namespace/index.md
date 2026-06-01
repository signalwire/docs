---
slug: "/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/queue-namespace"
title: "QueueNamespace"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.namespaces.QueueNamespace"
  parent: "com.signalwire.sdk.rest.namespaces"
  module: "com.signalwire.sdk.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/QueueNamespace.java"
  visibility: "public"
---
# `QueueNamespace`

Queues namespace \u2014 full CRUD with member operations.

<p>Mirrors `signalwire.rest.namespaces.queues.QueuesResource`: queue
 CRUD uses PUT for update; members are addressable both per-id and via the
 special `/next` endpoint.

## Signature

```java
public class QueueNamespace
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/queue-namespace/init)
- [`create`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/queue-namespace/create)
- [`delete`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/queue-namespace/delete)
- [`get`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/queue-namespace/get)
- [`getBasePath`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/queue-namespace/get-base-path)
- [`getMember`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/queue-namespace/get-member)
- [`getNextMember`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/queue-namespace/get-next-member)
- [`list`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/queue-namespace/list)
- [`listMembers`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/queue-namespace/list-members)
- [`queues`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/queue-namespace/queues) — Returns the legacy `com.signalwire.sdk.rest.CrudResource`-shaped accessor so older callers like `client.queues().queues()` keep compiling.
- [`update`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/queue-namespace/update)

## Source

[`src/main/java/com/signalwire/sdk/rest/namespaces/QueueNamespace.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/QueueNamespace.java)

Line 20.
