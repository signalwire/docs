---
slug: "/reference/php/signal-wire/relay/relay/action"
title: "Action"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\Relay\\Action"
  parent: "SignalWire\\Relay"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Action.php"
---
# `Action`

Base class for all RELAY call actions (play, record, collect, etc.).

An Action is the client-side handle returned when you start an
asynchronous operation on a call.  It accumulates events, tracks
state, and resolves once the operation reaches a terminal state.

## Signature

```php
class Action
```

## Methods

- [`__construct`](/reference/php/signal-wire/relay/relay/action/construct)
- [`executeSubcommand`](/reference/php/signal-wire/relay/relay/action/execute-subcommand) — Send a sub-command RPC through the client.
- [`getCallId`](/reference/php/signal-wire/relay/relay/action/get-call-id)
- [`getControlId`](/reference/php/signal-wire/relay/relay/action/get-control-id)
- [`getEvents`](/reference/php/signal-wire/relay/relay/action/get-events)
- [`getNodeId`](/reference/php/signal-wire/relay/relay/action/get-node-id)
- [`getPayload`](/reference/php/signal-wire/relay/relay/action/get-payload)
- [`getResult`](/reference/php/signal-wire/relay/relay/action/get-result)
- [`getState`](/reference/php/signal-wire/relay/relay/action/get-state)
- [`getStopMethod`](/reference/php/signal-wire/relay/relay/action/get-stop-method) — Return the RELAY RPC method that stops this action.
- [`handleEvent`](/reference/php/signal-wire/relay/relay/action/handle-event) — Append an incoming event and update local state / payload.
- [`isDone`](/reference/php/signal-wire/relay/relay/action/is-done)
- [`onCompleted`](/reference/php/signal-wire/relay/relay/action/on-completed) — Register a callback to fire when the action completes.
- [`resolve`](/reference/php/signal-wire/relay/relay/action/resolve) — Mark this action as completed.
- [`stop`](/reference/php/signal-wire/relay/relay/action/stop) — Stop the running action by sending its stop sub-command.
- [`wait`](/reference/php/signal-wire/relay/relay/action/wait) — Block until the action completes or $timeout seconds elapse.

## Source

[`/src/src/SignalWire/Relay/Action.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Action.php)

Line 16.
