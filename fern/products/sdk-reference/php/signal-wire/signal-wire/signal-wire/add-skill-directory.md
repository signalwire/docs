---
slug: "/reference/php/signal-wire/signal-wire/signal-wire/add-skill-directory"
title: "add_skill_directory"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\SignalWire::add_skill_directory"
  parent: "SignalWire\\SignalWire"
  module: "SignalWire"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SignalWire.php"
  visibility: "public"
---
# `add_skill_directory`

Add a directory to search for skills.

Mirrors Python's `signalwire.add_skill_directory(path)`. Delegates
to the singleton {@see SkillRegistry} instance.

**Modifiers:** `static`

## Signature

```php
public static function add_skill_directory(string $path): void
```

## Parameters

| Name   | Type     | Required | Default | Description |
| ------ | -------- | -------- | ------- | ----------- |
| `path` | `string` | yes      | —       | —           |

## Throws

- `\InvalidArgumentException` — when the path doesn't exist or isn't a directory.

## Source

[`/src/src/SignalWire/SignalWire.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SignalWire.php)

Line 103.
