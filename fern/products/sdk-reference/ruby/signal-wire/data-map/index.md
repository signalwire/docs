---
slug: "/reference/ruby/signal-wire/data-map"
title: "DataMap"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::DataMap"
  parent: "SignalWire"
  module: "SignalWire"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/datamap/data_map.rb"
  visibility: "public"
---
# `DataMap`

Fluent builder for server-side DataMap tools.

DataMap tools execute on SignalWire servers without requiring webhook
endpoints. This class provides a chainable API for building data\_map
configurations that become SWAIG function definitions.

All mutator methods return +self+ so calls can be chained:

dm = DataMap.new('get\_weather')
.purpose('Get current weather')
.parameter('location', 'string', 'City name', required: true)
.webhook('GET', 'https://api.weather.com/v1/current?q=${location}')
.output(Swaig::FunctionResult.new('Weather: ${response.current.temp\_f}F'))

## Signature

```ruby
class DataMap < Object
```

## Inheritance

**Extends:** `Object`

## Methods

- [`body`](/reference/ruby/signal-wire/data-map/body) — Set the request body for the most-recently-added webhook (POST / PUT).
- [`create_expression_tool`](/reference/ruby/signal-wire/data-map/create-expression-tool) — Build an expression-only tool (no HTTP calls).
- [`create_simple_api_tool`](/reference/ruby/signal-wire/data-map/create-simple-api-tool) — Build a simple API-calling tool in one shot.
- [`description`](/reference/ruby/signal-wire/data-map/description) — Alias for +purpose+. Sets the LLM-facing tool description. This string is read by the model to decide WHEN to call this tool. See +purpose+ for bad-vs-good examples.
- [`error_keys`](/reference/ruby/signal-wire/data-map/error-keys) — Set error keys on the most-recently-added webhook, or at the top level if no webhook has been added yet.
- [`expression`](/reference/ruby/signal-wire/data-map/expression) — Add an expression (pattern-matching rule).
- [`fallback_output`](/reference/ruby/signal-wire/data-map/fallback-output) — Set a fallback output used when all webhooks fail.
- [`foreach`](/reference/ruby/signal-wire/data-map/foreach) — Configure array processing on the most-recently-added webhook response.
- [`function_name`](/reference/ruby/signal-wire/data-map/function-name) — Returns the value of attribute function\_name.
- [`global_error_keys`](/reference/ruby/signal-wire/data-map/global-error-keys) — Set top-level error keys (applies to all webhooks).
- [`initialize`](/reference/ruby/signal-wire/data-map/initialize)
- [`output`](/reference/ruby/signal-wire/data-map/output) — Set the output result for the most-recently-added webhook.
- [`parameter`](/reference/ruby/signal-wire/data-map/parameter) — Add a typed parameter to the function signature — the +desc+ is LLM-FACING.
- [`params`](/reference/ruby/signal-wire/data-map/params) — Set request params for the most-recently-added webhook.
- [`purpose`](/reference/ruby/signal-wire/data-map/purpose) — Set the LLM-facing tool description (a.k.a. "purpose"). _PROMPT ENGINEERING_, not developer documentation.
- [`to_swaig_function`](/reference/ruby/signal-wire/data-map/to-swaig-function) — Serialize this DataMap into a complete SWAIG function definition Hash.
- [`webhook`](/reference/ruby/signal-wire/data-map/webhook) — Add a webhook (HTTP call) to the data\_map pipeline.
- [`webhook_expressions`](/reference/ruby/signal-wire/data-map/webhook-expressions) — Add expressions to run after the most-recently-added webhook completes.

## Source

[`lib/signalwire/datamap/data_map.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/datamap/data_map.rb)

Line 25.
