---
slug: "/reference/ruby/signal-wire/agent-base/extract-sip-username-from-request"
title: "extract_sip_username_from_request"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::AgentBase.extract_sip_username_from_request"
  parent: "SignalWire::AgentBase"
  module: "SignalWire.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb"
  visibility: "public"
---
# `extract_sip_username_from_request`

Extract the SIP username from request body data.

Looks for SIP URI in common request body fields
(e.g., "to", "from", "sip\_uri", "call.to", "call.from").

## Signature

```ruby
def extract_sip_username_from_request(request_data)
```

## Parameters

| Name           | Type   | Required | Default | Description             |
| -------------- | ------ | -------- | ------- | ----------------------- |
| `request_data` | `Hash` | yes      | —       | the parsed request body |

## Returns

`String | nil` — the extracted SIP username, or nil

## Source

[`lib/signalwire/agent/agent_base.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb)

Line 1249.
