---
slug: "/reference/java/com/signalwire/sdk/swml/swml/schema-validation-error/init"
title: "<init>"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.swml.SchemaValidationError.<init>"
  parent: "com.signalwire.sdk.swml.SchemaValidationError"
  module: "com.signalwire.sdk.swml.SchemaValidationError"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/SchemaValidationError.java"
  visibility: "public"
---
# `<init>`

Construct a SchemaValidationError.

Mirrors Python's
errors) signature.

## Signature

```java
public void <init>(
    java.lang.String verbName,
    java.util.List<java.lang.String> errors
)
```

## Parameters

| Name       | Type                               | Required | Default | Description                               |
| ---------- | ---------------------------------- | -------- | ------- | ----------------------------------------- |
| `verbName` | `java.lang.String`                 | yes      | —       | the verb whose validation failed          |
| `errors`   | `java.util.List<java.lang.String>` | yes      | —       | the list of human-readable error messages |

## Source

[`src/main/java/com/signalwire/sdk/swml/SchemaValidationError.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/SchemaValidationError.java)

Line 32.
