---
slug: "/reference/ruby/signal-wire/data-map/expression"
title: "expression"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::DataMap#expression"
  parent: "SignalWire::DataMap"
  module: "SignalWire.DataMap"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/datamap/data_map.rb"
  visibility: "public"
---
# `expression`

Add an expression (pattern-matching rule).

## Signature

```ruby
def expression(test_value, pattern, output, nomatch_output: nil)
```

## Parameters

| Name              | Type                            | Required | Default | Description                                     |
| ----------------- | ------------------------------- | -------- | ------- | ----------------------------------------------- |
| `test_value`      | `String`                        | yes      | —       | template string to test, e.g. "${args.command}" |
| `pattern`         | `String \| Regexp`              | yes      | —       | regex pattern to match against                  |
| `output`          | `Swaig::FunctionResult \| Hash` | yes      | —       | result when pattern matches                     |
| `nomatch_output:` | —                               | no       | `nil`   | —                                               |

## Source

[`lib/signalwire/datamap/data_map.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/datamap/data_map.rb)

Line 107.
