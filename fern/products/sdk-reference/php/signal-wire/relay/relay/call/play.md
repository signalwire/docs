---
slug: "/reference/php/signal-wire/relay/relay/call/play"
title: "play"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Relay\\Call::play"
  parent: "SignalWire\\Relay\\Call"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Call.php"
  visibility: "public"
---
# `play`

Start a calling.play action.

## Signature

```php
public function play(
    array $media,
    array $opts = array (
)
): SignalWire\Relay\PlayAction
```

## Parameters

| Name    | Type    | Required | Default     | Description                                                                                   |
| ------- | ------- | -------- | ----------- | --------------------------------------------------------------------------------------------- |
| `media` | `array` | yes      | —           | Play list (each entry is `{type:..., params:...}`).                                           |
| `opts`  | `array` | no       | `array (
)` | `control_id` (auto-generated when omitted), `on_completed` callback fired on terminal events. |

## Returns

`SignalWire\Relay\PlayAction`

## Source

[`/src/src/SignalWire/Relay/Call.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Call.php)

Line 407.
