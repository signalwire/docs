---
slug: "/reference/php/signal-wire/data-map/data-map/data-map/create-expression-tool"
title: "createExpressionTool"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\DataMap\\DataMap::createExpressionTool"
  parent: "SignalWire\\DataMap\\DataMap"
  module: "SignalWire.DataMap"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/DataMap/DataMap.php"
  visibility: "public"
---
# `createExpressionTool`

Build a complete SWAIG function definition with expressions only.

**Modifiers:** `static`

## Signature

```php
public static function createExpressionTool(
    string $name,
    string $purpose,
    array $parameters,
    array $expressions
): array
```

## Parameters

| Name          | Type     | Required | Default | Description |
| ------------- | -------- | -------- | ------- | ----------- |
| `name`        | `string` | yes      | —       | —           |
| `purpose`     | `string` | yes      | —       | —           |
| `parameters`  | `array`  | yes      | —       | —           |
| `expressions` | `array`  | yes      | —       | —           |

## Returns

`array`

## Source

[`/src/src/SignalWire/DataMap/DataMap.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/DataMap/DataMap.php)

Line 379.
