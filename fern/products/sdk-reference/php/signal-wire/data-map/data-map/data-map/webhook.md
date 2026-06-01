---
slug: "/reference/php/signal-wire/data-map/data-map/data-map/webhook"
title: "webhook"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\DataMap\\DataMap::webhook"
  parent: "SignalWire\\DataMap\\DataMap"
  module: "SignalWire.DataMap"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/DataMap/DataMap.php"
  visibility: "public"
---
# `webhook`

Add a webhook definition.

## Signature

```php
public function webhook(
    string $method,
    string $url,
    array $headers = array (
),
    string $formParam = '',
    bool $inputArgsAsParams = false,
    array $requireArgs = array (
)
): SignalWire\DataMap\DataMap
```

## Parameters

| Name                | Type     | Required | Default     | Description |
| ------------------- | -------- | -------- | ----------- | ----------- |
| `method`            | `string` | yes      | —           | —           |
| `url`               | `string` | yes      | —           | —           |
| `headers`           | `array`  | no       | `array (
)` | —           |
| `formParam`         | `string` | no       | `''`        | —           |
| `inputArgsAsParams` | `bool`   | no       | `false`     | —           |
| `requireArgs`       | `array`  | no       | `array (
)` | —           |

## Returns

`SignalWire\DataMap\DataMap`

## Source

[`/src/src/SignalWire/DataMap/DataMap.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/DataMap/DataMap.php)

Line 148.
