---
slug: "/reference/php/signal-wire/relay/relay/message"
title: "Message"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\Relay\\Message"
  parent: "SignalWire\\Relay"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Message.php"
---
# `Message`

Represents a RELAY messaging message (SMS / MMS).

A Message is created when you send or receive a message through the
RELAY messaging namespace.  It accumulates state-change events and
resolves once the message reaches a terminal state (delivered,
undelivered, or failed).

## Signature

```php
class Message
```

## Methods

- [`__construct`](/reference/php/signal-wire/relay/relay/message/construct) — Build a Message from a params array (as returned by the server).
- [`dispatchEvent`](/reference/php/signal-wire/relay/relay/message/dispatch-event) — Process an inbound event for this message.
- [`getBody`](/reference/php/signal-wire/relay/relay/message/get-body)
- [`getContext`](/reference/php/signal-wire/relay/relay/message/get-context)
- [`getDirection`](/reference/php/signal-wire/relay/relay/message/get-direction)
- [`getFromNumber`](/reference/php/signal-wire/relay/relay/message/get-from-number)
- [`getMedia`](/reference/php/signal-wire/relay/relay/message/get-media)
- [`getMessageId`](/reference/php/signal-wire/relay/relay/message/get-message-id)
- [`getReason`](/reference/php/signal-wire/relay/relay/message/get-reason)
- [`getResult`](/reference/php/signal-wire/relay/relay/message/get-result)
- [`getState`](/reference/php/signal-wire/relay/relay/message/get-state)
- [`getTags`](/reference/php/signal-wire/relay/relay/message/get-tags)
- [`getToNumber`](/reference/php/signal-wire/relay/relay/message/get-to-number)
- [`handleEvent`](/reference/php/signal-wire/relay/relay/message/handle-event) — Alias for `dispatchEvent` so the Client's event router (which
- [`isDone`](/reference/php/signal-wire/relay/relay/message/is-done)
- [`on`](/reference/php/signal-wire/relay/relay/message/on) — Register a listener that fires on every state-change event.
- [`onCompleted`](/reference/php/signal-wire/relay/relay/message/on-completed) — Register a callback to fire when the message reaches a terminal state.
- [`resolve`](/reference/php/signal-wire/relay/relay/message/resolve) — Mark this message as completed.
- [`wait`](/reference/php/signal-wire/relay/relay/message/wait) — Block until the message completes or $timeout seconds elapse.

## Source

[`/src/src/SignalWire/Relay/Message.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Message.php)

Line 17.
