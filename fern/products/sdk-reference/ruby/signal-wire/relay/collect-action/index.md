---
slug: "/reference/ruby/signal-wire/relay/collect-action"
title: "CollectAction"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::Relay::CollectAction"
  parent: "SignalWire::Relay"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/action.rb"
  visibility: "public"
---
# `CollectAction`

Handle for play\_and\_collect or standalone collect.

## Signature

```ruby
class CollectAction < SignalWire::Relay::Action
```

## Inheritance

**Extends:** [SignalWire::Relay::Action](/reference/ruby/signal-wire/relay/action)

## Methods

- [`_check_event`](/reference/ruby/signal-wire/relay/collect-action/check-event) — play\_and\_collect shares a control\_id across play and collect phases. Only resolve on collect events, not play events.
- [`initialize`](/reference/ruby/signal-wire/relay/collect-action/initialize)
- [`start_input_timers`](/reference/ruby/signal-wire/relay/collect-action/start-input-timers)
- [`stop`](/reference/ruby/signal-wire/relay/collect-action/stop)
- [`volume`](/reference/ruby/signal-wire/relay/collect-action/volume)

## Source

[`lib/signalwire/relay/action.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/action.rb)

Line 164.
