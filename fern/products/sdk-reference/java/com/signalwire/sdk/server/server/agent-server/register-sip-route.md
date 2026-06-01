---
slug: "/reference/java/com/signalwire/sdk/server/server/agent-server/register-sip-route"
title: "registerSipRoute"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.server.AgentServer.registerSipRoute"
  parent: "com.signalwire.sdk.server.AgentServer"
  module: "com.signalwire.sdk.server.AgentServer"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/server/AgentServer.java"
  visibility: "public"
---
# `registerSipRoute`

Register a SIP username to route to a specific agent.

## Signature

```java
public com.signalwire.sdk.server.AgentServer registerSipRoute(
    java.lang.String username,
    java.lang.String route
)
```

## Parameters

| Name       | Type               | Required | Default | Description |
| ---------- | ------------------ | -------- | ------- | ----------- |
| `username` | `java.lang.String` | yes      | —       | —           |
| `route`    | `java.lang.String` | yes      | —       | —           |

## Returns

`com.signalwire.sdk.server.AgentServer`

## Source

[`src/main/java/com/signalwire/sdk/server/AgentServer.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/server/AgentServer.java)

Line 150.
