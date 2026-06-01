---
slug: "/reference/java/com/signalwire/sdk/agent/agent/agent-base/detect-serverless-base-url"
title: "detectServerlessBaseUrl"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.agent.AgentBase.detectServerlessBaseUrl"
  parent: "com.signalwire.sdk.agent.AgentBase"
  module: "com.signalwire.sdk.agent.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java"
  visibility: "public"
---
# `detectServerlessBaseUrl`

Resolve a base URL from environment variables alone (proxy or
serverless platform).

Returns `null` if no suitable env
vars are set.

 <p>This is used by both the HTTP server path (when no proxy is
 manually set) and by non-HTTP transports such as the Lambda
 adapter, so they agree on the origin to use for webhook URLs.

 <p>The returned origin is a bare scheme + host(:port) with NO
 route appended \u2014 callers must layer their route on top via
 `#buildWebhookUrl(String)` and the post-prompt URL builder.
 This matters: it is how we guarantee that the agent's route
 always appears in webhook URLs regardless of which source
 produced the base.

## Signature

**Overload 1**

```java
public java.lang.String detectServerlessBaseUrl()
```

**Overload 2**

```java
public java.lang.String detectServerlessBaseUrl(
    com.signalwire.sdk.runtime.EnvProvider env
)
```

## Parameters (Overload 2)

| Name  | Type                                     | Required | Default | Description                  |
| ----- | ---------------------------------------- | -------- | ------- | ---------------------------- |
| `env` | `com.signalwire.sdk.runtime.EnvProvider` | yes      | —       | environment variable source. |

## Returns (Overload 1)

`java.lang.String` — base URL, or `null`.

## Returns (Overload 2)

`java.lang.String` — base URL, or `null`.

## Source

[`src/main/java/com/signalwire/sdk/agent/AgentBase.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java)

Line 1826.
