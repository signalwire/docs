---
slug: "/reference/php/signal-wire/relay/relay/collect-action"
title: "CollectAction"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\Relay\\CollectAction"
  parent: "SignalWire\\Relay"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Action.php"
---
# `CollectAction`

Handle for calling.collect (and play\_and\_collect) operations.

Note: play\_and\_collect emits intermediate calling.call.play events
that must be silently ignored so they do not pollute the collect
action's state.

## Signature

```php
class CollectAction extends Action
```

## Inheritance

**Extends:** [SignalWire\Relay\Action](/reference/php/signal-wire/relay/relay/action)

## Methods

- [`__construct`](/reference/php/signal-wire/relay/relay/collect-action/construct)
- [`executeSubcommand`](/reference/php/signal-wire/relay/relay/collect-action/execute-subcommand) — Send a sub-command RPC through the client.
- [`getCallId`](/reference/php/signal-wire/relay/relay/collect-action/get-call-id)
- [`getCollectResult`](/reference/php/signal-wire/relay/relay/collect-action/get-collect-result) — Return the structured collect result from the payload.
- [`getControlId`](/reference/php/signal-wire/relay/relay/collect-action/get-control-id)
- [`getEvents`](/reference/php/signal-wire/relay/relay/collect-action/get-events)
- [`getNodeId`](/reference/php/signal-wire/relay/relay/collect-action/get-node-id)
- [`getPayload`](/reference/php/signal-wire/relay/relay/collect-action/get-payload)
- [`getResult`](/reference/php/signal-wire/relay/relay/collect-action/get-result)
- [`getState`](/reference/php/signal-wire/relay/relay/collect-action/get-state)
- [`getStopMethod`](/reference/php/signal-wire/relay/relay/collect-action/get-stop-method)
- [`handleEvent`](/reference/php/signal-wire/relay/relay/collect-action/handle-event) — Override: silently ignore intermediate play events that arrive
- [`isDone`](/reference/php/signal-wire/relay/relay/collect-action/is-done)
- [`onCompleted`](/reference/php/signal-wire/relay/relay/collect-action/on-completed) — Register a callback to fire when the action completes.
- [`resolve`](/reference/php/signal-wire/relay/relay/collect-action/resolve) — Mark this action as completed.
- [`setStopMethod`](/reference/php/signal-wire/relay/relay/collect-action/set-stop-method)
- [`startInputTimers`](/reference/php/signal-wire/relay/relay/collect-action/start-input-timers) — Notify the server to start input timers now rather than waiting
- [`stop`](/reference/php/signal-wire/relay/relay/collect-action/stop) — Stop the running action by sending its stop sub-command.
- [`wait`](/reference/php/signal-wire/relay/relay/collect-action/wait) — Block until the action completes or $timeout seconds elapse.

## Source

[`/src/src/SignalWire/Relay/Action.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Action.php)

Line 328.
