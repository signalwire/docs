---
slug: "/reference/ruby/signal-wire/relay/relay-event"
title: "RelayEvent"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::Relay::RelayEvent"
  parent: "SignalWire::Relay"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/relay_event.rb"
  visibility: "public"
---
# `RelayEvent`

Base event wrapper for raw signalwire.event payloads.
Subclasses provide typed accessors for specific event types.

## Signature

```ruby
class RelayEvent < Object
```

## Inheritance

**Extends:** `Object`

## Methods

- [`call_id`](/reference/ruby/signal-wire/relay/relay-event/call-id) — Returns the value of attribute call\_id.
- [`event_type`](/reference/ruby/signal-wire/relay/relay-event/event-type) — Returns the value of attribute event\_type.
- [`from_payload`](/reference/ruby/signal-wire/relay/relay-event/from-payload)
- [`initialize`](/reference/ruby/signal-wire/relay/relay-event/initialize)
- [`params`](/reference/ruby/signal-wire/relay/relay-event/params) — Returns the value of attribute params.
- [`timestamp`](/reference/ruby/signal-wire/relay/relay-event/timestamp) — Returns the value of attribute timestamp.

## Source

[`lib/signalwire/relay/relay_event.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/relay_event.rb)

Line 7.
