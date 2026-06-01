---
slug: "/reference/php/signal-wire/relay/relay/stream-action"
title: "StreamAction"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\Relay\\StreamAction"
  parent: "SignalWire\\Relay"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Action.php"
---
# `StreamAction`

Handle for calling.stream operations.

## Signature

```php
class StreamAction extends Action
```

## Inheritance

**Extends:** [SignalWire\Relay\Action](/reference/php/signal-wire/relay/relay/action)

## Methods

- [`__construct`](/reference/php/signal-wire/relay/relay/stream-action/construct)
- [`executeSubcommand`](/reference/php/signal-wire/relay/relay/stream-action/execute-subcommand) — Send a sub-command RPC through the client.
- [`getCallId`](/reference/php/signal-wire/relay/relay/stream-action/get-call-id)
- [`getControlId`](/reference/php/signal-wire/relay/relay/stream-action/get-control-id)
- [`getEvents`](/reference/php/signal-wire/relay/relay/stream-action/get-events)
- [`getNodeId`](/reference/php/signal-wire/relay/relay/stream-action/get-node-id)
- [`getPayload`](/reference/php/signal-wire/relay/relay/stream-action/get-payload)
- [`getResult`](/reference/php/signal-wire/relay/relay/stream-action/get-result)
- [`getState`](/reference/php/signal-wire/relay/relay/stream-action/get-state)
- [`getStopMethod`](/reference/php/signal-wire/relay/relay/stream-action/get-stop-method)
- [`handleEvent`](/reference/php/signal-wire/relay/relay/stream-action/handle-event) — Append an incoming event and update local state / payload.
- [`isDone`](/reference/php/signal-wire/relay/relay/stream-action/is-done)
- [`onCompleted`](/reference/php/signal-wire/relay/relay/stream-action/on-completed) — Register a callback to fire when the action completes.
- [`resolve`](/reference/php/signal-wire/relay/relay/stream-action/resolve) — Mark this action as completed.
- [`stop`](/reference/php/signal-wire/relay/relay/stream-action/stop) — Stop the running action by sending its stop sub-command.
- [`wait`](/reference/php/signal-wire/relay/relay/stream-action/wait) — Block until the action completes or $timeout seconds elapse.

## Source

[`/src/src/SignalWire/Relay/Action.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Action.php)

Line 443.
