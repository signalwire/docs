---
slug: "/reference/java/com/signalwire/sdk/agent/agent/agent-base/set-language-params"
title: "setLanguageParams"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.agent.AgentBase.setLanguageParams"
  parent: "com.signalwire.sdk.agent.AgentBase"
  module: "com.signalwire.sdk.agent.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java"
  visibility: "public"
---
# `setLanguageParams`

Set (or replace) the per-language `params` dict on an already-added
language.

Empty/null params removes the key. Unknown code is a no-op.
Returns self for chaining. Mirrors Python's set\_language\_params.

## Signature

```java
public com.signalwire.sdk.agent.AgentBase setLanguageParams(
    java.lang.String code,
    java.util.Map<java.lang.String,java.lang.Object> params
)
```

## Parameters

| Name     | Type                                               | Required | Default | Description |
| -------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `code`   | `java.lang.String`                                 | yes      | —       | —           |
| `params` | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | —           |

## Returns

`com.signalwire.sdk.agent.AgentBase`

## Source

[`src/main/java/com/signalwire/sdk/agent/AgentBase.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java)

Line 715.
