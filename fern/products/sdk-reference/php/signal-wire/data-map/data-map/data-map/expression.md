---
slug: "/reference/php/signal-wire/data-map/data-map/data-map/expression"
title: "expression"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\DataMap\\DataMap::expression"
  parent: "SignalWire\\DataMap\\DataMap"
  module: "SignalWire.DataMap"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/DataMap/DataMap.php"
  visibility: "public"
---
# `expression`

Add an expression rule.

## Signature

```php
public function expression(
    string $testValue,
    string $pattern,
    mixed $output,
    mixed $nomatchOutput = NULL
): SignalWire\DataMap\DataMap
```

## Parameters

| Name            | Type     | Required | Default | Description |
| --------------- | -------- | -------- | ------- | ----------- |
| `testValue`     | `string` | yes      | —       | —           |
| `pattern`       | `string` | yes      | —       | —           |
| `output`        | `mixed`  | yes      | —       | —           |
| `nomatchOutput` | `mixed`  | no       | `NULL`  | —           |

## Returns

`SignalWire\DataMap\DataMap`

## Source

[`/src/src/SignalWire/DataMap/DataMap.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/DataMap/DataMap.php)

Line 122.
