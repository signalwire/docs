---
slug: "/reference/ruby/signal-wire/utils/schema-utils/initialize"
title: "initialize"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Utils::SchemaUtils#initialize"
  parent: "SignalWire::Utils::SchemaUtils"
  module: "SignalWire.Utils.SchemaUtils"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/utils/schema_utils.rb"
  visibility: "public"
---
# `initialize`

Construct a SchemaUtils.

## Signature

```ruby
def initialize(schema_path = nil, schema_validation = true)
```

## Parameters

| Name                | Type            | Required | Default | Description                                                                              |
| ------------------- | --------------- | -------- | ------- | ---------------------------------------------------------------------------------------- |
| `schema_path`       | `String \| nil` | no       | `nil`   | path to a schema.json file; nil for the bundled copy at lib/signalwire/swml/schema.json. |
| `schema_validation` | `Boolean`       | no       | `true`  | enable/disable schema validation.                                                        |

## Returns

`SchemaUtils` — a new instance of SchemaUtils

## Source

[`lib/signalwire/utils/schema_utils.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/utils/schema_utils.rb)

Line 58.
