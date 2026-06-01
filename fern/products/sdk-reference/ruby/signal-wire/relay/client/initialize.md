---
slug: "/reference/ruby/signal-wire/relay/client/initialize"
title: "initialize"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Relay::Client#initialize"
  parent: "SignalWire::Relay::Client"
  module: "SignalWire.Relay.Client"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/client.rb"
  visibility: "public"
---
# `initialize`

Python parity:
`RelayClient(project=None, token=None, jwt_token=None,
host=None, contexts=None, max_active_calls=None)`. Ruby v1
accepted `space:` for the same purpose; both keyword names
are honoured for backwards compat. `host` is the canonical
Python name and now drives the WebSocket endpoint.

## Signature

```ruby
def initialize(project: nil, token: nil, jwt_token: nil, host: nil, contexts: ['default'], max_active_calls: nil, space: nil)
```

## Parameters

| Name                | Type | Required | Default       | Description |
| ------------------- | ---- | -------- | ------------- | ----------- |
| `project:`          | —    | no       | `nil`         | —           |
| `token:`            | —    | no       | `nil`         | —           |
| `jwt_token:`        | —    | no       | `nil`         | —           |
| `host:`             | —    | no       | `nil`         | —           |
| `contexts:`         | —    | no       | `['default']` | —           |
| `max_active_calls:` | —    | no       | `nil`         | —           |
| `space:`            | —    | no       | `nil`         | —           |

## Returns

`Client` — a new instance of Client

## Throws

- `ArgumentError`

## Source

[`lib/signalwire/relay/client.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/client.rb)

Line 56.
