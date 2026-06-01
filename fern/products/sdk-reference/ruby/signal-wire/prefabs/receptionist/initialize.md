---
slug: "/reference/ruby/signal-wire/prefabs/receptionist/initialize"
title: "initialize"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Prefabs::Receptionist#initialize"
  parent: "SignalWire::Prefabs::Receptionist"
  module: "SignalWire.Prefabs.Receptionist"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/prefabs/receptionist.rb"
  visibility: "public"
---
# `initialize`

## Signature

```ruby
def initialize(departments:, name: 'receptionist', route: '/receptionist', greeting: 'Thank you for calling. How can I help you today?', **_opts)
```

## Parameters

| Name           | Type | Required | Default                                              | Description |
| -------------- | ---- | -------- | ---------------------------------------------------- | ----------- |
| `departments:` | —    | yes      | —                                                    | —           |
| `name:`        | —    | no       | `'receptionist'`                                     | —           |
| `route:`       | —    | no       | `'/receptionist'`                                    | —           |
| `greeting:`    | —    | no       | `'Thank you for calling. How can I help you today?'` | —           |
| `..._opts`     | —    | no       | —                                                    | —           |

## Returns

`Receptionist` — a new instance of Receptionist

## Throws

- `ArgumentError`

## Source

[`lib/signalwire/prefabs/receptionist.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/prefabs/receptionist.rb)

Line 24.
