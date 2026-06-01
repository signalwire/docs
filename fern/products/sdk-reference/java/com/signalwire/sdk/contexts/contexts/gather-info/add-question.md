---
slug: "/reference/java/com/signalwire/sdk/contexts/contexts/gather-info/add-question"
title: "addQuestion"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.contexts.GatherInfo.addQuestion"
  parent: "com.signalwire.sdk.contexts.GatherInfo"
  module: "com.signalwire.sdk.contexts.GatherInfo"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/contexts/GatherInfo.java"
  visibility: "public"
---
# `addQuestion`

Add a question to gather.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.contexts.GatherInfo addQuestion(
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
public com.signalwire.sdk.contexts.GatherInfo addQuestion(
    java.lang.String key,
    java.lang.String question
)
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

## Returns (Overload 1)

`com.signalwire.sdk.contexts.GatherInfo`

## Returns (Overload 2)

`com.signalwire.sdk.contexts.GatherInfo`

## Source

[`src/main/java/com/signalwire/sdk/contexts/GatherInfo.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/contexts/GatherInfo.java)

Line 38.
