---
slug: "/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/video-namespace/video-rooms/list-streams"
title: "listStreams"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.namespaces.VideoNamespace.VideoRooms.listStreams"
  parent: "com.signalwire.sdk.rest.namespaces.VideoNamespace.VideoRooms"
  module: "com.signalwire.sdk.rest.namespaces.VideoNamespace.VideoRooms"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/VideoNamespace.java"
  visibility: "public"
---
# `listStreams`

## Signature

**Overload 1**

```java
public java.util.Map<java.lang.String,java.lang.Object> listStreams(
    java.lang.String roomId
)
```

**Overload 2**

```java
public java.util.Map<java.lang.String,java.lang.Object> listStreams(
    java.lang.String roomId,
    java.util.Map<java.lang.String,java.lang.String> queryParams
)
```

## Parameters (Overload 1)

| Name     | Type               | Required | Default | Description |
| -------- | ------------------ | -------- | ------- | ----------- |
| `roomId` | `java.lang.String` | yes      | —       | —           |

## Parameters (Overload 2)

| Name          | Type                                               | Required | Default | Description |
| ------------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `roomId`      | `java.lang.String`                                 | yes      | —       | —           |
| `queryParams` | `java.util.Map<java.lang.String,java.lang.String>` | yes      | —       | —           |

## Returns (Overload 1)

`java.util.Map<java.lang.String,java.lang.Object>`

## Returns (Overload 2)

`java.util.Map<java.lang.String,java.lang.Object>`

## Source

[`src/main/java/com/signalwire/sdk/rest/namespaces/VideoNamespace.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/VideoNamespace.java)

Line 76.
