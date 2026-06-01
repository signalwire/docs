---
slug: "/reference/php/signal-wire/relay/relay/call"
title: "Call"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\Relay\\Call"
  parent: "SignalWire\\Relay"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Call.php"
---
# `Call`

Represents a RELAY voice call.

Holds call-level state, dispatches server events to registered listeners
and to in-flight Action objects, and exposes every calling.\* RPC method
as a first-class PHP method.

## Signature

```php
class Call
```

## Properties

| Name               | Type                      | Required | Default | Description           |
| ------------------ | ------------------------- | -------- | ------- | --------------------- |
| `actions`          | `array $actions`          | yes      | —       | controlId => Action   |
| `callId`           | `?string $callId`         | yes      | —       | —                     |
| `client`           | `object $client`          | yes      | —       | RELAY Client instance |
| `context`          | `?string $context`        | yes      | —       | —                     |
| `device`           | `array $device`           | yes      | —       | —                     |
| `dialWinner`       | `bool $dialWinner`        | yes      | —       | —                     |
| `direction`        | `?string $direction`      | yes      | —       | —                     |
| `endReason`        | `?string $endReason`      | yes      | —       | —                     |
| `nodeId`           | `?string $nodeId`         | yes      | —       | —                     |
| `onEventCallbacks` | `array $onEventCallbacks` | yes      | —       | —                     |
| `peer`             | `array $peer`             | yes      | —       | —                     |
| `state`            | `string $state`           | yes      | —       | —                     |
| `tag`              | `?string $tag`            | yes      | —       | —                     |

## Methods

- [`__construct`](/reference/php/signal-wire/relay/relay/call/construct)
- [`ai`](/reference/php/signal-wire/relay/relay/call/ai)
- [`aiHold`](/reference/php/signal-wire/relay/relay/call/ai-hold)
- [`aiMessage`](/reference/php/signal-wire/relay/relay/call/ai-message)
- [`aiUnhold`](/reference/php/signal-wire/relay/relay/call/ai-unhold)
- [`amazonBedrock`](/reference/php/signal-wire/relay/relay/call/amazon-bedrock)
- [`answer`](/reference/php/signal-wire/relay/relay/call/answer)
- [`bindDigit`](/reference/php/signal-wire/relay/relay/call/bind-digit)
- [`clearDigitBindings`](/reference/php/signal-wire/relay/relay/call/clear-digit-bindings) — Clear all digit bindings, optionally filtered by realm.
- [`collect`](/reference/php/signal-wire/relay/relay/call/collect) — Standalone collect (digits / speech / both).
- [`connect`](/reference/php/signal-wire/relay/relay/call/connect)
- [`denoise`](/reference/php/signal-wire/relay/relay/call/denoise)
- [`denoiseStop`](/reference/php/signal-wire/relay/relay/call/denoise-stop)
- [`detect`](/reference/php/signal-wire/relay/relay/call/detect)
- [`disconnect`](/reference/php/signal-wire/relay/relay/call/disconnect)
- [`dispatchEvent`](/reference/php/signal-wire/relay/relay/call/dispatch-event) — Central event router invoked by the Client whenever a server event
- [`echo`](/reference/php/signal-wire/relay/relay/call/echo)
- [`hangup`](/reference/php/signal-wire/relay/relay/call/hangup) — Hang up the call. `$reason` is forwarded as `reason` on the
- [`hold`](/reference/php/signal-wire/relay/relay/call/hold)
- [`joinConference`](/reference/php/signal-wire/relay/relay/call/join-conference)
- [`joinRoom`](/reference/php/signal-wire/relay/relay/call/join-room)
- [`leaveConference`](/reference/php/signal-wire/relay/relay/call/leave-conference)
- [`leaveRoom`](/reference/php/signal-wire/relay/relay/call/leave-room)
- [`liveTranscribe`](/reference/php/signal-wire/relay/relay/call/live-transcribe)
- [`liveTranslate`](/reference/php/signal-wire/relay/relay/call/live-translate)
- [`on`](/reference/php/signal-wire/relay/relay/call/on) — Register a generic event listener on this call.
- [`pass`](/reference/php/signal-wire/relay/relay/call/pass)
- [`pay`](/reference/php/signal-wire/relay/relay/call/pay)
- [`play`](/reference/php/signal-wire/relay/relay/call/play) — Start a calling.play action.
- [`playAndCollect`](/reference/php/signal-wire/relay/relay/call/play-and-collect) — Play media then collect a response (digits, speech).
- [`queueEnter`](/reference/php/signal-wire/relay/relay/call/queue-enter)
- [`queueLeave`](/reference/php/signal-wire/relay/relay/call/queue-leave) — Remove the call from a named queue.
- [`receiveFax`](/reference/php/signal-wire/relay/relay/call/receive-fax)
- [`record`](/reference/php/signal-wire/relay/relay/call/record)
- [`refer`](/reference/php/signal-wire/relay/relay/call/refer)
- [`resolveAllActions`](/reference/php/signal-wire/relay/relay/call/resolve-all-actions) — Mark every outstanding action as completed. Called when the call
- [`sendDigits`](/reference/php/signal-wire/relay/relay/call/send-digits)
- [`sendFax`](/reference/php/signal-wire/relay/relay/call/send-fax)
- [`stream`](/reference/php/signal-wire/relay/relay/call/stream)
- [`tap`](/reference/php/signal-wire/relay/relay/call/tap)
- [`transcribe`](/reference/php/signal-wire/relay/relay/call/transcribe)
- [`transfer`](/reference/php/signal-wire/relay/relay/call/transfer)
- [`unhold`](/reference/php/signal-wire/relay/relay/call/unhold)
- [`userEvent`](/reference/php/signal-wire/relay/relay/call/user-event)

## Source

[`/src/src/SignalWire/Relay/Call.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Call.php)

Line 16.
