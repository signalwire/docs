---
slug: "/reference/java/com/signalwire/sdk/contexts/contexts/gather-question/init"
title: "<init>"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.contexts.GatherQuestion.<init>"
  parent: "com.signalwire.sdk.contexts.GatherQuestion"
  module: "com.signalwire.sdk.contexts.GatherQuestion"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/contexts/GatherQuestion.java"
  visibility: "public"
---
# `<init>`

## Signature

**Overload 1**

```java
public void <init>(
    java.lang.String key,
    java.lang.String question,
    java.lang.String type,
    boolean confirm,
    java.lang.String prompt,
    java.util.List<java.lang.String> functions
)
```

**Overload 2**

```java
public void <init>(java.lang.String key, java.lang.String question)
```

## Parameters (Overload 1)

| Name        | Type                               | Required | Default | Description |
| ----------- | ---------------------------------- | -------- | ------- | ----------- |
| `key`       | `java.lang.String`                 | yes      | —       | —           |
| `question`  | `java.lang.String`                 | yes      | —       | —           |
| `type`      | `java.lang.String`                 | yes      | —       | —           |
| `confirm`   | `boolean`                          | yes      | —       | —           |
| `prompt`    | `java.lang.String`                 | yes      | —       | —           |
| `functions` | `java.util.List<java.lang.String>` | yes      | —       | —           |

## Parameters (Overload 2)

| Name       | Type               | Required | Default | Description |
| ---------- | ------------------ | -------- | ------- | ----------- |
| `key`      | `java.lang.String` | yes      | —       | —           |
| `question` | `java.lang.String` | yes      | —       | —           |

## Source

[`src/main/java/com/signalwire/sdk/contexts/GatherQuestion.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/contexts/GatherQuestion.java)

Line 23.
