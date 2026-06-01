---
slug: "/reference/java/com/signalwire/sdk/runtime/lambda/lambda/lambda-agent-handler/init"
title: "<init>"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.runtime.lambda.LambdaAgentHandler.<init>"
  parent: "com.signalwire.sdk.runtime.lambda.LambdaAgentHandler"
  module: "com.signalwire.sdk.runtime.lambda.LambdaAgentHandler"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/runtime/lambda/LambdaAgentHandler.java"
  visibility: "public"
---
# `<init>`

Create a handler for the given agent using the real process
environment.

## Signature

**Overload 1**

```java
public void <init>(com.signalwire.sdk.agent.AgentBase agent)
```

**Overload 2**

```java
public void <init>(
    com.signalwire.sdk.agent.AgentBase agent,
    com.signalwire.sdk.runtime.EnvProvider env
)
```

## Parameters (Overload 1)

| Name    | Type                                 | Required | Default | Description           |
| ------- | ------------------------------------ | -------- | ------- | --------------------- |
| `agent` | `com.signalwire.sdk.agent.AgentBase` | yes      | —       | the configured agent. |

## Parameters (Overload 2)

| Name    | Type                                     | Required | Default | Description                  |
| ------- | ---------------------------------------- | -------- | ------- | ---------------------------- |
| `agent` | `com.signalwire.sdk.agent.AgentBase`     | yes      | —       | the configured agent.        |
| `env`   | `com.signalwire.sdk.runtime.EnvProvider` | yes      | —       | environment variable source. |

## Source

[`src/main/java/com/signalwire/sdk/runtime/lambda/LambdaAgentHandler.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/runtime/lambda/LambdaAgentHandler.java)

Line 80.
