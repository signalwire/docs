---
slug: "/reference/ruby/signal-wire/relay/message"
title: "Message"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::Relay::Message"
  parent: "SignalWire::Relay"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/message.rb"
  visibility: "public"
---
# `Message`

Represents a single SMS/MMS message.

For outbound messages, use message.wait to block until a terminal state
(delivered, undelivered, failed) is reached.

## Signature

```ruby
class Message < Object
```

## Inheritance

**Extends:** `Object`

## Methods

- [`_dispatch_event`](/reference/ruby/signal-wire/relay/message/dispatch-event) — Handle a messaging.state event for this message.
- [`_set_on_completed`](/reference/ruby/signal-wire/relay/message/set-on-completed) — Set the on\_completed callback from options.
- [`body`](/reference/ruby/signal-wire/relay/message/body) — Returns the value of attribute body.
- [`context`](/reference/ruby/signal-wire/relay/message/context) — Returns the value of attribute context.
- [`direction`](/reference/ruby/signal-wire/relay/message/direction) — Returns the value of attribute direction.
- [`done?`](/reference/ruby/signal-wire/relay/message/done)
- [`from_number`](/reference/ruby/signal-wire/relay/message/from-number) — Returns the value of attribute from\_number.
- [`initialize`](/reference/ruby/signal-wire/relay/message/initialize)
- [`inspect`](/reference/ruby/signal-wire/relay/message/inspect)
- [`is_done?`](/reference/ruby/signal-wire/relay/message/is-done)
- [`media`](/reference/ruby/signal-wire/relay/message/media) — Returns the value of attribute media.
- [`message_id`](/reference/ruby/signal-wire/relay/message/message-id) — Returns the value of attribute message\_id.
- [`on_completed`](/reference/ruby/signal-wire/relay/message/on-completed) — Set the on\_completed callback.
- [`on_event`](/reference/ruby/signal-wire/relay/message/on-event) — Register an event listener for state changes.
- [`reason`](/reference/ruby/signal-wire/relay/message/reason) — Returns the value of attribute reason.
- [`result`](/reference/ruby/signal-wire/relay/message/result)
- [`segments`](/reference/ruby/signal-wire/relay/message/segments) — Returns the value of attribute segments.
- [`state`](/reference/ruby/signal-wire/relay/message/state) — Returns the value of attribute state.
- [`state=`](/reference/ruby/signal-wire/relay/message/state__2) — Sets the attribute state
- [`tags`](/reference/ruby/signal-wire/relay/message/tags) — Returns the value of attribute tags.
- [`to_number`](/reference/ruby/signal-wire/relay/message/to-number) — Returns the value of attribute to\_number.
- [`to_s`](/reference/ruby/signal-wire/relay/message/to-s)
- [`wait`](/reference/ruby/signal-wire/relay/message/wait) — Wait for the message to reach a terminal state. Raises ActionTimeoutError if timeout exceeded.

## Source

[`lib/signalwire/relay/message.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/message.rb)

Line 9.
