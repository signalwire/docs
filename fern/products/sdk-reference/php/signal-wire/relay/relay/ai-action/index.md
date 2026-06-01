---
slug: "/reference/php/signal-wire/relay/relay/ai-action"
title: "AIAction"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\Relay\\AIAction"
  parent: "SignalWire\\Relay"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Action.php"
---
# `AIAction`

Handle for calling.ai operations.

## Signature

```php
class AIAction extends Action
```

## Inheritance

**Extends:** [SignalWire\Relay\Action](/reference/php/signal-wire/relay/relay/action)

## Methods

- [`__construct`](/reference/php/signal-wire/relay/relay/ai-action/construct)
- [`executeSubcommand`](/reference/php/signal-wire/relay/relay/ai-action/execute-subcommand) — Send a sub-command RPC through the client.
- [`getCallId`](/reference/php/signal-wire/relay/relay/ai-action/get-call-id)
- [`getControlId`](/reference/php/signal-wire/relay/relay/ai-action/get-control-id)
- [`getEvents`](/reference/php/signal-wire/relay/relay/ai-action/get-events)
- [`getNodeId`](/reference/php/signal-wire/relay/relay/ai-action/get-node-id)
- [`getPayload`](/reference/php/signal-wire/relay/relay/ai-action/get-payload)
- [`getResult`](/reference/php/signal-wire/relay/relay/ai-action/get-result)
- [`getState`](/reference/php/signal-wire/relay/relay/ai-action/get-state)
- [`getStopMethod`](/reference/php/signal-wire/relay/relay/ai-action/get-stop-method)
- [`handleEvent`](/reference/php/signal-wire/relay/relay/ai-action/handle-event) — Append an incoming event and update local state / payload.
- [`isDone`](/reference/php/signal-wire/relay/relay/ai-action/is-done)
- [`onCompleted`](/reference/php/signal-wire/relay/relay/ai-action/on-completed) — Register a callback to fire when the action completes.
- [`resolve`](/reference/php/signal-wire/relay/relay/ai-action/resolve) — Mark this action as completed.
- [`stop`](/reference/php/signal-wire/relay/relay/ai-action/stop) — Stop the running action by sending its stop sub-command.
- [`wait`](/reference/php/signal-wire/relay/relay/ai-action/wait) — Block until the action completes or $timeout seconds elapse.

## Source

[`/src/src/SignalWire/Relay/Action.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Action.php)

Line 476.
