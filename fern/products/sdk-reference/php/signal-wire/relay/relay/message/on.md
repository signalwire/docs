---
slug: "/reference/php/signal-wire/relay/relay/message/on"
title: "on"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Relay\\Message::on"
  parent: "SignalWire\\Relay\\Message"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Message.php"
  visibility: "public"
---
# `on`

Register a listener that fires on every state-change event.

## Signature

```php
public function on(callable $cb): SignalWire\Relay\Message
```

## Parameters

| Name | Type       | Required | Default | Description |
| ---- | ---------- | -------- | ------- | ----------- |
| `cb` | `callable` | yes      | —       | —           |

## Returns

`SignalWire\Relay\Message`

## Source

[`/src/src/SignalWire/Relay/Message.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Message.php)

Line 149.
