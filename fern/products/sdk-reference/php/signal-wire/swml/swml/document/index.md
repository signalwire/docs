---
slug: "/reference/php/signal-wire/swml/swml/document"
title: "Document"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\SWML\\Document"
  parent: "SignalWire\\SWML"
  module: "SignalWire.SWML"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SWML/Document.php"
---
# `Document`

## Signature

```php
class Document
```

## Methods

- [`__construct`](/reference/php/signal-wire/swml/swml/document/construct)
- [`addRawVerb`](/reference/php/signal-wire/swml/swml/document/add-raw-verb) — Append a pre-formatted verb hash to a section.
- [`addSection`](/reference/php/signal-wire/swml/swml/document/add-section) — Add a new named section. Returns true if created, false if it already existed.
- [`addVerb`](/reference/php/signal-wire/swml/swml/document/add-verb) — Append a verb to the main section.
- [`addVerbToSection`](/reference/php/signal-wire/swml/swml/document/add-verb-to-section) — Append a verb to a named section.
- [`clearSection`](/reference/php/signal-wire/swml/swml/document/clear-section) — Clear all verbs in a section.
- [`getVerbs`](/reference/php/signal-wire/swml/swml/document/get-verbs) — Get a copy of the verbs for a section.
- [`getVersion`](/reference/php/signal-wire/swml/swml/document/get-version)
- [`hasSection`](/reference/php/signal-wire/swml/swml/document/has-section)
- [`render`](/reference/php/signal-wire/swml/swml/document/render) — Compact JSON string.
- [`renderPretty`](/reference/php/signal-wire/swml/swml/document/render-pretty) — Pretty-printed JSON string.
- [`reset`](/reference/php/signal-wire/swml/swml/document/reset) — Reset document to initial state.
- [`toArray`](/reference/php/signal-wire/swml/swml/document/to-array) — Return document as associative array.

## Source

[`/src/src/SignalWire/SWML/Document.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SWML/Document.php)

Line 7.
