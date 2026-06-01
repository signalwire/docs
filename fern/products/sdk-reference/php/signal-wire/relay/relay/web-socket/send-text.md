---
slug: "/reference/php/signal-wire/relay/relay/web-socket/send-text"
title: "sendText"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Relay\\WebSocket::sendText"
  parent: "SignalWire\\Relay\\WebSocket"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/WebSocket.php"
  visibility: "public"
---
# `sendText`

Send a UTF-8 text frame (FIN=1, opcode=0x1, masked).

## Signature

```php
public function sendText(string $payload): void
```

## Parameters

| Name      | Type     | Required | Default | Description |
| --------- | -------- | -------- | ------- | ----------- |
| `payload` | `string` | yes      | —       | —           |

## Throws

- `\RuntimeException` — if the socket is closed or write fails.

## Source

[`/src/src/SignalWire/Relay/WebSocket.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/WebSocket.php)

Line 120.
