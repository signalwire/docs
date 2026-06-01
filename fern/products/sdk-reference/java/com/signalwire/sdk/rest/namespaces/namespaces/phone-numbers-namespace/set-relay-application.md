---
slug: "/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/phone-numbers-namespace/set-relay-application"
title: "setRelayApplication"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.namespaces.PhoneNumbersNamespace.setRelayApplication"
  parent: "com.signalwire.sdk.rest.namespaces.PhoneNumbersNamespace"
  module: "com.signalwire.sdk.rest.namespaces.PhoneNumbersNamespace"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/PhoneNumbersNamespace.java"
  visibility: "public"
---
# `setRelayApplication`

Route inbound calls to a named RELAY application.

## Signature

```java
public java.util.Map<java.lang.String,java.lang.Object> setRelayApplication(
    java.lang.String id,
    java.lang.String name
)
```

## Parameters

| Name   | Type               | Required | Default | Description            |
| ------ | ------------------ | -------- | ------- | ---------------------- |
| `id`   | `java.lang.String` | yes      | —       | phone number SID       |
| `name` | `java.lang.String` | yes      | —       | RELAY application name |

## Returns

`java.util.Map<java.lang.String,java.lang.Object>`

## Source

[`src/main/java/com/signalwire/sdk/rest/namespaces/PhoneNumbersNamespace.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/PhoneNumbersNamespace.java)

Line 197.
