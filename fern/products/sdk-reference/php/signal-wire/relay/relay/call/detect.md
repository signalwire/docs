---
slug: "/reference/php/signal-wire/relay/relay/call/detect"
title: "detect"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Relay\\Call::detect"
  parent: "SignalWire\\Relay\\Call"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Call.php"
  visibility: "public"
---
# `detect`

## Signature

```php
public function detect(
    array $detect,
    array $opts = array (
)
): SignalWire\Relay\DetectAction
```

## Parameters

| Name     | Type    | Required | Default     | Description                                                             |
| -------- | ------- | -------- | ----------- | ----------------------------------------------------------------------- |
| `detect` | `array` | yes      | —           | Detection request (`{type: 'machine'\|'fax'\|'digit', params: {...}}`). |
| `opts`   | `array` | no       | `array (
)` | —                                                                       |

## Returns

`SignalWire\Relay\DetectAction`

## Source

[`/src/src/SignalWire/Relay/Call.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Call.php)

Line 466.
