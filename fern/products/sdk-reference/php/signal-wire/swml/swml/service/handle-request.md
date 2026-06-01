---
slug: "/reference/php/signal-wire/swml/swml/service/handle-request"
title: "handleRequest"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\SWML\\Service::handleRequest"
  parent: "SignalWire\\SWML\\Service"
  module: "SignalWire.SWML"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SWML/Service.php"
  visibility: "public"
---
# `handleRequest`

Handle an HTTP request. Returns \[status, headers, body].

## Signature

```php
public function handleRequest(
    string $method,
    string $path,
    array $headers = array (
),
    ?string $body = NULL
): array
```

## Parameters

| Name      | Type      | Required | Default     | Description |
| --------- | --------- | -------- | ----------- | ----------- |
| `method`  | `string`  | yes      | —           | —           |
| `path`    | `string`  | yes      | —           | —           |
| `headers` | `array`   | no       | `array (
)` | —           |
| `body`    | `?string` | no       | `NULL`      | —           |

## Returns

`array`

## Source

[`/src/src/SignalWire/SWML/Service.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SWML/Service.php)

Line 489.
