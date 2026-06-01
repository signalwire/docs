---
slug: "/reference/php/signal-wire/utils/utils/schema-validation-error/construct"
title: "__construct"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Utils\\SchemaValidationError::__construct"
  parent: "SignalWire\\Utils\\SchemaValidationError"
  module: "SignalWire.Utils"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Utils/SchemaValidationError.php"
  visibility: "public"
---
# `__construct`

Construct a SchemaValidationError. Mirrors Python's

SchemaValidationError(verb\_name, errors).

## Signature

```php
public function __construct(string $verbName, array $errors)
```

## Parameters

| Name       | Type     | Required | Default | Description                      |
| ---------- | -------- | -------- | ------- | -------------------------------- |
| `verbName` | `string` | yes      | —       | the verb whose validation failed |
| `errors`   | `array`  | yes      | —       | human-readable error messages    |

## Source

[`/src/src/SignalWire/Utils/SchemaValidationError.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Utils/SchemaValidationError.php)

Line 34.
