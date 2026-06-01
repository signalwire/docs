---
slug: "/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/video-namespace/video-room-recordings/list-events"
title: "listEvents"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.namespaces.VideoNamespace.VideoRoomRecordings.listEvents"
  parent: "com.signalwire.sdk.rest.namespaces.VideoNamespace.VideoRoomRecordings"
  module: "com.signalwire.sdk.rest.namespaces.VideoNamespace.VideoRoomRecordings"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/VideoNamespace.java"
  visibility: "public"
---
# `listEvents`

## Signature

**Overload 1**

```java
public java.util.Map<java.lang.String,java.lang.Object> listEvents(
    java.lang.String recordingId
)
```

**Overload 2**

```java
public java.util.Map<java.lang.String,java.lang.Object> listEvents(
    java.lang.String recordingId,
    java.util.Map<java.lang.String,java.lang.String> queryParams
)
```

## Parameters (Overload 1)

| Name          | Type               | Required | Default | Description |
| ------------- | ------------------ | -------- | ------- | ----------- |
| `recordingId` | `java.lang.String` | yes      | —       | —           |

## Parameters (Overload 2)

| Name          | Type                                               | Required | Default | Description |
| ------------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `recordingId` | `java.lang.String`                                 | yes      | —       | —           |
| `queryParams` | `java.util.Map<java.lang.String,java.lang.String>` | yes      | —       | —           |

## Returns (Overload 1)

`java.util.Map<java.lang.String,java.lang.Object>`

## Returns (Overload 2)

`java.util.Map<java.lang.String,java.lang.Object>`

## Source

[`src/main/java/com/signalwire/sdk/rest/namespaces/VideoNamespace.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/VideoNamespace.java)

Line 174.
