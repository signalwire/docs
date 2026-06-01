---
slug: "/reference/ruby/signal-wire/agent-base/add-mcp-server"
title: "add_mcp_server"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::AgentBase#add_mcp_server"
  parent: "SignalWire::AgentBase"
  module: "SignalWire.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb"
  visibility: "public"
---
# `add_mcp_server`

Add an external MCP server for tool discovery and invocation.

## Signature

```ruby
def add_mcp_server(url, headers: nil, resources: false, resource_vars: nil)
```

## Parameters

| Name             | Type     | Required | Default | Description                  |
| ---------------- | -------- | -------- | ------- | ---------------------------- |
| `url`            | `String` | yes      | —       | MCP server HTTP endpoint URL |
| `headers:`       | —        | no       | `nil`   | —                            |
| `resources:`     | —        | no       | `false` | —                            |
| `resource_vars:` | —        | no       | `nil`   | —                            |

## Returns

`self`

## Source

[`lib/signalwire/agent/agent_base.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb)

Line 1280.
