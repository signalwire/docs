---
slug: "/reference/php/signal-wire/skills/skills/http-helper/request"
title: "request"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Skills\\HttpHelper::request"
  parent: "SignalWire\\Skills\\HttpHelper"
  module: "SignalWire.Skills"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Skills/HttpHelper.php"
  visibility: "public"
---
# `request`

Inner request engine using cURL. Other skills may use this

directly when they need PUT/DELETE; the GET / POST helpers
above cover the common cases.

**Modifiers:** `static`

## Signature

```php
public static function request(
    string $method,
    string $url,
    array $headers = array (
),
    ?string $body = NULL,
    ?array $basicAuth = NULL,
    int $timeout = 15
): array
```

## Parameters

| Name        | Type      | Required | Default     | Description       |
| ----------- | --------- | -------- | ----------- | ----------------- |
| `method`    | `string`  | yes      | —           | —                 |
| `url`       | `string`  | yes      | —           | —                 |
| `headers`   | `array`   | no       | `array (
)` | —                 |
| `body`      | `?string` | no       | `NULL`      | —                 |
| `basicAuth` | `?array`  | no       | `NULL`      | \[user, password] |
| `timeout`   | `int`     | no       | `15`        | —                 |

## Returns

`array`

## Source

[`/src/src/SignalWire/Skills/HttpHelper.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Skills/HttpHelper.php)

Line 104.
