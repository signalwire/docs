---
slug: "/reference/php/signal-wire/server/server/agent-server"
title: "AgentServer"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\Server\\AgentServer"
  parent: "SignalWire\\Server"
  module: "SignalWire.Server"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Server/AgentServer.php"
---
# `AgentServer`

## Signature

```php
class AgentServer
```

## Methods

- [`__construct`](/reference/php/signal-wire/server/server/agent-server/construct)
- [`getAgent`](/reference/php/signal-wire/server/server/agent-server/get-agent) — Get an agent by route.
- [`getAgents`](/reference/php/signal-wire/server/server/agent-server/get-agents) — Get all registered routes (sorted).
- [`getHost`](/reference/php/signal-wire/server/server/agent-server/get-host)
- [`getPort`](/reference/php/signal-wire/server/server/agent-server/get-port)
- [`getSipAutoMap`](/reference/php/signal-wire/server/server/agent-server/get-sip-auto-map)
- [`getSipRoute`](/reference/php/signal-wire/server/server/agent-server/get-sip-route)
- [`getSipUsernameMapping`](/reference/php/signal-wire/server/server/agent-server/get-sip-username-mapping) — Get the SIP username mapping.
- [`handleRequest`](/reference/php/signal-wire/server/server/agent-server/handle-request) — Handle an HTTP request and return \[status, headers, body].
- [`isSipRoutingEnabled`](/reference/php/signal-wire/server/server/agent-server/is-sip-routing-enabled) — Check if SIP routing is enabled.
- [`register`](/reference/php/signal-wire/server/server/agent-server/register) — Register an agent at a route.
- [`registerSipUsername`](/reference/php/signal-wire/server/server/agent-server/register-sip-username) — Map a SIP username to a route.
- [`run`](/reference/php/signal-wire/server/server/agent-server/run) — Start the server (blocking).
- [`serve`](/reference/php/signal-wire/server/server/agent-server/serve) — Start the server using PHP's built-in server (blocking).
- [`serveStatic`](/reference/php/signal-wire/server/server/agent-server/serve-static) — Serve static files from a directory under a URL prefix.
- [`setupSipRouting`](/reference/php/signal-wire/server/server/agent-server/setup-sip-routing) — Set up central SIP-based routing for the server.
- [`unregister`](/reference/php/signal-wire/server/server/agent-server/unregister) — Unregister an agent from a route.

## Source

[`/src/src/SignalWire/Server/AgentServer.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Server/AgentServer.php)

Line 10.
