---
slug: "/reference/java/com/signalwire/sdk/pom/pom/prompt-object-model/init"
title: "<init>"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.pom.PromptObjectModel.<init>"
  parent: "com.signalwire.sdk.pom.PromptObjectModel"
  module: "com.signalwire.sdk.pom.PromptObjectModel"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/pom/PromptObjectModel.java"
  visibility: "public"
---
# `<init>`

Empty model (Python parity: `PromptObjectModel()` with debug=False).

## Signature

**Overload 1**

```java
public void <init>()
```

**Overload 2**

```java
public void <init>(boolean debug)
```

**Overload 3**

```java
public void <init>(
    java.util.List<java.util.Map<java.lang.String,java.lang.Object>> data
)
```

## Parameters (Overload 2)

| Name    | Type      | Required | Default | Description |
| ------- | --------- | -------- | ------- | ----------- |
| `debug` | `boolean` | yes      | —       | —           |

## Parameters (Overload 3)

| Name   | Type                                                               | Required | Default | Description                                                |
| ------ | ------------------------------------------------------------------ | -------- | ------- | ---------------------------------------------------------- |
| `data` | `java.util.List<java.util.Map<java.lang.String,java.lang.Object>>` | yes      | —       | list of section maps (each entry is one top-level section) |

## Source

[`src/main/java/com/signalwire/sdk/pom/PromptObjectModel.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/pom/PromptObjectModel.java)

Line 47.
