---
slug: "/reference/java/com/signalwire/sdk/datamap/datamap/data-map/webhook"
title: "webhook"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.datamap.DataMap.webhook"
  parent: "com.signalwire.sdk.datamap.DataMap"
  module: "com.signalwire.sdk.datamap.DataMap"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/datamap/DataMap.java"
  visibility: "public"
---
# `webhook`

Add a webhook API call.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.datamap.DataMap webhook(
    java.lang.String method,
    java.lang.String url,
    java.util.Map<java.lang.String,java.lang.String> headers
)
```

**Overload 2**

```java
public com.signalwire.sdk.datamap.DataMap webhook(
    java.lang.String method,
    java.lang.String url
)
```

## Parameters (Overload 1)

| Name      | Type                                               | Required | Default | Description |
| --------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `method`  | `java.lang.String`                                 | yes      | —       | —           |
| `url`     | `java.lang.String`                                 | yes      | —       | —           |
| `headers` | `java.util.Map<java.lang.String,java.lang.String>` | yes      | —       | —           |

## Parameters (Overload 2)

| Name     | Type               | Required | Default | Description |
| -------- | ------------------ | -------- | ------- | ----------- |
| `method` | `java.lang.String` | yes      | —       | —           |
| `url`    | `java.lang.String` | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.datamap.DataMap`

## Returns (Overload 2)

`com.signalwire.sdk.datamap.DataMap`

## Source

[`src/main/java/com/signalwire/sdk/datamap/DataMap.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/datamap/DataMap.java)

Line 148.
