---
slug: "/reference/java/com/signalwire/sdk/swml/swml/schema-utils/get-verb-required-properties"
title: "getVerbRequiredProperties"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.swml.SchemaUtils.getVerbRequiredProperties"
  parent: "com.signalwire.sdk.swml.SchemaUtils"
  module: "com.signalwire.sdk.swml.SchemaUtils"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/SchemaUtils.java"
  visibility: "public"
---
# `getVerbRequiredProperties`

The `required` list for a verb, or an empty list when the verb is
unknown or has no required properties.

Mirrors Python's `get_verb_required_properties(verb_name)`.

## Signature

```java
public java.util.List<java.lang.String> getVerbRequiredProperties(
    java.lang.String verbName
)
```

## Parameters

| Name       | Type               | Required | Default | Description |
| ---------- | ------------------ | -------- | ------- | ----------- |
| `verbName` | `java.lang.String` | yes      | —       | —           |

## Returns

`java.util.List<java.lang.String>`

## Source

[`src/main/java/com/signalwire/sdk/swml/SchemaUtils.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/SchemaUtils.java)

Line 202.
