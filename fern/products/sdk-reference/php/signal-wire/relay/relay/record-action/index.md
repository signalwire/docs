---
slug: "/reference/php/signal-wire/relay/relay/record-action"
title: "RecordAction"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\Relay\\RecordAction"
  parent: "SignalWire\\Relay"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Action.php"
---
# `RecordAction`

Handle for calling.record operations.

## Signature

```php
class RecordAction extends Action
```

## Inheritance

**Extends:** [SignalWire\Relay\Action](/reference/php/signal-wire/relay/relay/action)

## Methods

- [`__construct`](/reference/php/signal-wire/relay/relay/record-action/construct)
- [`executeSubcommand`](/reference/php/signal-wire/relay/relay/record-action/execute-subcommand) — Send a sub-command RPC through the client.
- [`getCallId`](/reference/php/signal-wire/relay/relay/record-action/get-call-id)
- [`getControlId`](/reference/php/signal-wire/relay/relay/record-action/get-control-id)
- [`getDuration`](/reference/php/signal-wire/relay/relay/record-action/get-duration)
- [`getEvents`](/reference/php/signal-wire/relay/relay/record-action/get-events)
- [`getNodeId`](/reference/php/signal-wire/relay/relay/record-action/get-node-id)
- [`getPayload`](/reference/php/signal-wire/relay/relay/record-action/get-payload)
- [`getResult`](/reference/php/signal-wire/relay/relay/record-action/get-result)
- [`getSize`](/reference/php/signal-wire/relay/relay/record-action/get-size)
- [`getState`](/reference/php/signal-wire/relay/relay/record-action/get-state)
- [`getStopMethod`](/reference/php/signal-wire/relay/relay/record-action/get-stop-method)
- [`getUrl`](/reference/php/signal-wire/relay/relay/record-action/get-url)
- [`handleEvent`](/reference/php/signal-wire/relay/relay/record-action/handle-event) — Append an incoming event and update local state / payload.
- [`isDone`](/reference/php/signal-wire/relay/relay/record-action/is-done)
- [`onCompleted`](/reference/php/signal-wire/relay/relay/record-action/on-completed) — Register a callback to fire when the action completes.
- [`pause`](/reference/php/signal-wire/relay/relay/record-action/pause)
- [`resolve`](/reference/php/signal-wire/relay/relay/record-action/resolve) — Mark this action as completed.
- [`resume`](/reference/php/signal-wire/relay/relay/record-action/resume)
- [`stop`](/reference/php/signal-wire/relay/relay/record-action/stop) — Stop the running action by sending its stop sub-command.
- [`wait`](/reference/php/signal-wire/relay/relay/record-action/wait) — Block until the action completes or $timeout seconds elapse.

## Source

[`/src/src/SignalWire/Relay/Action.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Action.php)

Line 282.
