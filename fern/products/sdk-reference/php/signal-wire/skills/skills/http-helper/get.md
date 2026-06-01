---
slug: "/reference/php/signal-wire/skills/skills/http-helper/get"
title: "get"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Skills\\HttpHelper::get"
  parent: "SignalWire\\Skills\\HttpHelper"
  module: "SignalWire.Skills"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Skills/HttpHelper.php"
  visibility: "public"
---
# `get`

Issue a GET. Returns \[status, body, parsed\_json\_or\_null].

**Modifiers:** `static`

## Signature

```php
public static function get(
    string $url,
    array $headers = array (
),
    ?array $query = NULL,
    ?array $basicAuth = NULL,
    int $timeout = 15
): array
```

## Parameters

| Name        | Type     | Required | Default     | Description |
| ----------- | -------- | -------- | ----------- | ----------- |
| `url`       | `string` | yes      | —           | —           |
| `headers`   | `array`  | no       | `array (
)` | —           |
| `query`     | `?array` | no       | `NULL`      | —           |
| `basicAuth` | `?array` | no       | `NULL`      | —           |
| `timeout`   | `int`    | no       | `15`        | —           |

## Returns

`array`

## Source

[`/src/src/SignalWire/Skills/HttpHelper.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Skills/HttpHelper.php)

Line 31.
