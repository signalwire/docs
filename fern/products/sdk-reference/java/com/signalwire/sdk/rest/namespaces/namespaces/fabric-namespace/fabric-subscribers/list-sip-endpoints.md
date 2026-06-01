---
slug: "/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/fabric-namespace/fabric-subscribers/list-sip-endpoints"
title: "listSipEndpoints"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.namespaces.FabricNamespace.FabricSubscribers.listSipEndpoints"
  parent: "com.signalwire.sdk.rest.namespaces.FabricNamespace.FabricSubscribers"
  module: "com.signalwire.sdk.rest.namespaces.FabricNamespace.FabricSubscribers"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/FabricNamespace.java"
  visibility: "public"
---
# `listSipEndpoints`

## Signature

**Overload 1**

```java
public java.util.Map<java.lang.String,java.lang.Object> listSipEndpoints(
    java.lang.String subscriberId
)
```

**Overload 2**

```java
public java.util.Map<java.lang.String,java.lang.Object> listSipEndpoints(
    java.lang.String subscriberId,
    java.util.Map<java.lang.String,java.lang.String> queryParams
)
```

## Parameters (Overload 1)

| Name           | Type               | Required | Default | Description |
| -------------- | ------------------ | -------- | ------- | ----------- |
| `subscriberId` | `java.lang.String` | yes      | —       | —           |

## Parameters (Overload 2)

| Name           | Type                                               | Required | Default | Description |
| -------------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `subscriberId` | `java.lang.String`                                 | yes      | —       | —           |
| `queryParams`  | `java.util.Map<java.lang.String,java.lang.String>` | yes      | —       | —           |

## Returns (Overload 1)

`java.util.Map<java.lang.String,java.lang.Object>`

## Returns (Overload 2)

`java.util.Map<java.lang.String,java.lang.Object>`

## Source

[`src/main/java/com/signalwire/sdk/rest/namespaces/FabricNamespace.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/FabricNamespace.java)

Line 130.
