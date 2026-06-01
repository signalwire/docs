---
slug: "/reference/php/signal-wire/swaig/swaig/function-result/send-sms"
title: "sendSms"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\SWAIG\\FunctionResult::sendSms"
  parent: "SignalWire\\SWAIG\\FunctionResult"
  module: "SignalWire.SWAIG"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SWAIG/FunctionResult.php"
  visibility: "public"
---
# `sendSms`

## Signature

```php
public function sendSms(
    string $to,
    string $from,
    string $body,
    array $media = array (
),
    array $tags = array (
)
): SignalWire\SWAIG\FunctionResult
```

## Parameters

| Name    | Type     | Required | Default     | Description |
| ------- | -------- | -------- | ----------- | ----------- |
| `to`    | `string` | yes      | —           | —           |
| `from`  | `string` | yes      | —           | —           |
| `body`  | `string` | yes      | —           | —           |
| `media` | `array`  | no       | `array (
)` | —           |
| `tags`  | `array`  | no       | `array (
)` | —           |

## Returns

`SignalWire\SWAIG\FunctionResult`

## Source

[`/src/src/SignalWire/SWAIG/FunctionResult.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SWAIG/FunctionResult.php)

Line 410.
