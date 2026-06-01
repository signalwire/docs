---
slug: "/reference/java/com/signalwire/sdk/swml/swml/schema-utils/get-verb-properties"
title: "getVerbProperties"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.swml.SchemaUtils.getVerbProperties"
  parent: "com.signalwire.sdk.swml.SchemaUtils"
  module: "com.signalwire.sdk.swml.SchemaUtils"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/SchemaUtils.java"
  visibility: "public"
---
# `getVerbProperties`

The `properties[verb_name]` block for a verb, or an empty map when
the verb is unknown.

Mirrors Python's `get_verb_properties(verb_name)`.

## Signature

```java
public java.util.Map<java.lang.String,java.lang.Object> getVerbProperties(
    java.lang.String verbName
)
```

## Parameters

| Name       | Type               | Required | Default | Description |
| ---------- | ------------------ | -------- | ------- | ----------- |
| `verbName` | `java.lang.String` | yes      | —       | —           |

## Returns

`java.util.Map<java.lang.String,java.lang.Object>`

## Source

[`src/main/java/com/signalwire/sdk/swml/SchemaUtils.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/SchemaUtils.java)

Line 187.
