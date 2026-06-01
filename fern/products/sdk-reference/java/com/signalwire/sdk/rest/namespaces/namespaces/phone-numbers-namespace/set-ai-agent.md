---
slug: "/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/phone-numbers-namespace/set-ai-agent"
title: "setAiAgent"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.namespaces.PhoneNumbersNamespace.setAiAgent"
  parent: "com.signalwire.sdk.rest.namespaces.PhoneNumbersNamespace"
  module: "com.signalwire.sdk.rest.namespaces.PhoneNumbersNamespace"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/PhoneNumbersNamespace.java"
  visibility: "public"
---
# `setAiAgent`

Route inbound calls to an AI Agent Fabric resource by ID.

## Signature

```java
public java.util.Map<java.lang.String,java.lang.Object> setAiAgent(
    java.lang.String id,
    java.lang.String agentId
)
```

## Parameters

| Name      | Type               | Required | Default | Description          |
| --------- | ------------------ | -------- | ------- | -------------------- |
| `id`      | `java.lang.String` | yes      | —       | phone number SID     |
| `agentId` | `java.lang.String` | yes      | —       | AI agent resource ID |

## Returns

`java.util.Map<java.lang.String,java.lang.Object>`

## Source

[`src/main/java/com/signalwire/sdk/rest/namespaces/PhoneNumbersNamespace.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/PhoneNumbersNamespace.java)

Line 156.
