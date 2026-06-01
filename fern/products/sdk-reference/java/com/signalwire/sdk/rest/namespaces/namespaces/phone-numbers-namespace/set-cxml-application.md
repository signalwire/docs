---
slug: "/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/phone-numbers-namespace/set-cxml-application"
title: "setCxmlApplication"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.namespaces.PhoneNumbersNamespace.setCxmlApplication"
  parent: "com.signalwire.sdk.rest.namespaces.PhoneNumbersNamespace"
  module: "com.signalwire.sdk.rest.namespaces.PhoneNumbersNamespace"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/PhoneNumbersNamespace.java"
  visibility: "public"
---
# `setCxmlApplication`

Route inbound calls to an existing cXML application by ID.

## Signature

```java
public java.util.Map<java.lang.String,java.lang.Object> setCxmlApplication(
    java.lang.String id,
    java.lang.String applicationId
)
```

## Parameters

| Name            | Type               | Required | Default | Description         |
| --------------- | ------------------ | -------- | ------- | ------------------- |
| `id`            | `java.lang.String` | yes      | —       | phone number SID    |
| `applicationId` | `java.lang.String` | yes      | —       | cXML application ID |

## Returns

`java.util.Map<java.lang.String,java.lang.Object>`

## Source

[`src/main/java/com/signalwire/sdk/rest/namespaces/PhoneNumbersNamespace.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/PhoneNumbersNamespace.java)

Line 143.
