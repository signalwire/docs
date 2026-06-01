---
slug: "/reference/java/com/signalwire/sdk/agent/agent/agent-base/validate-tool-token"
title: "validateToolToken"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.agent.AgentBase.validateToolToken"
  parent: "com.signalwire.sdk.agent.AgentBase"
  module: "com.signalwire.sdk.agent.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java"
  visibility: "public"
---
# `validateToolToken`

Validate a per-call SWAIG-function token.

Returns false when the
function is not registered, when the SessionManager rejects the
token, or on any underlying exception.

 <p>Python parity: `state_mixin.StateMixin.validate_tool_token`
 \u2014 rejects unknown functions up-front and swallows exceptions.

## Signature

```java
public boolean validateToolToken(
    java.lang.String functionName,
    java.lang.String token,
    java.lang.String callId
)
```

## Parameters

| Name           | Type               | Required | Default | Description |
| -------------- | ------------------ | -------- | ------- | ----------- |
| `functionName` | `java.lang.String` | yes      | —       | —           |
| `token`        | `java.lang.String` | yes      | —       | —           |
| `callId`       | `java.lang.String` | yes      | —       | —           |

## Returns

`boolean`

## Source

[`src/main/java/com/signalwire/sdk/agent/AgentBase.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java)

Line 647.
