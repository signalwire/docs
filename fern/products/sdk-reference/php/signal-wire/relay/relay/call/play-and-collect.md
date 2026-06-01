---
slug: "/reference/php/signal-wire/relay/relay/call/play-and-collect"
title: "playAndCollect"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Relay\\Call::playAndCollect"
  parent: "SignalWire\\Relay\\Call"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Call.php"
  visibility: "public"
---
# `playAndCollect`

Play media then collect a response (digits, speech).

## Signature

```php
public function playAndCollect(
    array $media,
    array $collect,
    array $opts = array (
)
): SignalWire\Relay\CollectAction
```

## Parameters

| Name      | Type    | Required | Default     | Description |
| --------- | ------- | -------- | ----------- | ----------- |
| `media`   | `array` | yes      | —           | —           |
| `collect` | `array` | yes      | —           | —           |
| `opts`    | `array` | no       | `array (
)` | —           |

## Returns

`SignalWire\Relay\CollectAction`

## Source

[`/src/src/SignalWire/Relay/Call.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Call.php)

Line 452.
