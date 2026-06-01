---
slug: "/reference/java/com/signalwire/sdk/swml/swml/service/define-tool"
title: "defineTool"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.swml.Service.defineTool"
  parent: "com.signalwire.sdk.swml.Service"
  module: "com.signalwire.sdk.swml.Service"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Service.java"
  visibility: "public"
---
# `defineTool`

Define a SWAIG function the AI can call.

Tool descriptions and
parameter descriptions are LLM-facing prompt engineering \u2014 see
PORTING\_GUIDE for guidance on writing them.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.swml.Service defineTool(
    java.lang.String name,
    java.lang.String description,
    java.util.Map<java.lang.String,java.lang.Object> parameters,
    com.signalwire.sdk.swaig.ToolHandler handler
)
```

**Overload 2**

```java
public com.signalwire.sdk.swml.Service defineTool(
    com.signalwire.sdk.swaig.ToolDefinition toolDef
)
```

## Parameters (Overload 1)

| Name          | Type                                               | Required | Default | Description |
| ------------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `name`        | `java.lang.String`                                 | yes      | —       | —           |
| `description` | `java.lang.String`                                 | yes      | —       | —           |
| `parameters`  | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | —           |
| `handler`     | `com.signalwire.sdk.swaig.ToolHandler`             | yes      | —       | —           |

## Parameters (Overload 2)

| Name      | Type                                      | Required | Default | Description |
| --------- | ----------------------------------------- | -------- | ------- | ----------- |
| `toolDef` | `com.signalwire.sdk.swaig.ToolDefinition` | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.swml.Service`

## Returns (Overload 2)

`com.signalwire.sdk.swml.Service`

## Source

[`src/main/java/com/signalwire/sdk/swml/Service.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Service.java)

Line 219.
