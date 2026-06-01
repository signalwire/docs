---
slug: "/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/pub-sub-namespace/publish"
title: "publish"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.namespaces.PubSubNamespace.publish"
  parent: "com.signalwire.sdk.rest.namespaces.PubSubNamespace"
  module: "com.signalwire.sdk.rest.namespaces.PubSubNamespace"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/PubSubNamespace.java"
  visibility: "public"
---
# `publish`

Publish a message to a channel.

## Signature

```java
public java.util.Map<java.lang.String,java.lang.Object> publish(
    java.lang.String channel,
    java.util.Map<java.lang.String,java.lang.Object> body
)
```

## Parameters

| Name      | Type                                               | Required | Default | Description |
| --------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `channel` | `java.lang.String`                                 | yes      | —       | —           |
| `body`    | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | —           |

## Returns

`java.util.Map<java.lang.String,java.lang.Object>`

## Source

[`src/main/java/com/signalwire/sdk/rest/namespaces/PubSubNamespace.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/PubSubNamespace.java)

Line 30.
