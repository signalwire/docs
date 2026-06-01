---
slug: "/reference/php/signal-wire/rest/rest/signal-wire-rest-error/construct"
title: "__construct"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\REST\\SignalWireRestError::__construct"
  parent: "SignalWire\\REST\\SignalWireRestError"
  module: "SignalWire.REST"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/SignalWireRestError.php"
  visibility: "public"
---
# `__construct`

## Signature

```php
public function __construct(
    string $message,
    int $statusCode = 0,
    string $responseBody = ''
)
```

## Parameters

| Name           | Type     | Required | Default | Description |
| -------------- | -------- | -------- | ------- | ----------- |
| `message`      | `string` | yes      | —       | —           |
| `statusCode`   | `int`    | no       | `0`     | —           |
| `responseBody` | `string` | no       | `''`    | —           |

## Source

[`/src/src/SignalWire/REST/SignalWireRestError.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/SignalWireRestError.php)

Line 15.
