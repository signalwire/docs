---
slug: "/reference/java/com/signalwire/sdk/agent/agent/agent-base/add-internal-filler"
title: "addInternalFiller"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.agent.AgentBase.addInternalFiller"
  parent: "com.signalwire.sdk.agent.AgentBase"
  module: "com.signalwire.sdk.agent.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java"
  visibility: "public"
---
# `addInternalFiller`

Add internal fillers for a single internal function and language.

<p>See `#setInternalFillersMap(java.util.Map)` for the complete
 list of supported function names and an explanation of what fillers
 do. Names outside the supported set log a warning and are stored, but
 the runtime will not play them.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.agent.AgentBase addInternalFiller(
    java.lang.String text,
    java.lang.String file
)
```

**Overload 2**

```java
public com.signalwire.sdk.agent.AgentBase addInternalFiller(
    java.lang.String functionName,
    java.lang.String languageCode,
    java.util.List<java.lang.String> fillers
)
```

## Parameters (Overload 1)

| Name   | Type               | Required | Default | Description |
| ------ | ------------------ | -------- | ------- | ----------- |
| `text` | `java.lang.String` | yes      | —       | —           |
| `file` | `java.lang.String` | yes      | —       | —           |

## Parameters (Overload 2)

| Name           | Type                               | Required | Default | Description                                |
| -------------- | ---------------------------------- | -------- | ------- | ------------------------------------------ |
| `functionName` | `java.lang.String`                 | yes      | —       | one of `#SUPPORTED_INTERNAL_FILLER_NAMES`. |
| `languageCode` | `java.lang.String`                 | yes      | —       | BCP-47 language code (e.g. `"en-US"`).     |
| `fillers`      | `java.util.List<java.lang.String>` | yes      | —       | phrases to speak while the function runs.  |

## Returns (Overload 1)

`com.signalwire.sdk.agent.AgentBase`

## Returns (Overload 2)

`com.signalwire.sdk.agent.AgentBase` — this agent for chaining.

## Source

[`src/main/java/com/signalwire/sdk/agent/AgentBase.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java)

Line 888.
