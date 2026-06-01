---
slug: "/reference/ruby/signal-wire/agent-base/agent-security-headers-middleware"
title: "AgentSecurityHeadersMiddleware"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::AgentBase::AgentSecurityHeadersMiddleware"
  parent: "SignalWire::AgentBase"
  module: "SignalWire.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb"
  visibility: "public"
---
# `AgentSecurityHeadersMiddleware`

\==================================================================
Rack Middleware
===============

## Signature

```ruby
class AgentSecurityHeadersMiddleware < Object
```

## Inheritance

**Extends:** `Object`

## Constants

| Name      | Type                                                                                         | Required | Default | Description |
| --------- | -------------------------------------------------------------------------------------------- | -------- | ------- | ----------- |
| `HEADERS` | `HEADERS = {
  'x-content-type-options' => 'nosniff',
  'x-frame-options'        => 'DENY',` | yes      | —       | —           |

## Methods

- [`call`](/reference/ruby/signal-wire/agent-base/agent-security-headers-middleware/call)
- [`initialize`](/reference/ruby/signal-wire/agent-base/agent-security-headers-middleware/initialize)

## Source

[`lib/signalwire/agent/agent_base.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb)

Line 2062.
