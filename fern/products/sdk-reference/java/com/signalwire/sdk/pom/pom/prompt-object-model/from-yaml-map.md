---
slug: "/reference/java/com/signalwire/sdk/pom/pom/prompt-object-model/from-yaml-map"
title: "fromYamlMap"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.pom.PromptObjectModel.fromYamlMap"
  parent: "com.signalwire.sdk.pom.PromptObjectModel"
  module: "com.signalwire.sdk.pom.PromptObjectModel"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/pom/PromptObjectModel.java"
  visibility: "public"
---
# `fromYamlMap`

Build a model from an already-parsed list-of-maps (YAML form).

Mirrors Python's dict-input branch of `from_yaml`.

**Modifiers:** `static`

## Signature

```java
public static com.signalwire.sdk.pom.PromptObjectModel fromYamlMap(
    java.util.List<java.util.Map<java.lang.String,java.lang.Object>> data
)
```

## Parameters

| Name   | Type                                                               | Required | Default | Description |
| ------ | ------------------------------------------------------------------ | -------- | ------- | ----------- |
| `data` | `java.util.List<java.util.Map<java.lang.String,java.lang.Object>>` | yes      | —       | —           |

## Returns

`com.signalwire.sdk.pom.PromptObjectModel`

## Source

[`src/main/java/com/signalwire/sdk/pom/PromptObjectModel.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/pom/PromptObjectModel.java)

Line 129.
