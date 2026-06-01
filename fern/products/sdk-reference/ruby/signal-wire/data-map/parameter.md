---
slug: "/reference/ruby/signal-wire/data-map/parameter"
title: "parameter"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::DataMap#parameter"
  parent: "SignalWire::DataMap"
  module: "SignalWire.DataMap"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/datamap/data_map.rb"
  visibility: "public"
---
# `parameter`

Add a typed parameter to the function signature — the +desc+ is
LLM-FACING.

Each parameter description is rendered into the OpenAI tool
schema under +parameters.properties.<name>.description+ and sent
to the model. The model uses it to decide HOW to fill in the
argument from user speech. It is prompt engineering, not
developer FYI.

\== Bad vs good

BAD : .parameter("city", "string", "the city")
GOOD: .parameter("city", "string",
"The name of the city to get weather for, e.g. "   \
"'San Francisco'. Ask the user if they did not "    \
"provide one. Include the state or country if the " \
"city name is ambiguous.")

## Signature

```ruby
def parameter(name, type, desc, required: false, enum: nil)
```

## Parameters

| Name        | Type     | Required | Default | Description                                                                                                     |
| ----------- | -------- | -------- | ------- | --------------------------------------------------------------------------------------------------------------- |
| `name`      | `String` | yes      | —       | —                                                                                                               |
| `type`      | `String` | yes      | —       | JSON-Schema type (string, number, boolean, array, object)                                                       |
| `desc`      | `String` | yes      | —       | LLM-facing prompt-engineering description telling the model how to extract this value from the user's utterance |
| `required:` | —        | no       | `false` | —                                                                                                               |
| `enum:`     | —        | no       | `nil`   | —                                                                                                               |

## Source

[`lib/signalwire/datamap/data_map.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/datamap/data_map.rb)

Line 93.
