---
slug: "/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/phone-numbers-namespace/set-swml-webhook"
title: "setSwmlWebhook"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.namespaces.PhoneNumbersNamespace.setSwmlWebhook"
  parent: "com.signalwire.sdk.rest.namespaces.PhoneNumbersNamespace"
  module: "com.signalwire.sdk.rest.namespaces.PhoneNumbersNamespace"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/PhoneNumbersNamespace.java"
  visibility: "public"
---
# `setSwmlWebhook`

Route inbound calls on this phone number to an SWML webhook URL.

<p>
 Your backend returns an SWML document per call. The server
 auto-creates a `swml_webhook` Fabric resource keyed off this URL.

## Signature

```java
public java.util.Map<java.lang.String,java.lang.Object> setSwmlWebhook(
    java.lang.String id,
    java.lang.String url
)
```

## Parameters

| Name  | Type               | Required | Default | Description                                    |
| ----- | ------------------ | -------- | ------- | ---------------------------------------------- |
| `id`  | `java.lang.String` | yes      | —       | phone number SID                               |
| `url` | `java.lang.String` | yes      | —       | SWML endpoint the server should fetch per call |

## Returns

`java.util.Map<java.lang.String,java.lang.Object>` — the updated phone number representation

## Source

[`src/main/java/com/signalwire/sdk/rest/namespaces/PhoneNumbersNamespace.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/PhoneNumbersNamespace.java)

Line 84.
