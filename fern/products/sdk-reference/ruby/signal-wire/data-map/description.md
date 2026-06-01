---
slug: "/reference/ruby/signal-wire/data-map/description"
title: "description"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::DataMap#description"
  parent: "SignalWire::DataMap"
  module: "SignalWire.DataMap"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/datamap/data_map.rb"
  visibility: "public"
---
# `description`

Alias for +purpose+. Sets the LLM-facing tool description. This
string is read by the model to decide WHEN to call this tool.
See +purpose+ for bad-vs-good examples.

## Signature

```ruby
def description(desc)
```

## Parameters

| Name   | Type | Required | Default | Description |
| ------ | ---- | -------- | ------- | ----------- |
| `desc` | —    | yes      | —       | —           |

## Source

[`lib/signalwire/datamap/data_map.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/datamap/data_map.rb)

Line 64.
