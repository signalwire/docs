---
slug: "/reference/java/com/signalwire/sdk/datamap/datamap/data-map/description"
title: "description"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.datamap.DataMap.description"
  parent: "com.signalwire.sdk.datamap.DataMap"
  module: "com.signalwire.sdk.datamap.DataMap"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/datamap/DataMap.java"
  visibility: "public"
---
# `description`

Alias for `#purpose(String)`; sets the LLM-facing tool
description.

This string is read by the model to decide WHEN to
call this tool. See `#purpose(String)` for bad-vs-good
examples.

## Signature

```java
public com.signalwire.sdk.datamap.DataMap description(
    java.lang.String description
)
```

## Parameters

| Name          | Type               | Required | Default | Description |
| ------------- | ------------------ | -------- | ------- | ----------- |
| `description` | `java.lang.String` | yes      | —       | —           |

## Returns

`com.signalwire.sdk.datamap.DataMap`

## Source

[`src/main/java/com/signalwire/sdk/datamap/DataMap.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/datamap/DataMap.java)

Line 79.
