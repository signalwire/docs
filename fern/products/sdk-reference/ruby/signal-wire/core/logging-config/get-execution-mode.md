---
slug: "/reference/ruby/signal-wire/core/logging-config/get-execution-mode"
title: "get_execution_mode"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Core::LoggingConfig.get_execution_mode"
  parent: "SignalWire::Core::LoggingConfig"
  module: "SignalWire.Core.LoggingConfig"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/core/logging_config.rb"
  visibility: "public"
---
# `get_execution_mode`

Detect the SDK's deployment environment based on well-known
environment variables.

## Signature

```ruby
def get_execution_mode
```

## Returns

`String` — one of 'cgi', 'lambda', 'google\_cloud\_function', 'azure\_function', or 'server'.

## Source

[`lib/signalwire/core/logging_config.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/core/logging_config.rb)

Line 28.
