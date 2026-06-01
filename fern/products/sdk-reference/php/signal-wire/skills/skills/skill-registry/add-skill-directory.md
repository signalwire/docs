---
slug: "/reference/php/signal-wire/skills/skills/skill-registry/add-skill-directory"
title: "addSkillDirectory"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Skills\\SkillRegistry::addSkillDirectory"
  parent: "SignalWire\\Skills\\SkillRegistry"
  module: "SignalWire.Skills"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Skills/SkillRegistry.php"
  visibility: "public"
---
# `addSkillDirectory`

Add a directory to search for skills.

Mirrors Python's
`signalwire.skills.registry.SkillRegistry.add_skill_directory`:
validate that the path exists and is a directory, then append it
(de-duplicated) to the external paths list. Throws
`InvalidArgumentException` (the PHP analog of Python's `ValueError`)
for invalid input.

## Signature

```php
public function addSkillDirectory(string $path): void
```

## Parameters

| Name   | Type     | Required | Default | Description |
| ------ | -------- | -------- | ------- | ----------- |
| `path` | `string` | yes      | —       | —           |

## Throws

- `\InvalidArgumentException` — when the path doesn't exist or isn't a directory.

## Source

[`/src/src/SignalWire/Skills/SkillRegistry.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Skills/SkillRegistry.php)

Line 107.
