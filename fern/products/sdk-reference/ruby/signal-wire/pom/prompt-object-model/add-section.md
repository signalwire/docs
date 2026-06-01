---
slug: "/reference/ruby/signal-wire/pom/prompt-object-model/add-section"
title: "add_section"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::POM::PromptObjectModel#add_section"
  parent: "SignalWire::POM::PromptObjectModel"
  module: "SignalWire.POM.PromptObjectModel"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/pom/prompt_object_model.rb"
  visibility: "public"
---
# `add_section`

Add a top-level section to the model and return the new Section.

Mirrors Python's `PromptObjectModel.add_section`. If +bullets+
is a String it is wrapped into a single-element Array (Python
parity). Raises ArgumentError when +title+ is nil and the model
already has at least one section (only the first section may
be untitled).

## Signature

```ruby
def add_section(title = nil, body: '', bullets: nil, numbered: nil, numbered_bullets: false)
```

## Parameters

| Name                | Type | Required | Default | Description |
| ------------------- | ---- | -------- | ------- | ----------- |
| `title`             | —    | no       | `nil`   | —           |
| `body:`             | —    | no       | `''`    | —           |
| `bullets:`          | —    | no       | `nil`   | —           |
| `numbered:`         | —    | no       | `nil`   | —           |
| `numbered_bullets:` | —    | no       | `false` | —           |

## Source

[`lib/signalwire/pom/prompt_object_model.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/pom/prompt_object_model.rb)

Line 126.
