---
slug: "/reference/java/com/signalwire/sdk/agent/agent/agent-base/add-language"
title: "addLanguage"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.agent.AgentBase.addLanguage"
  parent: "com.signalwire.sdk.agent.AgentBase"
  module: "com.signalwire.sdk.agent.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java"
  visibility: "public"
---
# `addLanguage`

Add a language configuration with an optional per-language `params`
dict (engine-specific tuning, voice settings, etc.).

The `params`
key is only emitted into SWML when non-empty so existing language
entries stay byte-identical when no params are passed.
Mirrors Python's add\_language(params=...) addition.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.agent.AgentBase addLanguage(
    java.lang.String name,
    java.lang.String code,
    java.lang.String voice
)
```

**Overload 2**

```java
public com.signalwire.sdk.agent.AgentBase addLanguage(
    java.lang.String name,
    java.lang.String code,
    java.lang.String voice,
    java.lang.String speechModel,
    java.lang.String fillerWord,
    java.lang.String engine
)
```

**Overload 3**

```java
public com.signalwire.sdk.agent.AgentBase addLanguage(
    java.lang.String name,
    java.lang.String code,
    java.lang.String voice,
    java.lang.String speechModel,
    java.lang.String fillerWord,
    java.lang.String engine,
    java.util.Map<java.lang.String,java.lang.Object> params
)
```

## Parameters (Overload 1)

| Name    | Type               | Required | Default | Description |
| ------- | ------------------ | -------- | ------- | ----------- |
| `name`  | `java.lang.String` | yes      | —       | —           |
| `code`  | `java.lang.String` | yes      | —       | —           |
| `voice` | `java.lang.String` | yes      | —       | —           |

## Parameters (Overload 2)

| Name          | Type               | Required | Default | Description |
| ------------- | ------------------ | -------- | ------- | ----------- |
| `name`        | `java.lang.String` | yes      | —       | —           |
| `code`        | `java.lang.String` | yes      | —       | —           |
| `voice`       | `java.lang.String` | yes      | —       | —           |
| `speechModel` | `java.lang.String` | yes      | —       | —           |
| `fillerWord`  | `java.lang.String` | yes      | —       | —           |
| `engine`      | `java.lang.String` | yes      | —       | —           |

## Parameters (Overload 3)

| Name          | Type                                               | Required | Default | Description |
| ------------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `name`        | `java.lang.String`                                 | yes      | —       | —           |
| `code`        | `java.lang.String`                                 | yes      | —       | —           |
| `voice`       | `java.lang.String`                                 | yes      | —       | —           |
| `speechModel` | `java.lang.String`                                 | yes      | —       | —           |
| `fillerWord`  | `java.lang.String`                                 | yes      | —       | —           |
| `engine`      | `java.lang.String`                                 | yes      | —       | —           |
| `params`      | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.agent.AgentBase`

## Returns (Overload 2)

`com.signalwire.sdk.agent.AgentBase`

## Returns (Overload 3)

`com.signalwire.sdk.agent.AgentBase`

## Source

[`src/main/java/com/signalwire/sdk/agent/AgentBase.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java)

Line 677.
