---
slug: "/reference/ruby/signal-wire/pom/section"
title: "Section"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::POM::Section"
  parent: "SignalWire::POM"
  module: "SignalWire.POM"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/pom/section.rb"
  visibility: "public"
---
# `Section`

Represents a section in the Prompt Object Model.

Each section contains a title, optional body text, optional bullet
points, and can have any number of nested subsections.

Mirrors Python's `signalwire.pom.pom.Section` exactly. See
`signalwire-python/signalwire/signalwire/pom/pom.py` for the
source-of-truth specification; rendering output (markdown / XML /
JSON / YAML) must match Python byte-for-byte so cross-language POM
documents are interoperable.

Attributes:

- +title+ — the name of the section.
- +body+  — a paragraph of text associated with the section.
- +bullets+ — bullet-pointed items (Array<String>).
- +subsections+ — nested Section objects.
- +numbered+ — whether this section should be numbered.
- +numbered\_bullets+ — whether bullets should be numbered (rendered
  to/from the JSON/YAML key +numberedBullets+ for Python parity).

## Signature

```ruby
class Section < Object
```

## Inheritance

**Extends:** `Object`

## Methods

- [`add_body`](/reference/ruby/signal-wire/pom/section/add-body) — Add or replace the body text for this section. Mirrors Python's `Section.add_body` (which is documented to "Add or replace").
- [`add_bullets`](/reference/ruby/signal-wire/pom/section/add-bullets) — Append bullet points to this section. Does not replace existing bullets — mirrors Python's `self.bullets.extend(bullets)`.
- [`add_subsection`](/reference/ruby/signal-wire/pom/section/add-subsection) — Add a subsection to this section, returning the new Section.
- [`body`](/reference/ruby/signal-wire/pom/section/body) — Returns the value of attribute body.
- [`body=`](/reference/ruby/signal-wire/pom/section/body__2) — Sets the attribute body
- [`bullets`](/reference/ruby/signal-wire/pom/section/bullets) — Returns the value of attribute bullets.
- [`bullets=`](/reference/ruby/signal-wire/pom/section/bullets__2) — Sets the attribute bullets
- [`initialize`](/reference/ruby/signal-wire/pom/section/initialize) — Construct a Section.
- [`numbered`](/reference/ruby/signal-wire/pom/section/numbered) — Returns the value of attribute numbered.
- [`numbered_bullets`](/reference/ruby/signal-wire/pom/section/numbered-bullets) — Returns the value of attribute numbered\_bullets.
- [`numbered_bullets=`](/reference/ruby/signal-wire/pom/section/numbered-bullets__2) — Sets the attribute numbered\_bullets
- [`numbered=`](/reference/ruby/signal-wire/pom/section/numbered__2) — Sets the attribute numbered
- [`render_markdown`](/reference/ruby/signal-wire/pom/section/render-markdown) — Render this section and all its subsections as Markdown. The output is byte-for-byte identical to Python's `Section.render_markdown`.
- [`render_xml`](/reference/ruby/signal-wire/pom/section/render-xml) — Render this section and all its subsections as XML. Output is byte-for-byte identical to Python's `Section.render_xml`.
- [`subsections`](/reference/ruby/signal-wire/pom/section/subsections) — Returns the value of attribute subsections.
- [`subsections=`](/reference/ruby/signal-wire/pom/section/subsections__2) — Sets the attribute subsections
- [`title`](/reference/ruby/signal-wire/pom/section/title) — Returns the value of attribute title.
- [`title=`](/reference/ruby/signal-wire/pom/section/title__2) — Sets the attribute title
- [`to_h`](/reference/ruby/signal-wire/pom/section/to-h) — Convert the section to a Hash representation suitable for JSON or YAML serialization. Keys are emitted in the same order as Python so cross-port string comparisons line up.

## Source

[`lib/signalwire/pom/section.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/pom/section.rb)

Line 24.
