---
slug: "/reference/ruby/signal-wire/contexts/gather-question/initialize"
title: "initialize"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Contexts::GatherQuestion#initialize"
  parent: "SignalWire::Contexts::GatherQuestion"
  module: "SignalWire.Contexts.GatherQuestion"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/contexts/context_builder.rb"
  visibility: "public"
---
# `initialize`

## Signature

```ruby
def initialize(key:, question:, type: 'string', confirm: false, prompt: nil, functions: nil)
```

## Parameters

| Name         | Type | Required | Default    | Description |
| ------------ | ---- | -------- | ---------- | ----------- |
| `key:`       | —    | yes      | —          | —           |
| `question:`  | —    | yes      | —          | —           |
| `type:`      | —    | no       | `'string'` | —           |
| `confirm:`   | —    | no       | `false`    | —           |
| `prompt:`    | —    | no       | `nil`      | —           |
| `functions:` | —    | no       | `nil`      | —           |

## Returns

`GatherQuestion` — a new instance of GatherQuestion

## Source

[`lib/signalwire/contexts/context_builder.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/contexts/context_builder.rb)

Line 31.
