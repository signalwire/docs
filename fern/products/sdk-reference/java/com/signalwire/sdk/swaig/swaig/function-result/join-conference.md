---
slug: "/reference/java/com/signalwire/sdk/swaig/swaig/function-result/join-conference"
title: "joinConference"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.swaig.FunctionResult.joinConference"
  parent: "com.signalwire.sdk.swaig.FunctionResult"
  module: "com.signalwire.sdk.swaig.FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swaig/FunctionResult.java"
  visibility: "public"
---
# `joinConference`

Join a conference via SWML.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.swaig.FunctionResult joinConference(
    java.lang.String name,
    boolean muted,
    java.lang.String beep,
    java.lang.String holdAudio
)
```

**Overload 2**

```java
public com.signalwire.sdk.swaig.FunctionResult joinConference(
    java.lang.String name
)
```

## Parameters (Overload 1)

| Name        | Type               | Required | Default | Description |
| ----------- | ------------------ | -------- | ------- | ----------- |
| `name`      | `java.lang.String` | yes      | —       | —           |
| `muted`     | `boolean`          | yes      | —       | —           |
| `beep`      | `java.lang.String` | yes      | —       | —           |
| `holdAudio` | `java.lang.String` | yes      | —       | —           |

## Parameters (Overload 2)

| Name   | Type               | Required | Default | Description |
| ------ | ------------------ | -------- | ------- | ----------- |
| `name` | `java.lang.String` | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.swaig.FunctionResult`

## Returns (Overload 2)

`com.signalwire.sdk.swaig.FunctionResult`

## Source

[`src/main/java/com/signalwire/sdk/swaig/FunctionResult.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swaig/FunctionResult.java)

Line 390.
