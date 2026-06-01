---
slug: "/reference/ruby/signal-wire/relay/action"
title: "Action"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::Relay::Action"
  parent: "SignalWire::Relay"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/action.rb"
  visibility: "public"
---
# `Action`

Base class for async action handles (play, record, detect, etc.).

Holds a control\_id and back-reference to the Call. Resolves when the
server sends a terminal event for this control\_id.

Uses Ruby's Queue for blocking wait semantics.

## Signature

```ruby
class Action < Object
```

## Inheritance

**Extends:** `Object`

## Methods

- [`_check_event`](/reference/ruby/signal-wire/relay/action/check-event) — Called by Call when an event matches our control\_id.
- [`_resolve`](/reference/ruby/signal-wire/relay/action/resolve) — Mark the action as completed and fire the on\_completed callback.
- [`_set_on_completed`](/reference/ruby/signal-wire/relay/action/set-on-completed) — Called internally to set the on\_completed callback from options.
- [`call`](/reference/ruby/signal-wire/relay/action/call) — Returns the value of attribute call.
- [`completed`](/reference/ruby/signal-wire/relay/action/completed) — Returns the value of attribute completed.
- [`control_id`](/reference/ruby/signal-wire/relay/action/control-id) — Returns the value of attribute control\_id.
- [`done?`](/reference/ruby/signal-wire/relay/action/done)
- [`initialize`](/reference/ruby/signal-wire/relay/action/initialize)
- [`is_done?`](/reference/ruby/signal-wire/relay/action/is-done)
- [`on_completed`](/reference/ruby/signal-wire/relay/action/on-completed) — Set the on\_completed callback.
- [`result`](/reference/ruby/signal-wire/relay/action/result) — Returns the value of attribute result.
- [`wait`](/reference/ruby/signal-wire/relay/action/wait) — Wait for the action to complete. Returns the terminal event. Raises ActionTimeoutError if timeout is specified and exceeded.

## Source

[`lib/signalwire/relay/action.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/action.rb)

Line 16.
