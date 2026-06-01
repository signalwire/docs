---
slug: "/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/phone-numbers-namespace/set-relay-topic"
title: "setRelayTopic"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.namespaces.PhoneNumbersNamespace.setRelayTopic"
  parent: "com.signalwire.sdk.rest.namespaces.PhoneNumbersNamespace"
  module: "com.signalwire.sdk.rest.namespaces.PhoneNumbersNamespace"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/PhoneNumbersNamespace.java"
  visibility: "public"
---
# `setRelayTopic`

Route inbound calls to a RELAY topic (client subscription).

## Signature

**Overload 1**

```java
public java.util.Map<java.lang.String,java.lang.Object> setRelayTopic(
    java.lang.String id,
    java.lang.String topic
)
```

**Overload 2**

```java
public java.util.Map<java.lang.String,java.lang.Object> setRelayTopic(
    java.lang.String id,
    java.lang.String topic,
    java.lang.String statusCallbackUrl
)
```

## Parameters (Overload 1)

| Name    | Type               | Required | Default | Description      |
| ------- | ------------------ | -------- | ------- | ---------------- |
| `id`    | `java.lang.String` | yes      | —       | phone number SID |
| `topic` | `java.lang.String` | yes      | —       | RELAY topic name |

## Parameters (Overload 2)

| Name                | Type               | Required | Default | Description                              |
| ------------------- | ------------------ | -------- | ------- | ---------------------------------------- |
| `id`                | `java.lang.String` | yes      | —       | phone number SID                         |
| `topic`             | `java.lang.String` | yes      | —       | RELAY topic name                         |
| `statusCallbackUrl` | `java.lang.String` | yes      | —       | call-status callback URL (may be `null`) |

## Returns (Overload 1)

`java.util.Map<java.lang.String,java.lang.Object>`

## Returns (Overload 2)

`java.util.Map<java.lang.String,java.lang.Object>`

## Source

[`src/main/java/com/signalwire/sdk/rest/namespaces/PhoneNumbersNamespace.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/PhoneNumbersNamespace.java)

Line 210.
