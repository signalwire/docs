---
slug: "/reference/php/signal-wire/relay/relay/call/dispatch-event"
title: "dispatchEvent"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Relay\\Call::dispatchEvent"
  parent: "SignalWire\\Relay\\Call"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Call.php"
  visibility: "public"
---
# `dispatchEvent`

Central event router invoked by the Client whenever a server event

targets this call.

## Signature

```php
public function dispatchEvent(SignalWire\Relay\Event $event): void
```

## Parameters

| Name    | Type                     | Required | Default | Description |
| ------- | ------------------------ | -------- | ------- | ----------- |
| `event` | `SignalWire\Relay\Event` | yes      | —       | —           |

## Source

[`/src/src/SignalWire/Relay/Call.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Call.php)

Line 71.
