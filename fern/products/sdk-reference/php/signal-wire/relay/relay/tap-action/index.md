---
slug: "/reference/php/signal-wire/relay/relay/tap-action"
title: "TapAction"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\Relay\\TapAction"
  parent: "SignalWire\\Relay"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Action.php"
---
# `TapAction`

Handle for calling.tap operations.

## Signature

```php
class TapAction extends Action
```

## Inheritance

**Extends:** [SignalWire\Relay\Action](/reference/php/signal-wire/relay/relay/action)

## Methods

- [`__construct`](/reference/php/signal-wire/relay/relay/tap-action/construct)
- [`executeSubcommand`](/reference/php/signal-wire/relay/relay/tap-action/execute-subcommand) — Send a sub-command RPC through the client.
- [`getCallId`](/reference/php/signal-wire/relay/relay/tap-action/get-call-id)
- [`getControlId`](/reference/php/signal-wire/relay/relay/tap-action/get-control-id)
- [`getEvents`](/reference/php/signal-wire/relay/relay/tap-action/get-events)
- [`getNodeId`](/reference/php/signal-wire/relay/relay/tap-action/get-node-id)
- [`getPayload`](/reference/php/signal-wire/relay/relay/tap-action/get-payload)
- [`getResult`](/reference/php/signal-wire/relay/relay/tap-action/get-result)
- [`getState`](/reference/php/signal-wire/relay/relay/tap-action/get-state)
- [`getStopMethod`](/reference/php/signal-wire/relay/relay/tap-action/get-stop-method)
- [`handleEvent`](/reference/php/signal-wire/relay/relay/tap-action/handle-event) — Append an incoming event and update local state / payload.
- [`isDone`](/reference/php/signal-wire/relay/relay/tap-action/is-done)
- [`onCompleted`](/reference/php/signal-wire/relay/relay/tap-action/on-completed) — Register a callback to fire when the action completes.
- [`resolve`](/reference/php/signal-wire/relay/relay/tap-action/resolve) — Mark this action as completed.
- [`stop`](/reference/php/signal-wire/relay/relay/tap-action/stop) — Stop the running action by sending its stop sub-command.
- [`wait`](/reference/php/signal-wire/relay/relay/tap-action/wait) — Block until the action completes or $timeout seconds elapse.

## Source

[`/src/src/SignalWire/Relay/Action.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Action.php)

Line 432.
