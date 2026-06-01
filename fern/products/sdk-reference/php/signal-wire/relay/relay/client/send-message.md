---
slug: "/reference/php/signal-wire/relay/relay/client/send-message"
title: "sendMessage"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Relay\\Client::sendMessage"
  parent: "SignalWire\\Relay\\Client"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Client.php"
  visibility: "public"
---
# `sendMessage`

Send an outbound message.

## Signature

```php
public function sendMessage(array $params): SignalWire\Relay\Message
```

## Parameters

| Name     | Type    | Required | Default | Description                                                                                      |
| -------- | ------- | -------- | ------- | ------------------------------------------------------------------------------------------------ |
| `params` | `array` | yes      | —       | Outbound messaging.send params (`to_number`, `from_number`, `body`, `media`, `tags`, `context`). |

## Returns

`SignalWire\Relay\Message` — Tracking object for the message lifecycle. The Message starts in `queued` state; subsequent `messaging.state` events from the server progress it through `sent` / `delivered` / `undelivered` / `failed`.

## Source

[`/src/src/SignalWire/Relay/Client.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Client.php)

Line 673.
