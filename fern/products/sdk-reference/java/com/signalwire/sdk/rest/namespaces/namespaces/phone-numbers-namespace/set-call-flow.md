---
slug: "/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/phone-numbers-namespace/set-call-flow"
title: "setCallFlow"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.namespaces.PhoneNumbersNamespace.setCallFlow"
  parent: "com.signalwire.sdk.rest.namespaces.PhoneNumbersNamespace"
  module: "com.signalwire.sdk.rest.namespaces.PhoneNumbersNamespace"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/PhoneNumbersNamespace.java"
  visibility: "public"
---
# `setCallFlow`

Route inbound calls to a Call Flow by ID (server default version).

## Signature

**Overload 1**

```java
public java.util.Map<java.lang.String,java.lang.Object> setCallFlow(
    java.lang.String id,
    java.lang.String flowId
)
```

**Overload 2**

```java
public java.util.Map<java.lang.String,java.lang.Object> setCallFlow(
    java.lang.String id,
    java.lang.String flowId,
    java.lang.String version
)
```

## Parameters (Overload 1)

| Name     | Type               | Required | Default | Description           |
| -------- | ------------------ | -------- | ------- | --------------------- |
| `id`     | `java.lang.String` | yes      | —       | phone number SID      |
| `flowId` | `java.lang.String` | yes      | —       | call-flow resource ID |

## Parameters (Overload 2)

| Name      | Type               | Required | Default | Description                                                              |
| --------- | ------------------ | -------- | ------- | ------------------------------------------------------------------------ |
| `id`      | `java.lang.String` | yes      | —       | phone number SID                                                         |
| `flowId`  | `java.lang.String` | yes      | —       | call-flow resource ID                                                    |
| `version` | `java.lang.String` | yes      | —       | `"working_copy"`, `"current_deployed"`, or `null` for the server default |

## Returns (Overload 1)

`java.util.Map<java.lang.String,java.lang.Object>`

## Returns (Overload 2)

`java.util.Map<java.lang.String,java.lang.Object>`

## Source

[`src/main/java/com/signalwire/sdk/rest/namespaces/PhoneNumbersNamespace.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/PhoneNumbersNamespace.java)

Line 169.
