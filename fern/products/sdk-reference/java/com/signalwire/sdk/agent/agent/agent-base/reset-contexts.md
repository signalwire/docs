---
slug: "/reference/java/com/signalwire/sdk/agent/agent/agent-base/reset-contexts"
title: "resetContexts"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.agent.AgentBase.resetContexts"
  parent: "com.signalwire.sdk.agent.AgentBase"
  module: "com.signalwire.sdk.agent.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java"
  visibility: "public"
---
# `resetContexts`

Remove all contexts, returning the agent to a no-contexts state.

This is a convenience wrapper around `defineContexts().reset()`.
Use it in a dynamic config callback when you need to rebuild
contexts from scratch for a specific request.

## Signature

```java
public com.signalwire.sdk.agent.AgentBase resetContexts()
```

## Returns

`com.signalwire.sdk.agent.AgentBase` — this agent for chaining.

## Source

[`src/main/java/com/signalwire/sdk/agent/AgentBase.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java)

Line 1020.
