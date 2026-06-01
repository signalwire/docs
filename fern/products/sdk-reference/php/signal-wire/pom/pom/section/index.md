---
slug: "/reference/php/signal-wire/pom/pom/section"
title: "Section"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\POM\\Section"
  parent: "SignalWire\\POM"
  module: "SignalWire.POM"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/POM/Section.php"
---
# `Section`

Represents a section in the Prompt Object Model.

Each section contains a title, optional body text, optional bullet
points, and any number of nested subsections. Mirrors Python's
`signalwire.pom.pom.Section` byte-for-byte for `render_markdown`,
`render_xml`, `to_dict` (and indirectly `to_json` / `to_yaml`).

Python parity: signalwire/signalwire/pom/pom.py::Section

Constructor params (`params` array — PHP idiom for kwargs):

- title  (?string)         section title; null is permitted only on the
  first top-level section of a PromptObjectModel
- body   (string)          paragraph text; default ''
- bullets (?list<string>)  bullet items; default \[]
- numbered (?bool)         null = inherit; true/false = explicit
- numberedBullets (bool)   render bullets as "1. foo" instead of "- foo"

## Signature

```php
class Section
```

## Properties

| Name              | Type                    | Required | Default | Description |
| ----------------- | ----------------------- | -------- | ------- | ----------- |
| `body`            | `string $body`          | yes      | —       | —           |
| `bullets`         | `array $bullets`        | yes      | —       | —           |
| `numbered`        | `?bool $numbered`       | yes      | —       | —           |
| `numberedBullets` | `bool $numberedBullets` | yes      | —       | —           |
| `subsections`     | `array $subsections`    | yes      | —       | —           |
| `title`           | `?string $title`        | yes      | —       | —           |

## Methods

- [`__construct`](/reference/php/signal-wire/pom/pom/section/construct)
- [`addBody`](/reference/php/signal-wire/pom/pom/section/add-body) — Add or replace the body text for this section.
- [`addBullets`](/reference/php/signal-wire/pom/pom/section/add-bullets) — Append bullet points to this section.
- [`addSubsection`](/reference/php/signal-wire/pom/pom/section/add-subsection) — Add a subsection to this section.
- [`renderMarkdown`](/reference/php/signal-wire/pom/pom/section/render-markdown) — Render this section and all its subsections as Markdown.
- [`renderXml`](/reference/php/signal-wire/pom/pom/section/render-xml) — Render this section and all its subsections as XML.
- [`toArray`](/reference/php/signal-wire/pom/pom/section/to-array) — Convert the section to a dictionary representation.

## Source

[`/src/src/SignalWire/POM/Section.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/POM/Section.php)

Line 25.
