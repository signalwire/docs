---
slug: "/reference/ruby/signal-wire/swml/service/swaig-pre-dispatch"
title: "swaig_pre_dispatch"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::SWML::Service#swaig_pre_dispatch"
  parent: "SignalWire::SWML::Service"
  module: "SignalWire.SWML.Service"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swml/service.rb"
  visibility: "public"
---
# `swaig_pre_dispatch`

Extension point: invoked between argument parsing and function
dispatch on POST /swaig. Returns \[target, short\_circuit]. If
short\_circuit is non-nil, it's returned as the SWAIG response
without calling on\_function\_call. AgentBase overrides to add
session-token validation and ephemeral dynamic-config copies.

## Signature

```ruby
def swaig_pre_dispatch(_request_data, _func_name, _env)
```

## Parameters

| Name            | Type | Required | Default | Description |
| --------------- | ---- | -------- | ------- | ----------- |
| `_request_data` | —    | yes      | —       | —           |
| `_func_name`    | —    | yes      | —       | —           |
| `_env`          | —    | yes      | —       | —           |

## Source

[`lib/signalwire/swml/service.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swml/service.rb)

Line 172.
