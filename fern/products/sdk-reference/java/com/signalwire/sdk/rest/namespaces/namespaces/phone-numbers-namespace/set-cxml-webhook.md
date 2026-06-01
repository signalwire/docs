---
slug: "/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/phone-numbers-namespace/set-cxml-webhook"
title: "setCxmlWebhook"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.namespaces.PhoneNumbersNamespace.setCxmlWebhook"
  parent: "com.signalwire.sdk.rest.namespaces.PhoneNumbersNamespace"
  module: "com.signalwire.sdk.rest.namespaces.PhoneNumbersNamespace"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/PhoneNumbersNamespace.java"
  visibility: "public"
---
# `setCxmlWebhook`

Route inbound calls to a cXML (Twilio-compat / LAML) webhook.

<p>
 Despite the wire value `laml_webhooks` being plural, this
 creates a single `cxml_webhook` Fabric resource.

## Signature

**Overload 1**

```java
public java.util.Map<java.lang.String,java.lang.Object> setCxmlWebhook(
    java.lang.String id,
    java.lang.String url
)
```

**Overload 2**

```java
public java.util.Map<java.lang.String,java.lang.Object> setCxmlWebhook(
    java.lang.String id,
    java.lang.String url,
    java.lang.String fallbackUrl
)
```

**Overload 3**

```java
public java.util.Map<java.lang.String,java.lang.Object> setCxmlWebhook(
    java.lang.String id,
    java.lang.String url,
    java.lang.String fallbackUrl,
    java.lang.String statusCallbackUrl
)
```

## Parameters (Overload 1)

| Name  | Type               | Required | Default | Description           |
| ----- | ------------------ | -------- | ------- | --------------------- |
| `id`  | `java.lang.String` | yes      | —       | phone number SID      |
| `url` | `java.lang.String` | yes      | —       | primary cXML endpoint |

## Parameters (Overload 2)

| Name          | Type               | Required | Default | Description                                         |
| ------------- | ------------------ | -------- | ------- | --------------------------------------------------- |
| `id`          | `java.lang.String` | yes      | —       | phone number SID                                    |
| `url`         | `java.lang.String` | yes      | —       | primary cXML endpoint                               |
| `fallbackUrl` | `java.lang.String` | yes      | —       | URL the server falls back to when the primary fails |

## Parameters (Overload 3)

| Name                | Type               | Required | Default | Description                          |
| ------------------- | ------------------ | -------- | ------- | ------------------------------------ |
| `id`                | `java.lang.String` | yes      | —       | phone number SID                     |
| `url`               | `java.lang.String` | yes      | —       | primary cXML endpoint                |
| `fallbackUrl`       | `java.lang.String` | yes      | —       | fallback URL (may be `null`)         |
| `statusCallbackUrl` | `java.lang.String` | yes      | —       | call-status callback (may be `null`) |

## Returns (Overload 1)

`java.util.Map<java.lang.String,java.lang.Object>`

## Returns (Overload 2)

`java.util.Map<java.lang.String,java.lang.Object>`

## Returns (Overload 3)

`java.util.Map<java.lang.String,java.lang.Object>`

## Source

[`src/main/java/com/signalwire/sdk/rest/namespaces/PhoneNumbersNamespace.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/PhoneNumbersNamespace.java)

Line 100.
