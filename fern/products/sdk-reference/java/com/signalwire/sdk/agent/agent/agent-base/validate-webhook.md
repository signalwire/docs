---
slug: "/reference/java/com/signalwire/sdk/agent/agent/agent-base/validate-webhook"
title: "validateWebhook"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.agent.AgentBase.validateWebhook"
  parent: "com.signalwire.sdk.agent.AgentBase"
  module: "com.signalwire.sdk.agent.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java"
  visibility: "public"
---
# `validateWebhook`

Public delegate around `#validateSignedWebhook` so external
front-doors (e.g.

`com.signalwire.sdk.server.AgentServer`, a
Lambda adapter, etc.) can run the same logic the in-process HTTP
server does. Mirrors the no-op-when-unset behavior described in
porting-sdk/webhooks.md.

## Signature

```java
public boolean validateWebhook(
    com.sun.net.httpserver.HttpExchange exchange,
    java.lang.String rawBody
)
```

## Parameters

| Name       | Type                                  | Required | Default | Description               |
| ---------- | ------------------------------------- | -------- | ------- | ------------------------- |
| `exchange` | `com.sun.net.httpserver.HttpExchange` | yes      | —       | the inbound HttpExchange. |
| `rawBody`  | `java.lang.String`                    | yes      | —       | raw UTF-8 body string.    |

## Returns

`boolean` — `true` when validation passes (or no key is configured).

## Source

[`src/main/java/com/signalwire/sdk/agent/AgentBase.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java)

Line 1373.
