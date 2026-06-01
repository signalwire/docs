---
slug: "/reference/php/signal-wire/utils/utils/schema-utils/construct"
title: "__construct"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Utils\\SchemaUtils::__construct"
  parent: "SignalWire\\Utils\\SchemaUtils"
  module: "SignalWire.Utils"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Utils/SchemaUtils.php"
  visibility: "public"
---
# `__construct`

Construct a SchemaUtils.

## Signature

```php
public function __construct(?string $schemaPath = NULL, bool $schemaValidation = true)
```

## Parameters

| Name               | Type      | Required | Default | Description                                                 |
| ------------------ | --------- | -------- | ------- | ----------------------------------------------------------- |
| `schemaPath`       | `?string` | no       | `NULL`  | Path to a schema.json file; null for the bundled copy.      |
| `schemaValidation` | `bool`    | no       | `true`  | Whether to enable schema validation (env override applies). |

## Source

[`/src/src/SignalWire/Utils/SchemaUtils.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Utils/SchemaUtils.php)

Line 56.
