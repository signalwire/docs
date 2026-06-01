---
slug: "/reference/php/signal-wire/relay/relay/call/record"
title: "record"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Relay\\Call::record"
  parent: "SignalWire\\Relay\\Call"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Call.php"
  visibility: "public"
---
# `record`

## Signature

```php
public function record(
    array $audio,
    array $opts = array (
)
): SignalWire\Relay\RecordAction
```

## Parameters

| Name    | Type    | Required | Default     | Description                       |
| ------- | ------- | -------- | ----------- | --------------------------------- |
| `audio` | `array` | yes      | —           | Recording config (`format`, etc.) |
| `opts`  | `array` | no       | `array (
)` | —                                 |

## Returns

`SignalWire\Relay\RecordAction`

## Source

[`/src/src/SignalWire/Relay/Call.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Call.php)

Line 420.
