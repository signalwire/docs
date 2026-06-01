---
slug: "/reference/php/signal-wire/relay/relay/client/on-call"
title: "onCall"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Relay\\Client::onCall"
  parent: "SignalWire\\Relay\\Client"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Client.php"
  visibility: "public"
---
# `onCall`

Register a handler for inbound calls.

## Signature

```php
public function onCall(callable $cb): SignalWire\Relay\Client
```

## Parameters

| Name | Type       | Required | Default | Description |
| ---- | ---------- | -------- | ------- | ----------- |
| `cb` | `callable` | yes      | —       | —           |

## Returns

`SignalWire\Relay\Client`

## Source

[`/src/src/SignalWire/Relay/Client.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Client.php)

Line 740.
