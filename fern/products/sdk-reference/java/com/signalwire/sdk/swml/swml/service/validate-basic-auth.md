---
slug: "/reference/java/com/signalwire/sdk/swml/swml/service/validate-basic-auth"
title: "validateBasicAuth"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.swml.Service.validateBasicAuth"
  parent: "com.signalwire.sdk.swml.Service"
  module: "com.signalwire.sdk.swml.Service"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Service.java"
  visibility: "public"
---
# `validateBasicAuth`

Validate provided basic-auth credentials against the configured ones
using a constant-time comparison.

(Python parity:
`AuthMixin.validate_basic_auth(username, password)`.)

## Signature

```java
public boolean validateBasicAuth(
    java.lang.String username,
    java.lang.String password
)
```

## Parameters

| Name       | Type               | Required | Default | Description |
| ---------- | ------------------ | -------- | ------- | ----------- |
| `username` | `java.lang.String` | yes      | —       | —           |
| `password` | `java.lang.String` | yes      | —       | —           |

## Returns

`boolean`

## Source

[`src/main/java/com/signalwire/sdk/swml/Service.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Service.java)

Line 136.
