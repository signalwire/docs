---
slug: "/reference/ruby/signal-wire/contexts/context/add-step"
title: "add_step"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Contexts::Context#add_step"
  parent: "SignalWire::Contexts::Context"
  module: "SignalWire.Contexts.Context"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/contexts/context_builder.rb"
  visibility: "public"
---
# `add_step`

Add a new step. Returns the new Step object (not self).

Python parity: `Context.add_step(name, *, task=None, bullets=None,
criteria=None, functions=None, valid_steps=None)`. The optional
keyword arguments give a one-call configuration shortcut:

ctx.add\_step("greet",
task: "Greet the caller",
bullets: \["Say hi", "Ask how can I help"],
criteria: "User has been greeted",
functions: \["weather"],
valid\_steps: \["help"])

Without the optional args this stays the bare `add_step("greet")`
form that returns a Step for further fluent configuration.

## Signature

```ruby
def add_step(name, task: nil, bullets: nil, criteria: nil, functions: nil, valid_steps: nil)
```

## Parameters

| Name           | Type | Required | Default | Description |
| -------------- | ---- | -------- | ------- | ----------- |
| `name`         | —    | yes      | —       | —           |
| `task:`        | —    | no       | `nil`   | —           |
| `bullets:`     | —    | no       | `nil`   | —           |
| `criteria:`    | —    | no       | `nil`   | —           |
| `functions:`   | —    | no       | `nil`   | —           |
| `valid_steps:` | —    | no       | `nil`   | —           |

## Throws

- `ArgumentError`

## Source

[`lib/signalwire/contexts/context_builder.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/contexts/context_builder.rb)

Line 388.
