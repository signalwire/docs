---
slug: "/reference/java/com/signalwire/sdk/agent/agent/agent-base/add-mcp-server"
title: "addMcpServer"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.agent.AgentBase.addMcpServer"
  parent: "com.signalwire.sdk.agent.AgentBase"
  module: "com.signalwire.sdk.agent.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java"
  visibility: "public"
---
# `addMcpServer`

Add an external MCP server for tool discovery and invocation.

Tools are discovered via MCP protocol at session start and added to SWAIG.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.agent.AgentBase addMcpServer(
    java.lang.String url,
    java.util.Map<java.lang.String,java.lang.String> headers,
    boolean resources,
    java.util.Map<java.lang.String,java.lang.String> resourceVars
)
```

**Overload 2**

```java
public com.signalwire.sdk.agent.AgentBase addMcpServer(java.lang.String url)
```

**Overload 3**

```java
public com.signalwire.sdk.agent.AgentBase addMcpServer(
    java.lang.String url,
    java.util.Map<java.lang.String,java.lang.String> headers
)
```

## Parameters (Overload 1)

| Name           | Type                                               | Required | Default | Description                                  |
| -------------- | -------------------------------------------------- | -------- | ------- | -------------------------------------------- |
| `url`          | `java.lang.String`                                 | yes      | —       | MCP server HTTP endpoint URL                 |
| `headers`      | `java.util.Map<java.lang.String,java.lang.String>` | yes      | —       | Optional HTTP headers (e.g. Authorization)   |
| `resources`    | `boolean`                                          | yes      | —       | Whether to fetch resources into global\_data |
| `resourceVars` | `java.util.Map<java.lang.String,java.lang.String>` | yes      | —       | Variables for URI template substitution      |

## Parameters (Overload 2)

| Name  | Type               | Required | Default | Description |
| ----- | ------------------ | -------- | ------- | ----------- |
| `url` | `java.lang.String` | yes      | —       | —           |

## Parameters (Overload 3)

| Name      | Type                                               | Required | Default | Description |
| --------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `url`     | `java.lang.String`                                 | yes      | —       | —           |
| `headers` | `java.util.Map<java.lang.String,java.lang.String>` | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.agent.AgentBase` — this for chaining

## Returns (Overload 2)

`com.signalwire.sdk.agent.AgentBase`

## Returns (Overload 3)

`com.signalwire.sdk.agent.AgentBase`

## Source

[`src/main/java/com/signalwire/sdk/agent/AgentBase.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java)

Line 1102.
