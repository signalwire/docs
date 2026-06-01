---
slug: "/reference/php/signal-wire/pom/pom/prompt-object-model"
title: "PromptObjectModel"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\POM\\PromptObjectModel"
  parent: "SignalWire\\POM"
  module: "SignalWire.POM"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/POM/PromptObjectModel.php"
---
# `PromptObjectModel`

A structured data format for composing, organizing, and rendering prompt

instructions for large language models.

Mirrors Python's `signalwire.pom.pom.PromptObjectModel`. Provides a
tree-based representation of nested sections, supporting JSON / YAML
serialization and Markdown / XML rendering.

YAML support: a small bundled emitter and parser implement the subset of
PyYAML's default block style needed for round-tripping POM documents.
Composer-installed yaml extensions are not required.

## Signature

```php
class PromptObjectModel
```

## Properties

| Name       | Type              | Required | Default | Description |
| ---------- | ----------------- | -------- | ------- | ----------- |
| `debug`    | `bool $debug`     | yes      | —       | —           |
| `sections` | `array $sections` | yes      | —       | —           |

## Methods

- [`__construct`](/reference/php/signal-wire/pom/pom/prompt-object-model/construct)
- [`addPomAsSubsection`](/reference/php/signal-wire/pom/pom/prompt-object-model/add-pom-as-subsection) — Add another PromptObjectModel as a subsection block under a target.
- [`addSection`](/reference/php/signal-wire/pom/pom/prompt-object-model/add-section) — Add a top-level section to the model.
- [`findSection`](/reference/php/signal-wire/pom/pom/prompt-object-model/find-section) — Recursively search for a section by title.
- [`fromJson`](/reference/php/signal-wire/pom/pom/prompt-object-model/from-json) — Create a PromptObjectModel from a JSON string or a parsed array.
- [`fromYaml`](/reference/php/signal-wire/pom/pom/prompt-object-model/from-yaml) — Create a PromptObjectModel from a YAML string or a parsed array.
- [`renderMarkdown`](/reference/php/signal-wire/pom/pom/prompt-object-model/render-markdown)
- [`renderXml`](/reference/php/signal-wire/pom/pom/prompt-object-model/render-xml)
- [`toArray`](/reference/php/signal-wire/pom/pom/prompt-object-model/to-array)
- [`toJson`](/reference/php/signal-wire/pom/pom/prompt-object-model/to-json) — Serialize the model as JSON. Matches Python `json.dumps(.., indent=2)`.
- [`toYaml`](/reference/php/signal-wire/pom/pom/prompt-object-model/to-yaml) — Serialize the model as YAML. Matches PyYAML's default block style

## Source

[`/src/src/SignalWire/POM/PromptObjectModel.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/POM/PromptObjectModel.php)

Line 19.
