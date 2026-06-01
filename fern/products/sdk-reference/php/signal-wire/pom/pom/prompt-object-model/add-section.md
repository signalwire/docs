---
slug: "/reference/php/signal-wire/pom/pom/prompt-object-model/add-section"
title: "addSection"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\POM\\PromptObjectModel::addSection"
  parent: "SignalWire\\POM\\PromptObjectModel"
  module: "SignalWire.POM"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/POM/PromptObjectModel.php"
  visibility: "public"
---
# `addSection`

Add a top-level section to the model.

## Signature

```php
public function addSection(
    ?string $title = NULL,
    array $params = array (
)
): SignalWire\POM\Section
```

## Parameters

| Name     | Type      | Required | Default     | Description |
| -------- | --------- | -------- | ----------- | ----------- |
| `title`  | `?string` | no       | `NULL`      | —           |
| `params` | `array`   | no       | `array (
)` | —           |

## Returns

`SignalWire\POM\Section`

## Throws

- `\InvalidArgumentException` — If $title is null and there is already at least one section

## Source

[`/src/src/SignalWire/POM/PromptObjectModel.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/POM/PromptObjectModel.php)

Line 181.
