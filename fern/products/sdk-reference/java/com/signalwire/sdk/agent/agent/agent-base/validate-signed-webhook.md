---
slug: "/reference/java/com/signalwire/sdk/agent/agent/agent-base/validate-signed-webhook"
title: "validateSignedWebhook"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.agent.AgentBase.validateSignedWebhook"
  parent: "com.signalwire.sdk.agent.AgentBase"
  module: "com.signalwire.sdk.agent.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java"
  visibility: "protected"
---
# `validateSignedWebhook`

Override the `Service` hook to enforce SignalWire webhook
signature validation when a `#signingKey` is configured.

Returns
`true` (no-op) when `signingKey` is unset; per
porting-sdk/webhooks.md, the AgentBase MUST NOT silently reject
unsigned requests when no key is configured (a prominent startup
warning is the documented behavior instead \u2014 emitted in
`Builder#build()`).

 <p>The signature header is read from `X-SignalWire-Signature`
 (or its `X-Twilio-Signature` legacy alias). The URL is
 reconstructed from proxy headers / `SWML_PROXY_URL_BASE` /
 the request itself, and the validator is called with the raw body
 bytes the caller already captured.

**Decorators:** `@Override`

## Signature

```java
protected boolean validateSignedWebhook(
    com.sun.net.httpserver.HttpExchange exchange,
    java.lang.String rawBody
)
```

## Parameters

| Name       | Type                                  | Required | Default | Description                                                        |
| ---------- | ------------------------------------- | -------- | ------- | ------------------------------------------------------------------ |
| `exchange` | `com.sun.net.httpserver.HttpExchange` | yes      | —       | the inbound HttpExchange.                                          |
| `rawBody`  | `java.lang.String`                    | yes      | —       | the raw UTF-8 body string that was already read from the exchange. |

## Returns

`boolean` — `true` when validation passes (or no key is configured).

## Source

[`src/main/java/com/signalwire/sdk/agent/AgentBase.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java)

Line 1397.
