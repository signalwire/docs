---
slug: "/reference/java/com/signalwire/sdk/agent/agent/agent-base/builder/env-provider"
title: "envProvider"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.agent.AgentBase.Builder.envProvider"
  parent: "com.signalwire.sdk.agent.AgentBase.Builder"
  module: "com.signalwire.sdk.agent.AgentBase.Builder"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java"
  visibility: "public"
---
# `envProvider`

Supply an alternative `EnvProvider` for the build-time env
var reads (`SWML_BASIC_AUTH_USER`, `SWML_BASIC_AUTH_PASSWORD`,
`SWML_PROXY_URL_BASE`).

<p>Primarily for the --simulate-serverless
 harness, which needs to mask the real process env with simulated
 values without mutating `System#getenv()` (which Java does
 not support). Pass `null` to fall back to the real process
 env (the default).

## Signature

```java
public com.signalwire.sdk.agent.AgentBase.Builder envProvider(
    com.signalwire.sdk.runtime.EnvProvider env
)
```

## Parameters

| Name  | Type                                     | Required | Default | Description         |
| ----- | ---------------------------------------- | -------- | ------- | ------------------- |
| `env` | `com.signalwire.sdk.runtime.EnvProvider` | yes      | —       | environment source. |

## Returns

`com.signalwire.sdk.agent.AgentBase.Builder` — this builder.

## Source

[`src/main/java/com/signalwire/sdk/agent/AgentBase.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java)

Line 251.
