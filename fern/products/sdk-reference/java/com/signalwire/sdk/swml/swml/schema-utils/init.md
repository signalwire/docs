---
slug: "/reference/java/com/signalwire/sdk/swml/swml/schema-utils/init"
title: "<init>"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.swml.SchemaUtils.<init>"
  parent: "com.signalwire.sdk.swml.SchemaUtils"
  module: "com.signalwire.sdk.swml.SchemaUtils"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/SchemaUtils.java"
  visibility: "public"
---
# `<init>`

Construct a SchemaUtils.

Mirrors Python's schema\_validation=True).

## Signature

```java
public void <init>(java.lang.String schemaPath, boolean schemaValidation)
```

## Parameters

| Name               | Type               | Required | Default | Description                                                                                           |
| ------------------ | ------------------ | -------- | ------- | ----------------------------------------------------------------------------------------------------- |
| `schemaPath`       | `java.lang.String` | yes      | —       | optional path to a schema.json file; pass null to use the embedded resource bundled with the SDK jar. |
| `schemaValidation` | `boolean`          | yes      | —       | enables/disables schema validation. Honors `SWML_SKIP_SCHEMA_VALIDATION=1` env override.              |

## Source

[`src/main/java/com/signalwire/sdk/swml/SchemaUtils.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/SchemaUtils.java)

Line 83.
