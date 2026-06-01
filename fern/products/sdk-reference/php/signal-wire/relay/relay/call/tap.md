---
slug: "/reference/php/signal-wire/relay/relay/call/tap"
title: "tap"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Relay\\Call::tap"
  parent: "SignalWire\\Relay\\Call"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Call.php"
  visibility: "public"
---
# `tap`

## Signature

```php
public function tap(
    array $tap,
    array $device,
    array $opts = array (
)
): SignalWire\Relay\TapAction
```

## Parameters

| Name     | Type    | Required | Default     | Description          |
| -------- | ------- | -------- | ----------- | -------------------- |
| `tap`    | `array` | yes      | —           | Tap config.          |
| `device` | `array` | yes      | —           | Tap delivery device. |
| `opts`   | `array` | no       | `array (
)` | —                    |

## Returns

`SignalWire\Relay\TapAction`

## Source

[`/src/src/SignalWire/Relay/Call.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Call.php)

Line 505.
