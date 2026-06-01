---
slug: "/reference/java/com/signalwire/sdk/prefabs/prefabs/survey-agent/init"
title: "<init>"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.prefabs.SurveyAgent.<init>"
  parent: "com.signalwire.sdk.prefabs.SurveyAgent"
  module: "com.signalwire.sdk.prefabs.SurveyAgent"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/prefabs/SurveyAgent.java"
  visibility: "public"
---
# `<init>`

## Signature

**Overload 1**

```java
public void <init>(
    java.lang.String name,
    java.util.List<java.util.Map<java.lang.String,java.lang.Object>> questions
)
```

**Overload 2**

```java
public void <init>(
    java.lang.String name,
    java.util.List<java.util.Map<java.lang.String,java.lang.Object>> questions,
    java.lang.String completionMessage,
    java.lang.String route,
    int port
)
```

## Parameters (Overload 1)

| Name        | Type                                                               | Required | Default | Description |
| ----------- | ------------------------------------------------------------------ | -------- | ------- | ----------- |
| `name`      | `java.lang.String`                                                 | yes      | —       | —           |
| `questions` | `java.util.List<java.util.Map<java.lang.String,java.lang.Object>>` | yes      | —       | —           |

## Parameters (Overload 2)

| Name                | Type                                                               | Required | Default | Description |
| ------------------- | ------------------------------------------------------------------ | -------- | ------- | ----------- |
| `name`              | `java.lang.String`                                                 | yes      | —       | —           |
| `questions`         | `java.util.List<java.util.Map<java.lang.String,java.lang.Object>>` | yes      | —       | —           |
| `completionMessage` | `java.lang.String`                                                 | yes      | —       | —           |
| `route`             | `java.lang.String`                                                 | yes      | —       | —           |
| `port`              | `int`                                                              | yes      | —       | —           |

## Source

[`src/main/java/com/signalwire/sdk/prefabs/SurveyAgent.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/prefabs/SurveyAgent.java)

Line 19.
