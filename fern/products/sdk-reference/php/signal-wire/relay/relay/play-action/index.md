---
slug: "/reference/php/signal-wire/relay/relay/play-action"
title: "PlayAction"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\Relay\\PlayAction"
  parent: "SignalWire\\Relay"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Action.php"
---
# `PlayAction`

Handle for calling.play operations.

## Signature

```php
class PlayAction extends Action
```

## Inheritance

**Extends:** [SignalWire\Relay\Action](/reference/php/signal-wire/relay/relay/action)

## Methods

- [`__construct`](/reference/php/signal-wire/relay/relay/play-action/construct)
- [`executeSubcommand`](/reference/php/signal-wire/relay/relay/play-action/execute-subcommand) — Send a sub-command RPC through the client.
- [`getCallId`](/reference/php/signal-wire/relay/relay/play-action/get-call-id)
- [`getControlId`](/reference/php/signal-wire/relay/relay/play-action/get-control-id)
- [`getEvents`](/reference/php/signal-wire/relay/relay/play-action/get-events)
- [`getNodeId`](/reference/php/signal-wire/relay/relay/play-action/get-node-id)
- [`getPayload`](/reference/php/signal-wire/relay/relay/play-action/get-payload)
- [`getResult`](/reference/php/signal-wire/relay/relay/play-action/get-result)
- [`getState`](/reference/php/signal-wire/relay/relay/play-action/get-state)
- [`getStopMethod`](/reference/php/signal-wire/relay/relay/play-action/get-stop-method)
- [`handleEvent`](/reference/php/signal-wire/relay/relay/play-action/handle-event) — Append an incoming event and update local state / payload.
- [`isDone`](/reference/php/signal-wire/relay/relay/play-action/is-done)
- [`onCompleted`](/reference/php/signal-wire/relay/relay/play-action/on-completed) — Register a callback to fire when the action completes.
- [`pause`](/reference/php/signal-wire/relay/relay/play-action/pause)
- [`resolve`](/reference/php/signal-wire/relay/relay/play-action/resolve) — Mark this action as completed.
- [`resume`](/reference/php/signal-wire/relay/relay/play-action/resume)
- [`stop`](/reference/php/signal-wire/relay/relay/play-action/stop) — Stop the running action by sending its stop sub-command.
- [`volume`](/reference/php/signal-wire/relay/relay/play-action/volume) — Adjust playback volume.
- [`wait`](/reference/php/signal-wire/relay/relay/play-action/wait) — Block until the action completes or $timeout seconds elapse.

## Source

[`/src/src/SignalWire/Relay/Action.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Action.php)

Line 249.
