---
slug: "/reference/php/signal-wire/relay/relay/detect-action"
title: "DetectAction"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\Relay\\DetectAction"
  parent: "SignalWire\\Relay"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Action.php"
---
# `DetectAction`

Handle for calling.detect operations (fax-tone, digit, machine, etc.).

## Signature

```php
class DetectAction extends Action
```

## Inheritance

**Extends:** [SignalWire\Relay\Action](/reference/php/signal-wire/relay/relay/action)

## Methods

- [`__construct`](/reference/php/signal-wire/relay/relay/detect-action/construct)
- [`executeSubcommand`](/reference/php/signal-wire/relay/relay/detect-action/execute-subcommand) — Send a sub-command RPC through the client.
- [`getCallId`](/reference/php/signal-wire/relay/relay/detect-action/get-call-id)
- [`getControlId`](/reference/php/signal-wire/relay/relay/detect-action/get-control-id)
- [`getDetectResult`](/reference/php/signal-wire/relay/relay/detect-action/get-detect-result)
- [`getEvents`](/reference/php/signal-wire/relay/relay/detect-action/get-events)
- [`getNodeId`](/reference/php/signal-wire/relay/relay/detect-action/get-node-id)
- [`getPayload`](/reference/php/signal-wire/relay/relay/detect-action/get-payload)
- [`getResult`](/reference/php/signal-wire/relay/relay/detect-action/get-result)
- [`getState`](/reference/php/signal-wire/relay/relay/detect-action/get-state)
- [`getStopMethod`](/reference/php/signal-wire/relay/relay/detect-action/get-stop-method)
- [`handleEvent`](/reference/php/signal-wire/relay/relay/detect-action/handle-event) — Append an incoming event and update local state / payload.
- [`isDone`](/reference/php/signal-wire/relay/relay/detect-action/is-done)
- [`onCompleted`](/reference/php/signal-wire/relay/relay/detect-action/on-completed) — Register a callback to fire when the action completes.
- [`resolve`](/reference/php/signal-wire/relay/relay/detect-action/resolve) — Mark this action as completed.
- [`stop`](/reference/php/signal-wire/relay/relay/detect-action/stop) — Stop the running action by sending its stop sub-command.
- [`wait`](/reference/php/signal-wire/relay/relay/detect-action/wait) — Block until the action completes or $timeout seconds elapse.

## Source

[`/src/src/SignalWire/Relay/Action.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Action.php)

Line 382.
