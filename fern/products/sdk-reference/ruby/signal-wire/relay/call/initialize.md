---
slug: "/reference/ruby/signal-wire/relay/call/initialize"
title: "initialize"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Relay::Call#initialize"
  parent: "SignalWire::Relay::Call"
  module: "SignalWire.Relay.Call"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/call.rb"
  visibility: "public"
---
# `initialize`

## Signature

```ruby
def initialize(client, call_id:, node_id:, project_id: '', context: '', tag: '', direction: '', device: {}, state: '', segment_id: '')
```

## Parameters

| Name          | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `client`      | —    | yes      | —       | —           |
| `call_id:`    | —    | yes      | —       | —           |
| `node_id:`    | —    | yes      | —       | —           |
| `project_id:` | —    | no       | `''`    | —           |
| `context:`    | —    | no       | `''`    | —           |
| `tag:`        | —    | no       | `''`    | —           |
| `direction:`  | —    | no       | `''`    | —           |
| `device:`     | —    | no       | `{}`    | —           |
| `state:`      | —    | no       | `''`    | —           |
| `segment_id:` | —    | no       | `''`    | —           |

## Returns

`Call` — a new instance of Call

## Source

[`lib/signalwire/relay/call.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/call.rb)

Line 16.
