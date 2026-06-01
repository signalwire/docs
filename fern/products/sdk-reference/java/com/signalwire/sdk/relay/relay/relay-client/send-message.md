---
slug: "/reference/java/com/signalwire/sdk/relay/relay/relay-client/send-message"
title: "sendMessage"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.RelayClient.sendMessage"
  parent: "com.signalwire.sdk.relay.RelayClient"
  module: "com.signalwire.sdk.relay.RelayClient"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/RelayClient.java"
  visibility: "public"
---
# `sendMessage`

Send an outbound SMS/MMS.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.relay.Message sendMessage(
    java.lang.String context,
    java.lang.String fromNumber,
    java.lang.String toNumber,
    java.lang.String body,
    java.util.List<java.lang.String> mediaUrls
)
```

**Overload 2**

```java
public com.signalwire.sdk.relay.Message sendMessage(
    java.lang.String context,
    java.lang.String fromNumber,
    java.lang.String toNumber,
    java.lang.String body,
    java.util.List<java.lang.String> mediaUrls,
    java.util.List<java.lang.String> tags
)
```

## Parameters (Overload 1)

| Name         | Type                               | Required | Default | Description                         |
| ------------ | ---------------------------------- | -------- | ------- | ----------------------------------- |
| `context`    | `java.lang.String`                 | yes      | —       | message context                     |
| `fromNumber` | `java.lang.String`                 | yes      | —       | sender E.164 number                 |
| `toNumber`   | `java.lang.String`                 | yes      | —       | recipient E.164 number              |
| `body`       | `java.lang.String`                 | yes      | —       | message body (required if no media) |
| `mediaUrls`  | `java.util.List<java.lang.String>` | yes      | —       | media URLs (required if no body)    |

## Parameters (Overload 2)

| Name         | Type                               | Required | Default | Description |
| ------------ | ---------------------------------- | -------- | ------- | ----------- |
| `context`    | `java.lang.String`                 | yes      | —       | —           |
| `fromNumber` | `java.lang.String`                 | yes      | —       | —           |
| `toNumber`   | `java.lang.String`                 | yes      | —       | —           |
| `body`       | `java.lang.String`                 | yes      | —       | —           |
| `mediaUrls`  | `java.util.List<java.lang.String>` | yes      | —       | —           |
| `tags`       | `java.util.List<java.lang.String>` | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.relay.Message` — the Message object with message\_id for tracking

## Returns (Overload 2)

`com.signalwire.sdk.relay.Message`

## Source

[`src/main/java/com/signalwire/sdk/relay/RelayClient.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/RelayClient.java)

Line 346.
