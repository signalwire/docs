---
slug: "/reference/java/com/signalwire/sdk/agent/agent/agent-base/get-language-params"
title: "getLanguageParams"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.agent.AgentBase.getLanguageParams"
  parent: "com.signalwire.sdk.agent.AgentBase"
  module: "com.signalwire.sdk.agent.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java"
  visibility: "public"
---
# `getLanguageParams`

Read the per-language `params` dict for a previously-added language.

Returns null when the code is unknown or params were never set.
Mirrors Python's get\_language\_params.

**Decorators:** `@SuppressWarnings({"unchecked"})`

## Signature

```java
public java.util.Map<java.lang.String,java.lang.Object> getLanguageParams(
    java.lang.String code
)
```

## Parameters

| Name   | Type               | Required | Default | Description |
| ------ | ------------------ | -------- | ------- | ----------- |
| `code` | `java.lang.String` | yes      | —       | —           |

## Returns

`java.util.Map<java.lang.String,java.lang.Object>`

## Source

[`src/main/java/com/signalwire/sdk/agent/AgentBase.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java)

Line 734.
