---
slug: "/reference/php/signal-wire/swaig/swaig/function-result/tap"
title: "tap"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\SWAIG\\FunctionResult::tap"
  parent: "SignalWire\\SWAIG\\FunctionResult"
  module: "SignalWire.SWAIG"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SWAIG/FunctionResult.php"
  visibility: "public"
---
# `tap`

## Signature

```php
public function tap(
    string $uri,
    string $controlId = '',
    string $direction = 'both',
    string $codec = 'PCMU'
): SignalWire\SWAIG\FunctionResult
```

## Parameters

| Name        | Type     | Required | Default  | Description |
| ----------- | -------- | -------- | -------- | ----------- |
| `uri`       | `string` | yes      | —        | —           |
| `controlId` | `string` | no       | `''`     | —           |
| `direction` | `string` | no       | `'both'` | —           |
| `codec`     | `string` | no       | `'PCMU'` | —           |

## Returns

`SignalWire\SWAIG\FunctionResult`

## Source

[`/src/src/SignalWire/SWAIG/FunctionResult.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SWAIG/FunctionResult.php)

Line 380.
