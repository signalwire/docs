---
slug: "/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/queue-namespace/list-members"
title: "listMembers"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.namespaces.QueueNamespace.listMembers"
  parent: "com.signalwire.sdk.rest.namespaces.QueueNamespace"
  module: "com.signalwire.sdk.rest.namespaces.QueueNamespace"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/QueueNamespace.java"
  visibility: "public"
---
# `listMembers`

## Signature

**Overload 1**

```java
public java.util.Map<java.lang.String,java.lang.Object> listMembers(
    java.lang.String queueId
)
```

**Overload 2**

```java
public java.util.Map<java.lang.String,java.lang.Object> listMembers(
    java.lang.String queueId,
    java.util.Map<java.lang.String,java.lang.String> queryParams
)
```

## Parameters (Overload 1)

| Name      | Type               | Required | Default | Description |
| --------- | ------------------ | -------- | ------- | ----------- |
| `queueId` | `java.lang.String` | yes      | —       | —           |

## Parameters (Overload 2)

| Name          | Type                                               | Required | Default | Description |
| ------------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `queueId`     | `java.lang.String`                                 | yes      | —       | —           |
| `queryParams` | `java.util.Map<java.lang.String,java.lang.String>` | yes      | —       | —           |

## Returns (Overload 1)

`java.util.Map<java.lang.String,java.lang.Object>`

## Returns (Overload 2)

`java.util.Map<java.lang.String,java.lang.Object>`

## Source

[`src/main/java/com/signalwire/sdk/rest/namespaces/QueueNamespace.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/QueueNamespace.java)

Line 59.
