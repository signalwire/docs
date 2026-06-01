---
slug: "/reference/ruby/signal-wire/data-map/webhook"
title: "webhook"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::DataMap#webhook"
  parent: "SignalWire::DataMap"
  module: "SignalWire.DataMap"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/datamap/data_map.rb"
  visibility: "public"
---
# `webhook`

Add a webhook (HTTP call) to the data\_map pipeline.

## Signature

```ruby
def webhook(method, url, headers: nil, form_param: nil, input_args_as_params: false, require_args: nil)
```

## Parameters

| Name                    | Type     | Required | Default | Description                                          |
| ----------------------- | -------- | -------- | ------- | ---------------------------------------------------- |
| `method`                | `String` | yes      | —       | HTTP method (GET, POST, PUT, DELETE, etc.)           |
| `url`                   | `String` | yes      | —       | endpoint URL (may contain ${variable} substitutions) |
| `headers:`              | —        | no       | `nil`   | —                                                    |
| `form_param:`           | —        | no       | `nil`   | —                                                    |
| `input_args_as_params:` | —        | no       | `false` | —                                                    |
| `require_args:`         | —        | no       | `nil`   | —                                                    |

## Source

[`lib/signalwire/datamap/data_map.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/datamap/data_map.rb)

Line 134.
