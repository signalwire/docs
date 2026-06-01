---
slug: "/reference/php/signal-wire/pom/pom/section/render-xml"
title: "renderXml"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\POM\\Section::renderXml"
  parent: "SignalWire\\POM\\Section"
  module: "SignalWire.POM"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/POM/Section.php"
  visibility: "public"
---
# `renderXml`

Render this section and all its subsections as XML.

## Signature

```php
public function renderXml(int $indent = 0, ?array $sectionNumber = NULL): string
```

## Parameters

| Name            | Type     | Required | Default | Description                         |
| --------------- | -------- | -------- | ------- | ----------------------------------- |
| `indent`        | `int`    | no       | `0`     | indentation level (each = 2 spaces) |
| `sectionNumber` | `?array` | no       | `NULL`  | numbering breadcrumb                |

## Returns

`string`

## Source

[`/src/src/SignalWire/POM/Section.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/POM/Section.php)

Line 216.
