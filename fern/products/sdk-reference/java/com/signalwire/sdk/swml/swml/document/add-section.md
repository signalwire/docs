---
slug: "/reference/java/com/signalwire/sdk/swml/swml/document/add-section"
title: "addSection"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.swml.Document.addSection"
  parent: "com.signalwire.sdk.swml.Document"
  module: "com.signalwire.sdk.swml.Document"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Document.java"
  visibility: "public"
---
# `addSection`

Add a named section.

If the section already exists, returns the existing list.

## Signature

```java
public java.util.List<java.util.Map<java.lang.String,java.lang.Object>> addSection(
    java.lang.String name
)
```

## Parameters

| Name   | Type               | Required | Default | Description |
| ------ | ------------------ | -------- | ------- | ----------- |
| `name` | `java.lang.String` | yes      | —       | —           |

## Returns

`java.util.List<java.util.Map<java.lang.String,java.lang.Object>>`

## Source

[`src/main/java/com/signalwire/sdk/swml/Document.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Document.java)

Line 45.
