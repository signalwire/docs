---
slug: "/reference/php/signal-wire/relay/relay/transcribe-action/handle-event"
title: "handleEvent"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Relay\\TranscribeAction::handleEvent"
  parent: "SignalWire\\Relay\\TranscribeAction"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Action.php"
  visibility: "public"
---
# `handleEvent`

Append an incoming event and update local state / payload.

## Signature

```php
public function handleEvent(SignalWire\Relay\Event $event): void
```

## Parameters

| Name    | Type                     | Required | Default | Description |
| ------- | ------------------------ | -------- | ------- | ----------- |
| `event` | `SignalWire\Relay\Event` | yes      | —       | —           |

## Source

[`/src/src/SignalWire/Relay/Action.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Action.php)

Line 144.
