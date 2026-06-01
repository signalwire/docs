---
slug: "/reference/ruby/signal-wire/prefabs/concierge/initialize"
title: "initialize"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Prefabs::Concierge#initialize"
  parent: "SignalWire::Prefabs::Concierge"
  module: "SignalWire.Prefabs.Concierge"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/prefabs/concierge.rb"
  visibility: "public"
---
# `initialize`

## Signature

```ruby
def initialize(venue_name:, services:, amenities:, hours_of_operation: nil, special_instructions: nil, welcome_message: nil, name: 'concierge', route: '/concierge', **_opts)
```

## Parameters

| Name                    | Type | Required | Default        | Description |
| ----------------------- | ---- | -------- | -------------- | ----------- |
| `venue_name:`           | —    | yes      | —              | —           |
| `services:`             | —    | yes      | —              | —           |
| `amenities:`            | —    | yes      | —              | —           |
| `hours_of_operation:`   | —    | no       | `nil`          | —           |
| `special_instructions:` | —    | no       | `nil`          | —           |
| `welcome_message:`      | —    | no       | `nil`          | —           |
| `name:`                 | —    | no       | `'concierge'`  | —           |
| `route:`                | —    | no       | `'/concierge'` | —           |
| `..._opts`              | —    | no       | —              | —           |

## Returns

`Concierge` — a new instance of Concierge

## Source

[`lib/signalwire/prefabs/concierge.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/prefabs/concierge.rb)

Line 23.
