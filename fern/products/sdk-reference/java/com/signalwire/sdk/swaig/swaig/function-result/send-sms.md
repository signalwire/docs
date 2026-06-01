---
slug: "/reference/java/com/signalwire/sdk/swaig/swaig/function-result/send-sms"
title: "sendSms"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.swaig.FunctionResult.sendSms"
  parent: "com.signalwire.sdk.swaig.FunctionResult"
  module: "com.signalwire.sdk.swaig.FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swaig/FunctionResult.java"
  visibility: "public"
---
# `sendSms`

Send SMS via SWML.

## Signature

```java
public com.signalwire.sdk.swaig.FunctionResult sendSms(
    java.lang.String toNumber,
    java.lang.String fromNumber,
    java.lang.String body,
    java.util.List<java.lang.String> media,
    java.util.List<java.lang.String> tags
)
```

## Parameters

| Name         | Type                               | Required | Default | Description |
| ------------ | ---------------------------------- | -------- | ------- | ----------- |
| `toNumber`   | `java.lang.String`                 | yes      | —       | —           |
| `fromNumber` | `java.lang.String`                 | yes      | —       | —           |
| `body`       | `java.lang.String`                 | yes      | —       | —           |
| `media`      | `java.util.List<java.lang.String>` | yes      | —       | —           |
| `tags`       | `java.util.List<java.lang.String>` | yes      | —       | —           |

## Returns

`com.signalwire.sdk.swaig.FunctionResult`

## Source

[`src/main/java/com/signalwire/sdk/swaig/FunctionResult.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swaig/FunctionResult.java)

Line 468.
