---
slug: "/reference/php/signal-wire/relay/relay/web-socket/receive"
title: "receive"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Relay\\WebSocket::receive"
  parent: "SignalWire\\Relay\\WebSocket"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/WebSocket.php"
  visibility: "public"
---
# `receive`

Read one complete inbound frame, blocking up to $timeout seconds.

Returns:

- the decoded payload string for a text/binary frame
- WebSocket::CLOSE\_FRAME for a close
- null on read timeout (socket still healthy)
  Auto-handles ping (replies with pong) and pong (silently consumed)
  and re-attempts to deliver the next non-control frame.

## Signature

```php
public function receive(float $timeout = 5.0): ?string
```

## Parameters

| Name      | Type    | Required | Default | Description |
| --------- | ------- | -------- | ------- | ----------- |
| `timeout` | `float` | no       | `5.0`   | —           |

## Returns

`?string`

## Throws

- `\RuntimeException` — on malformed frames or socket errors.

## Source

[`/src/src/SignalWire/Relay/WebSocket.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/WebSocket.php)

Line 159.
