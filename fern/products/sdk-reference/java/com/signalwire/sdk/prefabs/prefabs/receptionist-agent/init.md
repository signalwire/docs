---
slug: "/reference/java/com/signalwire/sdk/prefabs/prefabs/receptionist-agent/init"
title: "<init>"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.prefabs.ReceptionistAgent.<init>"
  parent: "com.signalwire.sdk.prefabs.ReceptionistAgent"
  module: "com.signalwire.sdk.prefabs.ReceptionistAgent"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/prefabs/ReceptionistAgent.java"
  visibility: "public"
---
# `<init>`

## Signature

**Overload 1**

```java
public void <init>(
    java.lang.String name,
    java.lang.String greeting,
    java.util.Map<java.lang.String,java.util.Map<java.lang.String,java.lang.Object>> departments
)
```

**Overload 2**

```java
public void <init>(
    java.lang.String name,
    java.lang.String greeting,
    java.util.Map<java.lang.String,java.util.Map<java.lang.String,java.lang.Object>> departments,
    java.lang.String route,
    int port
)
```

## Parameters (Overload 1)

| Name          | Type                                                                               | Required | Default | Description |
| ------------- | ---------------------------------------------------------------------------------- | -------- | ------- | ----------- |
| `name`        | `java.lang.String`                                                                 | yes      | —       | —           |
| `greeting`    | `java.lang.String`                                                                 | yes      | —       | —           |
| `departments` | `java.util.Map<java.lang.String,java.util.Map<java.lang.String,java.lang.Object>>` | yes      | —       | —           |

## Parameters (Overload 2)

| Name          | Type                                                                               | Required | Default | Description |
| ------------- | ---------------------------------------------------------------------------------- | -------- | ------- | ----------- |
| `name`        | `java.lang.String`                                                                 | yes      | —       | —           |
| `greeting`    | `java.lang.String`                                                                 | yes      | —       | —           |
| `departments` | `java.util.Map<java.lang.String,java.util.Map<java.lang.String,java.lang.Object>>` | yes      | —       | —           |
| `route`       | `java.lang.String`                                                                 | yes      | —       | —           |
| `port`        | `int`                                                                              | yes      | —       | —           |

## Source

[`src/main/java/com/signalwire/sdk/prefabs/ReceptionistAgent.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/prefabs/ReceptionistAgent.java)

Line 15.
