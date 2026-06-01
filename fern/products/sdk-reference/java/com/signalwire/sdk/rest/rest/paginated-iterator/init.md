---
slug: "/reference/java/com/signalwire/sdk/rest/rest/paginated-iterator/init"
title: "<init>"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.PaginatedIterator.<init>"
  parent: "com.signalwire.sdk.rest.PaginatedIterator"
  module: "com.signalwire.sdk.rest.PaginatedIterator"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/PaginatedIterator.java"
  visibility: "public"
---
# `<init>`

## Signature

**Overload 1**

```java
public void <init>(
    com.signalwire.sdk.rest.HttpClient http,
    java.lang.String path
)
```

**Overload 2**

```java
public void <init>(
    com.signalwire.sdk.rest.HttpClient http,
    java.lang.String path,
    java.util.Map<java.lang.String,java.lang.String> params
)
```

**Overload 3**

```java
public void <init>(
    com.signalwire.sdk.rest.HttpClient http,
    java.lang.String path,
    java.util.Map<java.lang.String,java.lang.String> params,
    java.lang.String dataKey
)
```

## Parameters (Overload 1)

| Name   | Type                                 | Required | Default | Description |
| ------ | ------------------------------------ | -------- | ------- | ----------- |
| `http` | `com.signalwire.sdk.rest.HttpClient` | yes      | —       | —           |
| `path` | `java.lang.String`                   | yes      | —       | —           |

## Parameters (Overload 2)

| Name     | Type                                               | Required | Default | Description |
| -------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `http`   | `com.signalwire.sdk.rest.HttpClient`               | yes      | —       | —           |
| `path`   | `java.lang.String`                                 | yes      | —       | —           |
| `params` | `java.util.Map<java.lang.String,java.lang.String>` | yes      | —       | —           |

## Parameters (Overload 3)

| Name      | Type                                               | Required | Default | Description |
| --------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `http`    | `com.signalwire.sdk.rest.HttpClient`               | yes      | —       | —           |
| `path`    | `java.lang.String`                                 | yes      | —       | —           |
| `params`  | `java.util.Map<java.lang.String,java.lang.String>` | yes      | —       | —           |
| `dataKey` | `java.lang.String`                                 | yes      | —       | —           |

## Source

[`src/main/java/com/signalwire/sdk/rest/PaginatedIterator.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/PaginatedIterator.java)

Line 46.
