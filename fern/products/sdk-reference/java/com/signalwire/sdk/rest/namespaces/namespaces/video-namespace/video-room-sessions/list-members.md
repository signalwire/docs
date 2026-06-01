---
slug: "/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/video-namespace/video-room-sessions/list-members"
title: "listMembers"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.namespaces.VideoNamespace.VideoRoomSessions.listMembers"
  parent: "com.signalwire.sdk.rest.namespaces.VideoNamespace.VideoRoomSessions"
  module: "com.signalwire.sdk.rest.namespaces.VideoNamespace.VideoRoomSessions"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/VideoNamespace.java"
  visibility: "public"
---
# `listMembers`

## Signature

**Overload 1**

```java
public java.util.Map<java.lang.String,java.lang.Object> listMembers(
    java.lang.String sessionId
)
```

**Overload 2**

```java
public java.util.Map<java.lang.String,java.lang.Object> listMembers(
    java.lang.String sessionId,
    java.util.Map<java.lang.String,java.lang.String> queryParams
)
```

## Parameters (Overload 1)

| Name        | Type               | Required | Default | Description |
| ----------- | ------------------ | -------- | ------- | ----------- |
| `sessionId` | `java.lang.String` | yes      | —       | —           |

## Parameters (Overload 2)

| Name          | Type                                               | Required | Default | Description |
| ------------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `sessionId`   | `java.lang.String`                                 | yes      | —       | —           |
| `queryParams` | `java.util.Map<java.lang.String,java.lang.String>` | yes      | —       | —           |

## Returns (Overload 1)

`java.util.Map<java.lang.String,java.lang.Object>`

## Returns (Overload 2)

`java.util.Map<java.lang.String,java.lang.Object>`

## Source

[`src/main/java/com/signalwire/sdk/rest/namespaces/VideoNamespace.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/VideoNamespace.java)

Line 125.
