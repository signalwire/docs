---
slug: "/reference/php/signal-wire/swaig/swaig/function-result/create-payment-action"
title: "createPaymentAction"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\SWAIG\\FunctionResult::createPaymentAction"
  parent: "SignalWire\\SWAIG\\FunctionResult"
  module: "SignalWire.SWAIG"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SWAIG/FunctionResult.php"
  visibility: "public"
---
# `createPaymentAction`

**Modifiers:** `static`

## Signature

```php
public static function createPaymentAction(
    string $type,
    string $text,
    string $language = 'en-US',
    string $voice = ''
): array
```

## Parameters

| Name       | Type     | Required | Default   | Description |
| ---------- | -------- | -------- | --------- | ----------- |
| `type`     | `string` | yes      | —         | —           |
| `text`     | `string` | yes      | —         | —           |
| `language` | `string` | no       | `'en-US'` | —           |
| `voice`    | `string` | no       | `''`      | —           |

## Returns

`array`

## Source

[`/src/src/SignalWire/SWAIG/FunctionResult.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SWAIG/FunctionResult.php)

Line 538.
