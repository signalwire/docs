---
slug: "/reference/php/signal-wire/relay/relay/client"
title: "Client"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\Relay\\Client"
  parent: "SignalWire\\Relay"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Client.php"
---
# `Client`

RELAY Client – manages the WebSocket connection to SignalWire, sends

JSON-RPC requests, and dispatches inbound events to the correct Call
or Message objects.

The transport layer (WebSocket send/receive) is abstracted behind
thin methods so that unit tests can subclass or mock without needing
a real WebSocket extension.

## Signature

```php
class Client
```

## Properties

| Name                 | Type                                   | Required | Default | Description          |
| -------------------- | -------------------------------------- | -------- | ------- | -------------------- |
| `agent`              | `string $agent`                        | yes      | —       | —                    |
| `authorizationState` | `?string $authorizationState`          | yes      | —       | —                    |
| `calls`              | `array $calls`                         | yes      | —       | callId => Call       |
| `connected`          | `bool $connected`                      | yes      | —       | —                    |
| `contexts`           | `array $contexts`                      | yes      | —       | —                    |
| `host`               | `string $host`                         | yes      | —       | —                    |
| `jwtToken`           | `?string $jwtToken`                    | yes      | —       | —                    |
| `messages`           | `array $messages`                      | yes      | —       | messageId => Message |
| `onCallHandler`      | `(callable \| null) $onCallHandler`    | yes      | —       | —                    |
| `onEventHandler`     | `(callable \| null) $onEventHandler`   | yes      | —       | —                    |
| `onMessageHandler`   | `(callable \| null) $onMessageHandler` | yes      | —       | —                    |
| `pending`            | `array $pending`                       | yes      | —       | id => callbacks      |
| `pendingDials`       | `array $pendingDials`                  | yes      | —       | tag => dial promise  |
| `project`            | `string $project`                      | yes      | —       | —                    |
| `protocol`           | `?string $protocol`                    | yes      | —       | —                    |
| `relayPath`          | `string $relayPath`                    | yes      | —       | —                    |
| `scheme`             | `string $scheme`                       | yes      | —       | —                    |
| `sessionId`          | `?string $sessionId`                   | yes      | —       | —                    |
| `token`              | `string $token`                        | yes      | —       | —                    |

## Methods

- [`__construct`](/reference/php/signal-wire/relay/relay/client/construct)
- [`authenticate`](/reference/php/signal-wire/relay/relay/client/authenticate) — Send the signalwire.connect RPC to authenticate and bind a session.
- [`connect`](/reference/php/signal-wire/relay/relay/client/connect) — Open the WebSocket connection and run the JSON-RPC `signalwire.connect`
- [`dial`](/reference/php/signal-wire/relay/relay/client/dial) — Originate an outbound call, blocking until `calling.call.dial`
- [`disconnect`](/reference/php/signal-wire/relay/relay/client/disconnect) — Gracefully close the connection.
- [`execute`](/reference/php/signal-wire/relay/relay/client/execute) — Send a JSON-RPC request and synchronously wait for the matching
- [`getCall`](/reference/php/signal-wire/relay/relay/client/get-call)
- [`getCalls`](/reference/php/signal-wire/relay/relay/client/get-calls)
- [`getMessages`](/reference/php/signal-wire/relay/relay/client/get-messages)
- [`handleEvent`](/reference/php/signal-wire/relay/relay/client/handle-event) — Route a signalwire.event payload to the appropriate handler.
- [`handleMessage`](/reference/php/signal-wire/relay/relay/client/handle-message) — Parse a raw JSON string from the server and route it.
- [`onCall`](/reference/php/signal-wire/relay/relay/client/on-call) — Register a handler for inbound calls.
- [`onMessage`](/reference/php/signal-wire/relay/relay/client/on-message) — Register a handler for inbound messages.
- [`readOnce`](/reference/php/signal-wire/relay/relay/client/read-once) — Read a single inbound frame from the WebSocket and dispatch it.
- [`receive`](/reference/php/signal-wire/relay/relay/client/receive) — Subscribe to one or more inbound contexts so that events for those
- [`reconnect`](/reference/php/signal-wire/relay/relay/client/reconnect) — Reconnect with exponential back-off (1 s -> 30 s cap).
- [`run`](/reference/php/signal-wire/relay/relay/client/run) — Main event loop – reads messages until disconnect.
- [`send`](/reference/php/signal-wire/relay/relay/client/send) — Encode and send a JSON message over the WebSocket. Throws if the
- [`sendAck`](/reference/php/signal-wire/relay/relay/client/send-ack) — Send an acknowledgement (empty result) for a server-initiated request.
- [`sendMessage`](/reference/php/signal-wire/relay/relay/client/send-message) — Send an outbound message.
- [`unreceive`](/reference/php/signal-wire/relay/relay/client/unreceive) — Unsubscribe from one or more contexts.

## Source

[`/src/src/SignalWire/Relay/Client.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Client.php)

Line 18.
