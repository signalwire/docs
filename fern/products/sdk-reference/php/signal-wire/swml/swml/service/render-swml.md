---
slug: "/reference/php/signal-wire/swml/swml/service/render-swml"
title: "renderSwml"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\SWML\\Service::renderSwml"
  parent: "SignalWire\\SWML\\Service"
  module: "SignalWire.SWML"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SWML/Service.php"
  visibility: "public"
---
# `renderSwml`

Render SWML for a request. Subclasses override this.

## Signature

```php
public function renderSwml(
    ?array $requestBody = NULL,
    array $headers = array (
)
): array
```

## Parameters

| Name          | Type     | Required | Default     | Description |
| ------------- | -------- | -------- | ----------- | ----------- |
| `requestBody` | `?array` | no       | `NULL`      | —           |
| `headers`     | `array`  | no       | `array (
)` | —           |

## Returns

`array`

## Source

[`/src/src/SignalWire/SWML/Service.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SWML/Service.php)

Line 475.
