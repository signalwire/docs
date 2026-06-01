---
slug: "/reference/php/signal-wire/relay/relay/play-action/volume"
title: "volume"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Relay\\PlayAction::volume"
  parent: "SignalWire\\Relay\\PlayAction"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Action.php"
  visibility: "public"
---
# `volume`

Adjust playback volume.

## Signature

```php
public function volume(float $db): void
```

## Parameters

| Name | Type    | Required | Default | Description                                 |
| ---- | ------- | -------- | ------- | ------------------------------------------- |
| `db` | `float` | yes      | —       | Volume adjustment in dB (e.g. -4.0 or 6.0). |

## Source

[`/src/src/SignalWire/Relay/Action.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Action.php)

Line 271.
