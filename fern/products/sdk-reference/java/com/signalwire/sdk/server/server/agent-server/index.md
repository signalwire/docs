---
slug: "/reference/java/com/signalwire/sdk/server/server/agent-server"
title: "AgentServer"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.server.AgentServer"
  parent: "com.signalwire.sdk.server"
  module: "com.signalwire.sdk.server"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/server/AgentServer.java"
  visibility: "public"
---
# `AgentServer`

Multi-agent hosting server.

Registers multiple agents on different routes and dispatches requests accordingly.

## Signature

```java
public class AgentServer
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/server/server/agent-server/init)
- [`getAgent`](/reference/java/com/signalwire/sdk/server/server/agent-server/get-agent) — Get agent for a route.
- [`getRoutes`](/reference/java/com/signalwire/sdk/server/server/agent-server/get-routes) — List all registered routes.
- [`getSipRoute`](/reference/java/com/signalwire/sdk/server/server/agent-server/get-sip-route) — Get route for a SIP username.
- [`register`](/reference/java/com/signalwire/sdk/server/server/agent-server/register) — Register an agent at a specific route.
- [`registerSipRoute`](/reference/java/com/signalwire/sdk/server/server/agent-server/register-sip-route) — Register a SIP username to route to a specific agent.
- [`run`](/reference/java/com/signalwire/sdk/server/server/agent-server/run) — Start the multi-agent server.
- [`serveStaticFiles`](/reference/java/com/signalwire/sdk/server/server/agent-server/serve-static-files) — Serve static files from a directory at a specific route.
- [`setStaticFilesDir`](/reference/java/com/signalwire/sdk/server/server/agent-server/set-static-files-dir) — Set directory for serving static files at /static route.
- [`stop`](/reference/java/com/signalwire/sdk/server/server/agent-server/stop) — Stop the server.
- [`unregister`](/reference/java/com/signalwire/sdk/server/server/agent-server/unregister) — Unregister an agent from a route.

## Source

[`src/main/java/com/signalwire/sdk/server/AgentServer.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/server/AgentServer.java)

Line 29.
