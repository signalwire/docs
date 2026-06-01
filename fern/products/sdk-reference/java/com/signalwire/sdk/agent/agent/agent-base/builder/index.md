---
slug: "/reference/java/com/signalwire/sdk/agent/agent/agent-base/builder"
title: "Builder"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.agent.AgentBase.Builder"
  parent: "com.signalwire.sdk.agent.AgentBase"
  module: "com.signalwire.sdk.agent"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java"
  visibility: "public"
---
# `Builder`

**Modifiers:** `static`

## Signature

```java
public static class Builder
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/builder/init)
- [`authPassword`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/builder/auth-password)
- [`authUser`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/builder/auth-user)
- [`autoAnswer`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/builder/auto-answer)
- [`build`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/builder/build)
- [`envProvider`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/builder/env-provider) — Supply an alternative `EnvProvider` for the build-time env var reads (`SWML_BASIC_AUTH_USER`, `SWML_BASIC_AUTH_PASSWORD`, `SWML_PROXY_URL_BASE`).
- [`host`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/builder/host)
- [`maxDuration`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/builder/max-duration)
- [`name`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/builder/name)
- [`port`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/builder/port)
- [`recordCall`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/builder/record-call)
- [`recordFormat`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/builder/record-format)
- [`recordStereo`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/builder/record-stereo)
- [`route`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/builder/route)
- [`signingKey`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/builder/signing-key) — Configure the customer's SignalWire Signing Key from the Dashboard (API Credentials \u2192 Signing Key).
- [`trustProxyForSignature`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/builder/trust-proxy-for-signature) — When set to `true`, the webhook URL reconstruction honors `X-Forwarded-Proto` / `X-Forwarded-Host` headers during signature validation.

## Source

[`src/main/java/com/signalwire/sdk/agent/AgentBase.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java)

Line 162.
