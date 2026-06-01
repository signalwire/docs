---
slug: "/reference/php/signal-wire/relay/relay/client/send"
title: "send"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Relay\\Client::send"
  parent: "SignalWire\\Relay\\Client"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Client.php"
  visibility: "public"
---
# `send`

Encode and send a JSON message over the WebSocket. Throws if the

socket is closed; the run loop catches and triggers reconnect.

## Signature

```php
public function send(array $msg): void
```

## Parameters

| Name  | Type    | Required | Default | Description |
| ----- | ------- | -------- | ------- | ----------- |
| `msg` | `array` | yes      | —       | —           |

## Source

[`/src/src/SignalWire/Relay/Client.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Client.php)

Line 378.
