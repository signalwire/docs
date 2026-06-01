---
slug: "/reference/java/com/signalwire/sdk/contexts/contexts/context/add-step"
title: "addStep"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.contexts.Context.addStep"
  parent: "com.signalwire.sdk.contexts.Context"
  module: "com.signalwire.sdk.contexts.Context"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/contexts/Context.java"
  visibility: "public"
---
# `addStep`

Add a new step to this context.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.contexts.Step addStep(java.lang.String stepName)
```

**Overload 2**

```java
public com.signalwire.sdk.contexts.Step addStep(
    java.lang.String stepName,
    java.lang.String task,
    java.util.List<java.lang.String> bullets,
    java.lang.String criteria,
    java.lang.Object functions,
    java.util.List<java.lang.String> validSteps
)
```

## Parameters (Overload 1)

| Name       | Type               | Required | Default | Description |
| ---------- | ------------------ | -------- | ------- | ----------- |
| `stepName` | `java.lang.String` | yes      | —       | —           |

## Parameters (Overload 2)

| Name         | Type                               | Required | Default | Description |
| ------------ | ---------------------------------- | -------- | ------- | ----------- |
| `stepName`   | `java.lang.String`                 | yes      | —       | —           |
| `task`       | `java.lang.String`                 | yes      | —       | —           |
| `bullets`    | `java.util.List<java.lang.String>` | yes      | —       | —           |
| `criteria`   | `java.lang.String`                 | yes      | —       | —           |
| `functions`  | `java.lang.Object`                 | yes      | —       | —           |
| `validSteps` | `java.util.List<java.lang.String>` | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.contexts.Step`

## Returns (Overload 2)

`com.signalwire.sdk.contexts.Step`

## Source

[`src/main/java/com/signalwire/sdk/contexts/Context.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/contexts/Context.java)

Line 57.
