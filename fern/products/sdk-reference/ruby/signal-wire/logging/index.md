---
slug: "/reference/ruby/signal-wire/logging"
title: "Logging"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "module"
  language: "ruby"
  qualified_name: "SignalWire::Logging"
  parent: "SignalWire"
  module: "SignalWire"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/logging.rb"
  visibility: "public"
---
# `Logging`

## Signature

```ruby
module Logging
```

## Constants

| Name     | Type                                                               | Required | Default | Description |
| -------- | ------------------------------------------------------------------ | -------- | ------- | ----------- |
| `LEVELS` | `LEVELS = { debug: 0, info: 1, warn: 2, error: 3, off: 4 }.freeze` | yes      | —       | —           |

## Methods

- [`global_level`](/reference/ruby/signal-wire/logging/global-level) — Returns the current global log level, derived from: 1. SIGNALWIRE\_LOG\_MODE=off -> :off (suppresses everything) 2. SIGNALWIRE\_LOG\_LEVEL env -> the named level 3. Default -> :info
- [`global_level=`](/reference/ruby/signal-wire/logging/global-level__2)
- [`logger`](/reference/ruby/signal-wire/logging/logger) — Convenience factory
- [`reset!`](/reference/ruby/signal-wire/logging/reset)
- [`suppressed?`](/reference/ruby/signal-wire/logging/suppressed)

## Classes

- [`Logger`](/reference/ruby/signal-wire/logging/logger) — -------------------------------------------------------------------

## Source

[`lib/signalwire/logging.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/logging.rb)

Line 4.
