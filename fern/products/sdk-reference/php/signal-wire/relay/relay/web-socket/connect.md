---
slug: "/reference/php/signal-wire/relay/relay/web-socket/connect"
title: "connect"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Relay\\WebSocket::connect"
  parent: "SignalWire\\Relay\\WebSocket"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/WebSocket.php"
  visibility: "public"
---
# `connect`

Open a WebSocket connection to the given URI.

## Signature

```php
public function connect(
    string $uri,
    array $headers = array (
),
    float $timeout = 10.0
): void
```

## Parameters

| Name      | Type     | Required | Default     | Description                                                           |
| --------- | -------- | -------- | ----------- | --------------------------------------------------------------------- |
| `uri`     | `string` | yes      | —           | ws:// or wss:// URI (e.g. wss://example.signalwire.com/api/relay/ws). |
| `headers` | `array`  | no       | `array (
)` | Additional HTTP headers for the upgrade request.                      |
| `timeout` | `float`  | no       | `10.0`      | TCP-connect timeout in seconds.                                       |

## Throws

- `\RuntimeException` — on connection or handshake failure.

## Source

[`/src/src/SignalWire/Relay/WebSocket.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/WebSocket.php)

Line 62.
