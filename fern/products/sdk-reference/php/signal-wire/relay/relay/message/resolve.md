---
slug: "/reference/php/signal-wire/relay/relay/message/resolve"
title: "resolve"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Relay\\Message::resolve"
  parent: "SignalWire\\Relay\\Message"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Message.php"
  visibility: "public"
---
# `resolve`

Mark this message as completed.

The optional $result is stored and the onCompleted callback fires
exactly once.

## Signature

```php
public function resolve($result = NULL): void
```

## Parameters

| Name     | Type    | Required | Default | Description |
| -------- | ------- | -------- | ------- | ----------- |
| `result` | `mixed` | no       | `NULL`  | —           |

## Source

[`/src/src/SignalWire/Relay/Message.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Message.php)

Line 248.
