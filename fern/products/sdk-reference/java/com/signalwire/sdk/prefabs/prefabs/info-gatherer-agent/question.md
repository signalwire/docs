---
slug: "/reference/java/com/signalwire/sdk/prefabs/prefabs/info-gatherer-agent/question"
title: "question"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.prefabs.InfoGathererAgent.question"
  parent: "com.signalwire.sdk.prefabs.InfoGathererAgent"
  module: "com.signalwire.sdk.prefabs.InfoGathererAgent"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/prefabs/InfoGathererAgent.java"
  visibility: "public"
---
# `question`

Convenience builder for questions.

**Modifiers:** `static`

## Signature

**Overload 1**

```java
public static java.util.Map<java.lang.String,java.lang.Object> question(
    java.lang.String keyName,
    java.lang.String questionText
)
```

**Overload 2**

```java
public static java.util.Map<java.lang.String,java.lang.Object> question(
    java.lang.String keyName,
    java.lang.String questionText,
    boolean confirm,
    java.lang.String promptAdd
)
```

## Parameters (Overload 1)

| Name           | Type               | Required | Default | Description |
| -------------- | ------------------ | -------- | ------- | ----------- |
| `keyName`      | `java.lang.String` | yes      | —       | —           |
| `questionText` | `java.lang.String` | yes      | —       | —           |

## Parameters (Overload 2)

| Name           | Type               | Required | Default | Description |
| -------------- | ------------------ | -------- | ------- | ----------- |
| `keyName`      | `java.lang.String` | yes      | —       | —           |
| `questionText` | `java.lang.String` | yes      | —       | —           |
| `confirm`      | `boolean`          | yes      | —       | —           |
| `promptAdd`    | `java.lang.String` | yes      | —       | —           |

## Returns (Overload 1)

`java.util.Map<java.lang.String,java.lang.Object>`

## Returns (Overload 2)

`java.util.Map<java.lang.String,java.lang.Object>`

## Source

[`src/main/java/com/signalwire/sdk/prefabs/InfoGathererAgent.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/prefabs/InfoGathererAgent.java)

Line 57.
