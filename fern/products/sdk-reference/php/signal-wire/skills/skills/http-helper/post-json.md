---
slug: "/reference/php/signal-wire/skills/skills/http-helper/post-json"
title: "postJson"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Skills\\HttpHelper::postJson"
  parent: "SignalWire\\Skills\\HttpHelper"
  module: "SignalWire.Skills"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Skills/HttpHelper.php"
  visibility: "public"
---
# `postJson`

Issue a POST with a JSON body. Returns \[status, body, parsed].

**Modifiers:** `static`

## Signature

```php
public static function postJson(
    string $url,
    mixed $body,
    array $headers = array (
),
    ?array $basicAuth = NULL,
    int $timeout = 15
): array
```

## Parameters

| Name        | Type     | Required | Default     | Description |
| ----------- | -------- | -------- | ----------- | ----------- |
| `url`       | `string` | yes      | —           | —           |
| `body`      | `mixed`  | yes      | —           | —           |
| `headers`   | `array`  | no       | `array (
)` | —           |
| `basicAuth` | `?array` | no       | `NULL`      | —           |
| `timeout`   | `int`    | no       | `15`        | —           |

## Returns

`array`

## Source

[`/src/src/SignalWire/Skills/HttpHelper.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Skills/HttpHelper.php)

Line 51.
