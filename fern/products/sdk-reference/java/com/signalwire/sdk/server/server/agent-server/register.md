---
slug: "/reference/java/com/signalwire/sdk/server/server/agent-server/register"
title: "register"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.server.AgentServer.register"
  parent: "com.signalwire.sdk.server.AgentServer"
  module: "com.signalwire.sdk.server.AgentServer"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/server/AgentServer.java"
  visibility: "public"
---
# `register`

Register an agent at a specific route.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.server.AgentServer register(
    com.signalwire.sdk.agent.AgentBase agent,
    java.lang.String route
)
```

**Overload 2**

```java
public com.signalwire.sdk.server.AgentServer register(
    com.signalwire.sdk.agent.AgentBase agent
)
```

## Parameters (Overload 1)

| Name    | Type                                 | Required | Default | Description |
| ------- | ------------------------------------ | -------- | ------- | ----------- |
| `agent` | `com.signalwire.sdk.agent.AgentBase` | yes      | —       | —           |
| `route` | `java.lang.String`                   | yes      | —       | —           |

## Parameters (Overload 2)

| Name    | Type                                 | Required | Default | Description |
| ------- | ------------------------------------ | -------- | ------- | ----------- |
| `agent` | `com.signalwire.sdk.agent.AgentBase` | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.server.AgentServer`

## Returns (Overload 2)

`com.signalwire.sdk.server.AgentServer`

## Source

[`src/main/java/com/signalwire/sdk/server/AgentServer.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/server/AgentServer.java)

Line 72.
