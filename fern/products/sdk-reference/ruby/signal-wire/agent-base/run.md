---
slug: "/reference/ruby/signal-wire/agent-base/run"
title: "run"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::AgentBase#run"
  parent: "SignalWire::AgentBase"
  module: "SignalWire.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb"
  visibility: "public"
---
# `run`

Universal run method — mirrors Python's
`WebMixin.run(event=None, context=None, force_mode=None,
host=None, port=None)`.

Detects execution mode (server / lambda / cgi) and routes
accordingly. `force_mode` overrides auto-detection.

## Signature

```ruby
def run(event: nil, context: nil, force_mode: nil, host: nil, port: nil)
```

## Parameters

| Name          | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `event:`      | —    | no       | `nil`   | —           |
| `context:`    | —    | no       | `nil`   | —           |
| `force_mode:` | —    | no       | `nil`   | —           |
| `host:`       | —    | no       | `nil`   | —           |
| `port:`       | —    | no       | `nil`   | —           |

## Source

[`lib/signalwire/agent/agent_base.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb)

Line 1452.
