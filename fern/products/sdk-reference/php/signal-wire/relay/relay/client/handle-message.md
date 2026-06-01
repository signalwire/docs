---
slug: "/reference/php/signal-wire/relay/relay/client/handle-message"
title: "handleMessage"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Relay\\Client::handleMessage"
  parent: "SignalWire\\Relay\\Client"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Client.php"
  visibility: "public"
---
# `handleMessage`

Parse a raw JSON string from the server and route it.

## Signature

```php
public function handleMessage(string $raw): void
```

## Parameters

| Name  | Type     | Required | Default | Description |
| ----- | -------- | -------- | ------- | ----------- |
| `raw` | `string` | yes      | —       | —           |

## Source

[`/src/src/SignalWire/Relay/Client.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Client.php)

Line 440.
