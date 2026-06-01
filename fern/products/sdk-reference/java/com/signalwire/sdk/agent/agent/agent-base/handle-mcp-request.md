---
slug: "/reference/java/com/signalwire/sdk/agent/agent/agent-base/handle-mcp-request"
title: "handleMcpRequest"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.agent.AgentBase.handleMcpRequest"
  parent: "com.signalwire.sdk.agent.AgentBase"
  module: "com.signalwire.sdk.agent.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java"
  visibility: "public"
---
# `handleMcpRequest`

Handle an MCP JSON-RPC 2.0 request.

Returns the response map.

## Signature

```java
public java.util.Map<java.lang.String,java.lang.Object> handleMcpRequest(
    java.util.Map<java.lang.String,java.lang.Object> body
)
```

## Parameters

| Name   | Type                                               | Required | Default | Description |
| ------ | -------------------------------------------------- | -------- | ------- | ----------- |
| `body` | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | —           |

## Returns

`java.util.Map<java.lang.String,java.lang.Object>`

## Source

[`src/main/java/com/signalwire/sdk/agent/AgentBase.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java)

Line 1182.
