---
slug: "/reference/php/signal-wire/utils/utils/schema-utils/validate-verb"
title: "validateVerb"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Utils\\SchemaUtils::validateVerb"
  parent: "SignalWire\\Utils\\SchemaUtils"
  module: "SignalWire.Utils"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Utils/SchemaUtils.php"
  visibility: "public"
---
# `validateVerb`

Validate a verb config against the schema.

Mirrors Python's validate\_verb(verb\_name, verb\_config).

## Signature

```php
public function validateVerb(string $verbName, array $verbConfig): array
```

## Parameters

| Name         | Type     | Required | Default | Description |
| ------------ | -------- | -------- | ------- | ----------- |
| `verbName`   | `string` | yes      | —       | —           |
| `verbConfig` | `array`  | yes      | —       | —           |

## Returns

`array` — Tuple of (valid, errors).

## Source

[`/src/src/SignalWire/Utils/SchemaUtils.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Utils/SchemaUtils.php)

Line 249.
