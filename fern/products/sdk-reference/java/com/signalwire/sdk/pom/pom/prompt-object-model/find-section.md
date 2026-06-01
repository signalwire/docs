---
slug: "/reference/java/com/signalwire/sdk/pom/pom/prompt-object-model/find-section"
title: "findSection"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.pom.PromptObjectModel.findSection"
  parent: "com.signalwire.sdk.pom.PromptObjectModel"
  module: "com.signalwire.sdk.pom.PromptObjectModel"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/pom/PromptObjectModel.java"
  visibility: "public"
---
# `findSection`

Recursively search for a section with the given title.

Mirrors Python
`find_section(title)`.

## Signature

```java
public java.util.Optional<com.signalwire.sdk.pom.Section> findSection(
    java.lang.String title
)
```

## Parameters

| Name    | Type               | Required | Default | Description |
| ------- | ------------------ | -------- | ------- | ----------- |
| `title` | `java.lang.String` | yes      | —       | —           |

## Returns

`java.util.Optional<com.signalwire.sdk.pom.Section>`

## Source

[`src/main/java/com/signalwire/sdk/pom/PromptObjectModel.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/pom/PromptObjectModel.java)

Line 175.
