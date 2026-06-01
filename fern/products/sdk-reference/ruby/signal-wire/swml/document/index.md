---
slug: "/reference/ruby/signal-wire/swml/document"
title: "Document"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::SWML::Document"
  parent: "SignalWire::SWML"
  module: "SignalWire.SWML"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swml/document.rb"
  visibility: "public"
---
# `Document`

## Signature

```ruby
class Document < Object
```

## Inheritance

**Extends:** `Object`

## Methods

- [`add_section`](/reference/ruby/signal-wire/swml/document/add-section) — Add a new named section. Returns true if created, false if it already exists.
- [`add_verb`](/reference/ruby/signal-wire/swml/document/add-verb) — Append a verb to the _main_ section.
- [`add_verb_to_section`](/reference/ruby/signal-wire/swml/document/add-verb-to-section) — Append a verb to an arbitrary section.
- [`get_verbs`](/reference/ruby/signal-wire/swml/document/get-verbs) — Return the list of verb hashes for a section.
- [`has_section?`](/reference/ruby/signal-wire/swml/document/has-section) — Check whether a section exists.
- [`initialize`](/reference/ruby/signal-wire/swml/document/initialize)
- [`render`](/reference/ruby/signal-wire/swml/document/render) — Compact JSON string.
- [`render_pretty`](/reference/ruby/signal-wire/swml/document/render-pretty) — Pretty-printed JSON string.
- [`reset`](/reference/ruby/signal-wire/swml/document/reset) — Reset the document to its initial empty state.
- [`sections`](/reference/ruby/signal-wire/swml/document/sections) — Returns the value of attribute sections.
- [`to_h`](/reference/ruby/signal-wire/swml/document/to-h) — Produce a plain Ruby hash suitable for JSON serialization.
- [`version`](/reference/ruby/signal-wire/swml/document/version) — Returns the value of attribute version.

## Source

[`lib/signalwire/swml/document.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swml/document.rb)

Line 7.
