---
slug: "/reference/java/com/signalwire/sdk/swaig/swaig/tool-handler/handle"
title: "handle"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.swaig.ToolHandler.handle"
  parent: "com.signalwire.sdk.swaig.ToolHandler"
  module: "com.signalwire.sdk.swaig.ToolHandler"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swaig/ToolHandler.java"
  visibility: "public"
---
# `handle`

Handle a SWAIG tool invocation.

**Modifiers:** `abstract`

## Signature

```java
public abstract com.signalwire.sdk.swaig.FunctionResult handle(
    java.util.Map<java.lang.String,java.lang.Object> args,
    java.util.Map<java.lang.String,java.lang.Object> rawData
)
```

## Parameters

| Name      | Type                                               | Required | Default | Description                                                         |
| --------- | -------------------------------------------------- | -------- | ------- | ------------------------------------------------------------------- |
| `args`    | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | Parsed arguments from the tool call                                 |
| `rawData` | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | Full raw request payload for accessing call info, global data, etc. |

## Returns

`com.signalwire.sdk.swaig.FunctionResult` — A FunctionResult with the response text and optional actions

## Source

[`src/main/java/com/signalwire/sdk/swaig/ToolHandler.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swaig/ToolHandler.java)

Line 19.
