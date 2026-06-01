---
slug: "/reference/php/signal-wire/swml/swml/service/on-function-call"
title: "onFunctionCall"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\SWML\\Service::onFunctionCall"
  parent: "SignalWire\\SWML\\Service"
  module: "SignalWire.SWML"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SWML/Service.php"
  visibility: "public"
---
# `onFunctionCall`

Dispatch a function call to the registered handler.

## Signature

```php
public function onFunctionCall(
    string $name,
    array $args,
    array $rawData
): ?SignalWire\SWAIG\FunctionResult
```

## Parameters

| Name      | Type     | Required | Default | Description |
| --------- | -------- | -------- | ------- | ----------- |
| `name`    | `string` | yes      | —       | —           |
| `args`    | `array`  | yes      | —       | —           |
| `rawData` | `array`  | yes      | —       | —           |

## Returns

`?SignalWire\SWAIG\FunctionResult`

## Source

[`/src/src/SignalWire/SWML/Service.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SWML/Service.php)

Line 335.
