---
slug: "/reference/php/signal-wire/relay/relay/message/construct"
title: "__construct"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Relay\\Message::__construct"
  parent: "SignalWire\\Relay\\Message"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Message.php"
  visibility: "public"
---
# `__construct`

Build a Message from a params array (as returned by the server).

Expected keys (all optional with sane defaults):
message\_id, context, direction, from\_number / from,
to\_number / to, body, media, tags, state, reason

## Signature

```php
public function __construct(array $params = array (
))
```

## Parameters

| Name     | Type    | Required | Default     | Description |
| -------- | ------- | -------- | ----------- | ----------- |
| `params` | `array` | no       | `array (
)` | —           |

## Source

[`/src/src/SignalWire/Relay/Message.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Message.php)

Line 46.
