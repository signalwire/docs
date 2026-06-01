---
slug: "/reference/php/signal-wire/pom/pom/prompt-object-model/add-pom-as-subsection"
title: "addPomAsSubsection"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\POM\\PromptObjectModel::addPomAsSubsection"
  parent: "SignalWire\\POM\\PromptObjectModel"
  module: "SignalWire.POM"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/POM/PromptObjectModel.php"
  visibility: "public"
---
# `addPomAsSubsection`

Add another PromptObjectModel as a subsection block under a target.

## Signature

```php
public function addPomAsSubsection(
    SignalWire\POM\Section|string $target,
    SignalWire\POM\PromptObjectModel $pomToAdd
): void
```

## Parameters

| Name       | Type                               | Required | Default | Description                                   |
| ---------- | ---------------------------------- | -------- | ------- | --------------------------------------------- |
| `target`   | `SignalWire\POM\Section\|string`   | yes      | —       | Either a section title or a Section instance. |
| `pomToAdd` | `SignalWire\POM\PromptObjectModel` | yes      | —       | —                                             |

## Throws

- `\InvalidArgumentException` — When the title cannot be resolved.

## Source

[`/src/src/SignalWire/POM/PromptObjectModel.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/POM/PromptObjectModel.php)

Line 359.
