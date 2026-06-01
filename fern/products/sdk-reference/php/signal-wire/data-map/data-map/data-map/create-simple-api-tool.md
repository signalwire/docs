---
slug: "/reference/php/signal-wire/data-map/data-map/data-map/create-simple-api-tool"
title: "createSimpleApiTool"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\DataMap\\DataMap::createSimpleApiTool"
  parent: "SignalWire\\DataMap\\DataMap"
  module: "SignalWire.DataMap"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/DataMap/DataMap.php"
  visibility: "public"
---
# `createSimpleApiTool`

Build a complete SWAIG function definition with a single webhook.

**Modifiers:** `static`

## Signature

```php
public static function createSimpleApiTool(
    string $name,
    string $purpose,
    array $parameters,
    string $method,
    string $url,
    mixed $output,
    array $headers = array (
)
): array
```

## Parameters

| Name         | Type     | Required | Default     | Description |
| ------------ | -------- | -------- | ----------- | ----------- |
| `name`       | `string` | yes      | —           | —           |
| `purpose`    | `string` | yes      | —           | —           |
| `parameters` | `array`  | yes      | —           | —           |
| `method`     | `string` | yes      | —           | —           |
| `url`        | `string` | yes      | —           | —           |
| `output`     | `mixed`  | yes      | —           | —           |
| `headers`    | `array`  | no       | `array (
)` | —           |

## Returns

`array`

## Source

[`/src/src/SignalWire/DataMap/DataMap.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/DataMap/DataMap.php)

Line 344.
