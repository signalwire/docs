---
slug: "/reference/java/com/signalwire/sdk/agent/agent/agent-base/set-prompt-pom"
title: "setPromptPom"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.agent.AgentBase.setPromptPom"
  parent: "com.signalwire.sdk.agent.AgentBase"
  module: "com.signalwire.sdk.agent.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java"
  visibility: "public"
---
# `setPromptPom`

Sets the prompt as a list of POM section maps.

Each section map
supports keys "title", "body", "bullets", "numbered",
"numbered\_bullets", and "subsections". Switches the agent to POM mode.

Mirrors Python's PromptManager.set\_prompt\_pom \u2014 accepts a list of
section dicts and stores them in pomSections.

## Signature

```java
public com.signalwire.sdk.agent.AgentBase setPromptPom(
    java.util.List<java.util.Map<java.lang.String,java.lang.Object>> pom
)
```

## Parameters

| Name  | Type                                                               | Required | Default | Description |
| ----- | ------------------------------------------------------------------ | -------- | ------- | ----------- |
| `pom` | `java.util.List<java.util.Map<java.lang.String,java.lang.Object>>` | yes      | —       | —           |

## Returns

`com.signalwire.sdk.agent.AgentBase`

## Source

[`src/main/java/com/signalwire/sdk/agent/AgentBase.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java)

Line 452.
