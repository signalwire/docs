---
slug: "/reference/java/com/signalwire/sdk/security/security/session-manager/create-token"
title: "createToken"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.security.SessionManager.createToken"
  parent: "com.signalwire.sdk.security.SessionManager"
  module: "com.signalwire.sdk.security.SessionManager"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/security/SessionManager.java"
  visibility: "public"
---
# `createToken`

Create a signed token for a function + callID.

## Signature

**Overload 1**

```java
public java.lang.String createToken(
    java.lang.String functionName,
    java.lang.String callId
)
```

**Overload 2**

```java
public java.lang.String createToken(
    java.lang.String functionName,
    java.lang.String callId,
    int expirySeconds
)
```

## Parameters (Overload 1)

| Name           | Type               | Required | Default | Description |
| -------------- | ------------------ | -------- | ------- | ----------- |
| `functionName` | `java.lang.String` | yes      | —       | —           |
| `callId`       | `java.lang.String` | yes      | —       | —           |

## Parameters (Overload 2)

| Name            | Type               | Required | Default | Description |
| --------------- | ------------------ | -------- | ------- | ----------- |
| `functionName`  | `java.lang.String` | yes      | —       | —           |
| `callId`        | `java.lang.String` | yes      | —       | —           |
| `expirySeconds` | `int`              | yes      | —       | —           |

## Returns (Overload 1)

`java.lang.String`

## Returns (Overload 2)

`java.lang.String`

## Source

[`src/main/java/com/signalwire/sdk/security/SessionManager.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/security/SessionManager.java)

Line 32.
