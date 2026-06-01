---
slug: "/reference/ruby/signal-wire/agent-server/app"
title: "app"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::AgentServer#app"
  parent: "SignalWire::AgentServer"
  module: "SignalWire.AgentServer"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/server/agent_server.rb"
  visibility: "public"
---
# `app`

Public Rack application — Python parity: `server.app` exposes
the underlying FastAPI instance. Ruby exposes the cached Rack
app (a Proc) so callers can mount it on their own server or
pass it to Rack-compatible test harnesses.

## Signature

```ruby
def app
```

## Source

[`lib/signalwire/server/agent_server.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/server/agent_server.rb)

Line 27.
