---
slug: "/reference/java/com/signalwire/sdk/agent/agent/agent-base/get-signing-key"
title: "getSigningKey"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.agent.AgentBase.getSigningKey"
  parent: "com.signalwire.sdk.agent.AgentBase"
  module: "com.signalwire.sdk.agent.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java"
  visibility: "public"
---
# `getSigningKey`

## Signature

```java
public java.lang.String getSigningKey()
```

## Returns

`java.lang.String` — the configured Signing Key for SignalWire webhook signature validation (resolved from the builder or `SIGNALWIRE_SIGNING_KEY` env), or `null` when validation is disabled.

## Source

[`src/main/java/com/signalwire/sdk/agent/AgentBase.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java)

Line 1353.
