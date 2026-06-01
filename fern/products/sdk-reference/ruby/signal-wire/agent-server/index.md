---
slug: "/reference/ruby/signal-wire/agent-server"
title: "AgentServer"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::AgentServer"
  parent: "SignalWire"
  module: "SignalWire"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/server/agent_server.rb"
  visibility: "public"
---
# `AgentServer`

Multi-agent hosting on a single Rack application.

server = AgentServer.new(host: '0.0.0.0', port: 3000)
server.register(my\_agent, route: '/agent1')
server.register(my\_agent2, route: '/agent2')
server.run

## Signature

```ruby
class AgentServer < Object
```

## Inheritance

**Extends:** `Object`

## Constants

| Name                      | Type                                                                                                         | Required | Default | Description                                        |
| ------------------------- | ------------------------------------------------------------------------------------------------------------ | -------- | ------- | -------------------------------------------------- |
| `MIME_TYPES`              | `MIME_TYPES = {
  '.html' => 'text/html',
  '.htm'  => 'text/html',
  '.css'  => 'text/css',
 `              | yes      | —       | MIME types for static file serving.                |
| `STATIC_SECURITY_HEADERS` | `STATIC_SECURITY_HEADERS = {
  'x-content-type-options' => 'nosniff',
  'x-frame-options'        => 'DENY',` | yes      | —       | Security headers applied to static file responses. |

## Methods

- [`app`](/reference/ruby/signal-wire/agent-server/app) — Public Rack application — Python parity: `server.app` exposes the underlying FastAPI instance. Ruby exposes the cached Rack app (a Proc) so callers can mount it on their own server or pass it to Rack-compatible test harnesses.
- [`get_agent`](/reference/ruby/signal-wire/agent-server/get-agent) — Get a specific agent by route.
- [`get_agents`](/reference/ruby/signal-wire/agent-server/get-agents) — Get all registered agents.
- [`host`](/reference/ruby/signal-wire/agent-server/host) — Returns the value of attribute host.
- [`initialize`](/reference/ruby/signal-wire/agent-server/initialize) — Construct an AgentServer.
- [`log_level`](/reference/ruby/signal-wire/agent-server/log-level) — Returns the value of attribute log\_level.
- [`logger`](/reference/ruby/signal-wire/agent-server/logger) — Returns the value of attribute logger.
- [`port`](/reference/ruby/signal-wire/agent-server/port) — Returns the value of attribute port.
- [`rack_app`](/reference/ruby/signal-wire/agent-server/rack-app) — Build a Rack application that routes requests to the appropriate agent.
- [`register`](/reference/ruby/signal-wire/agent-server/register) — Register an agent at a given route.
- [`register_sip_username`](/reference/ruby/signal-wire/agent-server/register-sip-username) — Register a SIP username mapping to a route.
- [`run`](/reference/ruby/signal-wire/agent-server/run) — Universal run method — mirrors Python's `AgentServer.run(event=None, context=None, host=None, port=None)`.
- [`serve_static_files`](/reference/ruby/signal-wire/agent-server/serve-static-files) — Serve static files from a directory at a given route.
- [`setup_sip_routing`](/reference/ruby/signal-wire/agent-server/setup-sip-routing) — Set up SIP-based routing.
- [`unregister`](/reference/ruby/signal-wire/agent-server/unregister) — Unregister an agent by route.

## Source

[`lib/signalwire/server/agent_server.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/server/agent_server.rb)

Line 20.
