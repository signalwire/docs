---
slug: "/reference/java/com/signalwire/sdk/relay/relay/call/send-fax"
title: "sendFax"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.Call.sendFax"
  parent: "com.signalwire.sdk.relay.Call"
  module: "com.signalwire.sdk.relay.Call"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java"
  visibility: "public"
---
# `sendFax`

Send a fax.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.relay.Action.SendFaxAction sendFax(
    java.lang.String documentUrl,
    java.util.Map<java.lang.String,java.lang.Object> options
)
```

**Overload 2**

```java
public com.signalwire.sdk.relay.Action.SendFaxAction sendFax(
    java.lang.String documentUrl,
    java.lang.String identity,
    java.lang.String controlId
)
```

## Parameters (Overload 1)

| Name          | Type                                               | Required | Default | Description         |
| ------------- | -------------------------------------------------- | -------- | ------- | ------------------- |
| `documentUrl` | `java.lang.String`                                 | yes      | —       | URL to PDF document |
| `options`     | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | optional parameters |

## Parameters (Overload 2)

| Name          | Type               | Required | Default | Description |
| ------------- | ------------------ | -------- | ------- | ----------- |
| `documentUrl` | `java.lang.String` | yes      | —       | —           |
| `identity`    | `java.lang.String` | yes      | —       | —           |
| `controlId`   | `java.lang.String` | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.relay.Action.SendFaxAction` — a SendFaxAction

## Returns (Overload 2)

`com.signalwire.sdk.relay.Action.SendFaxAction`

## Source

[`src/main/java/com/signalwire/sdk/relay/Call.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java)

Line 691.
