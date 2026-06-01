---
slug: "/reference/php/signal-wire/pom/pom/section/render-markdown"
title: "renderMarkdown"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\POM\\Section::renderMarkdown"
  parent: "SignalWire\\POM\\Section"
  module: "SignalWire.POM"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/POM/Section.php"
  visibility: "public"
---
# `renderMarkdown`

Render this section and all its subsections as Markdown.

## Signature

```php
public function renderMarkdown(int $level = 2, ?array $sectionNumber = NULL): string
```

## Parameters

| Name            | Type     | Required | Default | Description                     |
| --------------- | -------- | -------- | ------- | ------------------------------- |
| `level`         | `int`    | no       | `2`     | heading level (default 2 -> ##) |
| `sectionNumber` | `?array` | no       | `NULL`  | numbering breadcrumb            |

## Returns

`string`

## Source

[`/src/src/SignalWire/POM/Section.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/POM/Section.php)

Line 155.
