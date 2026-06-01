---
slug: "/reference/php/signal-wire/signal-wire/signal-wire/list-skills-with-params"
title: "list_skills_with_params"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\SignalWire::list_skills_with_params"
  parent: "SignalWire\\SignalWire"
  module: "SignalWire"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SignalWire.php"
  visibility: "public"
---
# `list_skills_with_params`

Get complete schema for all available skills.

Mirrors Python's `signalwire.list_skills_with_params()`. Returns
an associative array keyed by skill name with metadata + parameter
schema. Useful for GUI configuration tools, API documentation, or
programmatic skill discovery.

**Modifiers:** `static`

## Signature

```php
public static function list_skills_with_params(): array
```

## Returns

`array`

## Source

[`/src/src/SignalWire/SignalWire.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SignalWire.php)

Line 118.
