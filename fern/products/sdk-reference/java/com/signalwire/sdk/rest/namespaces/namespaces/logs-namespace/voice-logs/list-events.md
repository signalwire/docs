---
slug: "/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/logs-namespace/voice-logs/list-events"
title: "listEvents"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.namespaces.LogsNamespace.VoiceLogs.listEvents"
  parent: "com.signalwire.sdk.rest.namespaces.LogsNamespace.VoiceLogs"
  module: "com.signalwire.sdk.rest.namespaces.LogsNamespace.VoiceLogs"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/LogsNamespace.java"
  visibility: "public"
---
# `listEvents`

## Signature

**Overload 1**

```java
public java.util.Map<java.lang.String,java.lang.Object> listEvents(
    java.lang.String logId
)
```

**Overload 2**

```java
public java.util.Map<java.lang.String,java.lang.Object> listEvents(
    java.lang.String logId,
    java.util.Map<java.lang.String,java.lang.String> queryParams
)
```

## Parameters (Overload 1)

| Name    | Type               | Required | Default | Description |
| ------- | ------------------ | -------- | ------- | ----------- |
| `logId` | `java.lang.String` | yes      | —       | —           |

## Parameters (Overload 2)

| Name          | Type                                               | Required | Default | Description |
| ------------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `logId`       | `java.lang.String`                                 | yes      | —       | —           |
| `queryParams` | `java.util.Map<java.lang.String,java.lang.String>` | yes      | —       | —           |

## Returns (Overload 1)

`java.util.Map<java.lang.String,java.lang.Object>`

## Returns (Overload 2)

`java.util.Map<java.lang.String,java.lang.Object>`

## Source

[`src/main/java/com/signalwire/sdk/rest/namespaces/LogsNamespace.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/LogsNamespace.java)

Line 94.
