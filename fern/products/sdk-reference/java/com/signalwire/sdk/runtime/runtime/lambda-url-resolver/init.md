---
slug: "/reference/java/com/signalwire/sdk/runtime/runtime/lambda-url-resolver/init"
title: "<init>"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.runtime.LambdaUrlResolver.<init>"
  parent: "com.signalwire.sdk.runtime.LambdaUrlResolver"
  module: "com.signalwire.sdk.runtime.LambdaUrlResolver"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/runtime/LambdaUrlResolver.java"
  visibility: "public"
---
# `<init>`

Create a resolver backed by the real process environment.

## Signature

**Overload 1**

```java
public void <init>()
```

**Overload 2**

```java
public void <init>(com.signalwire.sdk.runtime.EnvProvider env)
```

## Parameters (Overload 2)

| Name  | Type                                     | Required | Default | Description                  |
| ----- | ---------------------------------------- | -------- | ------- | ---------------------------- |
| `env` | `com.signalwire.sdk.runtime.EnvProvider` | yes      | —       | environment variable source. |

## Source

[`src/main/java/com/signalwire/sdk/runtime/LambdaUrlResolver.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/runtime/LambdaUrlResolver.java)

Line 34.
