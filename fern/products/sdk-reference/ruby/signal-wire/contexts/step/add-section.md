---
slug: "/reference/ruby/signal-wire/contexts/step/add-section"
title: "add_section"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Contexts::Step#add_section"
  parent: "SignalWire::Contexts::Step"
  module: "SignalWire.Contexts.Step"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/contexts/context_builder.rb"
  visibility: "public"
---
# `add_section`

Add a POM section (title + body). Mutually exclusive with +set\_text+.

## Signature

```ruby
def add_section(title, body)
```

## Parameters

| Name    | Type | Required | Default | Description |
| ------- | ---- | -------- | ------- | ----------- |
| `title` | —    | yes      | —       | —           |
| `body`  | —    | yes      | —       | —           |

## Throws

- `ArgumentError`

## Source

[`lib/signalwire/contexts/context_builder.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/contexts/context_builder.rb)

Line 123.
