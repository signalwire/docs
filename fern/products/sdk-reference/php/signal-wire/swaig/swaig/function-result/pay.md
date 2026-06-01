---
slug: "/reference/php/signal-wire/swaig/swaig/function-result/pay"
title: "pay"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\SWAIG\\FunctionResult::pay"
  parent: "SignalWire\\SWAIG\\FunctionResult"
  module: "SignalWire.SWAIG"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SWAIG/FunctionResult.php"
  visibility: "public"
---
# `pay`

## Signature

```php
public function pay(
    string $connectorUrl,
    string $inputMethod = 'dtmf',
    string $actionUrl = '',
    int $timeout = 600,
    int $maxAttempts = 3
): SignalWire\SWAIG\FunctionResult
```

## Parameters

| Name           | Type     | Required | Default  | Description |
| -------------- | -------- | -------- | -------- | ----------- |
| `connectorUrl` | `string` | yes      | —        | —           |
| `inputMethod`  | `string` | no       | `'dtmf'` | —           |
| `actionUrl`    | `string` | no       | `''`     | —           |
| `timeout`      | `int`    | no       | `600`    | —           |
| `maxAttempts`  | `int`    | no       | `3`      | —           |

## Returns

`SignalWire\SWAIG\FunctionResult`

## Source

[`/src/src/SignalWire/SWAIG/FunctionResult.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SWAIG/FunctionResult.php)

Line 434.
