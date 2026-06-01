---
slug: "/reference/ruby/signal-wire/agent-server/register"
title: "register"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::AgentServer#register"
  parent: "SignalWire::AgentServer"
  module: "SignalWire.AgentServer"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/server/agent_server.rb"
  visibility: "public"
---
# `register`

Register an agent at a given route.

## Signature

```ruby
def register(agent, route: nil)
```

## Parameters

| Name     | Type     | Required | Default | Description                                |
| -------- | -------- | -------- | ------- | ------------------------------------------ |
| `agent`  | `Object` | yes      | —       | an agent object (e.g. AgentBase or prefab) |
| `route:` | —        | no       | `nil`   | —                                          |

## Source

[`lib/signalwire/server/agent_server.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/server/agent_server.rb)

Line 126.
